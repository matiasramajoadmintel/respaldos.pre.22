unit IngMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmIngMes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    cbMes: TComboBox;
    UpDown1: TUpDown;
    edtAno: TEdit;
    lblIng: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);

  private
    Teclas:byte;

  public
    Function ObtenerMes(var M, A: Word):Boolean;

  end;

const
  KEYREG = 'BONSAI\COMUNES';

var
  frmIngMes: TfrmIngMes;

implementation

uses Comunes, Util;

{$R *.DFM}

Function TfrmIngMes.ObtenerMes(var M, A: Word):Boolean;
var
  txtAnio: String;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  cbMes.Text := RecuperarValorRegistro(KEYREG,'MES');
  txtAnio := RecuperarValorRegistro(KEYREG,'ANIO');
  if txtAnio = 'Sin nombre' then UpDown1.Position := 1999
  else UpDown1.Position := StrToInt(txtAnio);
  ActiveControl:=cbMes;
  Screen.Cursor:=crDefault;

  ShowModal;

  if (cbMes.Text<>'') and (edtAno.Text<>'') then
  begin
    Result := ModalResult = MROK;
    if Result then
    begin
      M := MesComoWord(cbMes.Text);
      A := StrToInt(edtAno.Text);
    end;
    GuardarValorRegistro(KEYREG,'MES',cbMes.Text);
    GuardarValorRegistro(KEYREG,'ANIO',edtAno.Text);
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngMes.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngMes.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngMes.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngMes.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmIngMes.FormDestroy(Sender: TObject);
begin
{}
end;
//CHECK POINT para poder ver por campo (a determinar) los datos generados ie:descuentos
procedure TfrmIngMes.btnAceptarClick(Sender: TObject);
begin
showMessage('MATIAS check')
end;

end.

