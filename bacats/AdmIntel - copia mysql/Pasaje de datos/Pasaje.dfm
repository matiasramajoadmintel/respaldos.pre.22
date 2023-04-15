object Form1: TForm1
  Left = 317
  Top = 185
  Width = 242
  Height = 226
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnEdificios: TButton
    Left = 5
    Top = 26
    Width = 225
    Height = 25
    Caption = 'Edificios'
    TabOrder = 0
    OnClick = btnEdificiosClick
  end
  object btnPersonas: TButton
    Left = 5
    Top = 148
    Width = 225
    Height = 25
    Caption = 'Deptos., Personas, Ocupantes y Ocupaciones'
    TabOrder = 1
    OnClick = btnPersonasClick
  end
  object btnGrados: TButton
    Left = 5
    Top = 107
    Width = 225
    Height = 25
    Caption = 'Grados'
    Enabled = False
    TabOrder = 2
    OnClick = btnGradosClick
  end
  object btnEspecialidades: TButton
    Left = 5
    Top = 66
    Width = 225
    Height = 25
    Caption = 'Especialidades'
    TabOrder = 3
    OnClick = btnEspecialidadesClick
  end
  object Database2: TDatabase
    AliasName = 'DBBASEVIEJA'
    DatabaseName = 'DBVIEJA'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 128
    Top = 2
  end
  object DeptosViejos: TTable
    DatabaseName = 'DBVIEJA'
    TableName = 'DEPARTAM.DB'
    Left = 132
    Top = 64
    object DeptosViejosEdificio: TIntegerField
      FieldName = 'Edificio'
    end
    object DeptosViejosDpto: TStringField
      FieldName = 'Dpto'
      Size = 7
    end
    object DeptosViejosOcupante: TStringField
      FieldName = 'Ocupante'
      Size = 8
    end
    object DeptosViejosCoeficiente: TFloatField
      FieldName = 'Coeficiente'
    end
    object DeptosViejosNro: TAutoIncField
      FieldName = 'Nro'
      ReadOnly = True
    end
  end
  object EdificioV: TTable
    DatabaseName = 'DBVIEJA'
    Filter = 'Nro < 15'
    Filtered = True
    TableName = 'EDIFICIO.DB'
    Left = 132
    Top = 34
    object EdificioVNombre: TStringField
      FieldName = 'Nombre'
      Size = 30
    end
    object EdificioVDireccion: TStringField
      FieldName = 'Direccion'
      Size = 30
    end
    object EdificioVAdmFiscal: TBooleanField
      FieldName = 'Adm Fiscal'
    end
    object EdificioVNro: TAutoIncField
      FieldName = 'Nro'
      ReadOnly = True
    end
  end
  object DBNUEVA: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Sistemas\Base Naval\Datos\Admined.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 162
    Top = 2
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = DBNUEVA
    AutoStopAction = saNone
    Left = 196
    Top = 2
  end
  object Persona: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PERSONA'
    Left = 164
    Top = 98
    object PersonaIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
    end
    object PersonaNRODOCUMENTO: TIntegerField
      FieldName = 'NRODOCUMENTO'
    end
    object PersonaTIPODOCUMENTO: TIBStringField
      FieldName = 'TIPODOCUMENTO'
      Size = 5
    end
    object PersonaNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 25
    end
    object PersonaAPELLIDO: TIBStringField
      FieldName = 'APELLIDO'
      Size = 15
    end
    object PersonaSEXO: TIBStringField
      FieldName = 'SEXO'
      Size = 10
    end
  end
  object Ocupante: TTable
    DatabaseName = 'DBVIEJA'
    TableName = 'OCUPANTE.DB'
    Left = 130
    Top = 98
    object OcupanteNombre: TStringField
      FieldName = 'Nombre'
      Size = 30
    end
    object OcupanteMr: TStringField
      FieldName = 'Mr'
      Size = 8
    end
    object OcupanteGrado: TStringField
      FieldName = 'Grado'
      Size = 2
    end
    object OcupanteEspecialidad: TStringField
      FieldName = 'Especialidad'
      Size = 2
    end
    object OcupanteDestino: TStringField
      FieldName = 'Destino'
      Size = 6
    end
    object OcupanteFechaIngreso: TDateField
      FieldName = 'Fecha Ingreso'
    end
    object OcupanteFechaCump: TDateField
      FieldName = 'Fecha Cump'
    end
    object OcupanteDescuentoautomatico: TBooleanField
      FieldName = 'Descuento automatico'
    end
  end
  object qryEspecialidad: TQuery
    DatabaseName = 'DBVIEJA'
    SQL.Strings = (
      'SELECT DISTINCT ESPECIALIDAD FROM OCUPANTE')
    Left = 130
    Top = 130
    object qryEspecialidadESPECIALIDAD: TStringField
      FieldName = 'ESPECIALIDAD'
      Origin = 'DBVIEJA."OCUPANTE.DB".Especialidad'
      Size = 2
    end
  end
  object Especialidad: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ESPECIALIDAD'
    Left = 164
    Top = 130
    object EspecialidadDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object EspecialidadIDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
    end
  end
  object qryGrado: TQuery
    DatabaseName = 'DBVIEJA'
    SQL.Strings = (
      'SELECT DISTINCT GRADO FROM OCUPANTE')
    Left = 131
    Top = 162
    object qryGradoGRADO: TStringField
      FieldName = 'GRADO'
      Origin = 'DBVIEJA."OCUPANTE.DB".Grado'
      Size = 2
    end
  end
  object Grado: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GRADO'
    Left = 164
    Top = 162
    object GradoIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
    end
    object GradoABREVIATURA: TIBStringField
      FieldName = 'ABREVIATURA'
      Size = 2
    end
  end
  object EdificioN: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDEDIFICIO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDOCUPANTEJEFE'
        DataType = ftInteger
      end
      item
        Name = 'COEFICIENTE'
        DataType = ftFloat
      end
      item
        Name = 'DIRECCION'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ADMFISCAL'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'IDEDIFICIO'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN9'
        Fields = 'IDOCUPANTEJEFE'
      end>
    StoreDefs = True
    TableName = 'EDIFICIO'
    Left = 162
    Top = 34
    object EdificioNDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object EdificioNDIRECCION: TIBStringField
      FieldName = 'DIRECCION'
      Required = True
      Size = 45
    end
    object EdificioNADMFISCAL: TIBStringField
      FieldName = 'ADMFISCAL'
      Size = 2
    end
    object EdificioNIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
    end
  end
  object DeptosNuevos: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DEPARTAMENTO'
    Left = 162
    Top = 66
    object DeptosNuevosIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
    end
    object DeptosNuevosCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
    end
    object DeptosNuevosDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 10
    end
    object DeptosNuevosLLAVETERMICA: TIBStringField
      FieldName = 'LLAVETERMICA'
      Size = 2
    end
    object DeptosNuevosDISYUNTOR: TIBStringField
      FieldName = 'DISYUNTOR'
      Size = 2
    end
    object DeptosNuevosIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
    end
    object DeptosNuevosTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 5
    end
  end
  object OcupaNuevo: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'OCUPANTE'
    Left = 194
    Top = 98
    object OcupaNuevoIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
    end
    object OcupaNuevoIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
    end
    object OcupaNuevoIDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
    end
    object OcupaNuevoANTGRADO: TIntegerField
      FieldName = 'ANTGRADO'
    end
    object OcupaNuevoDESTINO: TIBStringField
      FieldName = 'DESTINO'
      Size = 30
    end
    object OcupaNuevoRENTA: TFloatField
      FieldName = 'RENTA'
    end
    object OcupaNuevoMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Size = 8
    end
    object OcupaNuevoANTSERVICIO: TIntegerField
      FieldName = 'ANTSERVICIO'
    end
    object OcupaNuevoTIPOPERSONAL: TIBStringField
      FieldName = 'TIPOPERSONAL'
      Size = 3
    end
  end
  object Ocupacion: TIBTable
    Database = DBNUEVA
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'OCUPACION'
    Left = 194
    Top = 132
    object OcupacionIDOCUPACION: TIntegerField
      FieldName = 'IDOCUPACION'
    end
    object OcupacionIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
    end
    object OcupacionIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
    end
    object OcupacionIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
    end
    object OcupacionFECHAINI: TDateTimeField
      FieldName = 'FECHAINI'
    end
    object OcupacionFECHAFIN: TDateTimeField
      FieldName = 'FECHAFIN'
    end
  end
end
