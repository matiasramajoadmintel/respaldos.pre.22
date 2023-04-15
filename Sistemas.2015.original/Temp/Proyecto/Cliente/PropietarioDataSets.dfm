object dmPropietario: TdmPropietario
  OldCreateOrder = False
  Left = 192
  Top = 103
  Height = 150
  Width = 215
  object qryPropietarios: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwClientes')
    Left = 22
    Top = 18
    object qryPropietariosIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Origin = 'DBR.vwClientes.IdCliente'
    end
    object qryPropietariosRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Origin = 'DBR.vwClientes.RazonSocial'
      Size = 60
    end
    object qryPropietariosDomicilio: TStringField
      FieldName = 'Domicilio'
      Origin = 'DBR.vwClientes.Domicilio'
      Size = 60
    end
    object qryPropietariosTelefono: TStringField
      FieldName = 'Telefono'
      Origin = 'DBR.vwClientes.Telefono'
      Size = 30
    end
    object qryPropietariosEmail: TStringField
      FieldName = 'Email'
      Origin = 'DBR.vwClientes.Email'
      Size = 30
    end
    object qryPropietariosLocalidad: TStringField
      FieldName = 'Localidad'
      Origin = 'DBR.vwClientes.Localidad'
      Size = 50
    end
    object qryPropietariosCodigoPostal: TStringField
      FieldName = 'CodigoPostal'
      Origin = 'DBR.vwClientes.CodigoPostal'
      Size = 10
    end
    object qryPropietariosFechaNacimiento: TDateTimeField
      FieldName = 'FechaNacimiento'
      Origin = 'DBR.vwClientes.FechaNacimiento'
    end
    object qryPropietariosDNI: TStringField
      FieldName = 'DNI'
      Origin = 'DBR.vwClientes.DNI'
      Size = 12
    end
    object qryPropietariosCUIT: TStringField
      FieldName = 'CUIT'
      Origin = 'DBR.vwClientes.CUIT'
      Size = 15
    end
  end
end
