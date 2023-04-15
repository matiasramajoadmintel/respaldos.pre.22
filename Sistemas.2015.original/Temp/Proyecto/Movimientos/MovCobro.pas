unit MovCobro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Mask,
  DBCtrls, MovimientoClass, ChequeClass, ChequeDataSets, ObraClass,
  MovimientoCobroClass;

type
  TfrmMovCobro = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtAPagar: TEdit;
    rgFormaPago: TRadioGroup;
    edtSaldoHon: TEdit;
    edtSaldoPres: TLabel;
    edtCheque: TEdit;
    lblCheque: TLabel;
    edtObra: TEdit;
    edtHonorarios: TEdit;
    edtPropietario: TEdit;
    edtSaldoObra: TEdit;
    edtNombreObra: TEdit;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel2: TBevel;
    Label8: TLabel;
    rgTipoCobro: TRadioGroup;
    edtMoneda: TEdit;
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
    gObra: TObra;
    procedure PrepararFormulario(Obra: TObra; M: Byte);
    function DatosValidos: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmMovCobro: TfrmMovCobro;

implementation

uses Comunes, Util, MessagesDataSets, PoolMovimientos, ElecObra;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmMovCobro.Agregar: Boolean;
var
  formElec: TfrmElecObra;
  R: Boolean;
begin
  Result := False;
  formElec := TfrmElecObra.Create(nil);
  if formElec.GetObra(gObra) then
  begin
    Modo := 0;
    PrepararFormulario(gObra, 0);

    ShowModal;

    Result := (ModalResult = mrOk);
  end;
  formElec.Release;
end;

function TfrmMovCobro.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  if not dmMovimientos.EliminarMovimiento(Id) then Exit;
  
  Result := True;
end;

function TfrmMovCobro.Modificar(Id: Word): Boolean;
begin
{  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);}
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmMovCobro.PrepararFormulario(Obra: TObra; M: Byte);
begin
  gObra := Obra;
  edtNombreObra.Text := Obra.Nombre;
  edtPropietario.Text := Obra.Propietario.Nombre;
  edtObra.Text := CurrToStrF(Obra.Presupuesto, ffCurrency, 2);
  edtHonorarios.Text := CurrToStrF(Obra.Honorarios, ffCurrency, 2);
  edtSaldoObra.Text := CurrToStrF(Obra.GetSaldoObra, ffCurrency, 2);
  edtSaldoHon.Text := CurrToStrF(Obra.GetSaldoHonorarios, ffCurrency, 2);
  edtMoneda.Text := Obra.Moneda;

  if M = 0 then //Alta
  begin
    {}
  end
  else //Modificación
  begin
{    Existe(Table, 'IdMovimiento', Id);
    Table.Edit;}
  end;

  lblCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  edtCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  ActiveControl := edtAPagar
end;

function TfrmMovCobro.DatosValidos: Boolean;
var
  Monto, Saldo: Currency;
begin
  Result := false;

  if edtAPagar.Text = '' then
  begin
    MsjError('Monto a pagar no especificado');
    Exit;
  end
  else
    Monto := StrToCurr(edtApagar.Text);

  if rgTipoCobro.ItemIndex = 0 then Saldo := gObra.GetSaldoObra
  else Saldo := gObra.GetSaldoHonorarios;

  if Monto > Saldo then
  begin
    MsjError('El monto cobrado supera el saldo correspondiente');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmMovCobro.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmMovCobro.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmMovCobro.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmMovCobro.PressEnter(Sender: TObject; var Key: Char);
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

procedure TfrmMovCobro.btnAceptarClick(Sender: TObject);
var
  M: TMovimiento;
  Ch: TCheque;
  IdCheque: Smallint;
  Tipo: String;
begin
  if not DatosValidos then Exit;

  M := TMovimiento.Create;
  M.FechaEfectuada := Date;
  M.Monto := StrToCurr(edtAPagar.Text);
  M.Moneda := gObra.Moneda;
  M.Tipo := 'COBRO';
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

  if rgTipoCobro.ItemIndex = 0 then Tipo := 'OBRA'
  else Tipo := 'HONORARIOS';
  if not dmMovimientos.AgregarCobroObra(M, Ch, TMovimientoCobro.Create(gObra, Tipo)) then Exit;

  ModalResult := mrOk;
end;

procedure TfrmMovCobro.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmMovCobro.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmMovCobro.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmMovCobro.rgFormaPagoClick(Sender: TObject);
begin
  lblCheque.Enabled := (rgFormaPago.ItemIndex = 1);
  edtCheque.Enabled := (rgFormaPago.ItemIndex = 1);
end;

end.
