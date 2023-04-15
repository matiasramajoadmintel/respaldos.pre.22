unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, DB, Grids, DBGrids, ExtCtrls, ToolWin,
  ImgList, DBCtrls, Buttons, DBTables;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Salir1: TMenuItem;
    Actualizaciones1: TMenuItem;
    Proveedor1: TMenuItem;
    Material1: TMenuItem;
    Unidad1: TMenuItem;
    StatusBar1: TStatusBar;
    areas1: TMenuItem;
    Consultas1: TMenuItem;
    itmLstTrab: TMenuItem;
    ToolBar1: TToolBar;
    dsDatos: TDataSource;
    ImageList1: TImageList;
    areas2: TMenuItem;
    Detalle1: TMenuItem;
    Resumen1: TMenuItem;
    btnCerrar: TToolButton;
    dsDepto: TDataSource;
    btnAplicar: TToolButton;
    btnQuitar: TToolButton;
    Q: TQuery;
    btnGrafico: TToolButton;
    Resumengeneral1: TMenuItem;
    iposdeespacioscomunes1: TMenuItem;
    N2: TMenuItem;
    Configuracindeespacioscomunes1: TMenuItem;
    btnImprimir: TToolButton;
    btnPrevia: TToolButton;
    Edificios2: TMenuItem;
    Departamentos2: TMenuItem;
    iposdetareas1: TMenuItem;
    Servicios1: TMenuItem;
    Informes1: TMenuItem;
    CuentaMantenimiento1: TMenuItem;
    Gastos1: TMenuItem;
    Administrativos1: TMenuItem;
    Financieros1: TMenuItem;
    Servicios2: TMenuItem;
    Mantenimiento1: TMenuItem;
    rabajosenunidades1: TMenuItem;
    rabajos1: TMenuItem;
    Gastos2: TMenuItem;
    Administrativos2: TMenuItem;
    Financieros2: TMenuItem;
    Servicios3: TMenuItem;
    Cuentaservicos1: TMenuItem;
    CuentaAdministracin1: TMenuItem;
    CuentaBanco1: TMenuItem;
    iposdegastosadministrativos1: TMenuItem;
    iposdegastosfinancieros1: TMenuItem;
    porrubro1: TMenuItem;
    poredificio1: TMenuItem;
    Ingresos1: TMenuItem;
    iposdeingresos1: TMenuItem;
    CociliacinBancaria1: TMenuItem;
    Listadodecheques1: TMenuItem;
    Conciliacinbancaria1: TMenuItem;
    Depsitos1: TMenuItem;
    Crditosbancarios1: TMenuItem;
    Generarpagos1: TMenuItem;
    Listapagos1: TMenuItem;
    Emisinlistadepagos1: TMenuItem;
    NCheque1: TMenuItem;
    Proveedor2: TMenuItem;
    Importe1: TMenuItem;
    Cobrado1: TMenuItem;
    Fecha1: TMenuItem;
    RecibosAnulados1: TMenuItem;
    Deptosocupados1: TMenuItem;
    Deptosvacios1: TMenuItem;
    Estadsticas1: TMenuItem;
    Servicios4: TMenuItem;
    Mantenimiento2: TMenuItem;
    Ingresos2: TMenuItem;
    Cheques2: TMenuItem;
    Listadedeudasaproveedores1: TMenuItem;
    Cheques1: TMenuItem;
    N5: TMenuItem;
    Reestablecercolumnas1: TMenuItem;
    ReenumerarDECIs1: TMenuItem;
    Servicios5: TMenuItem;
    rabajos2: TMenuItem;
    Ayuda1: TMenuItem;
    Contenido1: TMenuItem;
    Novedades1: TMenuItem;
    N6: TMenuItem;
    Acercade1: TMenuItem;
    Panel1: TPanel;
    pnlTitulo: TPanel;
    pnlFiltro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboEdi: TComboBox;
    ComboProv: TComboBox;
    dtpIni: TDateTimePicker;
    dtpFin: TDateTimePicker;
    ComboDepto: TComboBox;
    ComboImp: TComboBox;
    pnlCerrarFiltro: TPanel;
    btnCerrarPanelFiltro: TSpeedButton;
    rgTipoPago: TRadioGroup;
    rgPagado: TRadioGroup;
    ComboRubro: TComboBox;
    pnlGrid: TPanel;
    grdDatos: TDBGrid;
    pnlBotones: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    btnDetalle: TSpeedButton;
    Panel2: TPanel;
    StaticText1: TStaticText;
    DBNavigator1: TDBNavigator;
    Gastosadministrativos1: TMenuItem;
    CuentaServiciosdptosvacios1: TMenuItem;
    itmEmitirRecibos: TMenuItem;
    N1: TMenuItem;
    itmOcupantes: TMenuItem;
    itmOcupaciones: TMenuItem;
    itmEspecialidades: TMenuItem;
    itmGrados: TMenuItem;
    N4: TMenuItem;
    itmEdificios: TMenuItem;
    itmDepartamentos: TMenuItem;
    itmTiposdeartefacto: TMenuItem;
    itmTiposdedescuentos: TMenuItem;
    N8: TMenuItem;
    itmDecuentosAlquileres: TMenuItem;
    Descuentos2: TMenuItem;
    Pagos1: TMenuItem;
    Descuentos3: TMenuItem;
    itmCoeficientesAlquiler: TMenuItem;
    itmDescuentosExpensas: TMenuItem;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Salir1Click(Sender: TObject);
    procedure Proveedor1Click(Sender: TObject);
    procedure Material1Click(Sender: TObject);
    procedure Unidad1Click(Sender: TObject);
    procedure itmTrabajoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure areas1Click(Sender: TObject);
    procedure itmLstTrabClick(Sender: TObject);
    procedure grdDatosDblClick(Sender: TObject);
    procedure Detalle1Click(Sender: TObject);
    procedure Resumen1Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnDetalleClick(Sender: TObject);
    procedure btnGraficoClick(Sender: TObject);
    procedure Resumengeneral1Click(Sender: TObject);
    procedure ComboEdiClick(Sender: TObject);
    procedure btnCerrarPanelFiltroClick(Sender: TObject);
    procedure iposdeespacioscomunes1Click(Sender: TObject);
    procedure Configuracindeespacioscomunes1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPreviaClick(Sender: TObject);
    procedure Edificios1Click(Sender: TObject);
    procedure Edificios2Click(Sender: TObject);
    procedure iposdetareas1Click(Sender: TObject);
    procedure iposdeservicio1Click(Sender: TObject);
    procedure CuentaMantenimiento1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Servicios2Click(Sender: TObject);
    procedure poredificio1Click(Sender: TObject);
    procedure iposdegastosadministrativos1Click(Sender: TObject);
    procedure iposdegastosfinancieros1Click(Sender: TObject);
    procedure Administrativos1Click(Sender: TObject);
    procedure Financieros1Click(Sender: TObject);
    procedure Cuentaservicos1Click(Sender: TObject);
    procedure CuentaAdministracin1Click(Sender: TObject);
    procedure CuentaBanco1Click(Sender: TObject);
    procedure iposdeingresos1Click(Sender: TObject);
    procedure Listadodecheques1Click(Sender: TObject);
    procedure Conciliacinbancaria1Click(Sender: TObject);
    procedure Depsitos1Click(Sender: TObject);
    procedure Crditosbancarios1Click(Sender: TObject);
    procedure Pagos1Click(Sender: TObject);
    procedure Listapagos1Click(Sender: TObject);
    procedure Emisinlistadepagos1Click(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure Administrativos2Click(Sender: TObject);
    procedure Financieros2Click(Sender: TObject);
    procedure Servicios3Click(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure RecibosAnulados1Click(Sender: TObject);
    procedure Deptosvacios1Click(Sender: TObject);
    procedure Servicios4Click(Sender: TObject);
    procedure Mantenimiento2Click(Sender: TObject);
    procedure Ingresos2Click(Sender: TObject);
    procedure Cheques2Click(Sender: TObject);
    procedure Listadedeudasaproveedores1Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure Reestablecercolumnas1Click(Sender: TObject);
    procedure Servicios5Click(Sender: TObject);
    procedure rabajos2Click(Sender: TObject);
    procedure Novedades1Click(Sender: TObject);
    procedure Gastosadministrativos1Click(Sender: TObject);
    procedure CuentaServiciosdptosvacios1Click(Sender: TObject);
    procedure itmEspecialidadesClick(Sender: TObject);
    procedure itmGradosClick(Sender: TObject);
    procedure itmEdificiosClick(Sender: TObject);
    procedure itmDepartamentosClick(Sender: TObject);
    procedure itmOcupantesClick(Sender: TObject);
    procedure itmOcupacionesClick(Sender: TObject);
    procedure itmTiposdeartefactoClick(Sender: TObject);
    procedure itmTiposdedescuentosClick(Sender: TObject);
    procedure itmDecuentosAlquileresClick(Sender: TObject);
    procedure Descuentos2Click(Sender: TObject);
    procedure ComboEdiChange(Sender: TObject);
    procedure itmCoeficientesAlquilerClick(Sender: TObject);
    procedure itmDescuentosExpensasClick(Sender: TObject);

  private
    gListado: Integer;
    Teclas: Byte;
    gOrden: String;
    gId: Longword;
    procedure PrepararListado;
    procedure PrepararPanelBotones;
    procedure MostrarLstTrabDepto(const Orden: String);
    procedure MostrarLstTrabEdif(const Orden: String);
    procedure MostrarLstPagos(const Orden: String);
    procedure MostrarLstGastosAd(const Orden: String; const Id: Longword);
    procedure MostrarLstGastosFi(const Orden: String; const Id: Longword);
    procedure MostrarLstGastosSer(const Orden: String; const Id: Longword);
    procedure AbrirQry201;
    procedure AbrirQry202;
    procedure MostrarMontoTotal;

  public
    { Public declarations }

  end;

const
  TRAB_DEPTO = 100;
  TRAB_EDIF = 101;
  DET_TAREAS = 200;
  RES_TAREAS_DEPTO = 201;
  RES_TAREAS_GRAL = 202;
  GASTOS_ADMIN = 300;
  GASTOS_FINAN = 301;
  GASTOS_SERV = 302;
  PAGOS_PROV = 1000;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Trabajo, Comunes, ElecEnt, ElecProv, Proveedor, ElecMed, PoolQuerys,
     DetTrab, PoolDatos, Util, Grafico, ConfigEC, TrabEdi, IngGastoFi, Input,
     Ingreso, Conciliacion, Credito, IngDatosConci, IngFecAdmIntel, Pagos,
     QRPagos, QRCuentaMant3, QRCuentaAdministracion, QRGastoFi2,
     QRCuentaServicios, QRCuentaMant, QRCheques, DetPagos, RecAnul, DatosPago,
     Est_Servicios, Est_Mantenimiento, Est_Ingresos, Est_Cheques,
     IngGastoAd, IngServ, QRTrab, QRTrabEdif, QRLstGastoAd, Deudas, Cheques,
     ResetCol, ElecTServ, Lonuevo, QRCuentaServVacios, ElecEdificio,
     ElecEspecialidad, ElecGrado, ElecDepto, ElecOcupante, ElecOcupacion,
     ElecTipoArtefacto, ElecTipoDesc, IngMed, IngMes, ElecDescuento, ElecCoef;

{$R *.dfm}

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmPrincipal.PrepararListado;
var
  i: Integer;
  F: String;
begin
  grdDatos.Refresh;
  RecuperarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  pnlGrid.Visible := True;

  if not pnlFiltro.Visible then
  begin
    F := RecuperarValorRegistro(Name,'FECHAINI');
    if F = 'Sin nombre' then dtpIni.Date := Date - 30
    else dtpIni.Date := StrToDate(F);

    F := RecuperarValorRegistro(Name,'FECHAFIN');
    if F = 'Sin nombre' then dtpFin.Date := Date
    else dtpFin.Date := StrToDate(F);

    pnlFiltro.Visible := True;
  end;

  pnlCerrarFiltro.Visible := True;
  pnlTitulo.Visible := True;
  PrepararPanelBotones;
  for i:=0 to grdDatos.Columns.Count - 1 do
  begin
    grdDatos.Columns[i].Title.Alignment := taCenter;
    grdDatos.Columns[i].Title.Font.Style := [];
  end;
  btnCerrar.Visible := True;
  btnAplicar.Visible := True;
  btnQuitar.Visible := True;
  btnGrafico.Visible := (gListado=RES_TAREAS_DEPTO) or (gListado=RES_TAREAS_GRAL) or ((gListado >= DET_TAREAS)
                        and (gListado < 2002));
  btnPrevia.Visible := True;
  btnImprimir.Visible := True;

//  btnQuitarClick(nil);
end;

procedure TfrmPrincipal.PrepararPanelBotones;
begin
  pnlBotones.Visible := (gListado=TRAB_DEPTO) or (gListado=PAGOS_PROV) or (gListado = TRAB_EDIF) or
                        ((gListado >= GASTOS_ADMIN) and (gListado <= GASTOS_SERV));

  btnAgregar.Enabled := (gListado=TRAB_DEPTO) or (gListado = TRAB_EDIF) or
                        ((gListado >= GASTOS_ADMIN) and (gListado <= GASTOS_SERV));

  btnEliminar.Enabled := dsDatos.DataSet.RecordCount > 0;

  btnModificar.Enabled := ((gListado=TRAB_DEPTO) or (gListado = TRAB_EDIF) or
                          (gListado = PAGOS_PROV) or ((gListado >= GASTOS_ADMIN) and
                          (gListado <= GASTOS_SERV))) and (dsDatos.DataSet.RecordCount > 0);

  btnDetalle.Enabled := ((gListado = TRAB_DEPTO) or (gListado = TRAB_EDIF) or
                        (gListado = PAGOS_PROV)) and (dsDatos.DataSet.RecordCount > 0);
end;

procedure TfrmPrincipal.MostrarLstTrabDepto(const Orden: String);
var
  Id: Longint;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := TRAB_DEPTO;
  pnlTitulo.Caption := 'Listado de trabajos en departamentos';
  CargarListaCampo(ComboRubro,dmDatos.CAT,'DESCRIP');

  with dmQuerys,qryTrab do
  begin
    Id := qryTrabIDTRABAJO.Value;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_TRABAJOS ');
    SQL.Add(' ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryTrab;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    MostrarMontoTotal;
    Existe(qryTrab,'IDTRABAJO',Id);
  end;
end;

procedure TfrmPrincipal.MostrarLstTrabEdif(const Orden: String);
var
  Id: Longint;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := TRAB_EDIF;
  pnlTitulo.Caption := 'Listado de trabajos en edificios';
  CargarListaCampo(ComboRubro,dmDatos.CAT,'DESCRIP');  

  with dmQuerys,qryTrabEdi do
  begin
    Id := qryTrabEdiIDTRABAJO.Value;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_TRAB_EDIF');
    SQL.Add(' ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryTrabEdi;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    MostrarMontoTotal;
    Existe(qryTrabEdi,'IDTRABAJO',Id);
  end;
end;

procedure TfrmPrincipal.MostrarLstPagos(const Orden: String);
var
  Id: Integer;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := PAGOS_PROV;
  pnlTitulo.Caption := 'Lista de pagos a proveedores';

  with dmQuerys,qryPagados do
  begin
    Id := qryPagadosIDPAGO.Value;
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_PAGADOS ');
    if Orden <> '' then SQL.Add('ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryPagados;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    PrepararPanelBotones;
//    MostrarMontoTotal;
    Existe(qryPagados, 'IDPAGO', Id);
  end;
end;

procedure TfrmPrincipal.MostrarLstGastosAd(const Orden: String; const Id: Longword);
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := GASTOS_ADMIN;
  pnlTitulo.Caption := 'Lista de gastos administrativos';
  CargarListaCampo(ComboRubro,dmDatos.TGASTOAD,'DESCRIP');

  with dmQuerys,qryGastoAd do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_GASTO_AD ');
    SQL.Add('ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryGastoAd;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    MostrarMontoTotal;
    Existe(qryGastoAd,'IDGASTO_AD',Id);    
  end;
end;

procedure TfrmPrincipal.MostrarLstGastosFi(const Orden: String; const Id: Longword);
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := GASTOS_FINAN;
  pnlTitulo.Caption := 'Lista de gastos financieros';
    CargarListaCampo(ComboRubro,dmDatos.TGASTOFI,'DESCRIP');

  with dmQuerys,qryGastoFi do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_GASTO_FI ');
    SQL.Add('ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryGastoFi;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    MostrarMontoTotal;
    Existe(qryGastoFi,'IDGASTO_FI',Id);
  end;
end;

procedure TfrmPrincipal.MostrarLstGastosSer(const Orden: String; const Id: Longword);
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := GASTOS_SERV;
  pnlTitulo.Caption := 'Lista de gastos de servicios';
  CargarListaCampo(ComboRubro,dmDatos.SERV,'DESCRIP');

  with dmQuerys,qryServEdif do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VW_SERV_EDIF ');
    SQL.Add('ORDER BY ' + Orden);
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    Open;
    dsDatos.DataSet := qryServEdif;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    PrepararListado;
    MostrarMontoTotal;
    Existe(qryServEdif,'IDSERV_EDIF',Id);
  end;
end;

procedure TfrmPrincipal.AbrirQry201;
begin
  with dmQuerys,qryResTareas do
  begin
    Close;
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    ParamByName('F1').AsDate := dtpIni.Date;
    ParamByName('F2').AsDate := dtpFin.Date;
    Open;
    dsDatos.DataSet := qryResTareas;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
  end;
end;

procedure TfrmPrincipal.AbrirQry202;
begin
  with dmQuerys,qryCantTareas do
  begin
    Close;
    grdDatos.Columns.Clear;
    dsDatos.DataSet := nil;
    ParamByName('F1').AsDate := dtpIni.Date;
    ParamByName('F2').AsDate := dtpFin.Date;
    Open;
    dsDatos.DataSet := qryCantTareas;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
  end;
end;

procedure TfrmPrincipal.MostrarMontoTotal;
var
  Total: Currency;
begin
  dsDatos.DataSet.DisableControls;
  if dsDatos.DataSet.FindField('COSTO') <> nil then
    Total := SumaColumna(dsDatos.DataSet,'COSTO')
  else if dsDatos.DataSet.FindField('IMPORTE') <> nil then
    Total := SumaColumna(dsDatos.DataSet,'IMPORTE')
  else StaticText1.Visible := False;

  StaticText1.Caption := 'Total: ' + CurrToStrF(Total,ffCurrency,2);
  dsDatos.DataSet.EnableControls;
end;

//****************************************************************************//
//                                      EVENTOS
//****************************************************************************//

procedure TfrmPrincipal.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmPrincipal.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmPrincipal.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmPrincipal.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;
end;

procedure TfrmPrincipal.Salir1Click(Sender: TObject);
begin
  Halt;
  dmDatos.ADB.Close;
end;

procedure TfrmPrincipal.Material1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('MATERIAL');
    Release;
  end;
end;

procedure TfrmPrincipal.Proveedor1Click(Sender: TObject);
var
  IdProv: Integer;
  R: Boolean;
begin
  with TfrmElecProv.Create(nil) do
  begin
    R := getId(IdProv,1);
    Release;
  end;

  if not R then Exit;

  with TfrmProv.Create(nil) do
  begin
    Actualizar(3,IdProv);
    Release;
  end;
end;

procedure TfrmPrincipal.Unidad1Click(Sender: TObject);
begin
  with TfrmElecMed.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.areas1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('TAREA');
    Release;
  end;
end;

procedure TfrmPrincipal.iposdetareas1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('CATEGORIA');
    Release;
  end;
end;

procedure TfrmPrincipal.iposdeespacioscomunes1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('TIPO_ESPACIO');
    Release;
  end;
end;

procedure TfrmPrincipal.Configuracindeespacioscomunes1Click(Sender: TObject);
var
  Id: Integer;
  Desc: String;
begin
  with TfrmElecEdificio.Create(nil) do
  begin
    Id := GetId(Desc);
    Release;
  end;

  if Id <> 0 then
    with TfrmConfigEC.Create(nil) do
    begin
      Configurar(Id,Desc);
      Release;
    end;
end;

procedure TfrmPrincipal.Edificios1Click(Sender: TObject);
var
  R: Boolean;
begin
  R := True;

  with TfrmTrabEdi.Create(nil) do
  begin
    while R do
    begin
      R := Mostrar(0,-1);
      if gListado = TRAB_EDIF then
      begin
        if gOrden = '' then gOrden := 'FECHA_FIN';
        gListado := -1;
        MostrarLstTrabEdif(gOrden);
      end;
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.itmTrabajoClick(Sender: TObject);
var
  R: Boolean;
begin
  R := True;

  with TfrmTrabajos.Create(nil) do
  begin
    while R do
    begin
      R := Mostrar(0,-1);
      if gListado = TRAB_DEPTO then
      begin
        if gOrden = '' then gOrden := 'FECHA_FIN';
        gListado := -1;
        MostrarLstTrabDepto(gOrden);
      end;
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
  gListado := -1;
  pnlTitulo.Visible := False;
  pnlFiltro.Visible := False;
  pnlGrid.Visible := False;
  pnlBotones.Visible := False;
  CargarListaCampo(ComboEdi,dmDatos.qryEdificios,'Descripcion');
  CargarListaCampo(ComboProv,dmDatos.PROV,'RAZON_SOCIAL');
  ComboDepto.Clear;
  btnQuitar.Down := True;
  btnCerrar.Visible := False;
  btnAplicar.Visible := False;
  btnQuitar.Visible := False;
  btnGrafico.Visible := False;
  btnPrevia.Visible := False;
  btnImprimir.Visible := False;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);

  if gListado <> -1 then
  begin
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
    GuardarValorRegistro(Name,'FECHAINI',DateToStr(dtpIni.Date));
    GuardarValorRegistro(Name,'FECHAFIN',DateToStr(dtpFin.Date));
  end;
end;

procedure TfrmPrincipal.Edificios2Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA_FIN';
  MostrarLstTrabEdif('FECHA_FIN');
end;

procedure TfrmPrincipal.itmLstTrabClick(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA_FIN';
  MostrarLstTrabDepto('FECHA_FIN');
end;

procedure TfrmPrincipal.Detalle1Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := TComponent(Sender).Tag;
  pnlTitulo.Caption := 'Detalle de tareas';
  ComboRubro.Clear;
  dmQuerys.qryDetTareas.Close;
  dmQuerys.qryDetTareas.SQL.Clear;
  dmQuerys.qryDetTareas.SQL.Add('SELECT * FROM VW_DET_TAREAS ORDER BY FECHA_FIN');
  grdDatos.Columns.Clear;
  dsDatos.DataSet := nil;
  dmQuerys.qryDetTareas.Open;
  dsDatos.DataSet := dmQuerys.qryDetTareas;
  StatusBar1.Panels[3].Text := IntToStr(dmQuerys.qryDetTareas.RecordCount) +
                               ' registros listados';
  PrepararListado;
end;

procedure TfrmPrincipal.Resumen1Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := TComponent(Sender).Tag;
  pnlTitulo.Caption := 'Resumen de tareas por departamento';
  ComboRubro.Clear;
  AbrirQry201;
  PrepararListado;
end;

procedure TfrmPrincipal.Resumengeneral1Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
  gListado := TComponent(Sender).Tag;
  pnlTitulo.Caption := 'Resumen de tareas general';
  ComboRubro.Clear;
  AbrirQry202;
  PrepararListado;
end;

procedure TfrmPrincipal.grdDatosDblClick(Sender: TObject);
var
  Id: Integer;
begin
  if gListado = TRAB_DEPTO then btnDetalleClick(nil);

  if gListado = PAGOS_PROV then
  begin
    Existe(dmDatos.PAGO,'IDPAGO',dmQuerys.qryPagadosIDPAGO.value);
    dmDatos.PAGO.Edit;
    if dmDatos.PAGOCOBRADO.Text = 'Sí' then dmDatos.PAGOCOBRADO.Text := 'No'
    else dmDatos.PAGOCOBRADO.Text := 'Sí';
    dmDatos.PAGO.Post;
    Id := dmQuerys.qryPagadosIDPAGO.Value;
    dmQuerys.qryPagados.Close;
    Existe(dmQuerys.qryPagados,'IDPAGO',Id);
  end;
end;

procedure TfrmPrincipal.btnCerrarClick(Sender: TObject);
begin
  if gListado <> -1 then
  begin
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
    GuardarValorRegistro(Name,'FECHAINI',DateToStr(dtpIni.Date));
    GuardarValorRegistro(Name,'FECHAFIN',DateToStr(dtpFin.Date));
  end;

  pnlTitulo.Visible := False;
  pnlFiltro.Visible := False;
  pnlGrid.Visible := False;
  pnlBotones.Visible := False;
  btnCerrar.Visible := False;
  btnAplicar.Visible := False;
  btnQuitar.Visible := False;
  btnGrafico.Visible := False;
  btnPrevia.Visible := False;
  btnImprimir.Visible := False;
  StatusBar1.Panels[3].Text := '';
  gListado := -1;
end;

procedure TfrmPrincipal.btnAplicarClick(Sender: TObject);
var
  Imp: String;
begin
  if btnAplicar.Down then Exit;

  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);

  if gListado = RES_TAREAS_DEPTO then AbrirQry201
  else if gListado = RES_TAREAS_GRAL then AbrirQry202;

  with dsDatos.DataSet do
  begin
    DisableControls;
    Filtered := False;
    Filter := '';

    //Filtra por departamento
    if (ComboDepto.Text <> '') and (FindField('IDDEPARTAMENTO') <> nil) then
    begin
      Existe(dmDatos.EDIF,'Descripcion',ComboEdi.Text);
      Filtrar(dmDatos.DEPTO, 'IDEDIFICIO='+dmDatos.EDIFIDEDIFICIO.Text);
      Existe(dmDatos.DEPTO,'Descripcion',ComboDepto.Text);
      Filter := 'IDDEPARTAMENTO = ' + dmDatos.DEPTOIDDEPARTAMENTO.Text;
      dmDatos.DEPTO.Filtered:= False;
    end;

    //Filtra por edificio
    if (ComboEdi.Text <> '') and (FindField('IDEDIF') <> nil) then
    begin
      Existe(dmDatos.qryEdificios,'Descripcion',ComboEdi.Text);
      if Filter <> '' then
        Filter := Filter + 'AND IDEDIF = ' + dmDatos.qryEdificiosIdEdificio.Text
      else
        Filter := 'IDEDIF = ' + dmDatos.qryEdificiosIdEdificio.Text;
    end;

    //Filtra por Edificio
    if (ComboEdi.Text <> '') and (FindField('IDEDIFICIO') <> nil) then
    begin
      Existe(dmDatos.qryEdificios,'Descripcion',ComboEdi.Text);
      if Filter <> '' then
        Filter := Filter + 'AND IDEDIFICIO = ' + dmDatos.qryEdificiosIdEdificio.Text
      else
        Filter := 'IDEDIFICIO = ' + dmDatos.qryEdificiosIdEdificio.Text
    end;

    //Filtra por proveedor
    if (ComboProv.Text <> '') and (FindField('RAZON_SOCIAL') <> nil) then
    begin
      if Filter <> '' then
        Filter := Filter + 'AND RAZON_SOCIAL = ' + #39 + ComboProv.Text + #39
      else Filter := 'RAZON_SOCIAL=' + #39 + ComboProv.Text + #39;
    end;

    //Filtra por imputación
    if (ComboImp.Text <> '') and (FindField('IMPUTACION') <> nil) then
    begin
      case ComboImp.ItemIndex of
        0: Imp := '01';
        1: Imp := '03';
        2: Imp := '04';
      end;

      if Filter <> '' then
        Filter := Filter + 'AND IMPUTACION = ' + #39 + Imp + #39
      else Filter := 'IMPUTACION =' + #39 + Imp + #39;
    end;

    //Filtra por fecha fin
    if (FindField('FECHA_FIN') <> nil) then
    begin
      if Filter <> '' then
        Filter := Filter + 'AND (FECHA_FIN >= ' + #39 + DateToStr(dtpIni.Date) +
                  #39 + 'AND FECHA_FIN <= ' + #39 + DateToStr(dtpFin.Date) +
                  #39 + 'OR FECHA_FIN IS NULL)'
      else Filter := '(FECHA_FIN >= ' + #39 + DateToStr(dtpIni.Date) + #39 +
                     'AND FECHA_FIN <= ' + #39 + DateToStr(dtpFin.Date) +
                     #39 + 'OR FECHA_FIN IS NULL)';
    end;

    //Filtra por fecha
    if (FindField('FECHA') <> nil) then
    begin
      if Filter <> '' then
        Filter := Filter + ' AND ((FECHA >= ' + #39 + DateToStr(dtpIni.Date) +
                  #39 + ' AND FECHA <= ' + #39 + DateToStr(dtpFin.Date) +
                  #39 + ') OR FECHA IS NULL)'
      else Filter := '((FECHA >= ' + #39 + DateToStr(dtpIni.Date) + #39 +
                     ' AND FECHA <= ' + #39 + DateToStr(dtpFin.Date) +
                     #39 + ') OR FECHA IS NULL)';
    end;

    //Filtra por Pagado
    if (FindField('PAGADO') <> nil) then
    begin
      if rgPagado.ItemIndex = 0 then //Si está pagado
      begin
        if Filter <> '' then
          Filter := Filter + 'AND PAGADO = ' + #39 + 'Sí' + #39
        else Filter := 'PAGADO = ' + #39 + 'Sí' + #39;

       //Filtra por tipo de pago
        if rgTipoPago.ItemIndex = 0 then //Cheque
        begin
          if Filter <> '' then
            Filter := Filter + 'AND TIPO_PAGO = ' + #39 + 'C' + #39
          else Filter := 'TIPO_PAGO = ' + #39 + 'C' + #39;
        end
        else if rgTipoPago.ItemIndex = 1 then //Efectivo
        begin
          if Filter <> '' then
            Filter := Filter + 'AND TIPO_PAGO = ' + #39 + 'E' + #39
          else Filter := 'TIPO_PAGO = ' + #39 + 'E' + #39;
        end;
      end
      else
      begin if rgPagado.ItemIndex = 1 then
        if Filter <> '' then
          Filter := Filter + 'AND PAGADO = ' + #39 + 'No' + #39
        else Filter := 'PAGADO = ' + #39 + 'No' + #39;
      end;
    end
    else if (FindField('TIPO_PAGO') <> nil) then
    { Hay casos en los que no existe el campo 'PAGADO' pero si 'TIPO_PAGO', por
      ejemplo la consulta de pagos a los proveedores }
    begin
       //Filtra por tipo de pago
        if rgTipoPago.ItemIndex = 0 then //Cheque
        begin
          if Filter <> '' then
            Filter := Filter + 'AND TIPO_PAGO = ' + #39 + 'C' + #39
          else Filter := 'TIPO_PAGO = ' + #39 + 'C' + #39;
        end
        else if rgTipoPago.ItemIndex = 1 then //Efectivo
        begin
          if Filter <> '' then
            Filter := Filter + 'AND TIPO_PAGO = ' + #39 + 'E' + #39
          else Filter := 'TIPO_PAGO = ' + #39 + 'E' + #39;
        end;
    end;

    //Filtra por rubro
    if (ComboRubro.Text <> '') and (FindField('DESCRIP') <> nil) then
    begin
      if Filter <> '' then
        Filter := Filter + 'AND DESCRIP = ' + #39 + ComboRubro.Text + #39
      else Filter := 'DESCRIP = ' + #39 + ComboRubro.Text + #39;
    end;

    //Filtra por fecha de pago
    if (FindField('FECHA_PAGO') <> nil) then
      if Filter <> '' then
        Filter := Filter + 'AND FECHA_PAGO >= ' + #39 + DateToStr(dtpIni.Date) +
                  #39 + 'AND FECHA_PAGO <= ' + #39 + DateToStr(dtpFin.Date) + #39
      else Filter := 'FECHA_PAGO >= ' + #39 + DateToStr(dtpIni.Date) + #39 +
                     'AND FECHA_PAGO <= ' + #39 + DateToStr(dtpFin.Date + 1) + #39;


    Filtered := True;
    StatusBar1.Panels[3].Text := IntToStr(RecordCount) + ' registros listados';
    EnableControls;
  end;

  MostrarMontoTotal;
  btnAplicar.Down := True;
  btnQuitar.Down := False;
  RecuperarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);
end;

procedure TfrmPrincipal.btnQuitarClick(Sender: TObject);
begin
  if not btnQuitar.Down then
  begin
    dsDatos.DataSet.Filtered := False;
    btnAplicar.Down := False;
    btnQuitar.Down := True;
    StatusBar1.Panels[3].Text := IntToStr(dsDatos.DataSet.RecordCount) + ' registros listados';
    MostrarMontoTotal;
  end;
end;

procedure TfrmPrincipal.btnEliminarClick(Sender: TObject);
var
  I: String;
  Filtrado: Boolean;
  Id: Longword;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);

  Filtrado := dsDatos.DataSet.Filtered;

  if gListado = TRAB_DEPTO then //Listado de Trabajos en departamentos
  begin
    with TfrmTrabajos.Create(nil) do
    begin
      if Eliminar(dmQuerys.qryTrabIDTRABAJO.Value) then
      begin
        gListado := -1;
        MostrarLstTrabDepto(gOrden);
      end;
      Release;
    end;
  end;

  if gListado = TRAB_EDIF then //Listado de Trabajos en edificios
  begin
    with TfrmTrabEdi.Create(nil) do
    begin
      if Eliminar(dmQuerys.qryTrabEdiIDTRABAJO.Value) then
      begin
        gListado := -1;
        MostrarLstTrabEdif(gOrden);
      end;
      Release;
    end;
  end;

  if gListado = PAGOS_PROV then //Listado de pagos
  begin
    with TfrmPagos.Create(nil) do
    begin
      if Eliminar(dmQuerys.qryPagadosIDPAGO.Value) then
      begin
        gListado := -1;
        MostrarLstPagos(gOrden);
      end;
      Release;
    end;
  end;

  case gListado of
    GASTOS_ADMIN: with TfrmIngGastoAd.Create(nil) do //Gastos administrativos
         begin
           Id := dmQuerys.qryGastoAdIDGASTO_AD.Value;
           if Eliminar(Id) then MostrarLstGastosAd(gOrden,Id);
           Release;
         end;
    GASTOS_FINAN: with TfrmIngGastoFi.Create(nil) do //Gastos financieros
         begin
           Id := dmQuerys.qryGastoFiIDGASTO_FI.Value;
           if Eliminar(Id) then MostrarLstGastosFi(gOrden,Id);
           Release;
         end;
    GASTOS_SERV: with TfrmIngServ.Create(nil) do //Gastos de servicios
         begin
           Id := dmQuerys.qryServEdifIDSERV_EDIF.Value;
           if Eliminar(Id) then MostrarLstGastosSer(gOrden,Id);
           Release;
         end;
  end;
  if Filtrado then dsDatos.DataSet.Filtered := True;
end;

procedure TfrmPrincipal.btnModificarClick(Sender: TObject);
var
  Filtrado: Boolean;
  Id: Longword;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);

  Filtrado := dsDatos.DataSet.Filtered;

  if gListado = TRAB_DEPTO then
  begin
    with TfrmTrabajos.Create(nil) do
    begin
      Mostrar(2,dmQuerys.qryTrabIDTRABAJO.Value);
      Release;
    end;
    gListado := -1;
    MostrarLstTrabDepto(gOrden);
  end;

  if gListado = TRAB_EDIF then
  begin
    with TfrmTrabEdi.Create(nil) do
    begin
      Mostrar(2,dmQuerys.qryTrabEdiIDTRABAJO.Value);
      Release;
    end;
    gListado := -1;
    MostrarLstTrabEdif(gOrden);
  end;

  if gListado = PAGOS_PROV then
  begin
    with TfrmDatosPago.Create(nil) do
    begin
      Modificar(dmQuerys.qryPagadosIDPAGO.Value);
      Release;
    end;
    gListado := -1;
    MostrarLstPagos(gOrden);
  end;

  case gListado of
    GASTOS_ADMIN: with TfrmIngGastoAd.Create(nil) do //Gastos administrativos
         begin
           Id := dmQuerys.qryGastoAdIDGASTO_AD.Value;
           if Modificar(Id) then MostrarLstGastosAd(gOrden,Id);
           Release;
         end;
    GASTOS_FINAN: with TfrmIngGastoFi.Create(nil) do //Gastos financieros
         begin
           Id := dmQuerys.qryGastoFiIDGASTO_FI.Value;
           if Modificar(Id) then MostrarLstGastosFi(gOrden,Id);
           Release;
         end;
    GASTOS_SERV: with TfrmIngServ.Create(nil) do //Gastos de servicios
         begin
           Id := dmQuerys.qryServEdifIDSERV_EDIF.Value;
           if Modificar(Id) then MostrarLstGastosSer(gOrden,Id);
           Release;
         end;
  end;

  if Filtrado then dsDatos.DataSet.Filtered := True;
end;

procedure TfrmPrincipal.btnDetalleClick(Sender: TObject);
begin
  if gListado = TRAB_DEPTO then
    with TfrmDetTrab.Create(nil) do
    begin
      Mostrar(dmQuerys.qryTrabIDTRABAJO.Value);
      Release;
    end;

  if gListado = PAGOS_PROV then
    with TfrmDetPagos.Create(nil) do
    begin
      Mostrar(dmQuerys.qryPagadosIDPAGO.Value,dmQuerys.qryPagadosRAZON_SOCIAL.Text);
      Release;
    end;
end;

procedure TfrmPrincipal.btnGraficoClick(Sender: TObject);
var
  T: String;
  I: Integer;
begin
  T := '';
  if dmQuerys.qryResTareas.Filtered then
  begin
    if (ComboDepto.Text <> '') and (gListado = RES_TAREAS_DEPTO) then T := ComboDepto.Text;
    T := T + ' desde ' + DateToStr(dtpIni.Date) + ' hasta ' +
         DateToStr(dtpFin.Date);
  end;

  case gListado of
    RES_TAREAS_DEPTO: I := 0;
    RES_TAREAS_GRAL: I := 1;
  end;

  with TfrmGrafico.Create(nil) do
  begin
    Mostrar(T,I);
    Release;
  end;
end;

procedure TfrmPrincipal.btnPreviaClick(Sender: TObject);
begin
{  if gListado = TRAB_DEPTO then
    with TfrmQRTrab.Create(nil) do
    begin
      VistaPrevia;
      Release;
    end;}
end;

procedure TfrmPrincipal.btnImprimirClick(Sender: TObject);
begin
  if gListado = TRAB_DEPTO then
    with TfrmQRTrab.Create(nil) do
    begin
      VistaPrevia;
      Release;
    end
  else  if gListado = TRAB_EDIF then
    with TfrmQRTrabEdif.Create(nil) do
    begin
      VistaPrevia;
      Release;
    end
  else  if gListado = GASTOS_ADMIN then
    with TfrmQRLstGastoAd.Create(nil) do
    begin
      VistaPrevia;
      Release;
    end;
end;

procedure TfrmPrincipal.ComboEdiClick(Sender: TObject);
begin
  Existe(dmDatos.EDIF,'Descripcion',ComboEdi.Text);
  Filtrar(dmDatos.DEPTO, 'IDEDIFICIO='+dmDatos.EDIFIDEDIFICIO.Text);
  CargarListaCampo(ComboDepto,dmDatos.DEPTO,'Descripcion');
  ComboDepto.Text := '';
  dmDatos.DEPTO.Filtered:= False;
end;

procedure TfrmPrincipal.btnCerrarPanelFiltroClick(Sender: TObject);
begin
  pnlFiltro.Visible := False;
  pnlCerrarFiltro.Visible := False;
end;

procedure TfrmPrincipal.iposdeservicio1Click(Sender: TObject);
begin
  with TfrmElecTServ.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.CuentaMantenimiento1Click(Sender: TObject);
var
  M, A: Word;
  R: Boolean;
begin
  if not IngresarMes(M,A) then Exit;

  with TfrmQRCuentaMant.Create(nil) do
  begin
    VistaPrevia(M,A);
    Release;
  end;
end;

procedure TfrmPrincipal.poredificio1Click(Sender: TObject);
var
  M, A: Word;
  Id: Integer;
  Desc: String;
begin
  if not IngresarMes(M,A) then Exit;

  with TfrmElecEdificio.Create(nil) do
  begin
    Id := getId(Desc);
    Release;
  end;

  if Id <> 0 then
    with TfrmQRCuentaMant3.Create(nil) do
    begin
      VistaPrevia(M,A,Id,Desc);
      Release;
    end;
end;

procedure TfrmPrincipal.ToolButton3Click(Sender: TObject);
begin
{  DEPTO.Open;
  DE.Open;
  DEPTO.First;
  while not DEPTO.Eof do
  begin
    DE.Append;
    DEIDDEPTO.Value := DEPTOIDDEPARTAMENTO.Value;
    DEIDEDIF.Value:=DEPTOIDEDIFICIO.Value;
    DE.Post;
    DEPTO.Next;
  end;
  ToolButton3.Caption := 'Listo';}
end;

procedure TfrmPrincipal.Servicios2Click(Sender: TObject);
var
  Id: Longword;
  R: Boolean;
begin
  with TfrmIngServ.Create(nil) do
  begin
    R := True;
    while R do
    begin
      R := Agregar(Id, False);
      if R and (gListado=GASTOS_SERV) then MostrarLstGastosSer(gOrden,Id);
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.Deptosvacios1Click(Sender: TObject);
var
  Id: Longword;
  R: Boolean;
begin
  with TfrmIngServ.Create(nil) do
  begin
    R := True;
    while R do
    begin
      R := Agregar(Id, True);
      if R and (gListado=GASTOS_SERV) then MostrarLstGastosSer(gOrden,Id);
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.iposdegastosadministrativos1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('TIPO_GASTO_AD');
    Release;
  end;
end;

procedure TfrmPrincipal.iposdegastosfinancieros1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('TIPO_GASTO_FI');
    Release;
  end;
end;

procedure TfrmPrincipal.Administrativos1Click(Sender: TObject);
var
  Id: Longword;
  R: Boolean;
begin
  with TfrmIngGastoAd.Create(nil) do
  begin
    if (gListado=GASTOS_ADMIN) then //Si está visible el listado de gastos administrativos
    begin
      if Agregar(Id) then MostrarLstGastosAd(gOrden,Id);
    end
    else
    begin
      R := True;
      while R do R := Agregar(Id);
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.Financieros1Click(Sender: TObject);
var
  Id: Longword;
  R: Boolean;
begin
  with TfrmIngGastoFi.Create(nil) do
  begin
    if (gListado=GASTOS_FINAN) then
    begin
      if Agregar(Id) then MostrarLstGastosFi(gOrden,Id);
    end
    else
    begin
      R := True;
      while R do R := Agregar(Id);
    end;
    Release;
  end;
end;

procedure TfrmPrincipal.Cuentaservicos1Click(Sender: TObject);
var
  M, A: Word;
  Id: Integer;
  Desc: String;
begin
  if not IngresarMes(M,A) then Exit;

  with TfrmElecEdificio.Create(nil) do
  begin
    Id := getId(Desc);
    Release;
  end;

  if Id <> 0 then
    with TfrmQRCuentaServicios.Create(nil) do
    begin
      VistaPrevia(M,A,Id,Desc);
      Release;
    end;
end;

procedure TfrmPrincipal.CuentaServiciosdptosvacios1Click(Sender: TObject);
var
  M, A: Word;
  R: Boolean;
begin
  if not IngresarMes(M,A) then Exit;

  if not R then Exit;

  with TfrmQRCuentaSerVacios.Create(nil) do
  begin
    VistaPrevia(M,A);
    Release;
  end;
end;

procedure TfrmPrincipal.CuentaAdministracin1Click(Sender: TObject);
var
  M, A: Word;
begin
  if not IngresarMes(M,A) then Exit;

  with TfrmQRCuentaAdministracion.Create(nil) do
  begin
    VistaPrevia(M,A);
    Release;
  end;
end;

procedure TfrmPrincipal.CuentaBanco1Click(Sender: TObject);
var
  M, A: Word;
begin
  if not IngresarMes(M,A) then Exit;

  with TfrmQRGastoFi2.Create(nil) do
  begin
    VistaPrevia(M,A);
    Release;
  end;
end;

procedure TfrmPrincipal.iposdeingresos1Click(Sender: TObject);
begin
  with TfrmElecEnt.Create(nil) do
  begin
    Mostrar('TIPO_INGRESO');
    Release;
  end;
end;

procedure TfrmPrincipal.Listadodecheques1Click(Sender: TObject);
var
  Orden: String;
  FI,FF: TDateTime;
  R: Boolean;
begin
  with TfrmIngFecAdmIntel.Create(nil) do
  begin
    R := ObtenerFechas(FI,FF);
    Release;
  end;

  if not R then Exit;

  case TComponent(Sender).Tag of
    0: Orden := 'FECHA_PAGO';
    1: Orden := 'NRO_CHEQUE';
    2: Orden := 'RAZON_SOCIAL';
    3: Orden := 'IMPORTE';
    4: Orden := 'COBRADO';
  end;

  with TfrmQRCheques.Create(nil) do
  begin
    VistaPrevia(FI,FF,Orden);
    Release;
  end;
end;

procedure TfrmPrincipal.Conciliacinbancaria1Click(Sender: TObject);
var
  R: Boolean;
  FI,FF: TDateTime;
  H: Integer;
  SB,SL: Currency;
  CHA: String;
begin
  with TfrmIngDatosConci.Create(nil) do
  begin
    R := ObtenerDatos(FI,FF,H,SB,SL,CHA);
    Release;
  end;

  if not R then Exit;

  with TfrmConciliacion.Create(nil) do
  begin
    Mostrar(0,FI,FF,H,SB,SL,CHA);
    Release;
  end;
end;

procedure TfrmPrincipal.Depsitos1Click(Sender: TObject);
begin
  with TfrmIngreso.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Crditosbancarios1Click(Sender: TObject);
begin
  with TfrmCredito.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Pagos1Click(Sender: TObject);
begin
  with TfrmPagos.Create(nil) do
  begin
    Mostrar(0);
    Release;
  end;
end;

procedure TfrmPrincipal.Listapagos1Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA_PAGO';
  MostrarLstPagos('FECHA_PAGO');
end;

procedure TfrmPrincipal.Emisinlistadepagos1Click(Sender: TObject);
var
  FI,FF: TDateTime;
  R: Boolean;
begin
  with TfrmIngFecAdmIntel.Create(nil) do
  begin
    R := ObtenerFechas(FI,FF);
    Release;
  end;

  if not R then Exit;

  with TfrmQRPagos.Create(nil) do
  begin
    VistaPrevia(FI,FF);
    Release;
  end;
end;

procedure TfrmPrincipal.grdDatosTitleClick(Column: TColumn);
var
  i: Byte;
  F: TField;
  EstaFiltrado: Boolean;
  Id: Longword;
begin
    F := dsDatos.DataSet.FindField(Column.FieldName);
    if F.FieldKind = fkData then
    begin
      gOrden := Column.FieldName;

      for i:=0 to grdDatos.Columns.Count-1 do
        grdDatos.Columns[i].Title.Font.Style := [];

      Column.Title.Font.Style := [fsBold];

      EstaFiltrado := dsDatos.DataSet.Filtered;
      case gListado of
        TRAB_DEPTO: MostrarLstTrabDepto(gOrden);
        TRAB_EDIF: MostrarLstTrabEdif(gOrden);
        GASTOS_ADMIN: begin
               Id := dmQuerys.qryGastoAdIDGASTO_AD.Value;
               MostrarLstGastosAd(gOrden,Id);
             end;
        GASTOS_FINAN: begin
               Id := dmQuerys.qryGastoFiIDGASTO_FI.Value;
               MostrarLstGastosFi(gOrden,Id);
             end;
        GASTOS_SERV: begin
               Id := dmQuerys.qryServEdifIDSERV_EDIF.Value;
               MostrarLstGastosSer(gOrden,Id);
             end;
        PAGOS_PROV: MostrarLstPagos(gOrden);
      end;

      if EstaFiltrado then btnAplicarClick(nil);
    end
    else MsjInfo('No se puede ordenar por esta columna');
end;

procedure TfrmPrincipal.Administrativos2Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA';
  MostrarLstGastosAd(gOrden,1);
end;

procedure TfrmPrincipal.Financieros2Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA';
  MostrarLstGastosFi(gOrden,1);
end;

procedure TfrmPrincipal.Servicios3Click(Sender: TObject);
begin
  if gListado = TComponent(Sender).Tag then Exit;
  gOrden := 'FECHA';
  MostrarLstGastosSer(gOrden,1);
end;

procedure TfrmPrincipal.btnAgregarClick(Sender: TObject);
var
  Filtrado, R: Boolean;
begin
  if gListado <> -1 then
    GuardarEstadoGrilla(IntToStr(gListado)+'.col',grdDatos);

  Filtrado := dsDatos.DataSet.Filtered;

  case gListado of
    TRAB_DEPTO: itmTrabajoClick(nil); //Trabajos en departamentos
    TRAB_EDIF: Edificios1Click(nil); //Trabajos en edificios
    GASTOS_ADMIN: with TfrmIngGastoAd.Create(nil) do //Gastos administrativos
         begin
           if Agregar(gId) then MostrarLstGastosAd(gOrden,gId);
           Release;
         end;
    GASTOS_FINAN: with TfrmIngGastoFi.Create(nil) do //Gastos financieros
         begin
           if Agregar(gId) then MostrarLstGastosFi(gOrden,gId);
           Release;
         end;

    GASTOS_SERV: with TfrmIngServ.Create(nil) do //servicios
         begin
           R := True;
           while R do
           begin
             R := Agregar(gId, False);
             if R and (gListado=GASTOS_SERV) then MostrarLstGastosSer(gOrden,gId);
           end;
           Release;
         end;
  end;

  if Filtrado then dsDatos.DataSet.Filtered := True;
end;

procedure TfrmPrincipal.RecibosAnulados1Click(Sender: TObject);
begin
  with TfrmRecAnul.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Servicios4Click(Sender: TObject);
begin
  with TfrmEstServicios.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Mantenimiento2Click(Sender: TObject);
begin
  with TfrmEstMantenimiento.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Ingresos2Click(Sender: TObject);
begin
  with TfrmEstIngresos.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Cheques2Click(Sender: TObject);
begin
//  dmTemp.CargarTemp(0);
//  Filtrar(dmTemp.TMP,'TIPO_PAGO='+#39+'C'+#39);
  with TfrmEstCheques.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Listadedeudasaproveedores1Click(Sender: TObject);
begin
  with TfrmDeudas.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Cheques1Click(Sender: TObject);
begin
  with TfrmCheques.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Reestablecercolumnas1Click(Sender: TObject);
begin
  with TfrmResetCol.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.Servicios5Click(Sender: TObject);
begin
  MostrarMSJ('Numerando DECIs de servicios...');
  Application.ProcessMessages;
  dmDatos.NumerarDECIServicios;
  OcultarMSJ;
end;

procedure TfrmPrincipal.rabajos2Click(Sender: TObject);
begin
  MostrarMSJ('Numerando DECIs de trabajos...');
  Application.ProcessMessages;
  dmDatos.NumerarDECITrabajos;
  OcultarMSJ;
end;

procedure TfrmPrincipal.Gastosadministrativos1Click(Sender: TObject);
begin
  MostrarMSJ('Numerando DECIs de gastos administrativos...');
  Application.ProcessMessages;
  dmDatos.NumerarDECIAdministrativos;
  OcultarMSJ;
end;

procedure TfrmPrincipal.Novedades1Click(Sender: TObject);
begin
  with TfrmLoNuevo.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmEspecialidadesClick(Sender: TObject);
begin
  with TfrmElecEspecialidad.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmGradosClick(Sender: TObject);
begin
  with TfrmElecGrado.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmEdificiosClick(Sender: TObject);
begin
  with TfrmElecEdificio.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmDepartamentosClick(Sender: TObject);
begin
  with TfrmElecDepto.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmOcupantesClick(Sender: TObject);
begin
  with TfrmElecOcupante.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmOcupacionesClick(Sender: TObject);
begin
  with TfrmElecOcupacion.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmTiposdeartefactoClick(Sender: TObject);
begin
  with TfrmElecTipoArtefacto.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmTiposdedescuentosClick(Sender: TObject);
begin
  with TfrmElecTipoDesc.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.itmDecuentosAlquileresClick(Sender: TObject);
var
  M,A: Word;
  R: Boolean;
begin
  with TfrmIngMes.Create(nil) do
  begin
    R := ObtenerMes(M,A);
    Release;
  end;

  if R then dmDatos.GenerarDescuentosAlquiler(M,A);
end;

procedure TfrmPrincipal.itmDescuentosExpensasClick(Sender: TObject);
var
  M,A: Word;
  R: Boolean;
begin
  with TfrmIngMes.Create(nil) do
  begin
    R := ObtenerMes(M,A);
    Release;
  end;

  if R then dmDatos.GenerarDescuentosExpensas(M,A);
end;

procedure TfrmPrincipal.Descuentos2Click(Sender: TObject);
begin
  with TfrmElecDescuento.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

procedure TfrmPrincipal.ComboEdiChange(Sender: TObject);
begin
  if ComboEdi.Text = '' then ComboDepto.Clear;
end;

procedure TfrmPrincipal.itmCoeficientesAlquilerClick(Sender: TObject);
begin
  with TfrmElecCoef.Create(nil) do
  begin
    Mostrar;
    Release;
  end;
end;

end.
