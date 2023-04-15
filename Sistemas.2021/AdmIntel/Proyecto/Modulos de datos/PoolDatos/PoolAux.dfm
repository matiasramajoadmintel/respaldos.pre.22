object dmAux: TdmAux
  OldCreateOrder = False
  Left = 263
  Top = 236
  Height = 150
  Width = 215
  object TRAB: TTable
    DatabaseName = 'ADB'
    TableName = 'TRABAJO'
    Left = 14
    Top = 12
    object TRABIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
    end
    object TRABIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Required = True
    end
    object TRABNRO_FACT: TIntegerField
      FieldName = 'NRO_FACT'
    end
  end
end
