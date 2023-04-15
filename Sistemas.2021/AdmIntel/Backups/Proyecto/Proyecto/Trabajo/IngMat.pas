unit IngMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmIngMat = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    ComboMaterial: TComboBox;
    Label1: TLabel;
    btnAgregarMat: TSpeedButton;
    edtCant: TEdit;
    ComboUnidad: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    btnAgregarUni: TSpeedButton;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarMatClick(Sender: TObject);
    procedure btnAgregarUniClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(const M:Byte;var IdMat:Integer;var Cant:Real;var IdUni:Integer);
    function DatosValidos: Boolean;

  public
    function getMaterial(const M:Byte;var IdMat:Integer;var Cant:Real;var IdUni:Integer):Boolean;

  end;

var
  frmIngMat: TfrmIngMat;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, ElecMed;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmIngMat.getMaterial(const M:Byte;var IdMat:Integer;var Cant:Real;var IdUni:Integer):Boolean;
begin
  Modo := M;
  PrepararFormulario(M,IdMat,Cant,IdUni);

  ShowModal;

  Result := (ModalResult=mrOk);
  if Result then
  begin
    IdMat := dmDatos.MATIDMATERIAL.Value;
    Cant := StrToInt(edtCant.Text);
    IdUni := dmDatos.UNIIDUNIDAD.Value;
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmIngMat.PrepararFormulario(const M:Byte;var IdMat:Integer;var Cant:Real;var IdUni:Integer);
begin
  CargarListaCampo(ComboMaterial,dmDatos.MAT,'DESCRIP');
  CargarListaCampo(ComboUnidad,dmDatos.UNI,'ABREV');

  if M = 0 then
  begin
    ComboMaterial.Text := '';
    ComboUnidad.Text := '';
    edtCant.Text := '1';
  end
  else
  begin
    Existe(dmDatos.MAT,'IDMATERIAL',IdMat);
    ComboMaterial.Text := dmDatos.MATDESCRIP.Text;
    Existe(dmDatos.UNI,'IDUNIDAD',IdUni);
    ComboUnidad.Text := dmDatos.UNIABREV.Text;
    edtCant.Text := FloatToStr(Cant);
  end;
end;

function TfrmIngMat.DatosValidos: Boolean;
begin
  Result := False;

  if ComboMaterial.Text = '' then
  begin
    MsjError('Falta indicar el material');
    Exit;
  end;

  if not Existe(dmDatos.MAT,'DESCRIP',ComboMaterial.Text) then
  begin
    MsjError('No existe el material elegido');
    Exit;
  end;

  if ComboUnidad.Text = '' then
  begin
    MsjError('Falta indicar la unidad de medida');
    Exit;
  end;

  if not Existe(dmDatos.UNI,'ABREV',ComboUnidad.Text) then
  begin
    MsjError('No existe la unidad de medida');
    Exit;
  end;

  if edtCant.Text = '' then
  begin
    MsjError('Falta indicar la cantidad');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngMat.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngMat.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngMat.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngMat.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCant then
  begin
    case key of
     '1','2','3','4','5','6','7','8','9','0',',',#8,#13,#27:begin end;
     else key:=#0;
    end;
    if (Key = '.') or (Key = ',') then Key := DecimalSeparator;
  end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngMat.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngMat.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmIngMat.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngMat.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngMat.btnAgregarMatClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
  Desc: String;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('MATERIAL',Id,Desc);
    Release;
  end;

  if not R then Exit;

  CargarListaCampo(ComboMaterial,dmDatos.MAT,'DESCRIP');
  ComboMaterial.Text := Desc;
end;

procedure TfrmIngMat.btnAgregarUniClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
  Desc: String;
begin
  with TfrmElecMed.Create(nil) do
  begin
    R := getId(Id,Desc);
    Release;
  end;

  if not R then Exit;

  CargarListaCampo(ComboUnidad,dmDatos.UNI,'ABREV');
  ComboUnidad.Text := Desc;
end;

end.
