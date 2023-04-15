unit IngFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmFecha = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    lblIng: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    Teclas:byte;

  public
    Function ObtenerFecha(var Fecha:TDateTime):Boolean;

  end;

var
  frmFecha: TfrmFecha;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmFecha.ObtenerFecha(var Fecha:TDateTime):Boolean;
begin
  Screen.Cursor := crHourglass;
  DateTimePicker1.Date := Now;
  ActiveControl := DateTimePicker1;
  Screen.Cursor := crDefault;

  ShowModal;

  Result := ModalResult = MROK;
  if Result then Fecha := DateTimePicker1.Date;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmFecha.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmFecha.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmFecha.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmFecha.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

end.
