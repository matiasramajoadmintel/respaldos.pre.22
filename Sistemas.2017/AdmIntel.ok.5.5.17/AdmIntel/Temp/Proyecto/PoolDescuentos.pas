unit PoolDescuentos;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBQuery, IBCustomDataSet, IBTable;

type
  TdmDescuentos = class(TDataModule)
    DBAlcaldia: TIBDatabase;
    Transaction1: TIBTransaction;
    Parametro: TIBTable;
    ParametroDIVISOR_RENTA: TFloatField;
    qryOcupantes: TIBQuery;
    qryOcupantesCOEFICIENTE: TFloatField;
    qryOcupantesIDOCUPANTE: TIntegerField;
    qryOcupantesSUELDO: TFloatField;
    qryOcupantesRENTA_PROPIEDAD: TFloatField;
    Descuento: TIBTable;
    DescuentoIDOCUPANTE: TIntegerField;
    DescuentoIDTIPODESCUENTO: TIntegerField;
    DescuentoMES: TIBStringField;
    DescuentoANIO: TIntegerField;
    DescuentoMONTO: TFloatField;

  private
    { Private declarations }

  public
    procedure GenerarDescuentosAlquiler(Mes, Anio: Word);

  end;

var
  dmDescuentos: TdmDescuentos;

implementation

uses Util;

{$R *.dfm}

procedure TdmDescuentos.GenerarDescuentosAlquiler(Mes, Anio: Word);
var
  DivisorRenta, Alquiler: Real;
begin
  Parametro.Open;
  DivisorRenta := ParametroDIVISOR_RENTA.Value;
  Parametro.Close;

  try
//    Transaction1.StartTransaction;
    Descuento.Open;
    qryOcupantes.Open;
    qryOcupantes.First;
    while not qryOcupantes.Eof do
    begin
      Alquiler := qryOcupantesCOEFICIENTE.Value * qryOcupantesSUELDO.Value *
                  qryOcupantesRENTA_PROPIEDAD.Value / DivisorRenta;

      Descuento.Append;
      DescuentoIDOCUPANTE.Value := qryOcupantesIDOCUPANTE.Value;
      DescuentoIDTIPODESCUENTO.Value := 1; //418 / 01
      DescuentoMES.Value := IntToStr(Mes);
      DescuentoANIO.Value := Anio;
      DescuentoMONTO.Value := Alquiler * 0.9;
      Descuento.Post;

      Descuento.Append;
      DescuentoIDOCUPANTE.Value := qryOcupantesIDOCUPANTE.Value;
      DescuentoIDTIPODESCUENTO.Value := 2; //375 / 01
      DescuentoMES.Value := IntToStr(Mes);
      DescuentoANIO.Value := Anio;
      DescuentoMONTO.Value := Alquiler * 0.1;
      Descuento.Post;

      qryOcupantes.Next;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por alquiler');
  //    Transaction1.Rollback;
      Exit;
    end;
  end;

//  Transaction1.Commit;
  qryOcupantes.Close;
  Descuento.Close;
end;

end.
