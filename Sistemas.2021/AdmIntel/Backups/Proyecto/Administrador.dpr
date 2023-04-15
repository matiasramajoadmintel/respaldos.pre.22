program Administrador;

uses
  Forms,
  Principal in 'Principal\Principal.pas' {frmPrincipal},
  Util in '..\..\All Projects\Comunes\Util.pas',
  Comunes in '..\..\All Projects\Comunes\Comunes.pas',
  ElecEdi in 'Edificios\ElecEdi.pas' {frmElecEdi},
  Input in '..\..\All Projects\Input\Input.pas',
  IngClave in '..\..\All Projects\Input\IngClave.pas' {frmIngClave},
  IngClaves in '..\..\All Projects\Input\IngClaves.pas' {frmIngClaves},
  IngFecha in '..\..\All Projects\Input\IngFecha.pas' {frmfecha},
  IngFechas in '..\..\All Projects\Input\IngFechas.pas' {frmIngFechas},
  IngMes in '..\..\All Projects\Input\IngMes.pas' {frmIngMes},
  IngTexto in '..\..\All Projects\Input\IngTexto.pas' {frmIngTexto},
  Ing2Textos in '..\..\All Projects\Input\Ing2Textos.pas' {frmIng2Textos},
  StoreProcs in 'Modulos de datos\StoreProcs\StoreProcs.pas' {dmStoreProc: TDataModule},
  Proveedor in 'Proveedores\Proveedor.pas' {frmProv},
  ElecProv in 'Proveedores\ElecProv.pas' {frmElecProv},
  PoolDatos in 'Modulos de datos\PoolDatos\PoolDatos.pas' {dmDatos: TDataModule},
  IngMed in 'Unidades de medida\IngMed.pas' {frmIngMed},
  ElecMed in 'Unidades de medida\ElecMed.pas' {frmElecMed},
  PoolAlcaldia in 'Modulos de datos\PoolAlcaldia\PoolAlcaldia.pas' {dmAlcaldia: TDataModule},
  DetTrab in 'Trabajo\DetTrab.pas' {frmDetTrab},
  PoolQuerys in 'Modulos de datos\PoolQuerys\PoolQuerys.pas' {dmQuerys: TDataModule},
  Grafico in 'Trabajo\Grafico.pas' {frmGrafico},
  ElecEC in 'Espacios comunes\ElecEC.pas' {frmElecEC},
  IngMat in 'Trabajo\IngMat.pas' {frmIngMat},
  ConfigEC in 'Espacios comunes\ConfigEC.pas' {frmConfigEC},
  ElecDepto in 'Departamentos\ElecDepto.pas' {frmElecDepto},
  Trabajo in 'Trabajo\Trabajo.pas' {frmTrabajos},
  QRCuentaMant2 in 'Reportes\QRCuentaMant2.pas' {frmQRCuentaMant2},
  TrabEdi in 'Trabajo\TrabEdi.pas' {frmTrabEdi},
  GastoFi in 'Gastos\GastoFi.pas' {frmGastoFi},
  QRTrab in 'Reportes\QRTrab.pas' {frmQRTrab},
  ElecEnt in 'Entidades simples\ElecEnt.pas' {frmElecEnt},
  IngGastoFi in 'Gastos\IngGastoFi.pas' {frmIngGastoFi},
  QRCuentaMant in 'Reportes\QRCuentaMant.pas' {frmQRCuentaMant},
  IngServ in 'Servicios\IngServ.pas' {frmIngServ},
  ServEdif in 'Servicios\ServEdif.pas' {frmServEdif},
  IngGastoAd in 'Gastos\IngGastoAd.pas' {frmIngGastoAd},
  GastoAd in 'Gastos\GastoAd.pas' {frmGastoAd};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmStoreProc, dmStoreProc);
  Application.CreateForm(TdmDatos, dmDatos);
  Application.CreateForm(TdmAlcaldia, dmAlcaldia);
  Application.CreateForm(TdmQuerys, dmQuerys);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmElecEnt, frmElecEnt);
  Application.CreateForm(TfrmIngGastoFi, frmIngGastoFi);
  Application.CreateForm(TfrmQRCuentaMant, frmQRCuentaMant);
  Application.CreateForm(TfrmIngServ, frmIngServ);
  Application.CreateForm(TfrmServEdif, frmServEdif);
  Application.CreateForm(TfrmIngGastoAd, frmIngGastoAd);
  Application.CreateForm(TfrmGastoAd, frmGastoAd);
  Application.Run;
end.
