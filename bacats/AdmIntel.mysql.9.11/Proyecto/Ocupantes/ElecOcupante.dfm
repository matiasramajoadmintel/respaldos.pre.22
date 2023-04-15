object frmElecOcupante: TfrmElecOcupante
  Left = 993
  Top = 315
  Width = 599
  Height = 540
  Caption = 'Datos de personas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 45
    Width = 583
    Height = 402
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
    TabOrder = 0
    object grdDatos: TDBGrid
      Left = 5
      Top = 5
      Width = 573
      Height = 392
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
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
      OnKeyDown = grdDatosKeyDown
      OnTitleClick = grdDatosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'OCUPANTE'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 183
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 99
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 583
    Height = 45
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 128
      Top = 5
      Width = 27
      Height = 13
      Caption = 'Texto'
    end
    object Label2: TLabel
      Left = 8
      Top = 5
      Width = 41
      Height = 13
      Caption = 'Columna'
    end
    object edtDesc: TEdit
      Left = 128
      Top = 19
      Width = 120
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object btnBuscar: TBitBtn
      Left = 250
      Top = 19
      Width = 56
      Height = 21
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = btnBuscarClick
    end
    object ComboColumna: TComboBox
      Left = 8
      Top = 19
      Width = 120
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      Sorted = True
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object Button1: TButton
      Left = 374
      Top = 19
      Width = 85
      Height = 21
      Caption = 'Ocupaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 583
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Panel5: TPanel
      Left = 397
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCerrar: TBitBtn
        Left = 108
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
      object btnElegir: TBitBtn
        Left = 32
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Elegir'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 1
        Glyph.Data = {
          36090000424D36090000000000003600000028000000400000000C0000000100
          18000000000000090000C40E0000C40E00000000000000000000FFFFFF000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          800000800000800000800000800000000000FFFFFFFFFFFFFFFFFF0000000000
          00808080808080808080000000000000808080808080808080000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          8000008000008000008000008000000000000000000000000000008080808080
          80808080000000000000FFFFFEFFFFFE808080000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          800000FF0000800000FF00008000000000008080808080808080808080808080
          80808080000000FFFFFEFFFFFE000000000000808080808080808080000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          FF0000800000FF0000800000FF00000000008080808080808080808080808080
          80808080808080000000000000FFFFFEFFFFFE808080000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080808080808080FFFFFEFFFF
          FEFFFFFE808080000000FFFFFEFFFFFE00000000000080808080808080808000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080808080FFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFE808080000000000000FFFFFEFFFFFEFFFFFE00000000000000
          0000000000000000000000000000808080808080808080000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080FFFFFEFFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFE808080000000FFFFFEFFFFFE00000080808080808080
          8080000000808080808080808080FFFFFEFFFFFE808080000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000000000000000000000FFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFE80808000000000000080808080808080808000
          0000808080808080FFFFFEFFFFFE000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000FFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE80808000000080
          8080808080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE80808000000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
      end
    end
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 447
    Width = 583
    Height = 25
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object btnAgregar: TSpeedButton
      Left = 4
      Top = 2
      Width = 69
      Height = 22
      Hint = 'o presione la tecla "A"'
      Caption = '&Agregar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnAgregarClick
    end
    object btnEliminar: TSpeedButton
      Left = 73
      Top = 2
      Width = 69
      Height = 22
      Hint = 'o presione la tecla "Delete"'
      Caption = 'E&liminar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnEliminarClick
    end
    object btnModificar: TSpeedButton
      Left = 142
      Top = 2
      Width = 75
      Height = 22
      Hint = 'o presione la tecla "Enter"'
      Caption = '&Modificar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnModificarClick
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 320
    Top = 120
  end
  object OcupCiv: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_CIVIL'
    Left = 318
    Top = 150
    object OcupCivIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object OcupCivLEGAJO: TStringField
      FieldName = 'LEGAJO'
      Size = 10
    end
  end
  object OcupMil: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_MILITAR'
    Left = 384
    Top = 149
    object OcupMilIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object OcupMilMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_PERSONAS_2')
    Left = 282
    Top = 152
    object Query1IDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'ADB.VW_PERSONAS_2.IDOCUPANTE'
      Visible = False
    end
    object Query1OCUPANTE: TStringField
      DisplayLabel = 'Nombre'
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_PERSONAS_2.OCUPANTE'
      Size = 41
    end
    object Query1TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'ADB.VW_PERSONAS_2.TIPO'
    end
    object Query1MATRICULA: TStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRICULA'
      Origin = 'ADB.VW_PERSONAS_2.MATRICULA'
      Size = 10
    end
  end
  object MNO_: TTable
    DatabaseName = 'ADB'
    TableName = 'MILITAR_NO_OCUPANTE'
    Left = 352
    Top = 149
    object MNO_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object MNO_MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object ZQuery1: TZQuery
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    Active = True
    SQL.Strings = (
      'SELECT * FROM VW_PERSONAS_2')
    ParamCheck = True
    Params = <>
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 280
    Top = 181
    object ZQuery1IDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Required = True
    end
    object ZQuery1OCUPANTE: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'OCUPANTE'
      Size = 123
    end
    object ZQuery1TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
      Size = 57
    end
    object ZQuery1MATRICULA: TStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
      Size = 30
    end
  end
  object ztblOcupCiv: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    Active = True
    TableName = 'ocupante_civil'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 320
    Top = 181
    object ztblOcupCividpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblOcupCivlegajo: TStringField
      FieldName = 'legajo'
      Size = 30
    end
  end
  object ztblOcupMil: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    Active = True
    TableName = 'ocupante_militar'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 384
    Top = 181
    object ztblOcupMilidpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblOcupMilmatricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
  end
  object ztblMNO_: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    Active = True
    TableName = 'militar_no_ocupante'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 352
    Top = 181
    object ztblMNO_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblMNO_matricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
  end
end
