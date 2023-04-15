unit IngTexto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmIngTexto = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    lblIng: TLabel;
    Label2: TLabel;
    edtCod: TEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    Teclas:byte;

  public
    Function ObtenerTexto(var Txt:String;const Titulo:String):Boolean;

  end;

var
  frmIngTexto: TfrmIngTexto;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngTexto.ObtenerTexto(var Txt:String;const Titulo:String):Boolean;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  Caption := Titulo;
  edtCod.Text:=Txt;
  btnAceptar.Default:=True;
  btnCancelar.Default:=False;
  ActiveControl:=edtCod;
  Screen.Cursor:=crDefault;

  ShowModal;

  if edtCod.Text <> '' then
  begin
    Result := ModalResult = MROK;
    if Result then Txt := edtCod.Text;
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngTexto.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngTexto.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngTexto.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngTexto.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    case teclas of
      0: Perform(WM_NEXTDLGCTL,0,0);
      1: Perform(WM_NEXTDLGCTL,1,0);
    end;
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

end.
