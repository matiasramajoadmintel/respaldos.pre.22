unit PoolQuerys;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdmQuerys = class(TDataModule)
    qryTrab: TQuery;
    qryTrabIDTRABAJO: TIntegerField;
    qryTrabNRO_PEDIDO: TIntegerField;
    qryTrabIDDEPARTAMENTO: TIntegerField;
    qryTrabDESC_DEPTO: TStringField;
    qryTrabFECHA_INI: TDateTimeField;
    qryTrabFECHA_FIN: TDateTimeField;
    qryTrabRAZON_SOCIAL: TStringField;
    qryTrabCOSTO: TFloatField;
    qryTrabIMPUTACION: TStringField;
    qryTrabDESCRIP: TStringField;
    qryTrabTIPO_PAGO: TStringField;
    qryTrabNRO_CHEQUE: TStringField;
    qryTrabPAGADO: TStringField;
    qryTrabIDEDIF: TIntegerField;
    qryTrabEDIFICIO: TStringField;
    qryTrabNRO_DECI: TIntegerField;
    qryTrabNRO_ORDEN: TIntegerField;
    qryTrabNRO_FACTURA: TIntegerField;
    qryDetTareas: TQuery;
    qryResTareas: TQuery;
    qryResTareasDESCRIP: TStringField;
    qryResTareasIDDEPARTAMENTO: TIntegerField;
    qryResTareasCANTIDAD: TIntegerField;
    qryResTareasDepartamento: TStringField;
    qryCantTareas: TQuery;
    qryCantTareasTAREA: TStringField;
    qryCantTareasCANTIDAD: TIntegerField;
    qryEC: TQuery;
    qryTrabEdi: TQuery;
    qryTrabEdiIDTRABAJO: TIntegerField;
    qryTrabEdiNRO_PEDIDO: TIntegerField;
    qryTrabEdiIDEDIFICIO: TIntegerField;
    qryTrabEdiEDIFICIO: TStringField;
    qryTrabEdiESPACIO: TStringField;
    qryTrabEdiDESCRIP: TStringField;
    qryTrabEdiFECHA_INI: TDateTimeField;
    qryTrabEdiFECHA_FIN: TDateTimeField;
    qryTrabEdiRAZON_SOCIAL: TStringField;
    qryTrabEdiCOSTO: TFloatField;
    qryTrabEdiIMPUTACION: TStringField;
    qryTrabEdiPAGADO: TStringField;
    qryTrabEdiNRO_DECI: TIntegerField;
    qryTrabEdiNRO_ORDEN: TIntegerField;
    qryTrabEdiNRO_FACTURA: TIntegerField;
    qryTrabEdiTIPO_PAGO: TStringField;
    qryPagados: TQuery;
    qryPagadosIDPAGO: TIntegerField;
    qryPagadosFECHA_PAGO: TDateTimeField;
    qryPagadosRAZON_SOCIAL: TStringField;
    qryPagadosIMPORTE: TFloatField;
    qryPagadosTIPO_PAGO: TStringField;
    qryPagadosNRO_CHEQUE: TStringField;
    qryPagadosCOBRADO: TStringField;
    qryPagadosIDPROVEEDOR: TIntegerField;
    qryGastoAd: TQuery;
    qryGastoAdFECHA: TDateTimeField;
    qryGastoAdDESCRIP: TStringField;
    qryGastoAdCOSTO: TFloatField;
    qryGastoAdRAZON_SOCIAL: TStringField;
    qryGastoAdPAGADO: TStringField;
    qryGastoAdTIPO_PAGO: TStringField;
    qryGastoAdNRO_CHEQUE: TStringField;
    qryGastoAdIDTIPO_GASTO_AD: TIntegerField;
    qryGastoAdIDPROVEEDOR: TIntegerField;
    qryGastoAdIDGASTO_AD: TIntegerField;
    qryGastoAdFECHA_PAGO: TDateTimeField;
    qryGastoAdNRO_DECI: TIntegerField;
    qryGastoAdNRO_ORDEN: TIntegerField;
    qryGastoAdNRO_FACT: TIntegerField;
    qryGastoFi: TQuery;
    qryGastoFiFECHA: TDateTimeField;
    qryGastoFiCOSTO: TFloatField;
    Concepto: TStringField;
    qryGastoFiNRO_HOJA: TIntegerField;
    qryGastoFiIDTIPO_GASTO_FI: TIntegerField;
    qryGastoFiIDGASTO_FI: TIntegerField;
    qryServEdif: TQuery;
    qryServEdifFECHA: TDateTimeField;
    qryServEdifEDIFICIO: TStringField;
    qryServEdifDESCRIP: TStringField;
    qryServEdifCOSTO: TFloatField;
    qryServEdifRAZON_SOCIAL: TStringField;
    qryServEdifPAGADO: TStringField;
    qryServEdifTIPO_PAGO: TStringField;
    qryServEdifNRO_CHEQUE: TStringField;
    qryServEdifVACIOS: TStringField;
    qryServEdifIDEDIFICIO: TIntegerField;
    qryServEdifIDSERVICIO: TIntegerField;
    qryServEdifIDPROVEEDOR: TIntegerField;
    qryServEdifIDSERV_EDIF: TIntegerField;
    qryServEdifNRO_DECI: TIntegerField;
    qryServEdifNRO_ORDEN: TIntegerField;
    qryServEdifNRO_FACT: TIntegerField;
    Q: TQuery;
    qryMatUsados: TQuery;
    qryMatUsadosIDTRABAJO: TIntegerField;
    qryMatUsadosCANTIDAD: TFloatField;
    qryMatUsadosIDMATERIAL: TIntegerField;
    qryMatUsadosDESCRIP: TStringField;
    qryMatUsadosNROPEDIDO: TIntegerField;
    qryMatUsadosABREV: TStringField;
    qryMatUsadosLUGAR: TStringField;
    qryMatUsadosPROVEEDOR: TStringField;
    qryMatUsadosNROFACTURA: TIntegerField;
    qryMatUsadosIDUNIDAD: TIntegerField;
    qryMatUsadosFECHA_FIN: TDateTimeField;
    qryMatUsadosEDIFICO: TStringField;
    qryMatUsadosIDEDIFICIO: TIntegerField;
    qryDetTareasDESCRIP: TStringField;
    qryDetTareasFECHA_FIN: TDateTimeField;
    qryDetTareasRAZON_SOCIAL: TStringField;
    qryDetTareasEDIFICO: TStringField;
    qryDetTareasIDEDIFICIO: TIntegerField;
    qryDetTareasLUGAR: TStringField;
    qryOcupActuales: TQuery;
    qryOcupActualesIDOCUPANTE: TIntegerField;
    qryOcupActualesOCUPANTE: TStringField;
    qryOcupActualesTIPO: TStringField;
    qryOcupActualesLOCACION: TStringField;
    qryOcupActualesFECHAINI: TDateTimeField;
    qryOcupActualesFECHAFIN: TDateTimeField;
    qryOcupActualesIDEDIFICIO: TIntegerField;
    qryOcupActualesIDDEPARTAMENTO: TIntegerField;
    qryRecibos: TQuery;
    qryRecibosIDRECIBO: TIntegerField;
    qryRecibosFECHA_EMISION: TDateTimeField;
    qryRecibosFECHA_INICIO: TDateTimeField;
    qryRecibosFECHA_FIN: TDateTimeField;
    qryRecibosMONTO_MANT: TFloatField;
    qryRecibosMONTO_EXP: TFloatField;
    qryRecibosOCUPANTE: TStringField;
    qryRecibosDEPTO: TStringField;
    qryRecibosANULADO: TStringField;
    qryRecibosRecAnulado: TBooleanField;
    qryRecibosNRO_RECIBO: TStringField;
    qryOcupHistoricos: TQuery;
    qryOcupHistoricosIDOCUPANTE: TIntegerField;
    qryOcupHistoricosOCUPANTE: TStringField;
    qryOcupHistoricosLOCACION: TStringField;
    qryOcupHistoricosFECHAINI: TDateTimeField;
    qryOcupHistoricosFECHAFIN: TDateTimeField;
    qryOcupHistoricosFECHARETIRO: TDateTimeField;
    qryOcupHistoricosIDEDIFICIO: TIntegerField;
    qryOcupHistoricosIDDEPARTAMENTO: TIntegerField;
    qryIngresos: TQuery;
    qryIngresosIDINGRESO: TIntegerField;
    qryIngresosIDTIPO_INGRESO: TIntegerField;
    qryIngresosCONCEPTO: TStringField;
    qryIngresosFECHA: TDateTimeField;
    qryIngresosTIPO_PAGO: TStringField;
    qryIngresosNRO_CHEQUE: TStringField;
    qryIngresosNRO_RECIBO: TIntegerField;
    qryIngresosIMPORTE_MANT: TFloatField;
    qryIngresosSR: TStringField;
    qryIngresosIMPORTE_SERV: TFloatField;
    OcupCiv: TTable;
    OcupCivIDPERSONA: TIntegerField;
    OcupCivLEGAJO: TStringField;
    OcupMil: TTable;
    OcupMilIDPERSONA: TIntegerField;
    OcupMilMATRICULA: TStringField;
    MNO_: TTable;
    MNO_IDPERSONA: TIntegerField;
    MNO_MATRICULA: TStringField;
    qryOcupHistoricosTipoPers: TStringField;
    qryOcupHistoricosMatricula: TStringField;
    qryOcupHistoricosTIPO: TStringField;
    qryOcupActualesMATRICULA: TStringField;
    qryCobrosPart: TQuery;
    qryCobrosPartIDPERSONA: TIntegerField;
    qryCobrosPartOCUPANTE: TStringField;
    qryCobrosPartDOCUMENTO: TStringField;
    qryCobrosPartMES: TStringField;
    qryCobrosPartANIO: TIntegerField;
    qryCobrosPartEXPENSAS: TFloatField;
    qryCobrosPartRAE: TFloatField;
    qryCobrosPartALQUILER: TFloatField;
    qryCobrosPartDEPTO: TStringField;
    qryCobrosPartTotal: TCurrencyField;
    qryCobrosPartEDIFICIO: TStringField;
    qryCobrosPartLOCACION: TStringField;
    qryPagadosPERSONAL: TStringField;
    qryPagosEfectuados: TQuery;
    qryPagosEfectuadosIDPAGO: TIntegerField;
    qryPagosEfectuadosFECHA_PAGO: TDateTimeField;
    qryPagosEfectuadosIMPORTE: TFloatField;
    qryPagosEfectuadosTIPO_PAGO: TStringField;
    qryPagosEfectuadosNRO_CHEQUE: TStringField;
    qryPagosEfectuadosCOBRADO: TStringField;
    qryPagosEfectuadosPROVEEDOR: TStringField;
    qryPagosEfectuadosCOBRADOR: TStringField;
    qryDescuentos: TQuery;
    qryDescuentosDESCRIPCION: TStringField;
    qryDescuentosMES: TStringField;
    qryDescuentosANIO: TIntegerField;
    qryDescuentosMONTO: TFloatField;
    qryDescuentosAPENOM: TStringField;
    qryDescuentosIDDESCUENTO: TIntegerField;
    qryOcupActualesPARENTEZCO: TStringField;
    qryOcupActualesGARANTE: TStringField;
    qryDeudores: TQuery;
    qryDeudoresCOSTO: TFloatField;
    qryDeudoresNRO_FACT: TIntegerField;
    qryDeudoresIDPERSONA: TIntegerField;
    qryDeudoresOCUPANTE: TStringField;
    qryDeudoresTIPO: TStringField;
    qryDeudoresMATRICULA: TStringField;
    qryDeudoresFECHA_PAGO: TDateTimeField;
    qryDeudoresDESCRIP: TStringField;
    procedure qryRecibosCalcFields(DataSet: TDataSet);
    procedure qryOcupHistoricosCalcFields(DataSet: TDataSet);
    procedure qryCobrosPartCalcFields(DataSet: TDataSet);

  private
    { Private declarations }

  public
    function GetMaxIntValue(TableName, FieldName: String): Longint;
    function PrepareQuery(Consulta: Integer; Orden: String;
                          var Id: Longint): TQuery;
    function GetIdActual(Consulta: Integer): Longint;
    function GetTextActual(Consulta: Integer; FieldName: String): String;

  end;

var
  dmQuerys: TdmQuerys;

implementation

uses PoolDatos, ReportManager, Comunes;

{$R *.dfm}

function TdmQuerys.GetMaxIntValue(TableName, FieldName: String): Longint;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT MAX(' + FieldName + ') FROM ' + TableName);
  Q.Open;

  Result := Q.Fields[0].Value;
end;

procedure TdmQuerys.qryRecibosCalcFields(DataSet: TDataSet);
begin
  qryRecibosRecAnulado.Value := (qryRecibosANULADO.Text = 'Si');
end;

function TdmQuerys.PrepareQuery(Consulta: Integer; Orden: String;
                                var Id: Longint): TQuery;
var
  Q: TQuery;
  ViewName: String;
begin
  case Consulta of
    INGRESOS:
      begin
        Q := qryIngresos;
        ViewName := 'VW_INGRESOS';
      end;

    COBROS_PART:
      begin
        Q := qryCobrosPart;
        ViewName := 'VW_COBROS_PART';
      end;

    PAGOS_EFECTUADOS:
      begin
        Q := qryPagosEfectuados;
        ViewName := 'VW_PAGOS_EFECTUADOS';
      end;

    DESCUENTOS:
      begin
        Q := qryDescuentos;
        ViewName := 'VW_DESCUENTO';
      end;

    DEUDORES:
      begin
        Q := qryDeudores;
        ViewName := 'VW_DEUDORES';
      end;

    else
    begin
      Result := nil;
      Exit;
    end;
  end;

  if Orden = '' then
    Orden := Q.Fields[0].FieldName;

  Id := Q.Fields[0].AsInteger;
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT * FROM ' + ViewName);
  Q.SQL.Add(' ORDER BY ' + Orden);
  Q.Open;

  Result := Q;
end;

function TdmQuerys.GetIdActual(Consulta: Integer): Longint;
begin
  case Consulta of
    PAGOS_EFECTUADOS:
      Result := qryPagosEfectuadosIDPAGO.Value;
    else
      Result := 0;
  end;
end;

function TdmQuerys.GetTextActual(Consulta: Integer; FieldName: String): String;
begin
  case Consulta of
    PAGOS_EFECTUADOS:
      Result := qryPagosEfectuados.FieldByName(FieldName).AsString;
    else
      Result := '';
  end;
end;

procedure TdmQuerys.qryOcupHistoricosCalcFields(DataSet: TDataSet);
begin
  if qryOcupHistoricosTIPO.Text = 'OCUP_MIL' then
  begin
    qryOcupHistoricosTipoPers.Text := 'Personal militar';
    Existe(OcupMil, 'IDPERSONA', qryOcupHistoricosIDOCUPANTE.Value);
    qryOcupHistoricosMatricula.Text := OcupMilMATRICULA.Text;
  end
  else
  if qryOcupHistoricosTIPO.Text = 'OCUP_CIV' then
  begin
    qryOcupHistoricosTipoPers.Text := 'Personal civil';
    Existe(OcupCiv, 'IDPERSONA', qryOcupHistoricosIDOCUPANTE.Value);
    qryOcupHistoricosMatricula.Text := OcupCivLEGAJO.Text;
  end
  else
  if qryOcupHistoricosTIPO.Text = 'OCUP_PART' then
    qryOcupHistoricosTipoPers.Text := 'Particular'
  else
  begin
    qryOcupHistoricosTipoPers.Text := 'Militar no ocupante';
    Existe(MNO_, 'IDPERSONA', qryOcupHistoricosIDOCUPANTE.Value);
    qryOcupHistoricosMatricula.Text := MNO_MATRICULA.Text;
  end;
end;

procedure TdmQuerys.qryCobrosPartCalcFields(DataSet: TDataSet);
begin
  qryCobrosPartTotal.Value := qryCobrosPartEXPENSAS.Value +
                              qryCobrosPartALQUILER.Value;
end;

end.
