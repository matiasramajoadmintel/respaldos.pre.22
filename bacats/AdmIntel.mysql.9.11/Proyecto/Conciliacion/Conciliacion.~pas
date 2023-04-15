unit Conciliacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Printers;

type
  TfrmConciliacion = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    DBGrid3: TDBGrid;
    Label4: TLabel;
    DBGrid4: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    qry2: TQuery;
    qry2COSTO: TFloatField;
    qry2DESCRIP: TStringField;
    qry3: TQuery;
    qry1: TQuery;
    qry1FECHA_PAGO: TDateTimeField;
    qry1PROVEEDOR: TStringField;
    qry1IMPORTE: TFloatField;
    qry3NRO_CHEQUE: TStringField;
    qry3FECHA_PAGO: TDateTimeField;
    qry3PROVEEDOR: TStringField;
    qry3IMPORTE: TFloatField;
    qry4: TQuery;
    qry4FECHA_PAGO: TDateTimeField;
    qry4DESCRIP: TStringField;
    qry4COSTO: TFloatField;
    lblTot1: TLabel;
    lblTot2: TLabel;
    lblTot3: TLabel;
    lblTot4: TLabel;
    Panel5: TPanel;
    lblHoja: TLabel;
    Panel6: TPanel;
    lblTotA: TLabel;
    lblA_B: TLabel;
    lblTotB: TLabel;
    lblLibro: TLabel;
    lblDif: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnReporte: TSpeedButton;
    lblSBanco: TLabel;
    lblSLibro: TLabel;
    lblCheqAnul: TLabel;
    qry2FECHA: TDateTimeField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnReporteClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(const M: Byte; const FI,FF: TDateTime;
                                 const Hoja: Integer;
                                 const SaldoBanco, SaldoLibro: Currency;
                                 const CheqAnul: String);
    function DatosValidos: Boolean;
    procedure ArmarReporte;

  public
    procedure Mostrar(const M: Byte; const FI,FF: TDateTime;
                      const Hoja: Integer;
                      const SaldoBanco, SaldoLibro: Currency;
                      const CheqAnul: String);

  end;

var
  frmConciliacion: TfrmConciliacion;

implementation

uses Comunes, Util, Unit1;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmConciliacion.Mostrar(const M: Byte; const FI,FF: TDateTime; const Hoja: Integer;
                                   const SaldoBanco, SaldoLibro: Currency;
                                   const CheqAnul: String);
begin
  Modo := M;
  PrepararFormulario(M,FI,FF,Hoja,SaldoBanco,SaldoLibro,CheqAnul);

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmConciliacion.PrepararFormulario(const M: Byte; const FI,FF: TDateTime; const Hoja: Integer;
                                              const SaldoBanco, SaldoLibro: Currency;
                                              const CheqAnul: String);
var
  Tot1, Tot2, Tot3, Tot4, TotA, TotB, A_B, Dif: Currency;
  S: String;
begin
  Caption := 'Conciliación bancaria del   ' + DateToStr(FI) + '   al   ' + DateToStr(FF);
  lblHoja.Caption := 'Saldo según extracto bancario: (Hoja ' + IntToStr(Hoja) + ')';

  qry1.Close;
  qry1.ParamByName('FI').AsDateTime := FI;
  qry1.ParamByName('FF').AsDateTime := FF;

  qry2.Close;
  qry2.ParamByName('FI').AsDateTime := FI;
  qry2.ParamByName('FF').AsDateTime := FF;

  qry3.Close;
  qry3.ParamByName('FI').AsDateTime := FI;
  qry3.ParamByName('FF').AsDateTime := FF;

  qry4.Close;
  qry4.ParamByName('FI').AsDateTime := FI;
  qry4.ParamByName('FF').AsDateTime := FF;

  Tot1 := SumaColumna(qry1,'IMPORTE');
  Tot2 := SumaColumna(qry2,'COSTO');
  Tot3 := SumaColumna(qry3,'IMPORTE');
  Tot4 := SumaColumna(qry4,'COSTO');

  lblTot1.Caption := CurrToStrF(Tot1,ffCurrency ,2);
  lblTot2.Caption := CurrToStrF(Tot2,ffCurrency ,2);
  lblTot3.Caption := CurrToStrF(Tot3,ffCurrency ,2);
  lblTot4.Caption := CurrToStrF(Tot4,ffCurrency ,2);

//  S := Copy(edtSaldoBanco.Text,3,Length(edtSaldoBanco.Text));
  lblSBanco.Caption := CurrToStrF(SaldoBanco,ffCurrency ,2);
  TotA := SaldoBanco + Tot1 + Tot2;
  lblTotA.Caption := 'Subtotal A    ' + CurrToStrF(TotA,ffCurrency ,2);

  TotB := Tot3 + Tot4;
  lblTotB.Caption := CurrToStrF(TotB,ffCurrency ,2);

  A_B := TotA - TotB;
  lblA_B.Caption := CurrToStrF(A_B,ffCurrency ,2);

  lblSLibro.Caption := CurrToStrF(SaldoLibro,ffCurrency ,2);
  Dif := A_B - SaldoLibro;
  lblDif.Caption := CurrToStrF(Dif,ffCurrency ,2);
  if Dif <> 0 then lblDif.Font.Color := clRed
  else lblDif.Font.Color := clGreen;

  lblCheqAnul.Caption := 'Cheques anulados: ' + CheqAnul;
end;

function TfrmConciliacion.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmConciliacion.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmConciliacion.Salida_de_Campo(Sender: TObject);
var
  Aux: Currency;
  S: String;
begin
  SalidaDeCampo(self,Sender);

  {if Sender = edtSaldoBanco then
  begin
    if edtSaldoBanco.Text[1] = '$' then
    begin
      S := Copy(edtSaldoBanco.Text,3,Length(edtSaldoBanco.Text));
      Aux := StrToCurr(S);
    end
    else Aux := StrToCurr(edtSaldoBanco.Text);
    edtSaldoBanco.Text := CurrToStrF(Aux,ffCurrency ,2);
  end;}
end;

procedure TfrmConciliacion.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmConciliacion.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmConciliacion.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmConciliacion.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmConciliacion.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmConciliacion.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmConciliacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry1.Close;
  qry2.Close;
  qry3.Close;
  qry4.Close;
end;

procedure TfrmConciliacion.btnReporteClick(Sender: TObject);
begin
{  with TfrmQRConciliacion.Create(nil) do
  begin
    VistaPrevia(Date,Date);
    Release;
  end;}
  ArmarReporte;
end;

procedure TfrmConciliacion.ArmarReporte;
var
  MyRep: TCanvas;
begin
  with Form1.Image1.Canvas do
  begin
//    BeginDoc;
    Font.Size := 12;
    Font.Style := [fsBold];
//    Title := 'CONCIALIACION BANCARIA';
    TextOut(100,100,'ADMINISTRACION ADMINTEL');
    Font.Style := [];
    TextOut(100,PenPos.Y + 2 * Font.Size,'CONCILIACION BANCARIA AL: 28 de Febrero de 2003');
    TextOut(100,PenPos.Y + 2 * Font.Size,'Cuenta Nº 14500177/65 - BANCO NACION ARGENTINA');
    Font.Style := [fsBold];
{    TextOut(100,PenPos.Y + 2 * Font.Size,'SALDO SEGUN EXTRACTO BANCARIO: (Hoja ' +
            edtHoja.Text + ')           ' + edtSaldoBanco.Text);}
    Font.Style := [];
    TextOut(100,PenPos.Y + 2 * Font.Size,'2. DEPOSITOS BANCARIOS SIN CONTABILIZAR (+)');
    Font.Style := [fsBold];
    TextOut(200,PenPos.Y + 2 * Font.Size,'FECHA DEBITO');
    TextOut(500,PenPos.Y + 2 * Font.Size,'CONCEPTO');
    TextOut(1000,PenPos.Y + 2 * Font.Size,'IMPORTE');
    Font.Style := [];
    qry2.First;
    while not qry2.Eof do
    begin
      TextOut(200,PenPos.Y + 2 * Font.Size,qry2FECHA.Text);
      TextOut(500,PenPos.Y + 2 * Font.Size,qry2DESCRIP.Text);
      TextOut(1000,PenPos.Y + 2 * Font.Size,qry2COSTO.Text);
      qry2.Next;
    end;


//    EndDoc;
  end;

//  Form1.Image1.Canvas := MyRep;
  Form1.Show;
end;

end.
