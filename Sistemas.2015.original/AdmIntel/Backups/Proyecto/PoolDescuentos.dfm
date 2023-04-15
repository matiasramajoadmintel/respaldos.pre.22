object dmDescuentos: TdmDescuentos
  OldCreateOrder = False
  Left = 254
  Top = 172
  Height = 201
  Width = 257
  object DBAlcaldia: TIBDatabase
    Connected = True
    DatabaseName = 'D:\Sistemas\Base Naval\Datos\Admined.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 26
    Top = 10
  end
  object Transaction1: TIBTransaction
    Active = True
    DefaultDatabase = DBAlcaldia
    AutoStopAction = saNone
    Left = 98
    Top = 8
  end
  object Parametro: TIBTable
    Database = DBAlcaldia
    Transaction = Transaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PARAMETRO'
    Left = 26
    Top = 62
    object ParametroDIVISOR_RENTA: TFloatField
      FieldName = 'DIVISOR_RENTA'
    end
  end
  object qryOcupantes: TIBQuery
    Database = DBAlcaldia
    Transaction = Transaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VW_OCUPANTES_ACTUALES')
    Left = 26
    Top = 114
    object qryOcupantesCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
      Origin = 'VW_OCUPANTES_ACTUALES.COEFICIENTE'
    end
    object qryOcupantesIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'VW_OCUPANTES_ACTUALES.IDOCUPANTE'
    end
    object qryOcupantesSUELDO: TFloatField
      FieldName = 'SUELDO'
      Origin = 'VW_OCUPANTES_ACTUALES.SUELDO'
    end
    object qryOcupantesRENTA_PROPIEDAD: TFloatField
      FieldName = 'RENTA_PROPIEDAD'
      Origin = 'VW_OCUPANTES_ACTUALES.RENTA_PROPIEDAD'
    end
  end
  object Descuento: TIBTable
    Database = DBAlcaldia
    Transaction = Transaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DESCUENTO'
    Left = 90
    Top = 60
    object DescuentoIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
    end
    object DescuentoIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
    end
    object DescuentoMES: TIBStringField
      FieldName = 'MES'
      Size = 10
    end
    object DescuentoANIO: TIntegerField
      FieldName = 'ANIO'
    end
    object DescuentoMONTO: TFloatField
      FieldName = 'MONTO'
    end
  end
end
