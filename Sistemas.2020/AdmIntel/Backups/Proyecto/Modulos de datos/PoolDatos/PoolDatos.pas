unit PoolDatos;

interface

uses
  SysUtils, Classes, DB, DBTables, DateUtils, Variants, QForms, Controls;

type
  TdmDatos = class(TDataModule)
    ADB: TDatabase;
    MAT: TTable;
    MU: TTable;
    TAREA: TTable;
    TRAB: TTable;
    UNI: TTable;
    PROV: TTable;
    MATIDMATERIAL: TIntegerField;
    MATDESCRIP: TStringField;
    MUIDMATERIAL: TIntegerField;
    MUIDTRABAJO: TIntegerField;
    TAREAIDTAREA: TIntegerField;
    TAREADESCRIP: TStringField;
    UNIIDUNIDAD: TIntegerField;
    UNIDESCRIP: TStringField;
    UNIABREV: TStringField;
    PROVIDPROVEEDOR: TIntegerField;
    PROVRAZON_SOCIAL: TStringField;
    PROVNOMBRE_FANTASIA: TStringField;
    PROVDOMICILIO: TStringField;
    PROVTELEFONO: TStringField;
    PROVEMAIL: TStringField;
    TRABIDTRABAJO: TIntegerField;
    TRABNRO_PEDIDO: TIntegerField;
    TRABFECHA_INI: TDateTimeField;
    TRABFECHA_FIN: TDateTimeField;
    TRABCOSTO: TFloatField;
    TT: TTable;
    TTIDTRABAJO: TIntegerField;
    TTIDTAREA: TIntegerField;
    PROVCUIT: TStringField;
    MUMaterial: TStringField;
    MUIDUNIDAD: TIntegerField;
    MUCANTIDAD: TFloatField;
    MUUnidad: TStringField;
    TRABIDPROVEEDOR: TIntegerField;
    TRABIMPUTACION: TStringField;
    TESP: TTable;
    EC: TTable;
    TD: TTable;
    TESPIDTIPO_ESPACIO: TIntegerField;
    TESPDESCRIP: TStringField;
    ECIDEDIFICIO: TIntegerField;
    ECIDTIPO_ESPACIO: TIntegerField;
    TDIDTRABAJO: TIntegerField;
    TDIDDEPARTAMENTO: TIntegerField;
    TE: TTable;
    TEIDTRABAJO: TIntegerField;
    TEIDEDIFICIO: TIntegerField;
    TEIDTIPO_ESPACIO: TIntegerField;
    TRABTIPO_TRAB: TStringField;
    CAT: TTable;
    CATIDCATEGORIA: TIntegerField;
    CATDESCRIP: TStringField;
    TRABIDCATEGORIA: TIntegerField;
    TRABTipo: TStringField;
    SERV: TTable;
    SERVIDSERVICIO: TIntegerField;
    SERVDESCRIP: TStringField;
    TGASTOAD: TTable;
    TGASTOFI: TTable;
    TGASTOADIDTIPO_GASTO_AD: TIntegerField;
    TGASTOADDESCRIP: TStringField;
    TGASTOFIIDTIPO_GASTO_FI: TIntegerField;
    TGASTOFIDESCRIP: TStringField;
    TING: TTable;
    TINGIDTIPO_INGRESO: TIntegerField;
    TINGDESCRIP: TStringField;
    TRABPAGADO: TStringField;
    PAGO: TTable;
    PAGOIDPAGO: TIntegerField;
    PAGOCOBRADO: TStringField;
    PAGOTIPO_PAGO: TStringField;
    PAGONRO_CHEQUE: TStringField;
    TRABIDPAGO: TIntegerField;
    PAGOFECHA_PAGO: TDateTimeField;
    PAGOIMPORTE: TFloatField;
    PAGOProveedor: TStringField;
    DECI: TTable;
    DECIIDEDIFICIO: TIntegerField;
    DECINRO_MANT: TIntegerField;
    DECINRO_SERV: TIntegerField;
    DECIMES: TIntegerField;
    TRABNRO_ORDEN: TIntegerField;
    TRABNRO_DECI: TIntegerField;
    EDIF: TTable;
    EDIFIDEDIFICIO: TIntegerField;
    DEPTO: TTable;
    TRABNRO_FACT: TIntegerField;
    SERVEDIF: TTable;
    SERVEDIFIDEDIFICIO: TIntegerField;
    SERVEDIFIDPAGO: TIntegerField;
    SERVEDIFNRO_ORDEN: TIntegerField;
    SERVEDIFNRO_DECI: TIntegerField;
    SERVEDIFFECHAPAGO: TDateField;
    TDIdEdificio: TWordField;
    TRABIdEdificio: TWordField;
    AuxTD: TTable;
    AuxTE: TTable;
    AuxTEIDTRABAJO: TIntegerField;
    AuxTEIDEDIFICIO: TIntegerField;
    AuxTDIDTRABAJO: TIntegerField;
    AuxTDIDDEPARTAMENTO: TIntegerField;
    AuxTDIdEdificio: TIntegerField;
    DECIORDEN_MANT: TIntegerField;
    DECIORDEN_SERV: TIntegerField;
    GASTOAD: TTable;
    GASTOADFECHA_PAGO: TDateTimeField;
    GASTOADIDGASTO_AD: TIntegerField;
    GASTOADIDPAGO: TIntegerField;
    GASTOADNRO_ORDEN: TIntegerField;
    GASTOADNRO_DECI: TIntegerField;
    qryTrab: TQuery;
    qryTrabIDTRABAJO: TIntegerField;
    qryTrabFECHA_PAGO: TDateTimeField;
    qryTrabRAZON_SOCIAL: TStringField;
    Query: TQuery;
    DECIANIO: TIntegerField;
    qryServ: TQuery;
    qryServIDSERV_EDIF: TIntegerField;
    qryServRAZON_SOCIAL: TStringField;
    qryServFECHAPAGO: TDateTimeField;
    SERVEDIFIDSERV_EDIF: TIntegerField;
    qryGastoAd: TQuery;
    qryGastoAdIDGASTO_AD: TIntegerField;
    qryGastoAdFECHAPAGO: TDateTimeField;
    qrySoloDeptos: TQuery;
    qrySoloDeptosIDEDIFICIO: TIntegerField;
    qrySoloDeptosIDDEPARTAMENTO: TIntegerField;
    qrySoloDeptosDESCRIPCION: TStringField;
    qryEdificios: TQuery;
    qryEdificiosIDEDIFICIO: TIntegerField;
    qryEdificiosDESCRIPCION: TStringField;
    EDIFDESCRIPCION: TStringField;
    DEPTOIDEDIFICIO: TIntegerField;
    DEPTOIDDEPARTAMENTO: TIntegerField;
    DEPTODESCRIPCION: TStringField;
    TRABProveedor: TStringField;
    DEPTODescEdif: TStringField;
    DEPTODescCompleta: TStringField;
    PAR: TTable;
    PARULTIMO_ANO_NROS_DECI: TIntegerField;
    DESC: TTable;
    DESCIDOCUPANTE: TIntegerField;
    DESCIDTIPODESCUENTO: TIntegerField;
    DESCMES: TStringField;
    DESCANIO: TIntegerField;
    COEF: TTable;
    COEFTIPO: TStringField;
    COEFPERSONAL: TStringField;
    COEFCANT_AMB: TIntegerField;
    COEFPORCENTAJE: TFloatField;
    GRADO: TTable;
    GRADOIDGRADO: TIntegerField;
    GRADOTIEMPO_MINIMO: TIntegerField;
    GRADOCOD201: TFloatField;
    GRADOCOD209: TFloatField;
    qrySumaGA: TQuery;
    qrySumaGF: TQuery;
    qrySumaGATOTAL: TFloatField;
    qrySumaGFTOTAL: TFloatField;
    qryOcupMilitares: TQuery;
    qryOcupMilitaresIDPERSONA: TIntegerField;
    qryOcupMilitaresTIPO: TStringField;
    qryOcupMilitaresCANTAMB: TIntegerField;
    qryOcupMilitaresMATRICULA: TStringField;
    qryOcupMilitaresIDGRADO: TIntegerField;
    qryOcupMilitaresANTGRADO: TIntegerField;
    qryOcupMilitaresFECHA_INGRESO: TDateTimeField;
    qryOcupMilitaresRENTAPROPIA: TFloatField;
    DESCMONTO: TFloatField;
    EDIFCOEFICIENTE: TIntegerField;
    EDIFADMFISCAL: TStringField;
    qryGastosMantXEdif: TQuery;
    qryGastosServXEdif: TQuery;
    qryGastosMantXEdifIDEDIFICIO: TIntegerField;
    qryGastosMantXEdifMONTO: TFloatField;
    qryGastosServXEdifIDEDIFICIO: TIntegerField;
    qryGastosServXEdifPRORRATEO: TIntegerField;
    qryGastosServXEdifMONTO: TFloatField;
    qryGastosMantXDepto: TQuery;
    qryGastosMantXDeptoIDDEPARTAMENTO: TIntegerField;
    qryGastosMantXDeptoMONTO: TFloatField;
    qryDeptosOcupados: TQuery;
    qryDeptosOcupadosIDDEPARTAMENTO: TIntegerField;
    qryDeptosOcupadosIDPERSONA: TIntegerField;
    qryDeptosOcupadosTIPO: TStringField;
    qryDeptosOcupadosCOEFICIENTE: TFloatField;
    qryDeptosOcupadosIDEDIFICIO: TIntegerField;
    qryCantViviendas: TQuery;
    qryCantViviendasTOTAL_VIVIENDAS: TIntegerField;
    Q: TQuery;
    qryOcupMilitaresANT_SERVICIO: TIntegerField;
    qryServVACIOS: TStringField;
    DECINRO_VACIOS: TIntegerField;
    DECIORDEN_VACIOS: TIntegerField;
    qryServIDEDIFICIO: TIntegerField;
    PARDIVISOR_RENTA: TFloatField;
    tblPersona_: TTable;
    tblPersona_IDPERSONA: TIntegerField;
    tblPersona_NRODOCUMENTO: TIntegerField;
    tblPersona_TIPODOCUMENTO: TStringField;
    tblPersona_NOMBRE: TStringField;
    tblPersona_APELLIDO: TStringField;
    tblPersona_TELEFONO: TStringField;
    tblPersona_EMAIL: TStringField;
    tblPersona_TIPO: TStringField;
    tblOcupanteMilitar_: TTable;
    tblOcupanteMilitar_IDPERSONA: TIntegerField;
    tblOcupanteMilitar_IDESPECIALIDAD: TIntegerField;
    tblOcupanteMilitar_ANTGRADO: TIntegerField;
    tblOcupanteMilitar_DESTINO: TStringField;
    tblOcupanteMilitar_MATRICULA: TStringField;
    tblOcupanteMilitar_IDGRADO: TIntegerField;
    tblOcupanteMilitar_RENTAPROPIA: TFloatField;
    tblOcupanteMilitar_FECHA_INGRESO: TDateTimeField;
    tblOcupanteMilitar_ANT_SERVICIO: TIntegerField;
    tblEspecialidad_: TTable;
    tblGrado_: TTable;
    tblEspecialidad_IDESPECIALIDAD: TIntegerField;
    tblEspecialidad_DESCRIPCION: TStringField;
    tblEspecialidad_ABREV: TStringField;
    tblGrado_IDGRADO: TIntegerField;
    tblGrado_DESCRIPCION: TStringField;
    tblGrado_ABREVIATURA: TStringField;
    tblGrado_TIEMPO_MINIMO: TIntegerField;
    tblGrado_COD201: TFloatField;
    tblGrado_COD209: TFloatField;
    tblGrado_ORDEN: TIntegerField;
    qryOcupCiviles: TQuery;
    DEPTOCANTAMB: TIntegerField;
    tblOcupanteCivil_: TTable;
    tblOcupanteCivil_IDPERSONA: TIntegerField;
    tblOcupanteCivil_CATEGORIA: TStringField;
    tblOcupanteCivil_LEGAJO: TStringField;
    tblOcupanteCivil_SUELDO: TFloatField;
    qryOcupCivilesIDOCUPANTE: TIntegerField;
    qryOcupCivilesOCUPANTE: TStringField;
    qryOcupCivilesLOCACION: TStringField;
    qryOcupCivilesFECHAINI: TDateTimeField;
    qryOcupCivilesFECHAFIN: TDateTimeField;
    qryOcupCivilesIDEDIFICIO: TIntegerField;
    qryOcupCivilesIDDEPARTAMENTO: TIntegerField;
    qryOcupCivilesLEGAJO: TStringField;
    qryOcupCivilesSUELDO: TFloatField;
    PERS: TTable;
    PERSIDPERSONAL: TIntegerField;
    PERSNOMBRE: TStringField;
    PERSAPELLIDO: TStringField;
    PERSMATRICULA: TStringField;
    PERSIDGRADO: TIntegerField;
    qryCantDeptosXEdif: TQuery;
    qryCantDeptosXEdifTOTAL_VIVIENDAS: TIntegerField;
    tblCostoDeptoVacio: TTable;
    tblCostoDeptoVacioIDCOSTO_DEPTO_VACIO: TIntegerField;
    tblCostoDeptoVacioMES: TStringField;
    tblCostoDeptoVacioANIO: TIntegerField;
    tblCostoDeptoVacioMONTO_ADMIN: TFloatField;
    tblCostoDeptoVacioMONTO_EXP: TFloatField;
    qryDeptosVacios: TQuery;
    qryDeptosVaciosIDEDIFICIO: TIntegerField;
    qryDeptosVaciosIDDEPARTAMENTO: TIntegerField;
    qryDeptosVaciosCOEFICIENTE: TFloatField;
    tblCostoDeptoVacioIDLOCACION: TIntegerField;
    tblCostoDeptoVacioIDTIPO_LOCACION: TIntegerField;
    tblCostoDeptoVacioMONTO_EXP_EDIF: TFloatField;
    tblFechaDesc: TTable;
    tblFechaDescIDTIPO_DESCUENTO: TIntegerField;
    tblFechaDescFECHA: TDateTimeField;
    tblFechaDescMES: TStringField;
    tblFechaDescANIO: TIntegerField;
    tblFechaDescMONTO: TFloatField;
    tblFechaDescDEPTOS_ACTIVOS: TIntegerField;
    procedure TRABNewRecord(DataSet: TDataSet);
    procedure TRABCalcFields(DataSet: TDataSet);
    procedure DEPTOCalcFields(DataSet: TDataSet);

  private
    procedure GenerarDescuentosAlquilerMilitares(Mes, Anio: Word; var CantActivos: Integer; var Monto: Currency);
    procedure GenerarDescuentosAlquilerCiviles(Mes, Anio: Word; var CantActivos: Integer; var Monto: Currency);
    procedure ActualizarFechaDescuento(IdTipoDesc, CantActivos, Anio: Integer;
                                            Mes: String; Monto: Currency);

  public
    procedure GenerarNrosDECI;
    procedure RetornarNrosDECI(const IdEdificio: Integer; const Tipo: Char;
                               const Fecha: TDateTime;
                               var NDECI, NORDEN: Longword);
    procedure IncNrosDECI(IdEdificio: Smallint; Tipo: Char; Fecha: TDateTime);
    procedure VerificarEdificios;
    procedure VerificarDepartamentos;
    procedure NumerarDECIServicios;
    procedure NumerarDECIServiciosDeptosVacios;
    procedure NumerarDECITrabajos;
    procedure NumerarDECIAdministrativos;
    procedure GenerarDescuentosAlquiler(Mes, Anio: Word);
    procedure GenerarDescuentosExpensas(Mes, Anio: Word);
    procedure GenerarCostosDeptosVacios(Mes, Anio: Word);
    function LoadDatabaseFile: Boolean;
    function GetEspecialidades: TList;

  end;

var
  dmDatos: TdmDatos;

implementation

uses StoreProcs, PoolQuerys, Comunes, Util, Input, TipoLocacion;

{$R *.dfm}

procedure TdmDatos.GenerarNrosDECI;
var
  Anio, Cont: Word;
  i: Byte;
begin
  PAR.Open;
  PAR.First;

  //Si se carga por primera vez el parámetro ULTIMO_ANO_NROS_DECI, se lo debe
  //establecer en su valor por defecto, 2000
  if PARULTIMO_ANO_NROS_DECI.IsNull then
  begin
    PAR.Edit;
    PARULTIMO_ANO_NROS_DECI.Value := 2000;
    PAR.Post;
  end;

  //Genera los nros. de DECI para todos los años entre el 2001 y el actual.
  while YearOf(Date) > PARULTIMO_ANO_NROS_DECI.Value do
  begin
    Anio := PARULTIMO_ANO_NROS_DECI.Value + 1;
    qryEdificios.Open;
    Cont := 1;
    for i := 1 to 12 do
    begin
      qryEdificios.First;
      while not qryEdificios.Eof do
      begin
        DECI.Append;
        DECIIDEDIFICIO.Value := qryEdificiosIdEdificio.Value;
        DECIMES.Value := i;
        DECIANIO.Value := Anio;
        DECINRO_MANT.Value := Cont;
        DECINRO_SERV.Value := Cont;
        DECINRO_VACIOS.Value := Cont;
        DECIORDEN_MANT.Value := 1;
        DECIORDEN_SERV.Value := 1;
        DECIORDEN_VACIOS.Value := 1;
        DECI.Post;
        Cont := Cont + 1;
        qryEdificios.Next;
      end;

      {Agrega un registro más para la DECI de gastos administrativos}
      DECI.Append;
      DECIIDEDIFICIO.Value := -1;
      DECIMES.Value := i;
      DECIANIO.Value := Anio;
      DECINRO_MANT.Value := Cont;
      DECINRO_SERV.Value := Cont;
      DECIORDEN_MANT.Value := 1;
      DECIORDEN_SERV.Value := 1;
      DECI.Post;

      {Agrega un registro más para la DECI de gastos financieros}
      DECI.Append;
      DECIIDEDIFICIO.Value := -2;
      DECIMES.Value := i;
      DECIANIO.Value := Anio;
      DECINRO_MANT.Value := Cont + 1;
      DECINRO_SERV.Value := Cont + 1;
      DECIORDEN_MANT.Value := 1;
      DECIORDEN_SERV.Value := 1;
      DECI.Post;

      {Agrega un registro más para la DECI de servicios en deptos. vacios}
      DECI.Append;
      DECIIDEDIFICIO.Value := -3;
      DECIMES.Value := i;
      DECIANIO.Value := Anio;
      DECINRO_MANT.Value := Cont + 2;
      DECINRO_SERV.Value := Cont + 2;
      DECIORDEN_MANT.Value := 1;
      DECIORDEN_SERV.Value := 1;
      DECI.Post;

      Cont := Cont + 3;
    end;
    PAR.Edit;
    PARULTIMO_ANO_NROS_DECI.Value := Anio;
    PAR.Post;
  end;
  qryEdificios.Close;
  DECI.Close;
  PAR.Close;
end;

procedure TdmDatos.RetornarNrosDECI(const IdEdificio: Integer; const Tipo: Char;
                                    const Fecha: TDateTime;
                                    var NDECI, NORDEN: Longword);
var
  Mes, Anio: Word;
begin
  Mes := MonthOf(Fecha);
  Anio := YearOf(Fecha);
  Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([IdEdificio, Mes, Anio]));

  if Tipo = 'M' then //DECI de mantenimiento
  begin
    NDECI := DECINRO_MANT.Value;
    NORDEN := DECIORDEN_MANT.Value;
  end
  else if Tipo = 'S' then //DECI de servicios
  begin
    NDECI := DECINRO_SERV.Value;
    NORDEN := DECIORDEN_SERV.Value;
  end
  else if Tipo = 'A' then //DECI de administración
  begin
    NDECI := DECINRO_MANT.Value;
    NORDEN := DECIORDEN_MANT.Value;
  end
  else if Tipo = 'V' then //DECI de servicios en deptos. vacios
  begin
    NDECI := DECINRO_VACIOS.Value;
    NORDEN := DECIORDEN_VACIOS.Value;
  end;
end;

procedure TdmDatos.IncNrosDECI(IdEdificio: Smallint; Tipo: Char; Fecha: TDateTime);
var
  Mes, Anio: Word;
begin
  Mes := MonthOf(Fecha);
  Anio := YearOf(Fecha);
  Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([IdEdificio, Mes, Anio]));
  DECI.Edit;
  // Las DECI de mantenimiento siguen el orden de ORDEN_MANT, las de servicios
  // siguen el orden de ORDEN_SERV y el resto (administrativos y financieros)
  // siguen el orden de ORDEN_MANT.
  if Tipo = 'S' then
    DECIORDEN_SERV.Value := DECIORDEN_SERV.Value + 1
  else
    if Tipo = 'M' then
      DECIORDEN_MANT.Value := DECIORDEN_MANT.Value + 1
    else
      DECIORDEN_VACIOS.Value := DECIORDEN_VACIOS.Value + 1;
  DECI.Post;
  DECI.Close;
end;

procedure TdmDatos.VerificarEdificios;
begin
{  dmAlcaldia.qryEdificios.Open;
  EDIF.Open;
  if dmAlcaldia.qryEdificios.RecordCount <> EDIF.RecordCount then
  begin
    dmAlcaldia.qryEdificios.First;
    while not dmAlcaldia.qryEdificios.Eof do
    begin
      if not Existe(EDIF,'IDEDIFICIO',dmAlcaldia.qryEdificiosIdEdificio.Value) then
      begin
        EDIF.Append;
        EDIFIDEDIFICIO.Value := dmAlcaldia.qryEdificiosIdEdificio.Value;
        EDIFDESCRIP.Text := dmAlcaldia.qryEdificiosDescrip.Text;
        EDIF.Post;
      end;
      dmAlcaldia.qryEdificios.Next;
    end;
  end;}
end;

procedure TdmDatos.VerificarDepartamentos;
begin
{  dmAlcaldia.qryDeptos.Open;
  DTOEDIF.Open;
  if dmAlcaldia.qryDeptos.RecordCount <> DTOEDIF.RecordCount then
  begin
    dmAlcaldia.qryDeptos.First;
    while not dmAlcaldia.qryDeptos.Eof do
    begin
      if not Existe(DTOEDIF,'IDEDIF','IDDEPTO',
         VarArrayOf([dmAlcaldia.qryDeptosIdEdificio.Value,
         dmAlcaldia.qryDeptosIdDepartamento.Value])) then
      begin
        DTOEDIF.Append;
        DTOEDIFIDEDIF.Value := dmAlcaldia.qryDeptosIdEdificio.Value;
        DTOEDIFIDDEPTO.Value := dmAlcaldia.qryDeptosIdDepartamento.Value;
        DTOEDIFDESCRIP.Text := dmAlcaldia.qryDeptosDescDepto.Text;
        DTOEDIF.Post;
      end;
      dmAlcaldia.qryDeptos.Next;
    end;
  end;}
end;

procedure TdmDatos.NumerarDECIServicios;
var
  Mes, Anio: Word;
  D: String;
begin
  if not IngresarMes(Mes, Anio) then Exit;

  Screen.Cursor := crHourglass;

  //Setea todos los numeros de orden a 1
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE NROS_DECI SET ORDEN_SERV=1 WHERE MES=' + IntToStr(Mes) +
               ' AND ANIO=' + IntToStr(Anio) + 'AND IDEDIFICIO > 0');
  Query.ExecSQL;
  DECI.Open;
  DECI.Refresh;

  //filtra la consulta de servicios por mes y año
  D := IntToStr(DaysInAMonth(Anio,Mes));
  qryServ.Filtered := False;
  qryServ.Filter := 'FECHAPAGO >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                    IntToStr(Anio) + #39 + ' AND FECHAPAGO <= ' + #39 + D + '/' +
                    IntToStr(Mes) + '/' + IntToStr(Anio) + #39  +
                    ' AND VACIOS = ' + #39 + 'No' + #39;
  qryServ.Filtered := True;
  qryServ.Open;

  //Recorre todos los servicios del mes correspondiente y los renumera.
  qryServ.First;
  while not qryServ.Eof do
  begin
    Existe(SERVEDIF, 'IDSERV_EDIF', qryServIDSERV_EDIF.Value);
    Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([SERVEDIFIDEDIFICIO.Value, Mes, Anio]));
    SERVEDIF.Edit;
    SERVEDIFNRO_DECI.Value := DECINRO_SERV.Value;
    SERVEDIFNRO_ORDEN.Value := DECIORDEN_SERV.Value;
    SERVEDIF.Post;
    DECI.Edit;
    DECIORDEN_SERV.Value := DECIORDEN_SERV.Value + 1;
    DECI.Post;
    qryServ.Next;
  end;
  SERVEDIF.Close;
  qryServ.Close;
  Screen.Cursor := crDefault;
end;

procedure TdmDatos.NumerarDECIServiciosDeptosVacios;
var
  Mes, Anio: Word;
  D: String;
begin
  if not IngresarMes(Mes, Anio) then Exit;

  Screen.Cursor := crHourglass;

  //Setea todos los numeros de orden a 1
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE NROS_DECI SET ORDEN_VACIOS=1 WHERE MES=' + IntToStr(Mes) +
               ' AND ANIO=' + IntToStr(Anio) + 'AND IDEDIFICIO > 0');
  Query.ExecSQL;
  DECI.Open;
  DECI.Refresh;

  //filtra la consulta de servicios en deptos. vacios por mes y año
  D := IntToStr(DaysInAMonth(Anio,Mes));
  qryServ.Filtered := False;
  qryServ.Filter := 'FECHAPAGO >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                    IntToStr(Anio) + #39 + ' AND FECHAPAGO <= ' + #39 + D + '/' +
                    IntToStr(Mes) + '/' + IntToStr(Anio) + #39  +
                    ' AND VACIOS = ' + #39 + 'Sí' + #39;
  qryServ.Filtered := True;
  qryServ.Open;

  //Recorre todos los servicios del mes correspondiente y los renumera.
  qryServ.First;
  while not qryServ.Eof do
  begin
    Existe(SERVEDIF, 'IDSERV_EDIF', qryServIDSERV_EDIF.Value);
    Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([qryServIDEDIFICIO.Value, Mes, Anio]));
    SERVEDIF.Edit;
    SERVEDIFNRO_DECI.Value := DECINRO_VACIOS.Value;
    SERVEDIFNRO_ORDEN.Value := DECIORDEN_VACIOS.Value;
    SERVEDIF.Post;
    DECI.Edit;
    DECIORDEN_VACIOS.Value := DECIORDEN_VACIOS.Value + 1;
    DECI.Post;
    qryServ.Next;
  end;
  SERVEDIF.Close;
  qryServ.Close;
  Screen.Cursor := crDefault;
end;

procedure TdmDatos.NumerarDECITrabajos;
var
  Mes, Anio: Word;
  D: String;
begin
  if not IngresarMes(Mes, Anio) then Exit;

  Screen.Cursor := crHourglass;

  //Setea todos los numeros de orden a 1
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE NROS_DECI SET ORDEN_MANT=1 WHERE MES=' + IntToStr(Mes) +
               ' AND ANIO=' + IntToStr(Anio) + 'AND IDEDIFICIO > 0');
  Query.ExecSQL;
  DECI.Open;
  DECI.Refresh;

  //filtra la consulta de trabajos por mes y año
  D := IntToStr(DaysInAMonth(Anio,Mes));
  qryTrab.Filtered := False;
  qryTrab.Filter := 'FECHA_PAGO >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                    IntToStr(Anio) + #39 + ' AND FECHA_PAGO <= ' + #39 + D + '/' +
                    IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qryTrab.Filtered := True;
  qryTrab.Open;

  //Recorre todos los trabajos del mes correspondiente y los renumera.
  qryTrab.First;
  while not qryTrab.Eof do
  begin
    Existe(TRAB, 'IDTRABAJO', qryTRABIDTRABAJO.Value);
    Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([TRABIdEdificio.Value, Mes, Anio]));
    TRAB.Edit;
    TRABNRO_DECI.Value := DECINRO_MANT.Value;
    TRABNRO_ORDEN.Value := DECIORDEN_MANT.Value;
    TRAB.Post;
    DECI.Edit;
    DECIORDEN_MANT.Value := DECIORDEN_MANT.Value + 1;
    DECI.Post;
    qryTrab.Next;
  end;
  TRAB.Close;
  qryTrab.Close;
  Screen.Cursor := crDefault;
end;

procedure TdmDatos.NumerarDECIAdministrativos;
var
  Mes, Anio: Word;
  D: String;
begin
  if not IngresarMes(Mes, Anio) then Exit;

  Screen.Cursor := crHourglass;

  //Setea todos los numeros de orden a 1
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE NROS_DECI SET ORDEN_MANT=1 WHERE MES=' + IntToStr(Mes) +
               ' AND ANIO=' + IntToStr(Anio) + 'AND IDEDIFICIO=-1');
  Query.ExecSQL;
  DECI.Open;
  DECI.Refresh;

  //filtra la consulta de gastos administrativos por mes y año
  D := IntToStr(DaysInAMonth(Anio,Mes));
  qryGastoAd.Filtered := False;
  qryGastoAd.Filter := 'FECHAPAGO >= ' + #39 + '01/' + IntToStr(Mes) + '/' +
                    IntToStr(Anio) + #39 + ' AND FECHAPAGO <= ' + #39 + D + '/' +
                    IntToStr(Mes) + '/' + IntToStr(Anio) + #39;
  qryGastoAd.Filtered := True;
  qryGastoAd.Open;

  //Recorre todos los gastos administrativos del mes correspondiente y los renumera.
  qryGastoAd.First;
  while not qryGastoAd.Eof do
  begin
    Existe(GASTOAD, 'IDGASTO_AD', qryGastoAdIDGASTO_AD.Value);
    Existe(DECI,'IDEDIFICIO', 'MES', 'ANIO', VarArrayOf([-1, Mes, Anio]));
    GASTOAD.Edit;
    GASTOADNRO_DECI.Value := DECINRO_MANT.Value;
    GASTOADNRO_ORDEN.Value := DECIORDEN_MANT.Value;
    GASTOAD.Post;
    DECI.Edit;
    DECIORDEN_MANT.Value := DECIORDEN_MANT.Value + 1;
    DECI.Post;
    qryGastoAd.Next;
  end;
  GASTOAD.Close;
  qryGastoAd.Close;
  Screen.Cursor := crDefault;
end;

procedure TdmDatos.TRABNewRecord(DataSet: TDataSet);
begin
  TRABIDTRABAJO.Value := dmStoreProc.getId('IDTRABAJO') + 1;
end;

procedure TdmDatos.TRABCalcFields(DataSet: TDataSet);
var
  Table: TTable;
begin
  if TRABTIPO_TRAB.Text = 'D' then Table := AuxTD
  else Table := AuxTE;

  Existe(Table,'IDTRABAJO',TRABIDTRABAJO.Value);
  TRABIdEdificio.Value := Table.FieldByName('IdEdificio').AsInteger;
end;

procedure TdmDatos.DEPTOCalcFields(DataSet: TDataSet);
begin
  DEPTODescCompleta.Text := DEPTODescEdif.Text + ' ' + DEPTODESCRIPCION.Text;
end;

procedure TdmDatos.GenerarDescuentosAlquiler(Mes, Anio: Word);
var
  M: String;
  CantActivosMil, CantActivosCiv: Integer;
  MontoMil, MontoCiv: Currency;
begin
  //Verifica si ya se generaron los descuentos de alquiler para ese mes y año
  M := UpperCase(MesComoStr(Mes));
  if Existe(tblFechaDesc, 'IDTIPO_DESCUENTO', 'MES', 'ANIO', VarArrayOf([1, M, Anio])) then
  begin
    if not Confirmar(PChar('Los descuentos de alquileres para el mes de ' + M +
                     ' de ' + IntToStr(Anio) + ' ya fueron generados el día ' +
                     DateToStr(tblFechaDescFECHA.Value) + ' para ' +
                     IntToStr(tblFechaDescDEPTOS_ACTIVOS.Value) + ' deptos. ' +
                     'activos y un monto total de ' +
                     CurrToStrF(tblFechaDescMONTO.Value,ffCurrency,2) +
                     '. Si repite la operación, los valores anteriores serán ' +
                     'reemplazados. ¿Desea continuar?')) then Exit;
    BajaSQL('DESCUENTO', '((IDTIPODESCUENTO=1) OR (IDTIPODESCUENTO=2)) AND '+
            '(MES='+#39+M+#39+') AND (ANIO='+IntToStr(Anio)+')', Q);
    tblFechaDesc.Refresh;
  end;

  MostrarMSJ('Generando descuentos de alquiler...');
  Application.ProcessMessages;

  GenerarDescuentosAlquilerMilitares(Mes, Anio, CantActivosMil, MontoMil);
  GenerarDescuentosAlquilerCiviles(Mes, Anio, CantActivosCiv, MontoCiv);

  ActualizarFechaDescuento(1, CantActivosMil+CantActivosCiv, Anio, M, MontoMil+MontoCiv);

  OcultarMSJ;
end;

procedure TdmDatos.GenerarDescuentosAlquilerMilitares(Mes, Anio: Word; var CantActivos: Integer; var Monto: Currency);
var
  DivisorRenta, Alquiler, Coeficiente, Sueldo, Cod202, Cod218: Real;
  AntGrado: Byte;
  M: String;
//Lista de los ocupantes a los que no se les pudo encontrar un coeficiente de alquiler.
  SinCoeficiente: TStrings;
//Lista de los ocupantes a los que no se les pudo encontrar un grado militar.
  SinGrado: TStrings;
begin
  M := UpperCase(MesComoStr(Mes));
  SinCoeficiente := TStringList.Create;
  SinCoeficiente.Add('MR ; Tipo personal ; Tipo vivienda ; Cant. dormitorios');
  SinGrado := TStringList.Create;
  SinGrado.Add('MR');

  PAR.Open;
  if (PARDIVISOR_RENTA.IsNull) or (PARDIVISOR_RENTA.Value = 0) then
    DivisorRenta := 1
  else
    DivisorRenta := PARDIVISOR_RENTA.Value;
  PAR.Close;

  try
    CantActivos := 0;
    Monto := 0;

    DESC.Open;
    qryOcupMilitares.Open;
    qryOcupMilitares.First;
    while not qryOcupMilitares.Eof do
    begin
      {Ubica el registro en la tabla de coeficientes para obtener el que corresponde.
       Si no lo encuentra agrega una fila a la lista de ocupantes sin coeficiente}
      if not Existe(COEF,'TIPO','PERSONAL','CANT_AMB',
                VarArrayOf([qryOcupMilitaresTIPO.Text,
                'MIL', qryOcupMilitaresCANTAMB.Value])) then
        SinCoeficiente.Add(qryOcupMilitaresMATRICULA.Text + ' ; MIL ;' +
                           qryOcupMilitaresTIPO.Text + ' ; ' +
                           qryOcupMilitaresCANTAMB.Text)
      else
      begin
        {if (qryOcupMilitaresIDPERSONA.Value = 308) then
        begin
          MsjInfo('Aca esta');
        end;}

        Coeficiente := COEFPORCENTAJE.Value;

        if not Existe(Grado,'IDGRADO',qryOcupMilitaresIDGRADO.Value) then
          SinGrado.Add(qryOcupMilitaresMATRICULA.Text)
        else
        begin
          {Calcula el sueldo de ocupante. Si su antigüedad en el grado es menor
           al tiempo mínimo no se incluye el cod. 218}
          if qryOcupMilitaresANTGRADO.Value > GradoTIEMPO_MINIMO.Value then
            Cod218 := (GRADOCOD201.Value + GRADOCOD209.Value) * 0.1
          else
            Cod218 := 0;

          Cod202 := (GRADOCOD201.Value + GRADOCOD209.Value + Cod218) * 0.02 * qryOcupMilitaresANT_SERVICIO.Value;

          Sueldo := GRADOCOD201.Value + GRADOCOD209.Value + Cod202 + Cod218;

          //Calcula el monto del alquiler.
          Alquiler := (Coeficiente * Sueldo)/100 +
                      qryOcupMilitaresRENTAPROPIA.Value / DivisorRenta;

          //Agrega los registros de descuentos.
          DESC.Append;
          DESCIDOCUPANTE.Value := qryOcupMilitaresIDPERSONA.Value;
          DESCIDTIPODESCUENTO.Value := 1; //418 / 01
          DESCMES.Value := M;
          DESCANIO.Value := Anio;
          DESCMONTO.Value := Alquiler * 0.9;
          DESC.Post;

          DESC.Append;
          DESCIDOCUPANTE.Value := qryOcupMilitaresIDPERSONA.Value;
          DESCIDTIPODESCUENTO.Value := 2; //375 / 01
          DESCMES.Value := M;
          DESCANIO.Value := Anio;
          DESCMONTO.Value := Alquiler * 0.1;
          DESC.Post;

          CantActivos := CantActivos + 1;
          Monto := Monto + Alquiler * 0.9;
        end;
      end;

      qryOcupMilitares.Next;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por alquiler');
      OcultarMSJ;
      Exit;
    end;
  end;

  if SinCoeficiente.Count > 1 then
  begin
    MsjInfo(PChar('No se pudieron encontrar ' + IntToStr(SinCoeficiente.Count) +
           ' coeficientes de alquiler. Vea el archivo SinCoeficiente.txt'));
    SinCoeficiente.SaveToFile('SinCoeficiente.txt');
    SinCoeficiente.Free;
  end;

  if SinGrado.Count > 1 then
  begin
    MsjInfo(PChar('No se pudieron encontrar ' + IntToStr(SinGrado.Count) +
           ' grados militares. Vea el archivo SinGrado.txt'));
    SinGrado.SaveToFile('SinGrado.txt');
    SinGrado.Free;
  end;

  qryOcupMilitares.Close;
  DESC.Close;
  COEF.Close;
  Grado.Close;
end;

procedure TdmDatos.GenerarDescuentosAlquilerCiviles(Mes, Anio: Word; var CantActivos: Integer; var Monto: Currency);
var
  Alquiler, Coeficiente, Sueldo: Real;
  M: String;
//Lista de los ocupantes a los que no se les pudo encontrar un coeficiente de alquiler.
  SinCoeficiente: TStrings;
  CantAmb: Byte;
begin
  SinCoeficiente := TStringList.Create;
  SinCoeficiente.Add('Matricula ; Tipo personal ; Tipo vivienda ; Cant. dormitorios');
  M := UpperCase(MesComoStr(Mes));

  try
    CantActivos := 0;
    Monto := 0;
    
    DESC.Open;
    qryOcupCiviles.Open;
    qryOcupCiviles.First;
    while not qryOcupCiviles.Eof do
    begin
      Existe(DEPTO, 'IDDEPARTAMENTO', qryOcupCivilesIDDEPARTAMENTO.Value);
      {Ubica el registro en la tabla de coeficientes para obtener el que corresponde.
       Si no lo encuentra agrega una fila a la lista de ocupantes sin coeficiente}
      if not Existe(COEF,'TIPO','PERSONAL','CANT_AMB',
                VarArrayOf(['DEPTO', 'CIV', DEPTOCANTAMB.Value])) then
        SinCoeficiente.Add(qryOcupCivilesLEGAJO.Text + ' ; PC ' + ' DEPTO ' +
                           DEPTOCANTAMB.Text)
      else
      begin
       {if (qryOcupCivilesIDOCUPANTE.Value = 434) then
        begin
          MsjInfo('Aca esta');
        end;}
          Coeficiente := COEFPORCENTAJE.Value;

          Existe(tblOcupanteCivil_, 'IDPERSONA', qryOcupCivilesIDOCUPANTE.Value);
          Sueldo := tblOcupanteCivil_SUELDO.Value;

          //Calcula el monto del alquiler.
          Alquiler := (Coeficiente * Sueldo)/100;

          //Agrega los registros de descuentos.
          DESC.Append;
          DESCIDOCUPANTE.Value := qryOcupCivilesIDOCUPANTE.Value;
          DESCIDTIPODESCUENTO.Value := 1; //418 / 01
          DESCMES.Value := M;
          DESCANIO.Value := Anio;
          DESCMONTO.Value := Alquiler * 0.9;
          DESC.Post;

          DESC.Append;
          DESCIDOCUPANTE.Value := qryOcupCivilesIDOCUPANTE.Value;
          DESCIDTIPODESCUENTO.Value := 2; //375 / 01
          DESCMES.Value := M;
          DESCANIO.Value := Anio;
          DESCMONTO.Value := Alquiler * 0.1;
          DESC.Post;

          CantActivos := CantActivos + 1;
          Monto := Monto + Alquiler * 0.9;
      end;

      qryOcupCiviles.Next;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por alquiler');
      OcultarMSJ;
      Exit;
    end;
  end;

  if SinCoeficiente.Count > 1 then
  begin
    MsjInfo(PChar('No se pudieron encontrar ' + IntToStr(SinCoeficiente.Count) +
           ' coeficientes de alquiler. Vea el archivo SinCoeficiente.txt'));
    SinCoeficiente.SaveToFile('SinCoeficiente.txt');
    SinCoeficiente.Free;
  end;

  qryOcupCiviles.Close;
  DESC.Close;
  COEF.Close;
end;

procedure TdmDatos.GenerarDescuentosExpensas(Mes, Anio: Word);
var
  F1, F2: TDateTime;
  TotalOcupantes, TotalViviendas, TotalDeptosXEdif: Word;
  PorcionGastoAd, PorcionGastoFi, MontoDescuento, Monto: Real;
  NombreMes: String;
begin
{ FORMAS DE PRORRATEO DE GASTOS POR SERVICIOS:
  1: Entre todas las viviendas ocupadas en partes iguales
  2: Entre todas las viviendas ocupadas según su superficie
  3: Entre todas las viviendas (ocupadas y vacias) según su superficie
  4: Sin prorrateo, pagado por Alcaldía
  5: Sin prorrateo, pagado por el ocupante }

  //Verifica si ya se generaron los descuentos de expensas para ese mes y año
  NombreMes := UpperCase(MesComoStr(Mes));
  if Existe(tblFechaDesc, 'IDTIPO_DESCUENTO', 'MES', 'ANIO', VarArrayOf([3, NombreMes, Anio])) then
  begin
    if not Confirmar(PChar('Los descuentos de expensas para el mes de ' + NombreMes +
                     ' de ' + IntToStr(Anio) + ' ya fueron generados el día ' +
                     DateToStr(tblFechaDescFECHA.Value) + ' para ' +
                     IntToStr(tblFechaDescDEPTOS_ACTIVOS.Value) + ' deptos. ' +
                     'activos y un monto total de ' +
                     CurrToStrF(tblFechaDescMONTO.Value,ffCurrency,2) +
                     '. Si repite la operación, los valores anteriores serán ' +
                     'reemplazados. ¿Desea continuar?')) then Exit;
    BajaSQL('DESCUENTO', '(IDTIPODESCUENTO=3) AND (MES='+#39+NombreMes+#39+') '+
            'AND (ANIO='+IntToStr(Anio)+')', Q);
    tblFechaDesc.Refresh;
  end;

  MostrarMSJ('Generando descuentos de expensas...');
  Application.ProcessMessages;

//Obtiene las fecha inicio y fin (F1 y F2) con las que filtra los gastos
  F1 := EncodeDate(Anio,Mes,1);
  F2 := EncodeDate(Anio,Mes, DaysInAMonth(Anio,Mes));

//Obtiene el número total de viviendas
  qryCantViviendas.Open;
  TotalViviendas := qryCantViviendasTOTAL_VIVIENDAS.Value;
  qryCantViviendas.Close;

//Obtiene la suma de todos los gastos administrativos entre F1 y F2 y calcula
//cuanto debe pagar cada ocupante.
  qrySumaGA.ParamByName('F1').AsDate := F1;
  qrySumaGA.ParamByName('F2').AsDate := F2;
  qrySumaGA.Open;
  PorcionGastoAd := qrySumaGATOTAL.Value / TotalViviendas;;
  qrySumaGA.Close;

//Obtiene la suma de todos los gastos financieros entre F1 y F2 y calcula cuanto
//debe pagar cada ocupante.
  qrySumaGF.ParamByName('F1').AsDate := F1;
  qrySumaGF.ParamByName('F2').AsDate := F2;
  qrySumaGF.Open;
  PorcionGastoFi := qrySumaGFTOTAL.Value / TotalViviendas;
  qrySumaGF.Close;

//Obtiene los gastos de mantenimiento para cada edificio.
  qryGastosMantXEdif.ParamByName('F1').AsDate := F1;
  qryGastosMantXEdif.ParamByName('F2').AsDate := F2;
  qryGastosMantXEdif.Open;

//Obtiene los gastos de mantenimiento para cada departamento
  qryGastosMantXDepto.ParamByName('F1').AsDate := F1;
  qryGastosMantXDepto.ParamByName('F2').AsDate := F2;
  qryGastosMantXDepto.Open;

//Obtiene los gastos de servicios para cada edificio.
  qryGastosServXEdif.ParamByName('F1').AsDate := F1;
  qryGastosServXEdif.ParamByName('F2').AsDate := F2;
  qryGastosServXEdif.Open;

  try
    Monto := 0;

    DESC.Open;
    //Filtrar(EDIF, 'ADMFISCAL = ' + #39 + 'SI' + #39);
    EDIF.Open;
    EDIF.First;
    while not EDIF.Eof do
    begin
      {if (EDIFIDEDIFICIO.Value = 5) then
        begin
          MsjInfo('Aca esta');
        end;}

      Filtrar(qryDeptosOcupados, 'IDEDIFICIO = ' + EDIFIDEDIFICIO.Text);

      //Obtiene el número total de ocupantes
      TotalOcupantes := qryDeptosOcupados.RecordCount;

      //Obtiene el número total de deptos. del edificio
      qryCantDeptosXEdif.Close;
      qryCantDeptosXEdif.ParamByName('E').AsInteger := EDIFIDEDIFICIO.Value;
      qryCantDeptosXEdif.Open;
      TotalDeptosXEdif := qryCantDeptosXEdifTOTAL_VIVIENDAS.Value;

      qryDeptosOcupados.First;
      //Recorre los departamentos ocupados
      while not qryDeptosOcupados.Eof do
      begin
        DESC.Append;
        DESCIDOCUPANTE.Value := qryDeptosOcupadosIDPERSONA.Value;
        DESCIDTIPODESCUENTO.Value := 3; //Expensas comunes
        DESCMES.Value := NombreMes;
        DESCANIO.Value := Anio;

        //Incluye los montos correspondientes a gastos administrativos y finanjcieros
        MontoDescuento := PorcionGastoAd + PorcionGastoFi;

        //Incluye los gastos de mantenimiento en edificio si los hay
        if Existe(qryGastosMantXEdif, 'IDEDIFICIO', qryDeptosOcupadosIDEDIFICIO.Value) then
          MontoDescuento := MontoDescuento + (qryGastosMantXEdifMONTO.Value *
                            qryDeptosOcupadosCOEFICIENTE.Value) / 100;

        //Incluye los gastos de servicios que se prorratean entre las viviendas
        //ocupadas en partes iguales
        if Existe(qryGastosServXEdif, 'IDEDIFICIO;PRORRATEO', VarArrayOf([qryDeptosOcupadosIDEDIFICIO.Value,1])) then
          MontoDescuento := MontoDescuento + qryGastosServXEdifMONTO.Value / TotalOcupantes;

        //Incluye los gastos de servicios que se prorratean entre las viviendas
        //ocupadas según su coeficiente de superficie
        if Existe(qryGastosServXEdif, 'IDEDIFICIO;PRORRATEO', VarArrayOf([qryDeptosOcupadosIDEDIFICIO.Value,2])) then
          MontoDescuento := MontoDescuento + (qryGastosServXEdifMONTO.Value *
                            qryDeptosOcupadosCOEFICIENTE.Value) / 100;

        //Incluye los gastos de servicios que se prorratean entre todas las
        //viviendas en partes iguales
        if Existe(qryGastosServXEdif, 'IDEDIFICIO;PRORRATEO', VarArrayOf([qryDeptosOcupadosIDEDIFICIO.Value,3])) then
          MontoDescuento := MontoDescuento + qryGastosServXEdifMONTO.Value / TotalDeptosXEdif;

        //Incluye los gastos de mantenimiento en el departamento que le
        //corresponde pagar al ocupante
        if Existe(qryGastosMantXDepto, 'IDDEPARTAMENTO', qryDeptosOcupadosIDDEPARTAMENTO.Value) then
          MontoDescuento := MontoDescuento + qryGastosMantXDeptoMONTO.Value;

        DESCMONTO.Value := MontoDescuento;
        DESC.Post;
        Monto := Monto + MontoDescuento;

        qryDeptosOcupados.Next;
      end;

      EDIF.Next;
    end;
    qryDeptosOcupados.Close;
    EDIF.Filter := '';
    EDIF.Filtered := False;
    EDIF.Close;
    DESC.Close;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por expensas comunes');
      OcultarMSJ;
      Exit;
    end;
  end;

  ActualizarFechaDescuento(3, TotalViviendas, Anio, NombreMes, Monto);
  OcultarMSJ;
end;

procedure TdmDatos.GenerarCostosDeptosVacios(Mes, Anio: Word);
var
  F1, F2: TDateTime;
  TotalViviendas, TotalVacios: Word;
  PorcionGastoAd, PorcionGastoFi, GastoServXEdif, Monto: Real;
  NombreMes: String;
begin
  //Verifica si ya se generaron los descuentos de expensas para ese mes y año
  NombreMes := UpperCase(MesComoStr(Mes));
  if Existe(tblFechaDesc, 'IDTIPO_DESCUENTO', 'MES', 'ANIO', VarArrayOf([6, NombreMes, Anio])) then
  begin
    if not Confirmar(PChar('Los costos de expensas de deptos. vacios para el mes de ' + NombreMes +
                     ' de ' + IntToStr(Anio) + ' ya fueron generados el día ' +
                     DateToStr(tblFechaDescFECHA.Value) + ' para ' +
                     IntToStr(tblFechaDescDEPTOS_ACTIVOS.Value) + ' deptos. ' +
                     'y un monto total de ' +
                     CurrToStrF(tblFechaDescMONTO.Value,ffCurrency,2) +
                     '. Si repite la operación, los valores anteriores serán ' +
                     'reemplazados. ¿Desea continuar?')) then Exit;
    BajaSQL('COSTO_DEPTO_VACIO', '(MES='+#39+NombreMes+#39+') '+
            'AND (ANIO='+IntToStr(Anio)+')', Q);
    tblFechaDesc.Refresh;
  end;

  MostrarMSJ('Generando costos de expensas...');
  Application.ProcessMessages;

  tblCostoDeptoVacio.Open;

//Obtiene las fecha inicio y fin (F1 y F2) con las que filtra los gastos
  F1 := EncodeDate(Anio,Mes,1);
  F2 := EncodeDate(Anio,Mes, DaysInAMonth(Anio,Mes));

//Obtiene el número total de viviendas
  qryCantViviendas.Open;
  TotalViviendas := qryCantViviendasTOTAL_VIVIENDAS.Value;
  qryCantViviendas.Close;

//Obtiene la suma de todos los gastos administrativos entre F1 y F2 y calcula
//cuanto debe pagar cada ocupante.
  qrySumaGA.ParamByName('F1').AsDate := F1;
  qrySumaGA.ParamByName('F2').AsDate := F2;
  qrySumaGA.Open;
  PorcionGastoAd := qrySumaGATOTAL.Value / TotalViviendas;;
  qrySumaGA.Close;

//Obtiene la suma de todos los gastos financieros entre F1 y F2 y calcula cuanto
//debe pagar cada ocupante.
  qrySumaGF.ParamByName('F1').AsDate := F1;
  qrySumaGF.ParamByName('F2').AsDate := F2;
  qrySumaGF.Open;
  PorcionGastoFi := qrySumaGFTOTAL.Value / TotalViviendas;
  qrySumaGF.Close;

  qryGastosServXEdif.Close;
  qryGastosServXEdif.ParamByName('F1').AsDateTime := F1;
  qryGastosServXEdif.ParamByName('F2').AsDateTime := F2;
  qryGastosServXEdif.Open;

  EDIF.Open;
  EDIF.First;
  Monto := 0;
  TotalVacios := 0;
  while not EDIF.Eof do
  begin
    if Existe(qryGastosServXEdif, 'IDEDIFICIO', EDIFIDEDIFICIO.Value) then
      GastoServXEdif := qryGastosServXEdifMONTO.Value
    else
      GastoServXEdif := 0;

    //Caso especial para el el edificio de Salta.
    if EDIFIDEDIFICIO.Value = 3 then
    begin
      tblCostoDeptoVacio.Append;
      tblCostoDeptoVacioIDLOCACION.Value := 3;
      tblCostoDeptoVacioIDTIPO_LOCACION.Value := TipoLocacion.EDIFICIO;
      tblCostoDeptoVacioMES.Value := NombreMes;
      tblCostoDeptoVacioANIO.Value := Anio;
      tblCostoDeptoVacioMONTO_ADMIN.Value := PorcionGastoAd + PorcionGastoFi;
      tblCostoDeptoVacioMONTO_EXP.Value := GastoServXEdif;
      tblCostoDeptoVacioMONTO_EXP_EDIF.Value := GastoServXEdif;
      Monto := Monto + tblCostoDeptoVacioMONTO_EXP.Value;
      tblCostoDeptoVacio.Post;
    end
    else
    begin
      qryDeptosVacios.Close;
      qryDeptosVacios.ParamByName('E').AsInteger := EDIFIDEDIFICIO.Value;
      qryDeptosVacios.Open;
      qryDeptosVacios.First;
      while not qryDeptosVacios.Eof do
      begin
        tblCostoDeptoVacio.Append;
        tblCostoDeptoVacioIDLOCACION.Value := qryDeptosVaciosIDDEPARTAMENTO.Value;
        tblCostoDeptoVacioIDTIPO_LOCACION.Value := TipoLocacion.DEPARTAMENTO;
        tblCostoDeptoVacioMES.Value := NombreMes;
        tblCostoDeptoVacioANIO.Value := Anio;
        tblCostoDeptoVacioMONTO_ADMIN.Value := PorcionGastoAd + PorcionGastoFi;
        tblCostoDeptoVacioMONTO_EXP.Value := (GastoServXEdif * qryDeptosVaciosCOEFICIENTE.Value) / 100;
        tblCostoDeptoVacioMONTO_EXP_EDIF.Value := GastoServXEdif;
        Monto := Monto + tblCostoDeptoVacioMONTO_EXP.Value;
        tblCostoDeptoVacio.Post;

        TotalVacios := TotalVacios + 1;

        qryDeptosVacios.Next;
      end;
    end;

    EDIF.Next;
  end;
  ActualizarFechaDescuento(6, TotalVacios, Anio, NombreMes, Monto);
  OcultarMSJ;
end;

{ Busca el archivo de la base de datos y si no lo encuentra abre un cuadro
  de diálogo para que el usuario lo busque. Retorna True si se completa la
  conexión son éxito y False en caso contrario }
function TdmDatos.LoadDatabaseFile: Boolean;
{var
  DatabaseFile, NewLocation: String;}
begin
{  Result := True;

  DatabaseFile := RecuperarValorRegistro('Database','Database1File');
  if not FileExists(DatabaseFile) then
  begin
    MsjInfo(PChar('No se encontro el archivo de la base de datos ' + DBAdmin.Name + '. Deberá buscarlo usted mismo.'));
     Result := frmDBConnection.Connect(DBAdmin, NewLocation);
    GuardarValorRegistro('Database','Database1File',NewLocation);
  end
  else
  begin
    DBAdmin.DatabaseName := DatabaseFile;
    DBAdmin.Open;
  end;

  DatabaseFile := RecuperarValorRegistro('Database','Database2File');
  if not FileExists(DatabaseFile) then
  begin
    MsjInfo(PChar('No se encontro el archivo de la base de datos ' + DBAlcaldia.Name + '. Deberá buscarlo usted mismo.'));
    Result := frmDBConnection.Connect(DBAlcaldia, NewLocation);
    GuardarValorRegistro('Database','Database2File',NewLocation);
  end
  else
  begin
    DBAlcaldia.DatabaseName := DatabaseFile;
    DBAlcaldia.Open;
  end;}
end;

function TdmDatos.GetEspecialidades: TList;
begin

end;

procedure TdmDatos.ActualizarFechaDescuento(IdTipoDesc, CantActivos, Anio: Integer;
                                            Mes: String; Monto: Currency);
begin
  if Existe(tblFechaDesc, 'IDTIPO_DESCUENTO', 'MES', 'ANIO',
            VarArrayOf([IdTipoDesc, Mes, Anio])) then
  begin
    tblFechaDesc.Edit;
  end
  else
  begin
    tblFechaDesc.Append;
    tblFechaDescIDTIPO_DESCUENTO.Value := IdTipoDesc;
    tblFechaDescMES.Text := Mes;
    tblFechaDescANIO.Value := Anio;
  end;

  tblFechaDescFECHA.Value := Now;
  tblFechaDescMONTO.Value := Monto;
  tblFechaDescDEPTOS_ACTIVOS.Value := CantActivos;

  tblFechaDesc.Append;
end;

end.
