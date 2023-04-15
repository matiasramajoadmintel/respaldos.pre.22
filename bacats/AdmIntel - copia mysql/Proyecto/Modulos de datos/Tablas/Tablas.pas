unit Tablas;

interface

uses
  SysUtils, Classes, DB, DBTables, IBDatabase, IBCustomDataSet, IBTable, Forms, Principal,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TdmTablas = class(TDataModule)
    Database: TDatabase;
    tblEspecialidad: TTable;
    tblEspecialidadIDESPECIALIDAD: TIntegerField;
    tblEspecialidadDESCRIPCION: TStringField;
    tblPersona: TTable;
    tblOcupanteMilitar: TTable;
    tblPersonaIDPERSONA: TIntegerField;
    tblPersonaNRODOCUMENTO: TIntegerField;
    tblPersonaTIPODOCUMENTO: TStringField;
    tblPersonaNOMBRE: TStringField;
    tblPersonaAPELLIDO: TStringField;
    tblPersonaTELEFONO: TStringField;
    tblPersonaEMAIL: TStringField;
    tblOcupanteMilitarIDESPECIALIDAD: TIntegerField;
    tblOcupanteMilitarANTGRADO: TIntegerField;
    tblOcupanteMilitarDESTINO: TStringField;
    tblOcupanteMilitarMATRICULA: TStringField;
    tblOcupanteMilitarIDGRADO: TIntegerField;
    tblTipoArtefacto: TTable;
    tblTipoArtefactoIDTIPOARTEFACTO: TIntegerField;
    tblTipoArtefactoDESCRIPCION: TStringField;
    tblTipoDescuento: TTable;
    tblTipoDescuentoIDTIPODESCUENTO: TIntegerField;
    tblTipoDescuentoCODDESC: TIntegerField;
    tblTipoDescuentoOPERACION: TStringField;
    tblTipoDescuentoTIPOPAGO: TStringField;
    tblTipoDescuentoDESCRIPCION: TStringField;
    tblEdificio: TTable;
    tblEdificioIDEDIFICIO: TIntegerField;
    tblEdificioIDOCUPANTEJEFE: TIntegerField;
    tblEdificioDIRECCION: TStringField;
    tblEdificioADMFISCAL: TStringField;
    tblEdificioDESCRIPCION: TStringField;
    tblEdificioJEFEMILITAR: TIntegerField;
    tblEdificioECONOMO: TIntegerField;
    tblDepartamento: TTable;
    tblDepartamentoIDEDIFICIO: TIntegerField;
    tblDepartamentoIDDEPARTAMENTO: TIntegerField;
    tblDepartamentoCANTAMB: TIntegerField;
    tblDepartamentoLLAVETERMICA: TStringField;
    tblDepartamentoDISYUNTOR: TStringField;
    tblDepartamentoDESCRIPCION: TStringField;
    tblDepartamentoTIPO: TStringField;
    tblOcupacion: TTable;
    tblOcupacionIDOCUPACION: TIntegerField;
    tblOcupacionIDEDIFICIO: TIntegerField;
    tblOcupacionIDDEPARTAMENTO: TIntegerField;
    tblOcupacionIDOCUPANTE: TIntegerField;
    tblOcupacionFECHAINI: TDateTimeField;
    tblOcupacionFECHAFIN: TDateTimeField;
    tblOcupacionFECHARETIRO: TDateTimeField;
    tblCochera: TTable;
    tblCocheraIDEDIFICIO: TIntegerField;
    tblCocheraIDCOCHERA: TIntegerField;
    tblCocheraIDOCUPANTE: TIntegerField;
    tblCocheraCOEFICIENTE: TFloatField;
    tblCocheraDESCRIPCION: TStringField;
    tblArtefacto: TTable;
    tblArtefactoIDARTEFACTO: TIntegerField;
    tblArtefactoIDEDIFICIO: TIntegerField;
    tblArtefactoIDDEPARTAMENTO: TIntegerField;
    tblArtefactoIDTIPOARTEFACTO: TIntegerField;
    tblArtefactoMARCA: TStringField;
    tblArtefactoMODELO: TStringField;
    tblArtefactoFECHAINI: TDateTimeField;
    tblArtefactoFECHAFIN: TDateTimeField;
    tblArtefactoNROSERIE: TIntegerField;
    tblDescuento: TTable;
    tblDescuentoIDDESCUENTO: TIntegerField;
    tblDescuentoIDOCUPANTE: TIntegerField;
    tblDescuentoIDTIPODESCUENTO: TIntegerField;
    tblDescuentoMES: TStringField;
    tblDescuentoANIO: TIntegerField;
    tblDescuentoMONTO: TFloatField;
    tblCoef: TTable;
    tblCoefTIPO: TStringField;
    tblCoefPERSONAL: TStringField;
    tblCoefCANT_AMB: TIntegerField;
    tblCoefPORCENTAJE: TFloatField;
    tblOcupanteMilitarIDPERSONA: TIntegerField;
    tblGrado: TTable;
    tblGradoIDGRADO: TIntegerField;
    tblGradoDESCRIPCION: TStringField;
    tblGradoABREVIATURA: TStringField;
    tblGradoTIEMPO_MINIMO: TIntegerField;
    tblGradoCOD209: TFloatField;
    tblEdificioOBSERVACIONES: TStringField;
    tblOcupanteCivil: TTable;
    tblOcupanteCivilIDPERSONA: TIntegerField;
    tblOcupanteCivilCATEGORIA: TStringField;
    tblOcupanteCivilLEGAJO: TStringField;
    tblMilitarNoOcupante: TTable;
    tblMilitarNoOcupanteIDPERSONA: TIntegerField;
    tblMilitarNoOcupanteIDGRADO: TIntegerField;
    tblMilitarNoOcupanteMATRICULA: TStringField;
    tblGradoCOD201: TFloatField;
    tblOcupanteParticular: TTable;
    tblOcupanteParticularIDPERSONA: TIntegerField;
    tblOcupanteParticularIDGARANTE: TIntegerField;
    tblOcupanteParticularPARENTEZCO: TStringField;
    tblOcupanteParticularCOSTOALQUILER: TFloatField;
    tblPersona2: TTable;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    tblEspecialidadABREV: TStringField;
    tblEdificioCOEFICIENTE: TIntegerField;
    tblOcupanteMilitarRENTAPROPIA: TFloatField;
    tblDepartamentoCOEFICIENTE: TFloatField;
    tblOcupanteMilitarFECHA_INGRESO: TDateTimeField;
    tblOcupanteCivilSUELDO: TFloatField;
    tblPersonaTIPO: TStringField;
    tblOcupanteMilitarGrado: TStringField;
    tblOcupanteMilitarEspecialidad: TStringField;
    tblOcupanteMilitarANT_SERVICIO: TIntegerField;
    ztblEspecialidad: TZTable;
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblPersonaNewRecord(DataSet: TDataSet);

  private
    { Private declarations }

  public
    { Public declarations }
    
  end;

var
  dmTablas: TdmTablas;

implementation

uses StoreProcs;

{$R *.dfm}

procedure TdmTablas.DataModuleDestroy(Sender: TObject);
begin
  Database.Close;
end;

procedure TdmTablas.tblPersonaNewRecord(DataSet: TDataSet);
begin
  tblPersonaIDPERSONA.Value := dmStoreProc.getId('IDPERSONA') + 1;
end;

end.
