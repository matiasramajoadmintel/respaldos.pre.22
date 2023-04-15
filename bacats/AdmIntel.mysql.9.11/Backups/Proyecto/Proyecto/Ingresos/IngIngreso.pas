unit IngIngreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmIngIngreso = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    dtpFecha: TDateTimePicker;
    ComboServicio: TComboBox;
    edtImpMant: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnBuscarServ: TSpeedButton;
    rgPago: TRadioGroup;
    edtNroCheque: TEdit;
    lblNrocheque: TLabel;
    edtNroRecibo: TEdit;
    Label3: TLabel;
    edtSr: TEdit;
    Label5: TLabel;
    edtImpServ: TEdit;
    Label6: TLabel;
    btnBuscarSr: TSpeedButton;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarServClick(Sender: TObject);
    procedure rgPagoClick(Sender: TObject);
    procedure btnBuscarSrClick(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario(const Fec: TDateTime; const IdServ: Integer;
                                 const ImpM, ImpS: Currency; const TPago: Char;
                                 const NCheque, Sr: String;
                                 const NRecibo: Integer);
    function DatosValidos: Boolean;

  public
    function Ingresar(var Fec: TDateTime; var IdServ: Integer;
                      var ImpM, ImpS: Currency; var TPago: Char;
                      var NCheque, Sr: String;
                      var NRecibo: Integer): Boolean;

  end;

var
  frmIngIngreso: TfrmIngIngreso;

implementation

uses Comunes, Util, PoolDatos, DB, ElecEnt, ElecOcupante;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmIngIngreso.Ingresar(var Fec: TDateTime; var IdServ: Integer;
                                 var ImpM, ImpS: Currency; var TPago: Char;
                                 var NCheque, Sr: String;
                                 var NRecibo: Integer): Boolean;
begin
  PrepararFormulario(Fec,IdServ,ImpM, ImpS,TPago,NCheque,Sr,NRecibo);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    Fec := dtpFecha.Date;
    Existe(dmDatos.TING,'DESCRIP',ComboServicio.Text);
    IdServ := dmDatos.TINGIDTIPO_INGRESO.Value;
    ImpM := StrToCurr(edtImpMant.Text);
    ImpS := StrToCurr(edtImpServ.Text);
    if rgPago.ItemIndex = 0 then TPago := 'E'
    else TPago := 'C';
    NCheque := edtNroCheque.Text;
    NRecibo := StrToInt(edtNroRecibo.Text);
    Sr := edtSr.Text;
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmIngIngreso.PrepararFormulario(const Fec: TDateTime;
                                            const IdServ: Integer;
                                            const ImpM, ImpS: Currency;
                                            const TPago: Char;
                                            const NCheque, Sr: String;
                                            const NRecibo: Integer);
begin
  CargarListaCampo(ComboServicio,dmDatos.TING,'DESCRIP');

  dtpFecha.Date := Fec;
  if IdServ = -1 then ComboServicio.Text := ''
  else
  begin
    Existe(dmDatos.TING,'IDTIPO_INGRESO',IdServ);
    ComboServicio.Text := dmDatos.TINGDESCRIP.Text;
  end;
  edtImpMant.Text := CurrToStr(ImpM);
  edtImpServ.Text := CurrToStr(ImpS);
  if TPago = 'C' then rgPago.ItemIndex := 1
  else rgPago.ItemIndex := 0;
  rgPagoClick(nil);
  edtNroCheque.Text := NCheque;
  if NRecibo = -1 then edtNroRecibo.Text := ''
  else edtNroRecibo.Text := IntToStr(NRecibo);
  edtSr.Text := Sr;
end;

function TfrmIngIngreso.DatosValidos: Boolean;
begin
  Result := False;

  if (ComboServicio.Text = '') or (edtImpMant.Text = '') or
     (edtImpServ.Text = '') or ((rgPago.ItemIndex = 1) and
     (edtNroCheque.Text = '')) then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngIngreso.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngIngreso.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngIngreso.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngIngreso.PressEnter(Sender: TObject; var Key: Char);
begin
  if (Sender = edtImpMant) or (Sender = edtImpServ) or (Sender = edtNroRecibo) then
  begin
    case key of
      '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
       else key:=#0;
    end;

    if (Key = ',') or (Key = '.') then key := DecimalSeparator;
  end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngIngreso.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngIngreso.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngIngreso.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngIngreso.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngIngreso.btnBuscarServClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('TIPO_INGRESO',Id,Desc);
    Release;
  end;

  if not R then Exit;

  dmDatos.TING.Refresh;
  CargarListaCampo(ComboServicio,dmDatos.TING,'DESCRIP');
  ComboServicio.Text := Desc;
end;

procedure TfrmIngIngreso.rgPagoClick(Sender: TObject);
begin
  lblNrocheque.Enabled := (rgPago.ItemIndex = 1);
  edtNroCheque.Enabled := (rgPago.ItemIndex = 1);
  edtNroCheque.Text := '';
end;

procedure TfrmIngIngreso.btnBuscarSrClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
begin
  with TfrmElecOcupante.Create(nil) do
  begin
    Id := GetId(Desc, 0);
    Release;
  end;

  if Id <> 0 then edtSr.Text := Desc;
end;

end.
