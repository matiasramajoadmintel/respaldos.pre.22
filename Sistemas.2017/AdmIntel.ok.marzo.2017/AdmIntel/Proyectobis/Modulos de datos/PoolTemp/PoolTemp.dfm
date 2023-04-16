object dmTemp: TdmTemp
  OldCreateOrder = False
  Left = 334
  Top = 169
  Height = 242
  Width = 299
  object TMP: TTable
    DatabaseName = 'ADB'
    Exclusive = True
    TableName = 'TEMP_PAGOS'
    Left = 10
    Top = 8
    object TMPFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object TMPDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 50
    end
    object TMPEdificio: TStringField
      FieldKind = fkLookup
      FieldName = 'Edificio'
      LookupDataSet = dmDatos.qryEdificios
      LookupKeyFields = 'IdEdificio'
      LookupResultField = 'Descrip'
      KeyFields = 'IDEDIF'
      Size = 60
      Lookup = True
    end
    object TMPIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Required = True
      currency = True
    end
    object TMPTIPO_GASTO: TStringField
      FieldName = 'TIPO_GASTO'
      Size = 1
    end
    object TMPIDGASTO: TIntegerField
      FieldName = 'IDGASTO'
      Required = True
    end
    object TMPIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Required = True
    end
    object TMPTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
    object TMPIDEDIF: TIntegerField
      FieldName = 'IDEDIF'
    end
    object TMPNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
    object TMPNRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Size = 12
    end
    object TMPPROVEEDOR: TStringField
      FieldName = 'PROVEEDOR'
      Size = 45
    end
    object TMPNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
  end
  object qryServ: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_SERV_EDIF'
      'WHERE PAGADO = '#39'S'#237#39)
    Left = 106
    Top = 56
    object qryServIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Origin = 'ADB.VW_SERV_EDIF.IDSERV_EDIF'
    end
    object qryServCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_SERV_EDIF.COSTO'
    end
    object qryServIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_SERV_EDIF.IDPROVEEDOR'
    end
    object qryServDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_SERV_EDIF.DESCRIP'
      Size = 60
    end
    object qryServIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_SERV_EDIF.IDEDIFICIO'
    end
    object qryServVACIOS: TStringField
      FieldName = 'VACIOS'
      Origin = 'ADB.VW_SERV_EDIF.VACIOS'
      Size = 2
    end
    object qryServFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_SERV_EDIF.FECHA'
    end
    object qryServIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_SERV_EDIF.IDPAGO'
    end
    object qryServNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_SERV_EDIF.NRO_DECI'
    end
    object qryServRAZON_SOCIAL: TStringField
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_SERV_EDIF.RAZON_SOCIAL'
      Size = 45
    end
    object qryServTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_SERV_EDIF.TIPO_PAGO'
      Size = 1
    end
    object qryServNRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_SERV_EDIF.NRO_CHEQUE'
    end
    object qryServNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_SERV_EDIF.NRO_ORDEN'
    end
  end
  object qryGasto: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_GASTO_AD'
      'WHERE PAGADO = '#39'S'#237#39)
    Left = 60
    Top = 52
    object qryGastoIDGASTO_AD: TIntegerField
      FieldName = 'IDGASTO_AD'
      Origin = 'ADB.VW_GASTO_AD.IDGASTO_AD'
    end
    object qryGastoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_GASTO_AD.FECHA'
    end
    object qryGastoCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_GASTO_AD.COSTO'
    end
    object qryGastoDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_GASTO_AD.DESCRIP'
      Size = 60
    end
    object qryGastoIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_GASTO_AD.IDPROVEEDOR'
    end
    object qryGastoRAZON_SOCIAL: TStringField
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_GASTO_AD.RAZON_SOCIAL'
      Size = 45
    end
    object qryGastoTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_GASTO_AD.TIPO_PAGO'
      Size = 1
    end
    object qryGastoNRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_GASTO_AD.NRO_CHEQUE'
    end
    object qryGastoIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_GASTO_AD.IDPAGO'
    end
    object qryGastoNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_GASTO_AD.NRO_DECI'
    end
    object qryGastoNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_GASTO_AD.NRO_ORDEN'
    end
  end
  object qryTrab: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_TRAB_PAGADOS')
    Left = 15
    Top = 52
    object qryTrabIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_TRAB_PAGADOS.IDPAGO'
    end
    object qryTrabDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_TRAB_PAGADOS.DESCRIP'
      Size = 74
    end
    object qryTrabIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_TRAB_PAGADOS.IMPORTE'
    end
    object qryTrabFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_TRAB_PAGADOS.FECHA'
    end
    object qryTrabIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_TRAB_PAGADOS.IDEDIFICIO'
    end
    object qryTrabTIPO_TRAB: TStringField
      FieldName = 'TIPO_TRAB'
      Origin = 'ADB.VW_TRAB_PAGADOS.TIPO_TRAB'
      Size = 1
    end
    object qryTrabNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_TRAB_PAGADOS.NRO_DECI'
    end
    object qryTrabRAZON_SOCIAL: TStringField
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_TRAB_PAGADOS.RAZON_SOCIAL'
      Size = 45
    end
    object qryTrabTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_TRAB_PAGADOS.TIPO_PAGO'
      Size = 1
    end
    object qryTrabNRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_TRAB_PAGADOS.NRO_CHEQUE'
    end
    object qryTrabNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_TRAB_PAGADOS.RAZON_SOCIAL'
    end
  end
end
