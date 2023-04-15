unit IngFechas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmIngFechas = class(TForm)
    Panel2: TPanel;
    btnCancelar: TButton;
    btnAceptar: TButton;
    Panel1: TPanel;
    lblIng: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    Teclas:byte;

  public
    Function ObtenerFechas(var FechaINI,FechaFIN:TDateTime):Boolean;

  end;

var
  frmIngFechas: TfrmIngFechas;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngFechas.ObtenerFechas(var FechaINI,FechaFIN:TDateTime):Boolean;
begin
  Screen.Cursor:=crHourglass;
  DateTimePicker1.Date := Date-365;
  DateTimePicker2.Date := Date;
  ActiveControl:=DateTimePicker1;
  Screen.Cursor:=crDefault;

  ShowModal;

  Result := ModalResult = MROK;
  if Result then
  begin
    FechaINI := DateTimePicker1.Date;
    FechaFIN := DateTimePicker2.Date;
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngFechas.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngFechas.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngFechas.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngFechas.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

end.
