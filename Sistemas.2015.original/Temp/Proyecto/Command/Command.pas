unit Command;

interface

type
  TCommand = class(TObject) //Esta clase est� implementada como un Sigleton

  public
    class function NewInstance: TObject; override;
    procedure FreeInstance; override;
    class function GetRefCount: Integer;

    function AddRecord(TableName: String): Boolean;
    function RemoveRecord(TableName: String; IdRecord: Word): Boolean;
    function UpdateRecord(TableName: String; IdRecord: Word): Boolean;
  end;

var
  Instance: TCommand = nil;
  RefCount: Integer = 0;

implementation

uses QForms, Forms, Cliente, Obra, Proveedor, Empleado, Factura, Pedido,
  Remito, MovCobro, MovPago;

procedure TCommand.FreeInstance;
begin
  Dec( RefCount );
  if (RefCount = 0) then
  begin
    Instance := nil;
    // Destroy private variables here
    inherited FreeInstance;
  end;
end;

class function TCommand.NewInstance: TObject;
begin
  if not Assigned(Instance) then
  begin
    Instance := TCommand(TObject.NewInstance);
    // Initialize private variables here, like this:
    //   TSingleton(Result).Variable := Value;
  end;
  Result := Instance;
  Inc(RefCount);
end;

class function TCommand.GetRefCount: Integer;
begin
  Result := RefCount;
end;

function TCommand.AddRecord(TableName: String): Boolean;
var
  R: Boolean;
begin
  if TableName = 'Propietarios' then
    with TfrmCliente.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Obras' then
    with TfrmObra.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Proveedores' then
    with TfrmProv.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Personal' then
    with TfrmEmpleado.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Facturas' then
    with TfrmFactura.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Pedidos' then
    with TfrmPedido.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Remitos' then
    with TfrmRemito.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Cobros' then
    with TfrmMovCobro.Create(nil) do
    begin
      R := Agregar;
      Release;
    end
  else if TableName = 'Pagos' then
    with TfrmMovPago.Create(nil) do
    begin
      R := Agregar;
      Release;
    end;

  Result := R;
end;

function TCommand.RemoveRecord(TableName: String; IdRecord: Word): Boolean;
var
  R: Boolean;
begin
  if TableName = 'Propietarios' then
    with TfrmCliente.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Obras' then
    with TfrmObra.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Proveedores' then
    with TfrmProv.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Personal' then
    with TfrmEmpleado.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Facturas' then
    with TfrmFactura.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Pedidos' then
    with TfrmPedido.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Remitos' then
    with TfrmRemito.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Pagos' then
    with TfrmMovPago.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end
  else if TableName = 'Cobros' then
    with TfrmMovCobro.Create(nil) do
    begin
      R := Eliminar(IdRecord);
      Release;
    end;


  Result := R;
end;

function TCommand.UpdateRecord(TableName: String; IdRecord: Word): Boolean;
var
  R: Boolean;
begin
  if TableName = 'Propietarios' then
    with TfrmCliente.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Obras' then
    with TfrmObra.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Proveedores' then
    with TfrmProv.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Personal' then
    with TfrmEmpleado.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Facturas' then
    with TfrmFactura.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Pedidos' then
    with TfrmPedido.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end
  else if TableName = 'Remitos' then
    with TfrmRemito.Create(nil) do
    begin
      R := Modificar(IdRecord);
      Release;
    end;

  Result := R;
end;

end.
