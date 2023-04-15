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
    qryDetTareasDESCRIP: TStringField;
    qryDetTareasIDDEPARTAMENTO: TIntegerField;
    qryDetTareasFECHA_FIN: TDateTimeField;
    qryDetTareasRAZON_SOCIAL: TStringField;
    qryDetTareasDepartamento: TStringField;
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

  private
    { Private declarations }

  public
    function GetMaxIntValue(TableName, FieldName: String): Longint;

  end;

var
  dmQuerys: TdmQuerys;

implementation

uses PoolDatos;

{$R *.dfm}

function TdmQuerys.GetMaxIntValue(TableName, FieldName: String): Longint;
begin
  Q.Close;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT MAX(' + FieldName + ') FROM ' + TableName);
  Q.Open;

  Result := Q.Fields[0].Value;
end;

end.
