unit IngDatosConci;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, DateUtils;

type
  TfrmIngDatosConci = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblIng: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    edtHoja: TEdit;
    edtSaldoBanco: TEdit;
    edtLibro: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    edtCheqAnul: TEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);

  private
    Teclas:byte;

  public
    Function ObtenerDatos(var FechaINI,FechaFIN:TDateTime; var Hoja: Integer;
                          var SaldoBanco, SaldoLibro: Currency;
                          var CheqAnul: String):Boolean;

  end;

var
  frmIngDatosConci: TfrmIngDatosConci;

implementation

uses Comunes, Util;

{$R *.DFM}

Function TfrmIngDatosConci.ObtenerDatos(var FechaINI,FechaFIN:TDateTime;
                                        var Hoja: Integer;
                                        var SaldoBanco, SaldoLibro: Currency;
                                        var CheqAnul: String):Boolean;
var
  A,M,D: Word;
  AuxBanco, AuxLibro: String;
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
  edtHoja.Text := '';
  edtSaldoBanco.Text := '';
  edtLibro.Text := '';
  edtCheqAnul.Text := '';
  ActiveControl:=DateTimePicker1;
  Screen.Cursor:=crDefault;

  ShowModal;

  Result := (ModalResult = MROK);
  if Result then
  begin
    FechaINI := DateTimePicker1.Date;
    FechaFIN := DateTimePicker2.Date;
    Hoja := StrToInt(edtHoja.Text);
    CheqAnul := edtCheqAnul.Text;
    //Quita el caracter '$' de los strings mostrados en los TEdits
    AuxBanco := Copy(edtSaldoBanco.Text, 2, Length(edtSaldoBanco.Text)-1);
    AuxLibro := Copy(edtLibro.Text, 2, Length(edtLibro.Text)-1);
    //Si los string contienen un caracter '.' se los quita
    Delete(AuxBanco, AnsiPos('.', AuxBanco), 1);
    Delete(AuxLibro, AnsiPos('.', AuxLibro), 1);
    //Pasa los strings a currency
    SaldoBanco := StrToCurr(AuxBanco);
    SaldoLibro := StrToCurr(AuxLibro);
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngDatosConci.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngDatosConci.Salida_de_Campo(Sender: TObject);
begin
  if Sender = edtSaldoBanco then
    edtSaldoBanco.Text := CurrToStrF(StrToCurr(edtSaldoBanco.Text),ffCurrency,2);
  if Sender = edtLibro then
    edtLibro.Text := CurrToStrF(StrToCurr(edtLibro.Text),ffCurrency,2);

  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngDatosConci.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngDatosConci.PressEnter(Sender: TObject; var Key: Char);
begin
  if (Sender = edtHoja) or (Sender = edtSaldoBanco) or (Sender = edtLibro) then
  begin
    case key of
      '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
      else key:=#0;
    end;

    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;
  end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmIngDatosConci.BitBtn1Click(Sender: TObject);
begin
  if (edtHoja.Text = '') or (edtSaldoBanco.Text = '') or (edtLibro.Text = '') then
  begin
    MsjError('Faltan datos');
    Exit;
  end
  else ModalResult := mrOk;
end;

end.
