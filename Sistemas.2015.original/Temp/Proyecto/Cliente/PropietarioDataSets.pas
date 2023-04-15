unit PropietarioDataSets;

interface

uses
  SysUtils, Classes, DB, DBTables, Comunes;

type
  TdmPropietario = class(TDataModule)
    qryPropietarios: TQuery;
    qryPropietariosIdCliente: TSmallintField;
    qryPropietariosRazonSocial: TStringField;
    qryPropietariosDomicilio: TStringField;
    qryPropietariosTelefono: TStringField;
    qryPropietariosEmail: TStringField;
    qryPropietariosLocalidad: TStringField;
    qryPropietariosCodigoPostal: TStringField;
    qryPropietariosFechaNacimiento: TDateTimeField;
    qryPropietariosDNI: TStringField;
    qryPropietariosCUIT: TStringField;

  private
    { Private declarations }

  public
    function GetFields(IdPropietario: Smallint): TFields;

  end;

var
  dmPropietario: TdmPropietario;

implementation

{$R *.dfm}

function TdmPropietario.GetFields(IdPropietario: Smallint): TFields;
begin
  Existe(qryPropietarios, 'IdCliente', IdPropietario);
  Result := qryPropietarios.Fields;
end;

end.
