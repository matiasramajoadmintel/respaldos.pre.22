unit IngCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmIngCredito = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    dtpFecha: TDateTimePicker;
    edtCosto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtDesc: TEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario(var Fec: TDateTime; var Desc: String;
                                 var Costo: Currency);
    function DatosValidos: Boolean;

  public
    function Ingresar(var Fec: TDateTime; var Desc: String;
                      var Costo: Currency): Boolean;

  end;

var
  frmIngCredito: TfrmIngCredito;

implementation

uses Comunes, Util, PoolDatos, DB;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmIngCredito.Ingresar(var Fec: TDateTime; var Desc: String;
                                 var Costo: Currency): Boolean;
begin
  PrepararFormulario(Fec,Desc,Costo);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    Fec := dtpFecha.Date;
    Desc := edtDesc.Text;
    Costo := StrToCurr(edtCosto.Text);
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmIngCredito.PrepararFormulario(var Fec: TDateTime; var Desc: String;
                                            var Costo: Currency);
begin
  dtpFecha.Date := Fec;
  edtDesc.Text := Desc;
  edtCosto.Text := CurrToStr(Costo);
end;

function TfrmIngCredito.DatosValidos: Boolean;
begin
  Result := False;

  if (edtDesc.Text = '') or (edtCosto.Text = '') then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngCredito.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngCredito.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngCredito.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngCredito.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCosto then
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

procedure TfrmIngCredito.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngCredito.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngCredito.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngCredito.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

end.
