unit IngDia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmIngDia = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    cbMes: TComboBox;
    UpDown1: TUpDown;
    edtDia: TEdit;
    lblIng: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas:byte;

  public
    Function ObtenerDia(var M, D: Word):Boolean;

  end;

const
  KEYREG = 'BONSAI\COMUNES';

var
  frmIngDia: TfrmIngDia;

implementation

uses Comunes, Util;

{$R *.DFM}

Function TfrmIngDia.ObtenerDia(var M, D: Word):Boolean;
var
  txtDia: String;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  cbMes.Text := RecuperarValorRegistro(KEYREG,'MES');
  txtDia := RecuperarValorRegistro(KEYREG,'DIA');
  if txtDia = 'Sin nombre' then UpDown1.Position := 1
  else UpDown1.Position := StrToInt(txtDia);
  ActiveControl:=cbMes;
  Screen.Cursor:=crDefault;

  ShowModal;

  if (cbMes.Text<>'') and (edtDia.Text<>'') then
  begin
    Result := ModalResult = MROK;
    if Result then
    begin
      M := MesComoWord(cbMes.Text);
      D := StrToInt(edtDia.Text);
    end;
    GuardarValorRegistro(KEYREG,'MES',cbMes.Text);
    GuardarValorRegistro(KEYREG,'DIA',edtDia.Text);
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngDia.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngDia.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngDia.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngDia.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmIngDia.FormCreate(Sender: TObject);
begin
  {}
end;

procedure TfrmIngDia.FormDestroy(Sender: TObject);
begin
{}
end;

end.
