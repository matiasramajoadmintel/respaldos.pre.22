object dmMovimientos: TdmMovimientos
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object MOV: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Movimiento'
    Left = 12
    Top = 8
    object MOVIdMovimiento: TIntegerField
      FieldName = 'IdMovimiento'
    end
    object MOVFechaEfectuada: TDateTimeField
      FieldName = 'FechaEfectuada'
    end
    object MOVMonto: TFloatField
      FieldName = 'Monto'
      Required = True
    end
    object MOVMoneda: TStringField
      FieldName = 'Moneda'
      Required = True
      Size = 10
    end
    object MOVFormaPago: TStringField
      FieldName = 'FormaPago'
      Required = True
      Size = 10
    end
    object MOVTipo: TStringField
      FieldName = 'Tipo'
      Required = True
      Size = 10
    end
  end
  object PAGOFACT: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.PagoFactura'
    Left = 74
    Top = 8
    object PAGOFACTIdPagoFactura: TIntegerField
      FieldName = 'IdPagoFactura'
    end
    object PAGOFACTIdMovimiento: TIntegerField
      FieldName = 'IdMovimiento'
      Required = True
    end
    object PAGOFACTIdFactura: TSmallintField
      FieldName = 'IdFactura'
      Required = True
    end
    object PAGOFACTMonto: TFloatField
      FieldName = 'Monto'
      Required = True
    end
  end
  object MOVCH: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.MovimientoCheque'
    Left = 14
    Top = 62
    object MOVCHIdMovimiento: TIntegerField
      FieldName = 'IdMovimiento'
      Required = True
    end
    object MOVCHIdCheque: TSmallintField
      FieldName = 'IdCheque'
      Required = True
    end
  end
  object MOVCOB: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.MovimientoCobro'
    Left = 86
    Top = 64
    object MOVCOBIdMovimiento: TIntegerField
      FieldName = 'IdMovimiento'
      Required = True
    end
    object MOVCOBIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Required = True
    end
    object MOVCOBIdObra: TSmallintField
      FieldName = 'IdObra'
      Required = True
    end
    object MOVCOBTipo: TStringField
      FieldName = 'Tipo'
      Required = True
    end
  end
end
