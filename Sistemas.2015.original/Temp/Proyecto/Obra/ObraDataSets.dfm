object dmObras: TdmObras
  OldCreateOrder = False
  Left = 402
  Top = 176
  Height = 150
  Width = 215
  object qryObras: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwObras')
    Left = 14
    Top = 10
    object qryObrasIdObra: TSmallintField
      FieldName = 'IdObra'
      Origin = 'DBR.vwObras.IdObra'
    end
    object qryObrasTipoObra: TStringField
      FieldName = 'TipoObra'
      Origin = 'DBR.vwObras.TipoObra'
      Size = 50
    end
    object qryObrasCliente: TStringField
      FieldName = 'Cliente'
      Origin = 'DBR.vwObras.Cliente'
      Size = 60
    end
    object qryObrasNombre: TStringField
      FieldName = 'Nombre'
      Origin = 'DBR.vwObras.Nombre'
      Size = 50
    end
    object qryObrasPresupuesto: TFloatField
      FieldName = 'Presupuesto'
      Origin = 'DBR.vwObras.Presupuesto'
    end
    object qryObrasHonorarios: TFloatField
      FieldName = 'Honorarios'
      Origin = 'DBR.vwObras.Honorarios'
    end
    object qryObrasMoneda: TStringField
      FieldName = 'Moneda'
      Origin = 'DBR.vwObras.Moneda'
      Size = 10
    end
    object qryObrasSuperficie: TFloatField
      FieldName = 'Superficie'
      Origin = 'DBR.vwObras.Superficie'
    end
    object qryObrasFechaInicio: TDateTimeField
      FieldName = 'FechaInicio'
      Origin = 'DBR.vwObras.FechaInicio'
    end
    object qryObrasFechaFin: TDateTimeField
      FieldName = 'FechaFin'
      Origin = 'DBR.vwObras.FechaFin'
    end
    object qryObrasEstado: TStringField
      FieldName = 'Estado'
      Origin = 'DBR.vwObras.Estado'
    end
    object qryObrasPorcentaje: TIntegerField
      FieldName = 'Porcentaje'
      Origin = 'DBR.vwObras.Porcentaje'
    end
    object qryObrasDescripcion: TStringField
      FieldName = 'Descripcion'
      Origin = 'DBR.vwObras.Descripcion'
      Size = 255
    end
    object qryObrasCantidadAmbientes: TSmallintField
      FieldName = 'CantidadAmbientes'
      Origin = 'DBR.vwObras.CantidadAmbientes'
    end
    object qryObrasCantidadBanos: TSmallintField
      FieldName = 'CantidadBanos'
      Origin = 'DBR.vwObras.CantidadBanos'
    end
    object qryObrasTiempoEstimado: TSmallintField
      FieldName = 'TiempoEstimado'
      Origin = 'DBR.vwObras.TiempoEstimado'
    end
    object qryObrasFraccion: TStringField
      FieldName = 'Fraccion'
      Origin = 'DBR.vwObras.Fraccion'
      Size = 10
    end
    object qryObrasParcela: TStringField
      FieldName = 'Parcela'
      Origin = 'DBR.vwObras.Parcela'
      Size = 10
    end
    object qryObrasUnidadFuncional: TStringField
      FieldName = 'UnidadFuncional'
      Origin = 'DBR.vwObras.UnidadFuncional'
      Size = 10
    end
    object qryObrasNroCuentaMuni: TStringField
      FieldName = 'NroCuentaMuni'
      Origin = 'DBR.vwObras.NroCuentaMuni'
    end
    object qryObrasNroPartidaMuni: TStringField
      FieldName = 'NroPartidaMuni'
      Origin = 'DBR.vwObras.NroPartidaMuni'
    end
    object qryObrasNroObra: TStringField
      FieldName = 'NroObra'
      Origin = 'DBR.vwObras.NroObra'
      Size = 6
    end
    object qryObrasIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Origin = 'DBR.vwObras.IdCliente'
    end
  end
  object qryPagadoObra: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT SUM(Monto) AS MontoPagado FROM vwMovimientosCobro'
      'WHERE IdObra = :O AND TipoCobro = '#39'OBRA'#39)
    Left = 88
    Top = 10
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'O'
        ParamType = ptUnknown
      end>
    object qryPagadoObraMontoPagado: TFloatField
      FieldName = 'MontoPagado'
      Origin = 'DBR.vwMovimientosCobro.Monto'
    end
  end
  object qryPagadoHonorarios: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT SUM(Monto) AS MontoPagado FROM vwMovimientosCobro'
      'WHERE IdObra = :O AND TipoCobro = '#39'HONORARIOS'#39)
    Left = 44
    Top = 64
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'O'
        ParamType = ptUnknown
      end>
    object qryPagadoHonorariosMontoPagado: TFloatField
      FieldName = 'MontoPagado'
      Origin = 'DBR.vwMovimientosCobro.Monto'
    end
  end
end
