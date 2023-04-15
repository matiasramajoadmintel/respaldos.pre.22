unit IngClave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmIngClave = class(TForm)
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
    Teclas, Tipo: byte; //Tipo=0 --> entero; Tipo=1 --> real
    procedure PrepararForm;

  public
    Function ObtenerEntero(var Nro:Integer;const Titulo:String):Boolean;
    Function ObtenerReal(var Nro:Double;const Titulo:String):Boolean;

  end;

var
  frmIngClave: TfrmIngClave;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngClave.ObtenerEntero(var Nro:Integer;const Titulo:String):Boolean;
begin
  Result := False;
  Tipo := 0;
  Caption := Titulo;
  edtCod.Text := IntToStr(Nro);
  ActiveControl := edtCod;

  ShowModal;

  if edtCod.Text <> '' then
  begin
    Result := ModalResult = MROK;
    if EsEntero(edtCod.Text) then
      if Result then Nro := StrToInt(edtCod.Text);
  end;
end;

Function TfrmIngClave.ObtenerReal(var Nro:Double;const Titulo:String):Boolean;
begin
  Result := False;
  Tipo := 1;
  Caption := Titulo;
  edtCod.Text := FloatToStr(Nro);
  ActiveControl := edtCod;

  ShowModal;

  if edtCod.Text <> '' then
  begin
    Result := ModalResult = MROK;
    if Result then Nro := StrToFloat(edtCod.Text);
  end;
end;

procedure TfrmIngClave.PrepararForm;
begin
  btnAceptar.Default:=True;
  btnCancelar.Default:=False;
  ActiveControl:=edtCod;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngClave.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngClave.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngClave.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngClave.PressEnter(Sender: TObject; var Key: Char);
begin
  case key of
    '1','2','3','4','5','6','7','8','9','0',',',#8,#13,#27:begin end;
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
