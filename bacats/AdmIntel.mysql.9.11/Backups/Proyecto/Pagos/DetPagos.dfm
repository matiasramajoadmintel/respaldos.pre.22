object frmDetPagos: TfrmDetPagos
  Left = 274
  Top = 137
  Width = 649
  Height = 345
  BorderIcons = []
  Caption = 'Detalle de pagos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnActivate = FormCreate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 641
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 455
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TBitBtn
        Left = 110
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        OnClick = btnCancelarClick
        Kind = bkClose
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 21
    Width = 641
    Height = 246
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object grdDatos: TDBGrid
      Left = 5
      Top = 5
      Width = 631
      Height = 236
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lugar'
          Title.Alignment = taCenter
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_DECI'
          Title.Alignment = taCenter
          Title.Caption = 'DECI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_ORDEN'
          Title.Alignment = taCenter
          Title.Caption = 'Orden'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_FACT'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Fact.'
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 641
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 267
    Width = 641
    Height = 21
    Align = alBottom
    TabOrder = 3
    object StaticText1: TStaticText
      Left = 571
      Top = 1
      Width = 69
      Height = 19
      Align = alRight
      Alignment = taRightJustify
      BorderStyle = sbsSingle
      Caption = 'StaticText1'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object dsDatos: TDataSource
    DataSet = qryDetPagos
    Left = 278
    Top = 106
  end
  object qryDetPagos: TQuery
    OnCalcFields = qryDetPagosCalcFields
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_DET_PAGADOS'
      'WHERE IDPAGO = :N'
      'ORDER BY FECHA')
    Left = 246
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end>
    object qryDetPagosIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_DET_PAGADOS.IDPAGO'
    end
    object qryDetPagosFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_DET_PAGADOS.FECHA'
    end
    object qryDetPagosDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_DET_PAGADOS.DESCRIP'
      Size = 60
    end
    object qryDetPagosIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_DET_PAGADOS.IMPORTE'
      DisplayFormat = '#,0.00'
    end
    object qryDetPagosNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_DET_PAGADOS.NRO_DECI'
    end
    object qryDetPagosNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_DET_PAGADOS.NRO_ORDEN'
    end
    object qryDetPagosNRO_FACT: TIntegerField
      FieldName = 'NRO_FACT'
      Origin = 'ADB.VW_DET_PAGADOS.NRO_FACT'
    end
    object qryDetPagosLugar: TStringField
      FieldKind = fkCalculated
      FieldName = 'Lugar'
      Size = 100
      Calculated = True
    end
    object qryDetPagosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'ADB.VW_DET_PAGADOS.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryDetPagosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ADB.VW_DET_PAGADOS.IDPAGO'
    end
  end
  object TRAB: TTable
    DatabaseName = 'ADB'
    TableName = 'TRABAJO'
    Left = 246
    Top = 140
    object TRABIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Required = True
    end
    object TRABNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object TRABNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
    object TRABTIPO_TRAB: TStringField
      FieldName = 'TIPO_TRAB'
      Size = 1
    end
  end
  object TRABEDIF: TTable
    DatabaseName = 'ADB'
    TableName = 'TRAB_EDIF'
    Left = 280
    Top = 140
    object TRABEDIFIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Required = True
    end
    object TRABEDIFIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object TRABEDIFIDTIPO_ESPACIO: TIntegerField
      FieldName = 'IDTIPO_ESPACIO'
      Required = True
    end
    object TRABEDIFEdificio: TStringField
      FieldKind = fkLookup
      FieldName = 'Edificio'
      LookupDataSet = dmDatos.EDIF
      LookupKeyFields = 'IDEDIFICIO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDEDIFICIO'
      Size = 60
      Lookup = True
    end
    object TRABEDIFEspacio: TStringField
      FieldKind = fkLookup
      FieldName = 'Espacio'
      LookupDataSet = TESP
      LookupKeyFields = 'IDTIPO_ESPACIO'
      LookupResultField = 'DESCRIP'
      KeyFields = 'IDTIPO_ESPACIO'
      Size = 60
      Lookup = True
    end
  end
  object TRABDTO: TTable
    Active = True
    DatabaseName = 'ADB'
    TableName = 'TRAB_DEPTO'
    Left = 312
    Top = 140
    object TRABDTOIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Required = True
    end
    object TRABDTOIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object TRABDTODepto: TStringField
      FieldKind = fkLookup
      FieldName = 'Depto'
      LookupDataSet = dmDatos.DEPTO
      LookupKeyFields = 'IDDEPARTAMENTO'
      LookupResultField = 'DescCompleta'
      KeyFields = 'IDDEPARTAMENTO'
      Size = 60
      Lookup = True
    end
  end
  object TESP: TTable
    Active = True
    DatabaseName = 'ADB'
    TableName = 'TIPO_ESPACIO'
    Left = 342
    Top = 140
    object TESPIDTIPO_ESPACIO: TIntegerField
      FieldName = 'IDTIPO_ESPACIO'
      Required = True
    end
    object TESPDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 60
    end
  end
  object SERVEDIF: TTable
    DatabaseName = 'ADB'
    TableName = 'SERV_EDIF'
    Left = 370
    Top = 138
    object SERVEDIFIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object SERVEDIFDescEdif: TStringField
      FieldKind = fkLookup
      FieldName = 'DescEdif'
      LookupDataSet = dmDatos.EDIF
      LookupKeyFields = 'IDEDIFICIO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDEDIFICIO'
      Size = 60
      Lookup = True
    end
    object SERVEDIFIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Required = True
    end
  end
end
