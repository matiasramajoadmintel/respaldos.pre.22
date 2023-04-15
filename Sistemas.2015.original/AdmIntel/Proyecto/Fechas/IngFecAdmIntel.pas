unit IngFecAdmIntel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, DateUtils;

type
  TfrmIngFecAdmIntel = class(TForm)
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
  frmIngFecAdmIntel: TfrmIngFecAdmIntel;

implementation

uses Comunes;

{$R *.DFM}

Function TfrmIngFecAdmIntel.ObtenerFechas(var FechaINI,FechaFIN:TDateTime):Boolean;
var
  A,M,D: Word;
begin
  Screen.Cursor:=crHourglass;
  A := CurrentYear;
  M := MonthOf(Date) - 1;
  if M = 0 then
  begin
    M := 12;
    A := A - 1;
  end;
  DateTimePicker1.Date := StrToDate('01/'+IntToStr(M)+'/'+IntToStr(A));
  D := DaysInMonth(DateTimePicker1.Date);
  DateTimePicker2.Date := StrToDate(IntToStr(D)+'/'+IntToStr(M)+'/'+IntToStr(A));
  Screen.Cursor:=crHourglass;
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

procedure TfrmIngFecAdmIntel.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngFecAdmIntel.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngFecAdmIntel.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngFecAdmIntel.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

end.
