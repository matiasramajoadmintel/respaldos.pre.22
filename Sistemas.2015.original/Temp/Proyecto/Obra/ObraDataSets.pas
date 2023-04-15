unit ObraDataSets;

interface

uses
  SysUtils, Classes, DB, DBTables, Comunes;

type
  TdmObras = class(TDataModule)
    qryObras: TQuery;
    qryObrasIdObra: TSmallintField;
    qryObrasTipoObra: TStringField;
    qryObrasCliente: TStringField;
    qryObrasNombre: TStringField;
    qryObrasPresupuesto: TFloatField;
    qryObrasHonorarios: TFloatField;
    qryObrasMoneda: TStringField;
    qryObrasSuperficie: TFloatField;
    qryObrasFechaInicio: TDateTimeField;
    qryObrasFechaFin: TDateTimeField;
    qryObrasEstado: TStringField;
    qryObrasPorcentaje: TIntegerField;
    qryObrasDescripcion: TStringField;
    qryObrasCantidadAmbientes: TSmallintField;
    qryObrasCantidadBanos: TSmallintField;
    qryObrasTiempoEstimado: TSmallintField;
    qryObrasFraccion: TStringField;
    qryObrasParcela: TStringField;
    qryObrasUnidadFuncional: TStringField;
    qryObrasNroCuentaMuni: TStringField;
    qryObrasNroPartidaMuni: TStringField;
    qryObrasNroObra: TStringField;
    qryPagadoObra: TQuery;
    qryPagadoObraMontoPagado: TFloatField;
    qryPagadoHonorarios: TQuery;
    qryPagadoHonorariosMontoPagado: TFloatField;
    qryObrasIdCliente: TSmallintField;

  private
    { Private declarations }

  public
    function GetFields(IdObra: Smallint): TFields;
    function GetMontoPagadoObra(IdObra: Smallint): Currency;
    function GetMontoPagadoHonorarios(IdObra: Smallint): Currency;

  end;

var
  dmObras: TdmObras;

implementation

{$R *.dfm}

function TdmObras.GetFields(IdObra: Smallint): TFields;
begin
  Existe(qryObras, 'IdObra', IdObra);
  Result := qryObras.Fields;
end;

function TdmObras.GetMontoPagadoObra(IdObra: Smallint): Currency;
begin
  qryPagadoObra.ParamByName('O').AsInteger := IdObra;
  qryPagadoObra.Open;
  Result := qryPagadoObraMontoPagado.Value;
  qryPagadoObra.Close;
end;

function TdmObras.GetMontoPagadoHonorarios(IdObra: Smallint): Currency;
begin
  qryPagadoHonorarios.ParamByName('O').AsInteger := IdObra;
  qryPagadoHonorarios.Open;
  Result := qryPagadoHonorariosMontoPagado.Value;
  qryPagadoHonorarios.Close;
end;

end.
