object dmCheques: TdmCheques
  OldCreateOrder = False
  Left = 291
  Top = 153
  Height = 194
  Width = 186
  object CHDEV: TTable
    DatabaseName = 'ADB'
    TableName = 'CHEQUE_DEVUELTO'
    Left = 12
    Top = 14
    object CHDEVNRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Required = True
    end
    object CHDEVFECHA_DEV: TDateTimeField
      FieldName = 'FECHA_DEV'
      Required = True
    end
    object CHDEVTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
end
