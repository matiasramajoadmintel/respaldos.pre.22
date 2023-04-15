object frmElecDescuento: TfrmElecDescuento
  Left = 155
  Top = 126
  Width = 665
  Height = 375
  Caption = 'Descuentos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 45
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 5
      Width = 81
      Height = 13
      Caption = 'Nombre a buscar'
    end
    object Label2: TLabel
      Left = 144
      Top = 4
      Width = 20
      Height = 13
      Caption = 'Mes'
    end
    object Label3: TLabel
      Left = 265
      Top = 4
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 3
      Width = 525
      Height = 39
    end
    object Label4: TLabel
      Left = 320
      Top = 4
      Width = 46
      Height = 13
      Caption = 'Concepto'
    end
    object edtDesc: TEdit
      Left = 10
      Top = 18
      Width = 131
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edtDescKeyPress
    end
    object btnBuscar: TBitBtn
      Left = 474
      Top = 17
      Width = 51
      Height = 21
      Hint = 'Muestra los descuentos realizados seg'#250'n el filtro selecionado'
      Caption = 'Mostrar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnBuscarClick
    end
    object ComboMes: TComboBox
      Left = 144
      Top = 18
      Width = 120
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      OnKeyPress = ComboMesKeyPress
      Items.Strings = (
        'ENERO'
        'FEBRERO'
        'MARZO'
        'ABRIL'
        'MAYO'
        'JUNIO'
        'JULIO'
        'AGOSTO'
        'SEPTIEMBRE'
        'OCTUBRE'
        'NOVIEMBRE'
        'DICIEMBRE')
    end
    object edtAnio: TEdit
      Left = 265
      Top = 18
      Width = 37
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '2000'
      OnKeyPress = edtDescKeyPress
    end
    object UpDown1: TUpDown
      Left = 302
      Top = 18
      Width = 16
      Height = 21
      Associate = edtAnio
      Min = 2000
      Max = 3000
      Position = 2000
      TabOrder = 4
      Thousands = False
      Wrap = False
    end
    object cmbTDesc: TComboBox
      Left = 321
      Top = 18
      Width = 152
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 5
      Items.Strings = (
        'Alquiler'
        'Expensas comunes'
        'RAE')
    end
    object Panel4: TPanel
      Left = 588
      Top = 1
      Width = 68
      Height = 43
      Align = alRight
      BevelInner = bvLowered
      BevelOuter = bvNone
      BorderWidth = 3
      TabOrder = 6
      object btnImprimir: TBitBtn
        Left = 9
        Top = 12
        Width = 51
        Height = 21
        Hint = 'Muestra una vista preliminar del reporte impreso'
        Caption = 'Imprimir'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnImprimirClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 45
    Width = 657
    Height = 273
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'Panel1'
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
      Width = 647
      Height = 263
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      DataSource = DataSource1
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
      TitleFont.Height = -15
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = grdDatosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Ocupante'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES'
          Title.Alignment = taCenter
          Title.Caption = 'Mes'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANIO'
          Title.Alignment = taCenter
          Title.Caption = 'A'#241'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO'
          Title.Alignment = taCenter
          Title.Caption = 'Monto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 657
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Panel5: TPanel
      Left = 353
      Top = 1
      Width = 303
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCerrar: TBitBtn
        Left = 226
        Top = 2
        Width = 75
        Height = 25
        Cancel = True
        Caption = '&Cerrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 0
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
      object StaticText1: TStaticText
        Left = 30
        Top = 3
        Width = 193
        Height = 23
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Query1: TQuery
    OnCalcFields = Query1CalcFields
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_DESCUENTO')
    Left = 24
    Top = 192
    object Query1Ocupante: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupante'
      Size = 40
      Calculated = True
    end
    object Query1APELLIDO: TStringField
      FieldName = 'APELLIDO'
      Origin = 'DB.VW_DESCUENTO.APELLIDO'
      Size = 15
    end
    object Query1NOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'DB.VW_DESCUENTO.NOMBRE'
      Size = 25
    end
    object Query1MES: TStringField
      FieldName = 'MES'
      Origin = 'DB.VW_DESCUENTO.MES'
      Size = 10
    end
    object Query1ANIO: TIntegerField
      FieldName = 'ANIO'
      Origin = 'DB.VW_DESCUENTO.ANIO'
    end
    object Query1MONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DB.VW_DESCUENTO.MONTO'
      currency = True
    end
    object Query1IDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'DB.VW_DESCUENTO.IDOCUPANTE'
    end
    object Query1IDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Origin = 'DB.VW_DESCUENTO.IDTIPODESCUENTO'
    end
    object Query1IDDESCUENTO: TIntegerField
      FieldName = 'IDDESCUENTO'
      Origin = 'DB.VW_DESCUENTO.IDDESCUENTO'
    end
    object Query1DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'ADB.VW_DESCUENTO.DESCRIPCION'
      Size = 25
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 56
    Top = 192
  end
  object TDESC: TTable
    DatabaseName = 'ADB'
    TableName = 'TIPO_DESCUENTO'
    Left = 34
    Top = 236
    object TDESCIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Required = True
    end
    object TDESCCODDESC: TIntegerField
      FieldName = 'CODDESC'
      Required = True
    end
    object TDESCTIPOPAGO: TStringField
      FieldName = 'TIPOPAGO'
      Size = 2
    end
    object TDESCDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
end
