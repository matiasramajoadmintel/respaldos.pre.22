program Ravier;

uses
  Forms,
  Principal in 'Principal\Principal.pas' {frmPrincipal},
  Command in 'Command\Command.pas',
  InterfaceDataSets in 'Modulos de datos\InterfaceDataSets.pas' {dmInterface: TDataModule},
  Comunes in '..\..\All Projects\Delphi\Comunes\Comunes.pas',
  MSJU in '..\..\All Projects\Delphi\Comunes\MSJU.pas' {frmMSJ},
  DataBases in 'Modulos de datos\DataBases.pas' {dmDataBases: TDataModule},
  ElecEnt in 'Entidades simples\ElecEnt.pas' {frmElecEnt},
  Util in '..\..\All Projects\Delphi\Comunes\Util.pas',
  MensajeError in '..\..\All Projects\Delphi\Comunes\MensajeError.pas' {frmMsjError},
  Input in '..\..\All Projects\Delphi\Input\Input.pas',
  Ing2Textos in '..\..\All Projects\Delphi\Input\Ing2Textos.pas' {frmIng2Textos},
  IngClave in '..\..\All Projects\Delphi\Input\IngClave.pas' {frmIngClave},
  IngClaves in '..\..\All Projects\Delphi\Input\IngClaves.pas' {frmIngClaves},
  IngDia in '..\..\All Projects\Delphi\Input\IngDia.pas' {frmIngDia},
  IngFecha in '..\..\All Projects\Delphi\Input\IngFecha.pas' {frmfecha},
  IngFechas in '..\..\All Projects\Delphi\Input\IngFechas.pas' {frmIngFechas},
  IngMes in '..\..\All Projects\Delphi\Input\IngMes.pas' {frmIngMes},
  IngTexto in '..\..\All Projects\Delphi\Input\IngTexto.pas' {frmIngTexto},
  StoredProcs in 'Modulos de datos\StoredProcs.pas' {dmStoredProcs: TDataModule},
  MessagesDataSets in '..\..\All Projects\Delphi\Mensajes de error\MessagesDataSets.pas' {dmMessages: TDataModule},
  Cliente in 'Cliente\Cliente.pas' {frmCliente},
  Obra in 'Obra\Obra.pas' {frmObra},
  PoolQuerys in 'Modulos de datos\PoolQuerys.pas' {dmQuerys: TDataModule},
  ElecFactura in 'Factura\ElecFactura.pas' {frmElecFacturas},
  Proveedor in 'Proveedor\Proveedor.pas' {frmProv},
  MovCobro in 'Movimientos\MovCobro.pas' {frmMovCobro},
  Servicio in 'Servicio\Servicio.pas' {frmServicio},
  ElecServicio in 'Servicio\ElecServicio.pas' {frmElecServicios},
  Material in 'Material\Material.pas' {frmMaterial},
  ElecMaterial in 'Material\ElecMaterial.pas' {frmElecMateriales},
  Remito in 'Remito\Remito.pas' {frmRemito},
  ElecCliente in 'Cliente\ElecCliente.pas' {frmElecCliente},
  ElecEmpleado in 'Empleado\ElecEmpleado.pas' {frmElecEmpleado},
  Factura in 'Factura\Factura.pas' {frmFactura},
  Pedido in 'Pedido\Pedido.pas' {frmPedido},
  ElecObra in 'Obra\ElecObra.pas' {frmElecObra},
  ElecPedido in 'Pedido\ElecPedido.pas' {frmElecPedido},
  Empleado in 'Empleado\Empleado.pas' {frmEmpleado},
  ElecRemito in 'Remito\ElecRemito.pas' {frmElecRemito},
  ElecProveedor in 'Proveedor\ElecProveedor.pas' {frmElecProveedor},
  PoolMovimientos in 'Movimientos\PoolMovimientos.pas' {dmMovimientos: TDataModule},
  MovimientoClass in 'Movimientos\MovimientoClass.pas',
  FacturaClass in 'Factura\FacturaClass.pas',
  FacturaDataSets in 'Factura\FacturaDataSets.pas' {dmFactura: TDataModule},
  ChequeClass in 'Cheques\ChequeClass.pas',
  ChequeDataSets in 'Cheques\ChequeDataSets.pas' {dmCheques: TDataModule},
  ObraClass in 'Obra\ObraClass.pas',
  PropietarioClass in 'Cliente\PropietarioClass.pas',
  ObraDataSets in 'Obra\ObraDataSets.pas' {dmObras: TDataModule},
  PropietarioDataSets in 'Cliente\PropietarioDataSets.pas' {dmPropietario: TDataModule},
  MovPago in 'Movimientos\MovPago.pas' {frmMovPago},
  MovimientoCobroClass in 'Movimientos\MovimientoCobroClass.pas';

{$R *.res}

begin
  MostrarMSJ('Iniciando sistema...');
  Application.ProcessMessages;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmDataBases, dmDataBases);
  Application.CreateForm(TdmInterface, dmInterface);
  Application.CreateForm(TdmStoredProcs, dmStoredProcs);
  Application.CreateForm(TdmMessages, dmMessages);
  Application.CreateForm(TdmQuerys, dmQuerys);
  Application.CreateForm(TfrmElecObra, frmElecObra);
  Application.CreateForm(TfrmElecPedido, frmElecPedido);
  Application.CreateForm(TfrmEmpleado, frmEmpleado);
  Application.CreateForm(TfrmElecRemito, frmElecRemito);
  Application.CreateForm(TfrmElecProveedor, frmElecProveedor);
  Application.CreateForm(TdmMovimientos, dmMovimientos);
  Application.CreateForm(TdmFactura, dmFactura);
  Application.CreateForm(TdmCheques, dmCheques);
  Application.CreateForm(TdmObras, dmObras);
  Application.CreateForm(TdmPropietario, dmPropietario);
  Application.CreateForm(TfrmMovPago, frmMovPago);
  OcultarMSJ;
  Application.Run;
end.
