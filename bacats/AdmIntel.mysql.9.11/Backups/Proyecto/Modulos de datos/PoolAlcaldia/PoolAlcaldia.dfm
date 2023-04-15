object dmAlcaldia: TdmAlcaldia
  OldCreateOrder = False
  Left = 234
  Top = 179
  Height = 164
  Width = 258
  object ALCDB: TDatabase
    AliasName = 'DBAlcaldia'
    DatabaseName = 'ALCDB'
    KeepConnection = False
    LoginPrompt = False
    SessionName = 'Default'
    Left = 20
    Top = 12
  end
  object qryDeptos: TQuery
    DatabaseName = 'ALCDB'
    SQL.Strings = (
      'SELECT * FROM vwDeptos'
      'ORDER BY Descrip')
    Left = 20
    Top = 72
    object qryDeptosIdDepartamento: TIntegerField
      FieldName = 'IdDepartamento'
      Origin = 'ALCDB.vwDeptos.IdDepartamento'
    end
    object qryDeptosDescrip: TStringField
      FieldName = 'Descrip'
      Origin = 'ALCDB.vwDeptos.Descrip'
      Size = 255
    end
    object qryDeptosIdEdificio: TIntegerField
      FieldName = 'IdEdificio'
      Origin = 'ALCDB.vwDeptos.IdEdificio'
    end
    object qryDeptosDescDepto: TStringField
      FieldName = 'DescDepto'
      Origin = 'ALCDB.vwDeptos.DescDepto'
      Size = 50
    end
  end
  object qryEdificios: TQuery
    DatabaseName = 'ALCDB'
    SQL.Strings = (
      'SELECT * FROM vwEdificios'
      'ORDER BY Descrip')
    Left = 80
    Top = 72
    object qryEdificiosIdEdificio: TIntegerField
      FieldName = 'IdEdificio'
      Origin = 'ALCDB.vwEdificios.IdEdificio'
    end
    object qryEdificiosDescrip: TStringField
      FieldName = 'Descrip'
      Origin = 'ALCDB.vwEdificios.Descrip'
      Size = 50
    end
  end
end
