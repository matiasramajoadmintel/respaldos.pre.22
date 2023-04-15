object dmFactura: TdmFactura
  OldCreateOrder = False
  Left = 416
  Top = 216
  Height = 150
  Width = 215
  object qryMontoPagado: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT SUM(Monto) AS MontoPagado FROM PagoFactura'
      'WHERE IdFactura = :F')
    Left = 28
    Top = 8
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'F'
        ParamType = ptUnknown
      end>
    object qryMontoPagadoMontoPagado: TFloatField
      FieldName = 'MontoPagado'
      Origin = 'DBR.PagoFactura.Monto'
    end
  end
  object tblFactura: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Factura'
    Left = 114
    Top = 8
    object tblFacturaIdFactura: TSmallintField
      FieldName = 'IdFactura'
      Required = True
    end
    object tblFacturaPagado: TBooleanField
      FieldName = 'Pagado'
      Required = True
    end
  end
  object qryFacturas: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwFacturas')
    Left = 30
    Top = 66
    object qryFacturasIdFactura: TSmallintField
      FieldName = 'IdFactura'
      Origin = 'DBR.vwFacturas.IdFactura'
    end
    object qryFacturasNumero: TStringField
      FieldName = 'Numero'
      Origin = 'DBR.vwFacturas.Numero'
      Size = 15
    end
    object qryFacturasFecha: TDateTimeField
      FieldName = 'Fecha'
      Origin = 'DBR.vwFacturas.Fecha'
    end
    object qryFacturasProveedor: TStringField
      FieldName = 'Proveedor'
      Origin = 'DBR.vwFacturas.Proveedor'
      Size = 60
    end
    object qryFacturasObra: TStringField
      FieldName = 'Obra'
      Origin = 'DBR.vwFacturas.Obra'
      Size = 50
    end
    object qryFacturasPagado: TBooleanField
      FieldName = 'Pagado'
      Origin = 'DBR.vwFacturas.Pagado'
    end
    object qryFacturasTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'DBR.vwFacturas.Tipo'
      Size = 10
    end
    object qryFacturasMonto: TFloatField
      FieldName = 'Monto'
      Origin = 'DBR.vwFacturas.Monto'
    end
  end
end
