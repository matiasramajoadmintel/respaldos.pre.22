unit FacturaDataSets;

interface

uses
  SysUtils, Classes, DB, DBTables, Comunes, Variants;

type
  TdmFactura = class(TDataModule)
    qryMontoPagado: TQuery;
    qryMontoPagadoMontoPagado: TFloatField;
    tblFactura: TTable;
    tblFacturaIdFactura: TSmallintField;
    tblFacturaPagado: TBooleanField;
    qryFacturas: TQuery;
    qryFacturasIdFactura: TSmallintField;
    qryFacturasNumero: TStringField;
    qryFacturasFecha: TDateTimeField;
    qryFacturasProveedor: TStringField;
    qryFacturasObra: TStringField;
    qryFacturasPagado: TBooleanField;
    qryFacturasTipo: TStringField;
    qryFacturasMonto: TFloatField;

  private
    { Private declarations }

  public
    function GetMontoPagado(IdFactura: Smallint): Currency;
    procedure SetPagado(IdFactura: Smallint; Value: Boolean);
    function GetFields(IdFactura: Smallint): TFields;

  end;

var
  dmFactura: TdmFactura;

implementation

{$R *.dfm}

function TdmFactura.GetMontoPagado(IdFactura: Smallint): Currency;
begin
  qryMontoPagado.ParamByName('F').AsInteger := IdFactura;
  qryMontoPagado.Open;
  Result := qryMontoPagadoMontoPagado.Value;
  qryMontoPagado.Close;
end;

procedure TdmFactura.SetPagado(IdFactura: Smallint; Value: Boolean);
begin
  Existe(tblFactura, 'IdFactura', IdFactura);
  tblFactura.Edit;
  tblFacturaPagado.Value := Value;
  tblFactura.Post;
  tblFactura.Close;
end;

function TdmFactura.GetFields(IdFactura: Smallint): TFields;
begin
  Existe(qryFacturas, 'IdFactura', IdFactura);
  Result := qryFacturas.Fields;
end;

end.
