unit IngMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmIngMed = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    lblIng: TLabel;
    Label2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);

  private
    Teclas:byte;

  public
    Function ObtenerTexto(var Txt1,Txt2:String;const Titulo:String):Boolean;

  end;

var
  frmIngMed: TfrmIngMed;

implementation

uses Comunes, Util;

{$R *.DFM}

Function TfrmIngMed.ObtenerTexto(var Txt1,Txt2:String;const Titulo:String):Boolean;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  Caption := Titulo;
  edt1.Text:=Txt1;
  edt2.Text:=Txt2;
  btnAceptar.Default:=True;
  btnCancelar.Default:=False;
  ActiveControl:=edt1;
  Screen.Cursor:=crDefault;

  ShowModal;

  if (edt1.Text <> '') and (edt2.Text <> '') then
  begin
    Result := ModalResult = MROK;
    if Result then
    begin
      Txt1 := edt1.Text;
      Txt2 := edt2.Text;
    end;
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngMed.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngMed.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngMed.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngMed.PressEnter(Sender: TObject; var Key: Char);
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

procedure TfrmIngMed.btnAceptarClick(Sender: TObject);
begin
  if edt1.Text = '' then
  begin
    MsjError('Falta descripcion');
    Exit;
  end;

  if edt2.Text = '' then
  begin
    MsjError('Falta abreviatura');
    Exit;
  end;

  ModalResult := mrOk;
end;

end.
