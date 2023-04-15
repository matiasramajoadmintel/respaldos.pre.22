unit PoolMovimientos;

interface

uses
  SysUtils, Classes, DB, DBTables, FacturaClass, Controls, MovimientoClass,
  ChequeClass, MovimientoCobroClass, MessagesDataSets, Comunes;

type
  TdmMovimientos = class(TDataModule)
    MOV: TTable;
    MOVIdMovimiento: TIntegerField;
    MOVFechaEfectuada: TDateTimeField;
    MOVMonto: TFloatField;
    MOVMoneda: TStringField;
    MOVFormaPago: TStringField;
    MOVTipo: TStringField;
    PAGOFACT: TTable;
    PAGOFACTIdPagoFactura: TIntegerField;
    PAGOFACTIdMovimiento: TIntegerField;
    PAGOFACTIdFactura: TSmallintField;
    PAGOFACTMonto: TFloatField;
    MOVCH: TTable;
    MOVCHIdMovimiento: TIntegerField;
    MOVCHIdCheque: TSmallintField;
    MOVCOB: TTable;
    MOVCOBIdMovimiento: TIntegerField;
    MOVCOBIdCliente: TSmallintField;
    MOVCOBIdObra: TSmallintField;
    MOVCOBTipo: TStringField;

  private
   {}

  public
    function AgregarPagoFactura(IdFact: Smallint; M: TMovimiento; Ch: TCheque): Boolean;
    function AgregarCobroObra(M: TMovimiento; Ch: TCheque; MC: TMovimientoCobro): Boolean;
    function EliminarMovimiento(Id: Smallint): Boolean;

  end;

var
  dmMovimientos: TdmMovimientos;

implementation

uses Util, PoolQuerys;

{$R *.dfm}

function TdmMovimientos.AgregarPagoFactura(IdFact: Smallint; M: TMovimiento; Ch: TCheque): Boolean;
var
  IdMov: Smallint;
begin
  Result := False;

  try
    MOV.Open;
    MOV.Append;
    MOVFechaEfectuada.Value := M.FechaEfectuada;
    MOVMonto.Value := M.Monto;
    MOVMoneda.Text := 'PESOS';
    MOVFormaPago.Text := M.FormaPago;
    MOVTipo.Text := 'PAGO';
    MOV.Post;
    MOV.Close;

    IdMov := dmQuerys.GetMaxIntValue('Movimiento', 'IdMovimiento');

    if Ch <> nil then
    begin
      MOVCH.Open;
      MOVCH.Append;
      MOVCHIdMovimiento.Value := IdMov;
      MOVCHIdCheque.Value := Ch.IdCheque;
      MOVCH.Post;
      MOVCH.Close;
    end;

    PAGOFACT.Open;
    PAGOFACT.Append;
    PAGOFACTIdMovimiento.Value := IdMov;
    PAGOFACTIdFactura.Value := IdFact;
    PAGOFACTMonto.Value := M.Monto;
    PAGOFACT.Post;
    PAGOFACT.Close;
    except on E: EDBEngineError do
    begin
      MsjError('Se produjo un error al intentar genarar el movimiento.');
      MOV.Cancel;
      PAGOFACT.Cancel;
      Exit;
    end;
  end;
  Result := True;
end;

function TdmMovimientos.AgregarCobroObra(M: TMovimiento; Ch: TCheque; MC: TMovimientoCobro): Boolean;
var
  IdMov: Smallint;
begin
  Result := False;

  try
    MOV.Open;
    MOV.Append;
    MOVFechaEfectuada.Value := M.FechaEfectuada;
    MOVMonto.Value := M.Monto;
    MOVMoneda.Text := M.Moneda;
    MOVFormaPago.Text := M.FormaPago;
    MOVTipo.Text := 'COBRO';
    MOV.Post;
    MOV.Close;

    IdMov := dmQuerys.GetMaxIntValue('Movimiento', 'IdMovimiento');

    if Ch <> nil then
    begin
      MOVCH.Open;
      MOVCH.Append;
      MOVCHIdMovimiento.Value := IdMov;
      MOVCHIdCheque.Value := Ch.IdCheque;
      MOVCH.Post;
      MOVCH.Close;
    end;

    MOVCOB.Open;
    MOVCOB.Append;
    MOVCOBIdMovimiento.Value := IdMov;
    MOVCOBIdCliente.Value := MC.Obra.Propietario.IdPropietario;
    MOVCOBIdObra.Value := MC.Obra.IdObra;
    MOVCOBTipo.Text := MC.Tipo;
    MOVCOB.Post;
    MOVCOB.Close;
    except on E: EDBEngineError do
    begin
      MsjError('Se produjo un error al intentar genarar el movimiento.');
      MOV.Cancel;
      MOVCOB.Cancel;
      MOVCH.Cancel;
      Exit;
    end;
  end;
  Result := True;
end;

function TdmMovimientos.EliminarMovimiento(Id: Smallint): Boolean;
begin
  Result := false;
  Existe(MOV, 'IdMovimiento', Id);
  try
    MOV.Delete;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error al intentar eliminar. ' +
                 'Compruebe que el ítem que desea borrar no haya sido utilizado.');
      Exit;
    end;
  end;
  Result := true;
end;

end.



