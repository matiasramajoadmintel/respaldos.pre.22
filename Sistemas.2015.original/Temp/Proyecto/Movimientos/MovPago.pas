unit MovPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Mask,
  DBCtrls, MovimientoClass, FacturaClass, ChequeClass, ChequeDataSets;

type
  TfrmMovPago = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    qryFact: TQuery;
    qryFactIdFactura: TSmallintField;
    qryFactNumero: TStringField;
    qryFactFecha: TDateTimeField;
    qryFactProveedor: TStringField;
    qryFactObra: TStringField;
    qryFactTipo: TStringField;
    qryFactMonto: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    edtAPagar: TEdit;
    rgFormaPago: TRadioGroup;
    edtSaldo: TEdit;
    Label8: TLabel;
    edtCheque: TEdit;
    lblCheque: TLabel;
    PAGO: TTable;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgFormaPagoClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gFactura: TFactura;
    procedure PrepararFormulario(IdFactura: Smallint; M: Byte; Id: Word);
    function DatosValidos: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmMovPago: TfrmMovPago;

implementation

uses Comunes, Util, MessagesDataSets, PoolMovimientos, ElecFactura;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmMovPago.Agregar: Boolean;
var
  formElec: TfrmElecFacturas;
begin
  Result := False;
  formElec := TfrmElecFacturas.Create(nil);
  if formElec.GetFactura(gFactura) then
  begin
    Modo := 0;
    PrepararFormulario(gFactura.IdFactura, 0, 0);

    ShowModal;

    Result := (ModalResult = mrOk);
  end;
  formElec.Release;
end;

function TfrmMovPago.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('�Est� seguro de eliminar el �tem elegido?') then Exit;

  if not dmMovimientos.EliminarMovimiento(Id) then Exit;

  Result := True;
end;

function TfrmMovPago.Modificar(Id: Word): Boolean;
begin
{  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);}
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmMovPago.PrepararFormulario(IdFactura: Smallint; M: Byte; Id: Word);
begin
  if M = 0 then //Alta
  begin
    Existe(qryFact, 'IdFactura', IdFactura);
    edtSaldo.Text := CurrToStrF(gFactura.GetSaldo, ffCurrency, 2);
  end
  else //Modificaci�n
  begin
{    Existe(Table, 'IdMovimiento', Id);
    Table.Edit;}
  end;
  lblCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  edtCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  ActiveControl := edtAPagar
end;

function TfrmMovPago.DatosValidos: Boolean;
var
  Monto: Currency;
begin
  Result := false;

  if edtAPagar.Text = '' then
  begin
    MsjError('Monto a pagar no especificado');
    Exit;
  end
  else
    Monto := StrToCurr(edtApagar.Text);

  if Monto > qryFactMonto.Value then
  begin
    MsjError('El monto a pagar supera el saldo de la factura');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmMovPago.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmMovPago.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmMovPago.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmMovPago.PressEnter(Sender: TObject; var Key: Char);
begin
  case key of
    '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
     else key:=#0;
  end;

  if (Key = ',') or (Key = '.') then
    Key := DecimalSeparator;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmMovPago.btnAceptarClick(Sender: TObject);
var
  M: TMovimiento;
  Ch: TCheque;
  IdCheque: Smallint;
begin
  if not DatosValidos then Exit;

  M := TMovimiento.Create;
  M.FechaEfectuada := Date;
  M.Monto := StrToCurr(edtAPagar.Text);
  M.Moneda := 'PESOS';
  M.Tipo := 'PAGO';
  if rgFormaPago.ItemIndex = 0 then
  begin
    M.FormaPago := 'EFECTIVO';
    Ch := nil;
  end
  else
  begin
    M.FormaPago := 'CHEQUE';
    IdCheque := dmCheques.Add(edtCheque.Text, M.Monto);
    Ch := TCheque.Create(IdCheque);
  end;

  if not dmMovimientos.AgregarPagoFactura(gFactura.IdFactura, M, Ch) then Exit;
  gFactura.SetPagado(gFactura.GetSaldo = 0);

  ModalResult := mrOk;
end;

procedure TfrmMovPago.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('�Est� seguro de cancelar la operaci�n?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmMovPago.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmMovPago.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmMovPago.rgFormaPagoClick(Sender: TObject);
begin
  lblCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  edtCheque.Enabled := (rgFormaPago.ItemIndex = 1);
end;

end.
