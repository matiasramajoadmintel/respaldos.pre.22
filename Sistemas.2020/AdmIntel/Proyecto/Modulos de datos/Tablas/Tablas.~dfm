object dmTablas: TdmTablas
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Left = 273
  Top = 229
  Height = 326
  Width = 495
  object Database: TDatabase
    AliasName = 'DBAdmin'
    DatabaseName = 'DB'
    LoginPrompt = False
    Params.Strings = (
      'PASSWORD=masterkey'
      'USER NAME=SYSDBA')
    SessionName = 'Default'
    TransIsolation = tiDirtyRead
    Left = 38
    Top = 8
  end
  object tblEspecialidad: TTable
    DatabaseName = 'DB'
    TableName = 'ESPECIALIDAD'
    Left = 38
    Top = 64
    object tblEspecialidadIDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object tblEspecialidadDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
    object tblEspecialidadABREV: TStringField
      FieldName = 'ABREV'
      Size = 3
    end
  end
  object tblPersona: TTable
    OnNewRecord = tblPersonaNewRecord
    DatabaseName = 'DB'
    TableName = 'PERSONA'
    Left = 110
    Top = 64
    object tblPersonaIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Visible = False
    end
    object tblPersonaNRODOCUMENTO: TIntegerField
      FieldName = 'NRODOCUMENTO'
      Required = True
    end
    object tblPersonaTIPODOCUMENTO: TStringField
      FieldName = 'TIPODOCUMENTO'
      Required = True
      Size = 5
    end
    object tblPersonaNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 25
    end
    object tblPersonaAPELLIDO: TStringField
      FieldName = 'APELLIDO'
      Required = True
      Size = 15
    end
    object tblPersonaTELEFONO: TStringField
      FieldName = 'TELEFONO'
    end
    object tblPersonaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tblPersonaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
  end
  object tblOcupanteMilitar: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_MILITAR'
    Left = 182
    Top = 64
    object tblOcupanteMilitarIDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
      Visible = False
    end
    object tblOcupanteMilitarANTGRADO: TIntegerField
      FieldName = 'ANTGRADO'
      Required = True
    end
    object tblOcupanteMilitarDESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 30
    end
    object tblOcupanteMilitarMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
    object tblOcupanteMilitarIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
      Visible = False
    end
    object tblOcupanteMilitarIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
      Visible = False
    end
    object tblOcupanteMilitarRENTAPROPIA: TFloatField
      FieldName = 'RENTAPROPIA'
      DisplayFormat = '#,0.00'
      currency = True
    end
    object tblOcupanteMilitarFECHA_INGRESO: TDateTimeField
      FieldName = 'FECHA_INGRESO'
    end
    object tblOcupanteMilitarGrado: TStringField
      FieldKind = fkLookup
      FieldName = 'Grado'
      LookupDataSet = tblGrado
      LookupKeyFields = 'IDGRADO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDGRADO'
      Size = 50
      Lookup = True
    end
    object tblOcupanteMilitarEspecialidad: TStringField
      FieldKind = fkLookup
      FieldName = 'Especialidad'
      LookupDataSet = tblEspecialidad
      LookupKeyFields = 'IDESPECIALIDAD'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDESPECIALIDAD'
      Size = 50
      Lookup = True
    end
    object tblOcupanteMilitarANT_SERVICIO: TIntegerField
      FieldName = 'ANT_SERVICIO'
    end
  end
  object tblTipoArtefacto: TTable
    DatabaseName = 'DB'
    TableName = 'TIPO_ARTEFACTO'
    Left = 268
    Top = 62
    object tblTipoArtefactoIDTIPOARTEFACTO: TIntegerField
      FieldName = 'IDTIPOARTEFACTO'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object tblTipoArtefactoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 15
    end
  end
  object tblTipoDescuento: TTable
    DatabaseName = 'DB'
    TableName = 'TIPO_DESCUENTO'
    Left = 38
    Top = 120
    object tblTipoDescuentoIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object tblTipoDescuentoCODDESC: TIntegerField
      FieldName = 'CODDESC'
      Required = True
    end
    object tblTipoDescuentoOPERACION: TStringField
      FieldName = 'OPERACION'
      Required = True
      Size = 5
    end
    object tblTipoDescuentoTIPOPAGO: TStringField
      FieldName = 'TIPOPAGO'
      Size = 2
    end
    object tblTipoDescuentoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 15
    end
  end
  object tblEdificio: TTable
    AutoRefresh = True
    DatabaseName = 'DB'
    TableName = 'EDIFICIO'
    Left = 110
    Top = 120
    object tblEdificioIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Visible = False
    end
    object tblEdificioIDOCUPANTEJEFE: TIntegerField
      FieldName = 'IDOCUPANTEJEFE'
      Visible = False
    end
    object tblEdificioDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Required = True
      Size = 45
    end
    object tblEdificioADMFISCAL: TStringField
      FieldName = 'ADMFISCAL'
      Size = 2
    end
    object tblEdificioDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
    object tblEdificioJEFEMILITAR: TIntegerField
      FieldName = 'JEFEMILITAR'
      Visible = False
    end
    object tblEdificioECONOMO: TIntegerField
      FieldName = 'ECONOMO'
      Visible = False
    end
    object tblEdificioOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 200
    end
    object tblEdificioCOEFICIENTE: TIntegerField
      FieldName = 'COEFICIENTE'
      Required = True
      DisplayFormat = '0.00'
    end
  end
  object tblDepartamento: TTable
    DatabaseName = 'DB'
    TableName = 'DEPARTAMENTO'
    Left = 174
    Top = 120
    object tblDepartamentoIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object tblDepartamentoIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      ReadOnly = True
      Required = True
    end
    object tblDepartamentoCANTAMB: TIntegerField
      FieldName = 'CANTAMB'
    end
    object tblDepartamentoLLAVETERMICA: TStringField
      FieldName = 'LLAVETERMICA'
      Size = 2
    end
    object tblDepartamentoDISYUNTOR: TStringField
      FieldName = 'DISYUNTOR'
      Size = 2
    end
    object tblDepartamentoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 10
    end
    object tblDepartamentoTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 5
    end
    object tblDepartamentoCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
    end
  end
  object tblOcupacion: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPACION'
    Left = 254
    Top = 120
    object tblOcupacionIDOCUPACION: TIntegerField
      FieldName = 'IDOCUPACION'
      ReadOnly = True
      Required = True
    end
    object tblOcupacionIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object tblOcupacionIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object tblOcupacionIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Required = True
    end
    object tblOcupacionFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Required = True
    end
    object tblOcupacionFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
      Required = True
    end
    object tblOcupacionFECHARETIRO: TDateTimeField
      FieldName = 'FECHARETIRO'
    end
  end
  object tblCochera: TTable
    DatabaseName = 'DB'
    TableName = 'COCHERA'
    Left = 38
    Top = 176
    object tblCocheraIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object tblCocheraIDCOCHERA: TIntegerField
      FieldName = 'IDCOCHERA'
      ReadOnly = True
      Required = True
    end
    object tblCocheraIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
    end
    object tblCocheraCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
      Required = True
    end
    object tblCocheraDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 10
    end
  end
  object tblArtefacto: TTable
    DatabaseName = 'DB'
    TableName = 'ARTEFACTO'
    Left = 110
    Top = 176
    object tblArtefactoIDARTEFACTO: TIntegerField
      FieldName = 'IDARTEFACTO'
      ReadOnly = True
      Required = True
    end
    object tblArtefactoIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object tblArtefactoIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object tblArtefactoIDTIPOARTEFACTO: TIntegerField
      FieldName = 'IDTIPOARTEFACTO'
      Required = True
    end
    object tblArtefactoMARCA: TStringField
      FieldName = 'MARCA'
      Required = True
    end
    object tblArtefactoMODELO: TStringField
      FieldName = 'MODELO'
    end
    object tblArtefactoFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
      Required = True
    end
    object tblArtefactoFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
    end
    object tblArtefactoNROSERIE: TIntegerField
      FieldName = 'NROSERIE'
    end
  end
  object tblDescuento: TTable
    DatabaseName = 'DB'
    TableName = 'DESCUENTO'
    Left = 174
    Top = 176
    object tblDescuentoIDDESCUENTO: TIntegerField
      FieldName = 'IDDESCUENTO'
      ReadOnly = True
      Required = True
    end
    object tblDescuentoIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Required = True
    end
    object tblDescuentoIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Required = True
    end
    object tblDescuentoMES: TStringField
      FieldName = 'MES'
      Size = 10
    end
    object tblDescuentoANIO: TIntegerField
      FieldName = 'ANIO'
    end
    object tblDescuentoMONTO: TFloatField
      FieldName = 'MONTO'
    end
  end
  object tblCoef: TTable
    DatabaseName = 'DB'
    TableName = 'COEFICIENTE_ALQUILER'
    Left = 254
    Top = 176
    object tblCoefTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 5
    end
    object tblCoefPERSONAL: TStringField
      FieldName = 'PERSONAL'
      Required = True
      Size = 3
    end
    object tblCoefCANT_AMB: TIntegerField
      FieldName = 'CANT_AMB'
      Required = True
    end
    object tblCoefPORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
      Required = True
    end
  end
  object tblGrado: TTable
    DatabaseName = 'DB'
    TableName = 'GRADO'
    Left = 332
    Top = 64
    object tblGradoIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
    end
    object tblGradoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
    object tblGradoABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Required = True
      Size = 2
    end
    object tblGradoTIEMPO_MINIMO: TIntegerField
      FieldName = 'TIEMPO_MINIMO'
    end
    object tblGradoCOD209: TFloatField
      FieldName = 'COD209'
    end
    object tblGradoCOD201: TFloatField
      FieldName = 'COD201'
    end
  end
  object tblOcupanteCivil: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_CIVIL'
    Left = 334
    Top = 120
    object tblOcupanteCivilIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object tblOcupanteCivilCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 10
    end
    object tblOcupanteCivilLEGAJO: TStringField
      FieldName = 'LEGAJO'
      Size = 10
    end
    object tblOcupanteCivilSUELDO: TFloatField
      FieldName = 'SUELDO'
      DisplayFormat = '#,0.00'
    end
  end
  object tblMilitarNoOcupante: TTable
    DatabaseName = 'DB'
    TableName = 'MILITAR_NO_OCUPANTE'
    Left = 334
    Top = 176
    object tblMilitarNoOcupanteIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object tblMilitarNoOcupanteIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
    end
    object tblMilitarNoOcupanteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object tblOcupanteParticular: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_PARTICULAR'
    Left = 38
    Top = 232
    object tblOcupanteParticularIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object tblOcupanteParticularIDGARANTE: TIntegerField
      FieldName = 'IDGARANTE'
      Required = True
    end
    object tblOcupanteParticularPARENTEZCO: TStringField
      FieldName = 'PARENTEZCO'
      Size = 15
    end
    object tblOcupanteParticularCOSTOALQUILER: TFloatField
      FieldName = 'COSTOALQUILER'
      DisplayFormat = '#,0.00'
    end
  end
  object tblPersona2: TTable
    DatabaseName = 'DB'
    TableName = 'PERSONA'
    Left = 122
    Top = 232
    object IntegerField1: TIntegerField
      FieldName = 'IDPERSONA'
      ReadOnly = True
      Required = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'NRODOCUMENTO'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'TIPODOCUMENTO'
      Required = True
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 25
    end
    object StringField3: TStringField
      FieldName = 'APELLIDO'
      Required = True
      Size = 15
    end
    object StringField4: TStringField
      FieldName = 'TELEFONO'
    end
    object StringField5: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
end
