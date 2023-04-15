unit IngClaves;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmIngClaves = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    lblIng: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtVI: TEdit;
    edtVF: TEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    Teclas:byte;

  public
    Function ObtenerClaves(var VI,VF:LongInt;const T:String):Boolean;
    Function ObtenerClaves2(var VI,VF:LongInt;const T,L1,L2:String):Boolean;

  end;

var
  frmIngClaves: TfrmIngClaves;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngClaves.ObtenerClaves(var VI,VF:LongInt;const T:String):Boolean;
begin
  Screen.Cursor:=crHourglass;
  Result := False;
  Caption := T;
  ActiveControl:=edtVI;
  Screen.Cursor:=crDefault;

  ShowModal;

  if (edtVI.Text<>'') and (edtVF.Text<>'') then
  begin
    Result := ModalResult = MROK;
    if Result then
    begin
      VI := StrToInt(edtVI.Text);
      VF := StrToInt(edtVF.Text);
    end;
  end;
end;

Function TfrmIngClaves.ObtenerClaves2(var VI,VF:LongInt;const T,L1,L2:String):Boolean;
begin
  Label1.Caption := L1;
  Label2.Caption := L2;
  Result := ObtenerClaves(VI,VF,T);
  Label1.Caption := 'Valor inicial';
  Label1.Caption := 'Valor final';
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngClaves.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngClaves.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngClaves.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngClaves.PressEnter(Sender: TObject; var Key: Char);
begin
  case key of
    '1','2','3','4','5','6','7','8','9','0',#8,#13,#27:begin end;
     else key:=#0;
  end;

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
