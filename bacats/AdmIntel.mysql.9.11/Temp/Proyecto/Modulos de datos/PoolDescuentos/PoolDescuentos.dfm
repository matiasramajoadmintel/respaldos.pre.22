object dmDescuentos: TdmDescuentos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 305
  Top = 158
  Height = 287
  Width = 474
  object Parametro: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PARAMETRO'
    Left = 26
    Top = 62
    object ParametroDIVISOR_RENTA: TIBBCDField
      FieldName = 'DIVISOR_RENTA'
      Precision = 9
      Size = 2
    end
  end
  object qryOcupMilitares: TIBQuery
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM VW_OCUPANTES_ACTUALES')
    Left = 26
    Top = 202
    object qryOcupMilitaresIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'VW_OCUPANTES_ACTUALES.IDOCUPANTE'
    end
    object qryOcupMilitaresMATRICULA: TIBStringField
      FieldName = 'MATRICULA'
      Origin = 'VW_OCUPANTES_ACTUALES.MATRICULA'
      Size = 8
    end
    object qryOcupMilitaresIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Origin = 'VW_OCUPANTES_ACTUALES.IDGRADO'
    end
    object qryOcupMilitaresANTGRADO: TIntegerField
      FieldName = 'ANTGRADO'
      Origin = 'VW_OCUPANTES_ACTUALES.ANTGRADO'
    end
    object qryOcupMilitaresANTSERVICIO: TIntegerField
      FieldName = 'ANTSERVICIO'
      Origin = 'VW_OCUPANTES_ACTUALES.ANTSERVICIO'
    end
    object qryOcupMilitaresCANTAMB: TIntegerField
      FieldName = 'CANTAMB'
      Origin = 'VW_OCUPANTES_ACTUALES.CANTAMB'
    end
    object qryOcupMilitaresTIPODEPTO: TIBStringField
      FieldName = 'TIPODEPTO'
      Origin = 'VW_OCUPANTES_ACTUALES.TIPODEPTO'
      Size = 5
    end
    object qryOcupMilitaresRENTAPROPIA: TIBBCDField
      FieldName = 'RENTAPROPIA'
      Origin = 'VW_OCUPANTES_ACTUALES.RENTAPROPIA'
      Precision = 9
      Size = 2
    end
  end
  object Descuento: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
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
    object DescuentoMONTO: TIBBCDField
      FieldName = 'MONTO'
      Precision = 9
      Size = 2
    end
  end
  object DBAdmin: TIBDatabase
    Connected = True
    DatabaseName = '192.168.1.45:D:\Sistemas\Base Naval\Datos\dbadmin.gdb'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = Transaction2
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    Left = 26
    Top = 8
  end
  object Transaction2: TIBTransaction
    Active = False
    DefaultDatabase = DBAdmin
    AutoStopAction = saNone
    Left = 80
    Top = 8
  end
  object qrySumaGA: TIBQuery
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM(COSTO) AS TOTAL FROM GASTO_AD'
      'WHERE (FECHA_PAGO >= :F1) AND (FECHA_PAGO <= :F2)')
    Left = 258
    Top = 62
    ParamData = <
      item
        DataType = ftDate
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'F2'
        ParamType = ptUnknown
      end>
    object qrySumaGATOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qrySumaGF: TIBQuery
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM(COSTO) AS TOTAL FROM GASTO_FI'
      'WHERE (FECHA_PAGO >= :F1) AND (FECHA_PAGO <= :F2)')
    Left = 324
    Top = 62
    ParamData = <
      item
        DataType = ftDate
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'F2'
        ParamType = ptUnknown
      end>
    object qrySumaGFTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object Edificio: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'IDEDIFICIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CALLE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ADMFISCAL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDOCUPANTEJEFE'
        DataType = ftInteger
      end
      item
        Name = 'COEFICIENTE'
        DataType = ftFloat
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
    Left = 152
    Top = 60
    object EdificioIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object EdificioCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
    end
  end
  object qrySumaServ: TIBQuery
    Database = DBAdmin
    Transaction = Transaction2
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM( Serv_edif.COSTO ) AS TOTAL'
      'FROM SERV_EDIF Serv_edif'
      '   INNER JOIN SERVICIO Servicio'
      '   ON  (Serv_edif.IDSERVICIO = Servicio.IDSERVICIO)  '
      
        'WHERE (FECHA_PAGO >= :F1) AND (FECHA_PAGO <= :F2) AND (IDEDIFICI' +
        'O = :E) AND (PRORRATEO = :P)')
    Left = 390
    Top = 62
    ParamData = <
      item
        DataType = ftDate
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'F2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'E'
        ParamType = ptUnknown
      end
      item
        DataType = ftBytes
        Name = 'P'
        ParamType = ptUnknown
      end>
    object qrySumaServTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qrySumaTrab: TIBQuery
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT SUM(TRABAJO.COSTO) AS TOTAL '
      'FROM TRABAJO, TRAB_EDIF'
      
        'WHERE (TRABAJO.IDTRABAJO = TRAB_EDIF.IDTRABAJO) AND (TRABAJO.FEC' +
        'HA_FIN >= :F1) AND (TRABAJO.FECHA_FIN <= :F2) AND (TRABAJO.IMPUT' +
        'ACION = '#39'03'#39') AND (TRAB_EDIF.IDEDIFICIO = :E)')
    Left = 260
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'F2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'E'
        ParamType = ptUnknown
      end>
    object qrySumaTrabTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object tblCoeficiente: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'COEFICIENTE_ALQUILER'
    Left = 26
    Top = 112
    object tblCoeficienteTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 5
    end
    object tblCoeficientePERSONAL: TIBStringField
      FieldName = 'PERSONAL'
      Size = 3
    end
    object tblCoeficienteCANT_AMB: TIntegerField
      FieldName = 'CANT_AMB'
    end
    object tblCoeficientePORCENTAJE: TFloatField
      FieldName = 'PORCENTAJE'
    end
  end
  object tblGrado: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GRADO'
    Left = 94
    Top = 110
    object tblGradoIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
    end
    object tblGradoTIEMPO_MINIMO: TIntegerField
      FieldName = 'TIEMPO_MINIMO'
    end
    object tblGradoCOD201: TFloatField
      FieldName = 'COD201'
    end
    object tblGradoCOD209: TFloatField
      FieldName = 'COD209'
    end
  end
  object Depto: TIBTable
    Database = DBAdmin
    Transaction = Transaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DEPARTAMENTO'
    Left = 152
    Top = 110
    object DeptoIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
    end
    object DeptoIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
    end
    object DeptoCOEFICIENTE: TIBBCDField
      FieldName = 'COEFICIENTE'
      Precision = 9
      Size = 2
    end
    object DeptoCANTAMB: TIntegerField
      FieldName = 'CANTAMB'
    end
    object DeptoTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 5
    end
  end
end
