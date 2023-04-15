object frmElecOT: TfrmElecOT
  Left = 65
  Top = 85
  Width = 630
  Height = 460
  Caption = 'Elecci'#243'n de Orden de Trabajo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 403
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 612
      Height = 393
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsQry
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'OT'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'N'#186'/SubN'#186
          Width = 54
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'FechaEmi'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Emitida'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodEjemp'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Interno'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Equipo'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = ' Descrip. Subfamilia'
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Porcentaje'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = '%'
          Width = 36
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Estado2'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Estado'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoOT'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Tipo OT'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoMant2'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo Mant.'
          Width = 57
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 403
    Width = 622
    Height = 30
    Align = alBottom
    TabOrder = 1
    object Panel3: TPanel
      Left = 436
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 108
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        Kind = bkClose
      end
      object btnElegir: TBitBtn
        Left = 32
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Elegir'
        TabOrder = 1
        Kind = bkOK
      end
    end
  end
  object Qry: TQuery
    OnCalcFields = QryCalcFields
    DatabaseName = 'MDB'
    SQL.Strings = (
      'SELECT * FROM OTView'
      'WHERE FechaEmi >= '#39'01/01/2001'#39
      'ORDER BY NroOT, SubNroOT')
    Left = 274
    Top = 170
    object QryNroOT: TIntegerField
      FieldName = 'NroOT'
      Origin = 'MDB.OTView.NroOT'
    end
    object QrySubNroOT: TIntegerField
      FieldName = 'SubNroOT'
      Origin = 'MDB.OTView.SubNroOT'
    end
    object QryIdOT: TIntegerField
      FieldName = 'IdOT'
      Origin = 'MDB.OTView.IdOT'
    end
    object QryIdEquipo: TIntegerField
      FieldName = 'IdEquipo'
      Origin = 'MDB.OTView.IdEquipo'
    end
    object QryIdTipoOT: TIntegerField
      FieldName = 'IdTipoOT'
      Origin = 'MDB.OTView.NroOT'
    end
    object QryPorcentaje: TIntegerField
      FieldName = 'Porcentaje'
      Origin = 'MDB.OTView.NroOT'
    end
    object QryIdSubFamilia: TIntegerField
      FieldName = 'IdSubFamilia'
      Origin = 'MDB.OTView.IdSubFamilia'
    end
    object QryIdEjemp: TIntegerField
      FieldName = 'IdEjemp'
      Origin = 'MDB.OTView.IdEjemp'
    end
    object QryEquipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Equipo'
      Size = 200
      Calculated = True
    end
    object QryCodEjemp: TStringField
      Alignment = taRightJustify
      FieldKind = fkLookup
      FieldName = 'CodEjemp'
      LookupKeyFields = 'IdEjemp'
      LookupResultField = 'CodEjemp'
      KeyFields = 'IdEjemp'
      Size = 45
      Lookup = True
    end
    object QryFechaEmi: TDateTimeField
      FieldName = 'FechaEmi'
      Origin = 'MDB.OTView.FechaEmi'
      DisplayFormat = 'DD/MM/YY'
    end
    object QryEstado: TStringField
      FieldName = 'Estado'
      Origin = 'MDB.OTView.Estado'
      FixedChar = True
      Size = 1
    end
    object QryTipoOT: TStringField
      FieldName = 'TipoOT'
      Origin = 'MDB.OTView.TipoOT'
      Size = 30
    end
    object QryTipoMant: TStringField
      FieldName = 'TipoMant'
      Origin = 'MDB.OTView.TipoMant'
      Size = 3
    end
    object QryEstado2: TStringField
      FieldKind = fkCalculated
      FieldName = 'Estado2'
      Size = 1
      Calculated = True
    end
    object QryTipoMant2: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoMant2'
      Size = 3
      Calculated = True
    end
    object QryOT: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'OT'
      Size = 8
      Calculated = True
    end
  end
  object dsQry: TDataSource
    DataSet = Qry
    Left = 304
    Top = 168
  end
  object Table1: TTable
    DatabaseName = 'MDB'
    Left = 134
    Top = 158
  end
end
