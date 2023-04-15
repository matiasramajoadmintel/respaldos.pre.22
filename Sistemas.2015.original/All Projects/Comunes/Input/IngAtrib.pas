unit IngAtrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmIngAtrib = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    edtCod: TEdit;
    rgTipo: TRadioGroup;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    Teclas:byte;

  public
    Function ObtenerTexto(var Txt:String;var Tipo:Char):Boolean;

  end;

var
  frmIngAtrib: TfrmIngAtrib;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngAtrib.ObtenerTexto(var Txt:String;var Tipo:Char):Boolean;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  edtCod.Text:=Txt;
  if Tipo = 'N' then rgTipo.ItemIndex := 0
  else rgTipo.ItemIndex := 1;
  btnAceptar.Default:=True;
  btnCancelar.Default:=False;
  ActiveControl:=edtCod;
  Screen.Cursor:=crDefault;

  ShowModal;

  if edtCod.Text <> '' then
  begin
    Result := ModalResult = MROK;
    if Result then
    begin
      Txt := edtCod.Text;
      if rgTipo.ItemIndex = 0 then Tipo := 'N'
      else Tipo := 'A';
    end;
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngAtrib.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngAtrib.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngAtrib.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngAtrib.PressEnter(Sender: TObject; var Key: Char);
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
