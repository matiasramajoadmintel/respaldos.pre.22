program AdmIntel;

uses
  Forms,
  Principal in 'Principal\Principal.pas' {frmPrincipal},
  IngPersonal in 'Personal\IngPersonal.pas' {frmIngPersonal},
  StoreProcs in 'Modulos de datos\StoreProcs\StoreProcs.pas' {dmStoreProc: TDataModule},
  Proveedor in 'Proveedores\Proveedor.pas' {frmProv},
  ElecPersonal in 'Personal\ElecPersonal.pas' {frmElecPersonal},
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
  QROcupHistoricos in 'Reportes\QROcupHistoricos.pas' {frmQROcupHistoricos},
  IngTServ in 'Servicios\IngTServ.pas' {frmIngTServ},
  IngIngreso in 'Ingresos\IngIngreso.pas' {frmIngIngreso},
  Ingreso in 'Ingresos\Ingreso.pas' {frmIngreso},
  Personal in 'Personal\Personal.pas' {frmPersonal},
  ElecTServ in 'Servicios\ElecTServ.pas' {frmElecTServ},
  Conciliacion in 'Conciliacion\Conciliacion.pas' {frmConciliacion},
  IngGastoFi in 'Gastos\IngGastoFi.pas' {frmIngGastoFi},
  QRPagosPorPagador in 'Reportes\QRPagosPorPagador.pas' {frmQRPagosPagador},
  IngFecAdmIntel in 'Fechas\IngFecAdmIntel.pas' {frmIngFecAdmIntel},
  Deudas in 'Pagos\Deudas.pas' {frmDeudas},
  DetTrab in 'Trabajo\DetTrab.pas' {frmDetTrab},
  PoolCheques in 'Modulos de datos\PoolCheques\PoolCheques.pas' {dmCheques: TDataModule},
  QRCuentaMant3 in 'Reportes\QRCuentaMant3.pas' {frmQRCuentaMant3},
  QRResumenDECIsServ in 'Reportes\QRResumenDECIsServ.pas' {frmQRResumenDECIsServ},
  QRCuentaMant in 'Reportes\QRCuentaMant.pas' {frmQRCuentaMant},
  QRResumenCobros in 'Reportes\QRResumenCobros.pas' {frmQRResumenCobros},
  QRCuentaServVacios in 'Reportes\QRCuentaServVacios.pas' {frmQRCuentaSerVacios},
  ElecEC in 'Espacios comunes\ElecEC.pas' {frmElecEC},
  DatosPago in 'Pagos\DatosPago.pas' {frmDatosPago},
  Est_GastosAdmin in 'Estadisticas\Est_GastosAdmin.pas' {frmEstGastosAdmin},
  Est_Servicios in 'Estadisticas\Est_Servicios.pas' {frmEstServicios},
  Est_Cheques in 'Estadisticas\Est_Cheques.pas' {frmEstCheques},
  PoolAux in 'Modulos de datos\PoolDatos\PoolAux.pas' {dmAux: TDataModule},
  QRLstGastoAd in 'Reportes\QRLstGastoAd.pas' {frmQRLstGastoAd},
  QRTrab in 'Reportes\QRTrab.pas' {frmQRTrab},
  QRTrabEdif in 'Reportes\QRTrabEdif.pas' {frmQRTrabEdif},
  Pagos in 'Pagos\Pagos.pas' {frmPagos},
  Cheques in 'Gastos\Cheques.pas' {frmCheques},
  ResetCol in 'ResetCol\ResetCol.pas' {frmResetCol},
  ElecEnt in 'Entidades simples\ElecEnt.pas' {frmElecEnt},
  IngServ in 'Servicios\IngServ.pas' {frmIngServ},
  Unit1 in 'Unit1.pas' {Form1},
  QRCuentaServicios in 'Reportes\QRCuentaServicios.pas' {frmQRCuentaServicios},
  Tablas in 'Modulos de datos\Tablas\Tablas.pas' {dmTablas: TDataModule},
  PersonaDetail in 'Ocupantes\PersonaDetail.pas' {frmPersonaDetail},
  OcupanteParticular in 'Ocupantes\OcupanteParticular.pas' {frmOcupanteParticular},
  PersonalMilitarDetail in 'Ocupantes\PersonalMilitarDetail.pas' {frmPersonalMilitarDetail},
  OcupanteCivil in 'Ocupantes\OcupanteCivil.pas' {frmOcupanteCivil},
  MilitarNoOcupante in 'Ocupantes\MilitarNoOcupante.pas' {frmMilitarNoOcupante},
  IngEspecialidad in 'Especialidades\IngEspecialidad.pas' {frmIngEspecialidad},
  ElecEspecialidad in 'Especialidades\ElecEspecialidad.pas' {frmElecEspecialidad},
  IngGrado in 'Grados\IngGrado.pas' {frmIngGrado},
  ElecGrado in 'Grados\ElecGrado.pas' {frmElecGrado},
  ElecEdificio in 'Edificios\ElecEdificio.pas' {frmElecEdificio},
  IngEdificio in 'Edificios\IngEdificio.pas' {frmIngEdificio},
  ElecDeptoVacio in 'Departamentos\ElecDeptoVacio.pas' {frmElecDeptoVacio},
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
  ElecCoef in 'Coef\ElecCoef.pas' {frmElecCoef},
  Recibo in 'Recibos\Recibo.pas' {frmRecibo},
  Util in '..\..\All Projects\Delphi\Comunes\Util.pas',
  Comunes in '..\..\All Projects\Delphi\Comunes\Comunes.pas',
  MensajeError in '..\..\All Projects\Delphi\Comunes\MensajeError.pas' {frmMsjError},
  MSJU in '..\..\All Projects\Delphi\Comunes\MSJU.pas' {frmMSJ},
  Input in '..\..\All Projects\Delphi\Input\Input.pas',
  Ing2Textos in '..\..\All Projects\Delphi\Input\Ing2Textos.pas' {frmIng2Textos},
  IngClave in '..\..\All Projects\Delphi\Input\IngClave.pas' {frmIngClave},
  IngClaves in '..\..\All Projects\Delphi\Input\IngClaves.pas' {frmIngClaves},
  IngDia in '..\..\All Projects\Delphi\Input\IngDia.pas' {frmIngDia},
  IngFecha in '..\..\All Projects\Delphi\Input\IngFecha.pas' {frmfecha},
  IngFechas in '..\..\All Projects\Delphi\Input\IngFechas.pas' {frmIngFechas},
  IngMes in '..\..\All Projects\Delphi\Input\IngMes.pas' {frmIngMes},
  IngTexto in '..\..\All Projects\Delphi\Input\IngTexto.pas' {frmIngTexto},
  Lonuevo in '..\..\All Projects\Delphi\Lonuevo\Lonuevo.pas' {frmLoNuevo},
  EstMantLineas in 'Estadisticas\EstMantLineas.pas' {frmEstMantLineas},
  EstMantBarras in 'Estadisticas\EstMantBarras.pas' {frmEstMantBarras},
  EstMantTorta in 'Estadisticas\EstMantTorta.pas' {frmEstMantTorta},
  ElecDepto in 'Departamentos\ElecDepto.pas' {frmElecDepto},
  QRGastoFi2 in 'Reportes\QRGastoFi2.pas' {frmQRGastoFi2},
  QRCheques in 'Reportes\QRCheques.pas' {frmQRCheques},
  ReportManager in 'Reportes\ReportManager.pas',
  QRIngresos in 'Reportes\QRIngresos.pas' {frmQRIngresos},
  ElecOcupante in 'Ocupantes\ElecOcupante.pas' {frmElecOcupante},
  QRTitularesRemanentes in 'Reportes\QRTitularesRemanentes.pas' {frmQRTitularesRemanentes},
  Est_Mantenimiento in 'Estadisticas\Est_Mantenimiento.pas' {frmEstMantenimiento},
  PersonaClass in 'Ocupantes\PersonaClass.pas',
  Admintel_Util in 'Admintel_Util.pas',
  GradoClass in 'Grados\GradoClass.pas',
  EspecialidadClass in 'Especialidades\EspecialidadClass.pas',
  PersonalMilitarClass in 'Ocupantes\PersonalMilitarClass.pas',
  UtilCollections in 'Modulos de datos\UtilCollections.pas' {dmUtilCollections: TDataModule},
  Ocupante in 'Ocupantes\Ocupante.pas' {frmOcupante},
  OcupanteMilitar in 'Ocupantes\OcupanteMilitar.pas' {frmOcupanteMilitar},
  QRDeudores in 'Reportes\QRDeudores.pas' {frmQRDeudores},
  QRCobrosCiv in 'Reportes\QRCobrosCiv.pas' {frmQRCobrosCiv},
  QRCobrosPart in 'Reportes\QRCobrosPart.pas' {frmQRCobrosPart},
  QRCobrosMil in 'Reportes\QRCobrosMil.pas' {frmQRCobrosMil},
  GastoAd in 'Gastos\GastoAd.pas' {frmGastoAd},
  IngGastoAd in 'Gastos\IngGastoAd.pas' {frmIngGastoAd},
  IngDatosConci in 'Conciliacion\IngDatosConci.pas' {frmIngDatosConci},
  QRPagos in 'Reportes\QRPagos.pas' {frmQRPagos},
  QRFormularioPagos in 'Reportes\QRFormularioPagos.pas' {frmQRFormularioPago},
  ElecProv in 'Proveedores\ElecProv.pas' {frmElecProv},
  QROcupActuales in 'Reportes\QROcupActuales.pas' {frmQROcupActuales},
  QRTitulares in 'Reportes\QRTitulares.pas' {frmQRTitulares},
  TipoLocacion in 'TipoLocacion.pas',
  Est_Ingresos in 'Estadisticas\Est_Ingresos.pas' {frmEstIngresos},
  QRCuentaAdministracion in 'Reportes\QRCuentaAdministracion.pas' {frmQRCuentaAdministracion},
  QRResumenDECIsMant in 'Reportes\QRResumenDECIsMant.pas' {frmQRResumenDECIsMant},
  QRDescuentos in 'Reportes\QRDescuentos.pas' {frmQRDescuentos},
  RespaldoGrados in 'Grados\RespaldoGrados.pas' {Form2};

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
  Application.CreateForm(TdmUtilCollections, dmUtilCollections);
  Application.CreateForm(TfrmQRCobrosMil, frmQRCobrosMil);
  Application.CreateForm(TfrmQRCobrosPart, frmQRCobrosPart);
  Application.CreateForm(TfrmQRCobrosCiv, frmQRCobrosCiv);
  Application.CreateForm(TfrmQRFormularioPago, frmQRFormularioPago);
  Application.CreateForm(TfrmQROcupActuales, frmQROcupActuales);
  Application.CreateForm(TfrmQROcupHistoricos, frmQROcupHistoricos);
  Application.CreateForm(TfrmQRPagosPagador, frmQRPagosPagador);
  Application.CreateForm(TfrmQRCuentaMant3, frmQRCuentaMant3);
  Application.CreateForm(TfrmQRResumenDECIsServ, frmQRResumenDECIsServ);
  Application.CreateForm(TfrmQRCuentaMant, frmQRCuentaMant);
  Application.CreateForm(TfrmQRResumenCobros, frmQRResumenCobros);
  Application.CreateForm(TfrmQRCuentaSerVacios, frmQRCuentaSerVacios);
  Application.CreateForm(TfrmQRLstGastoAd, frmQRLstGastoAd);
  Application.CreateForm(TfrmQRTrab, frmQRTrab);
  Application.CreateForm(TfrmQRTrabEdif, frmQRTrabEdif);
  Application.CreateForm(TfrmQRCuentaServicios, frmQRCuentaServicios);
  Application.CreateForm(TfrmQRGastoFi2, frmQRGastoFi2);
  Application.CreateForm(TfrmQRCheques, frmQRCheques);
  Application.CreateForm(TfrmQRIngresos, frmQRIngresos);
  Application.CreateForm(TfrmQRTitularesRemanentes, frmQRTitularesRemanentes);
  Application.CreateForm(TfrmQRDeudores, frmQRDeudores);
  Application.CreateForm(TfrmQRPagos, frmQRPagos);
  Application.CreateForm(TfrmQRTitulares, frmQRTitulares);
  Application.CreateForm(TfrmEstIngresos, frmEstIngresos);
  Application.CreateForm(TfrmQRCuentaAdministracion, frmQRCuentaAdministracion);
  Application.CreateForm(TfrmQRResumenDECIsMant, frmQRResumenDECIsMant);
  Application.CreateForm(TfrmQRDescuentos, frmQRDescuentos);
  Application.CreateForm(TForm2, Form2);
  dmDatos.DECI.Open;
  dmDatos.GenerarNrosDECI;
  OcultarMSJ;
  Application.Run;
end.
