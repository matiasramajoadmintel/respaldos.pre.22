unit PoolDescuentos;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBQuery, IBCustomDataSet, IBTable,
  DateUtils, Variants, DBTables;

type
  TdmDescuentos = class(TDataModule)
    Parametro: TIBTable;
    qryOcupMilitares: TIBQuery;
    Descuento: TIBTable;
    DescuentoIDOCUPANTE: TIntegerField;
    DescuentoIDTIPODESCUENTO: TIntegerField;
    DescuentoMES: TIBStringField;
    DescuentoANIO: TIntegerField;
    DBAdmin: TIBDatabase;
    Transaction2: TIBTransaction;
    qrySumaGA: TIBQuery;
    qrySumaGATOTAL: TFloatField;
    qrySumaGF: TIBQuery;
    qrySumaGFTOTAL: TFloatField;
    Edificio: TIBTable;
    EdificioIDEDIFICIO: TIntegerField;
    EdificioCOEFICIENTE: TFloatField;
    qrySumaServ: TIBQuery;
    qrySumaServTOTAL: TFloatField;
    qrySumaTrab: TIBQuery;
    qrySumaTrabTOTAL: TFloatField;
    tblCoeficiente: TIBTable;
    tblCoeficienteTIPO: TIBStringField;
    tblCoeficientePERSONAL: TIBStringField;
    tblCoeficienteCANT_AMB: TIntegerField;
    tblCoeficientePORCENTAJE: TFloatField;
    tblGrado: TIBTable;
    tblGradoIDGRADO: TIntegerField;
    tblGradoTIEMPO_MINIMO: TIntegerField;
    tblGradoCOD201: TFloatField;
    tblGradoCOD209: TFloatField;
    qryOcupMilitaresIDOCUPANTE: TIntegerField;
    qryOcupMilitaresMATRICULA: TIBStringField;
    qryOcupMilitaresIDGRADO: TIntegerField;
    qryOcupMilitaresANTGRADO: TIntegerField;
    qryOcupMilitaresANTSERVICIO: TIntegerField;
    qryOcupMilitaresCANTAMB: TIntegerField;
    qryOcupMilitaresTIPODEPTO: TIBStringField;
    qryOcupMilitaresRENTAPROPIA: TIBBCDField;
    ParametroDIVISOR_RENTA: TIBBCDField;
    DescuentoMONTO: TIBBCDField;
    Depto: TIBTable;
    DeptoIDEDIFICIO: TIntegerField;
    DeptoIDDEPARTAMENTO: TIntegerField;
    DeptoCOEFICIENTE: TIBBCDField;
    DeptoCANTAMB: TIntegerField;
    DeptoTIPO: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    procedure GenerarDescuentosAlquiler(Mes, Anio: Word);
    procedure GenerarDescuentosExpensas(Mes, Anio: Word);
    function LoadDatabaseFile: Boolean;

  end;

var
  dmDescuentos: TdmDescuentos;

implementation

uses Util, Comunes, Tablas, Forms;

{$R *.dfm}

procedure TdmDescuentos.GenerarDescuentosAlquiler(Mes, Anio: Word);
var
  DivisorRenta, Alquiler, Coeficiente, Sueldo: Real;
  AntGrado: Byte;
  M: String;
//Lista de los ocupantes a los que no se les pudo encontrar un coeficiente de alquiler.
  SinCoeficiente: TStrings;
//Lista de los ocupantes a los que no se les pudo encontrar un grado militar.
  SinGrado: TStrings;
begin
  Descuento.EmptyTable;

  SinCoeficiente := TStringList.Create;
  SinCoeficiente.Add('MR ; Tipo personal ; Tipo vivienda ; Cant. dormitorios');
  SinGrado := TStringList.Create;
  SinGrado.Add('MR');

  Parametro.Open;
  if ParametroDIVISOR_RENTA.Value = 0 then DivisorRenta := 1
  else DivisorRenta := ParametroDIVISOR_RENTA.Value;
  Parametro.Close;
  M := UpperCase(MesComoStr(Mes));

  try
    Descuento.Open;
    qryOcupMilitares.Open;
    qryOcupMilitares.First;
    while not qryOcupMilitares.Eof do
    begin
      {Ubica el registro en la tabla de coeficientes para obtener el que corresponde.
       Si no lo encuentra agrega una fila a la lista de ocupantes sin coeficiente}
      if not Existe(tblCoeficiente,'TIPO;PERSONAL;CANT_AMB',
                VarArrayOf([qryOcupMilitaresTIPODEPTO.Text,
                'MIL', qryOcupMilitaresCANTAMB.Value])) then
        SinCoeficiente.Add(qryOcupMilitaresMATRICULA.Text + ' ; MIL ;' +
                           qryOcupMilitaresTIPODEPTO.Text + ' ; ' +
                           qryOcupMilitaresCANTAMB.Text)
      else
      begin
        Coeficiente := tblCoeficientePORCENTAJE.Value;

        if not Existe(tblGrado,'IDGRADO',qryOcupMilitaresIDGRADO.Value) then
          SinGrado.Add(qryOcupMilitaresMATRICULA.Text)
        else
        begin
          {Calcula el sueldo de ocupante. Si su antigüedad en el grado es menor
           al tiempo mínimo no se incluye el cod. 218}
          if qryOcupMilitaresANTGRADO.Value <= tblGradoTIEMPO_MINIMO.Value then
            Sueldo := (tblGradoCOD201.Value + tblGradoCOD209.Value) *
                      (1 + qryOcupMilitaresANTSERVICIO.Value * 0.02)
          else
            Sueldo := (tblGradoCOD201.Value + tblGradoCOD209.Value) *
                      (1.1 + qryOcupMilitaresANTSERVICIO.Value * 0.02);

          //Calcula el monto del alquiler.
          Alquiler := (Coeficiente * Sueldo) +
                      qryOcupMilitaresRENTAPROPIA.Value / DivisorRenta;

          //Agrega los registros de descuentos.
          Descuento.Append;
          DescuentoIDOCUPANTE.Value := qryOcupMilitaresIDOCUPANTE.Value;
          DescuentoIDTIPODESCUENTO.Value := 1; //418 / 01
          DescuentoMES.Value := M;
          DescuentoANIO.Value := Anio;
          DescuentoMONTO.Value := Alquiler * 0.9;
          Descuento.Post;

          Descuento.Append;
          DescuentoIDOCUPANTE.Value := qryOcupMilitaresIDOCUPANTE.Value;
          DescuentoIDTIPODESCUENTO.Value := 2; //375 / 01
          DescuentoMES.Value := M;
          DescuentoANIO.Value := Anio;
          DescuentoMONTO.Value := Alquiler * 0.1;
          Descuento.Post;
        end;
      end;

      qryOcupMilitares.Next;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por alquiler');
  //    Transaction1.Rollback;
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

  //  Transaction1.Commit;
  qryOcupMilitares.Close;
  Descuento.Close;
  tblCoeficiente.Close;
  tblGrado.Close;
end;

procedure TdmDescuentos.GenerarDescuentosExpensas(Mes, Anio: Word);
var
  TotalGastosAdmin, TotalGastosFinan, TotalGastosTrab: Real;
  TotalGastosServ1, TotalGastosServ2, TotalGastosServ3: Real;
  TotalGastosEdif: Real;
  F1, F2: TDateTime;
begin
{ FORMAS DE PRORRATEO DE GASTOS POR SERVICIOS:
  1: Entre todos los ocupantes en partes iguales
  2: Entre todas las viviendas ocupadas según su superficie
  3: Entre todas las viviendas (ocupadas y vacias) según su superficie
  4: Sin prorrateo, pagado por Alcaldía
  5: Sin prorrateo, pagado por el ocupante }

//Obtiene las fecha inicio y fin (F1 y F2) con las que filtra los gastos
  F1 := EncodeDate(Anio,Mes,1);
  F2 := EncodeDate(Anio,Mes, DaysInAMonth(Anio,Mes));

//Obtiene la suma de todos los gastos administrativos entre F1 y F2
  qrySumaGA.ParamByName('F1').AsDate := F1;
  qrySumaGA.ParamByName('F2').AsDate := F2;
  qrySumaGA.Open;
  TotalGastosAdmin := qrySumaGATOTAL.Value;
  qrySumaGA.Close;

//Obtiene la suma de todos los gastos financieros entre F1 y F2
  qrySumaGF.ParamByName('F1').AsDate := F1;
  qrySumaGF.ParamByName('F2').AsDate := F2;
  qrySumaGF.Open;
  TotalGastosFinan := qrySumaGFTOTAL.Value;
  qrySumaGF.Close;

  try
    Edificio.Open;
    Edificio.First;
    while not Edificio.Eof do
    begin
      //Obtiene la suma de todos los gastos por servicios entre F1 y F2 para el
      //edificio E y que se prorratea entre ocupantes en partes iguales.
      qrySumaServ.ParamByName('F1').AsDate := F1;
      qrySumaServ.ParamByName('F2').AsDate := F2;
      qrySumaServ.ParamByName('E').AsInteger := EdificioIDEDIFICIO.Value;
      qrySumaServ.ParamByName('P').AsWord := 1;
      qrySumaServ.Open;
      TotalGastosServ1 := qrySumaServTOTAL.Value;
      qrySumaServ.Close;

      //Obtiene la suma de todos los gastos por servicios entre F1 y F2 para el
      //edificio E y que se prorratea entre viviendas ocupadas según su superficie
      qrySumaServ.ParamByName('F1').AsDate := F1;
      qrySumaServ.ParamByName('F2').AsDate := F2;
      qrySumaServ.ParamByName('E').AsInteger := EdificioIDEDIFICIO.Value;
      qrySumaServ.ParamByName('P').AsWord := 2;
      qrySumaServ.Open;
      TotalGastosServ2 := qrySumaServTOTAL.Value;
      qrySumaServ.Close;

      //Obtiene la suma de todos los gastos por servicios entre F1 y F2 para el
      //edificio E y que se prorratea entre todas viviendas (ocupadas y vacias)
      //según su superficie
      qrySumaServ.ParamByName('F1').AsDate := F1;
      qrySumaServ.ParamByName('F2').AsDate := F2;
      qrySumaServ.ParamByName('E').AsInteger := EdificioIDEDIFICIO.Value;
      qrySumaServ.ParamByName('P').AsWord := 3;
      qrySumaServ.Open;
      TotalGastosServ3 := qrySumaServTOTAL.Value;
      qrySumaServ.Close;

      //Obtiene la suma de todos los gastos por mantenimiento entre F1 y F2 para el
      //edificio E.
      qrySumaTrab.ParamByName('F1').AsDate := F1;
      qrySumaTrab.ParamByName('F2').AsDate := F2;
      qrySumaTrab.ParamByName('E').AsInteger := EdificioIDEDIFICIO.Value;
      qrySumaTrab.Open;
      TotalGastosTrab := qrySumaTrabTOTAL.Value;
      qrySumaTrab.Close;

      //Calcula la suma de gastos para el edificio que se repartirá entre los
      //departamentos. Para los gastos administrativos y financieros se utiliza
      //el coeficiente del edificio como indice de reparto.
      TotalGastosEdif := (TotalGastosAdmin + TotalGastosFinan) /
                          EdificioCOEFICIENTE.Value + TotalGastosTrab;

      //Para cada departamento en el edifio...


      Edificio.Next;
    end;
    Edificio.Close;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error generando los descuentos por expensas comunes');
      Exit;
    end;
  end;
end;

{ Busca el archivo de la base de datos y si no lo encuentra abre un cuadro
  de diálogo para que el usuario lo busque. Retorna True si se completa la
  conexión son éxito y False en caso contrario }
function TdmDescuentos.LoadDatabaseFile: Boolean;
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

procedure TdmDescuentos.DataModuleCreate(Sender: TObject);
begin
{}
end;

procedure TdmDescuentos.DataModuleDestroy(Sender: TObject);
begin
{}
end;

end.
