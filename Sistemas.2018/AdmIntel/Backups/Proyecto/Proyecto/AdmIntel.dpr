program AdmIntel;

uses
  Forms,
  Principal in 'Principal\Principal.pas' {frmPrincipal},
  IngDatosConci in 'Conciliacion\IngDatosConci.pas' {frmIngDatosConci},
  StoreProcs in 'Modulos de datos\StoreProcs\StoreProcs.pas' {dmStoreProc: TDataModule},
  Proveedor in 'Proveedores\Proveedor.pas' {frmProv},
  ElecProv in 'Proveedores\ElecProv.pas' {frmElecProv},
  PoolDatos in 'Modulos de datos\PoolDatos\PoolDatos.pas' {dmDatos: TDataModule},
  IngMed in 'Unidades de medida\IngMed.pas' {frmIngMed},
  ElecMed in 'Unidades de medida\ElecMed.pas' {frmElecMed},
  DetPagos in 'Pagos\DetPagos.pas' {frmDetPagos},
  Grafico in 'Trabajo\Grafico.pas' {frmGrafico},
  RecAnul in 'Pagos\RecAnul.pas' {frmRecAnul},
  IngMat in 'Trabajo\IngMat.pas' {frmIngMat},
  ConfigEC in 'Espacios comunes\ConfigEC.pas' {frmConfigEC},
  Trabajo in 'Trabajo\Trabajo.pas' {frmTrabajos},
  TrabEdi in 'Trabajo\TrabEdi.pas' {frmTrabEdi},
  Credito in 'Creditos bancarios\Credito.pas' {frmCredito},
  IngCredito in 'Creditos bancarios\IngCredito.pas' {frmIngCredito},
  QRCheques in 'Reportes\QRCheques.pas' {frmQRCheques},
  IngTServ in 'Servicios\IngTServ.pas' {frmIngTServ},
  IngIngreso in 'Ingresos\IngIngreso.pas' {frmIngIngreso},
  Ingreso in 'Ingresos\Ingreso.pas' {frmIngreso},
  IngGastoAd in 'Gastos\IngGastoAd.pas' {frmIngGastoAd},
  ElecTServ in 'Servicios\ElecTServ.pas' {frmElecTServ},
  Conciliacion in 'Conciliacion\Conciliacion.pas' {frmConciliacion},
  IngGastoFi in 'Gastos\IngGastoFi.pas' {frmIngGastoFi},
  QRPagos in 'Reportes\QRPagos.pas' {frmQRPagos},
  IngFecAdmIntel in 'Fechas\IngFecAdmIntel.pas' {frmIngFecAdmIntel},
  Deudas in 'Pagos\Deudas.pas' {frmDeudas},
  DetTrab in 'Trabajo\DetTrab.pas' {frmDetTrab},
  PoolCheques in 'Modulos de datos\PoolCheques\PoolCheques.pas' {dmCheques: TDataModule},
  QRCuentaMant3 in 'Reportes\QRCuentaMant3.pas' {frmQRCuentaMant3},
  QRCuentaAdministracion in 'Reportes\QRCuentaAdministracion.pas' {frmQRCuentaAdministracion},
  QRCuentaMant in 'Reportes\QRCuentaMant.pas' {frmQRCuentaMant},
  QRGastoFi2 in 'Reportes\QRGastoFi2.pas' {frmQRGastoFi2},
  QRCuentaServVacios in 'Reportes\QRCuentaServVacios.pas' {frmQRCuentaSerVacios},
  ElecEC in 'Espacios comunes\ElecEC.pas' {frmElecEC},
  DatosPago in 'Pagos\DatosPago.pas' {frmDatosPago},
  Est_Ingresos in 'Estadisticas\Est_Ingresos.pas' {frmEstIngresos},
  Est_Servicios in 'Estadisticas\Est_Servicios.pas' {frmEstServicios},
  Est_Cheques in 'Estadisticas\Est_Cheques.pas' {frmEstCheques},
  Est_Mantenimiento in 'Estadisticas\Est_Mantenimiento.pas' {frmEstMantenimiento},
  PoolAux in 'Modulos de datos\PoolDatos\PoolAux.pas' {dmAux: TDataModule},
  QRLstGastoAd in 'Reportes\QRLstGastoAd.pas' {frmQRLstGastoAd},
  QRTrab in 'Reportes\QRTrab.pas' {frmQRTrab},
  QRTrabEdif in 'Reportes\QRTrabEdif.pas' {frmQRTrabEdif},
  Pagos in 'Pagos\Pagos.pas' {frmPagos},
  Cheques in 'Gastos\Cheques.pas' {frmCheques},
  ResetCol in 'ResetCol\ResetCol.pas' {frmResetCol},
  Util in '..\..\..\All Projects\Comunes\Util.pas',
  Comunes in '..\..\..\All Projects\Comunes\Comunes.pas',
  MemoIN in '..\..\..\All Projects\Comunes\MemoIN.pas' {frmMMIN},
  MensajeError in '..\..\..\All Projects\Comunes\MensajeError.pas' {frmMsjError},
  MSJU in '..\..\..\All Projects\Comunes\MSJU.pas' {frmMSJ},
  Input in '..\..\..\All Projects\Input\Input.pas',
  Ing2Textos in '..\..\..\All Projects\Input\Ing2Textos.pas' {frmIng2Textos},
  IngClave in '..\..\..\All Projects\Input\IngClave.pas' {frmIngClave},
  IngClaves in '..\..\..\All Projects\Input\IngClaves.pas' {frmIngClaves},
  IngFecha in '..\..\..\All Projects\Input\IngFecha.pas' {frmfecha},
  IngFechas in '..\..\..\All Projects\Input\IngFechas.pas' {frmIngFechas},
  IngMes in '..\..\..\All Projects\Input\IngMes.pas' {frmIngMes},
  IngTexto in '..\..\..\All Projects\Input\IngTexto.pas' {frmIngTexto},
  ElecEnt in 'Entidades simples\ElecEnt.pas' {frmElecEnt},
  IngServ in 'Servicios\IngServ.pas' {frmIngServ},
  Lonuevo in '..\..\..\All Projects\Lonuevo\Lonuevo.pas' {frmLoNuevo},
  Unit1 in 'Unit1.pas' {Form1},
  QRCuentaServicios in 'Reportes\QRCuentaServicios.pas' {frmQRCuentaServicios},
  ElecOcupante in 'Ocupantes\ElecOcupante.pas' {frmElecOcupante},
  Tablas in 'Modulos de datos\Tablas\Tablas.pas' {dmTablas: TDataModule},
  IngOcupante in 'Ocupantes\IngOcupante.pas' {frmIngOcupante},
  IngOcupante5 in 'Ocupantes\IngOcupante5.pas' {frmIngOcupante5},
  IngOcupante2 in 'Ocupantes\IngOcupante2.pas' {frmIngOcupante2},
  IngOcupante3 in 'Ocupantes\IngOcupante3.pas' {frmIngOcupante3},
  IngOcupante4 in 'Ocupantes\IngOcupante4.pas' {frmIngOcupante4},
  IngEspecialidad in 'Especialidades\IngEspecialidad.pas' {frmIngEspecialidad},
  ElecEspecialidad in 'Especialidades\ElecEspecialidad.pas' {frmElecEspecialidad},
  IngGrado in 'Grados\IngGrado.pas' {frmIngGrado},
  ElecGrado in 'Grados\ElecGrado.pas' {frmElecGrado},
  ElecEdificio in 'Edificios\ElecEdificio.pas' {frmElecEdificio},
  IngEdificio in 'Edificios\IngEdificio.pas' {frmIngEdificio},
  ElecDepto in 'Departamentos\ElecDepto.pas' {frmElecDepto},
  IngOcupacion in 'Ocupacion\IngOcupacion.pas' {frmIngOcupacion},
  ElecOcupacion in 'Ocupacion\ElecOcupacion.pas' {frmElecOcupacion},
  IngTipoArtefacto in 'TipoArtefacto\IngTipoArtefacto.pas' {frmIngTipoArtefacto},
  ElecTipoArtefacto in 'TipoArtefacto\ElecTipoArtefacto.pas' {frmElecTipoArtefacto},
  IngTipoDesc in 'TipoDescuento\IngTipoDesc.pas' {frmIngTipoDesc},
  ElecTipoDesc in 'TipoDescuento\ElecTipoDesc.pas' {frmElecTipoDesc},
  IngDescuento in 'Descuento\IngDescuento.pas' {frmIngDescuento},
  ElecDescuento in 'Descuento\ElecDescuento.pas' {frmElecDescuento},
  PoolQuerys in 'Modulos de datos\PoolQuerys\PoolQuerys.pas' {dmQuerys: TDataModule},
  IngDepto in 'Departamentos\IngDepto.pas' {frmIngDepto},
  IngCoef in 'Coef\IngCoef.pas' {frmIngCoef},
  ElecCoef in 'Coef\ElecCoef.pas' {frmElecCoef};

{$R *.res}

begin
  MostrarMsj('Iniciando sistema...');
  Application.ProcessMessages;
  Application.Initialize;
  Application.CreateForm(TdmStoreProc, dmStoreProc);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmAux, dmAux);
  Application.CreateForm(TdmCheques, dmCheques);
  Application.CreateForm(TdmTablas, dmTablas);
  Application.CreateForm(TdmQuerys, dmQuerys);
  dmDatos.DECI.Open;
  dmDatos.GenerarNrosDECI;
  OcultarMSJ;
  Application.Run;
end.
