object frmElecGrado: TfrmElecGrado
  Left = 213
  Top = 175
  Width = 521
  Height = 375
  Caption = 'Grado'
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 513
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
    object edtDesc: TEdit
      Left = 10
      Top = 19
      Width = 275
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
      Left = 286
      Top = 19
      Width = 75
      Height = 21
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 293
    Width = 513
    Height = 25
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object btnAgregar: TSpeedButton
      Left = 4
      Top = 2
      Width = 60
      Height = 22
      Hint = 'o presione la tecla "A"'
      Caption = '&Agregar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAgregarClick
    end
    object btnEliminar: TSpeedButton
      Left = 64
      Top = 2
      Width = 60
      Height = 22
      Hint = 'o presione la tecla "Delete"'
      Caption = 'E&liminar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEliminarClick
    end
    object btnModificar: TSpeedButton
      Left = 124
      Top = 2
      Width = 60
      Height = 22
      Hint = 'o presione la tecla "Enter"'
      Caption = '&Modificar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnModificarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 513
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Panel5: TPanel
      Left = 327
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
        TabOrder = 1
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
        TabOrder = 0
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
  object Panel1: TPanel
    Left = 0
    Top = 45
    Width = 513
    Height = 248
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
    TabOrder = 3
    object grdDatos: TDBGrid
      Left = 5
      Top = 5
      Width = 503
      Height = 238
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsGrado
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
          FieldName = 'DESCRIPCION'
          Title.Alignment = taCenter
          Title.Caption = 'Descripci'#243'n'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 207
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABREVIATURA'
          Title.Alignment = taCenter
          Title.Caption = 'Abreviatura'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO_MINIMO'
          Title.Alignment = taCenter
          Title.Caption = 'Tiempo m'#237'nimo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD201'
          Title.Alignment = taCenter
          Title.Caption = 'Sueldo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD209'
          Title.Alignment = taCenter
          Title.Caption = 'R.G.A.S.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object dsGrado: TDataSource
    DataSet = qryGrados
    Left = 226
    Top = 139
  end
  object qryGrados: TQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      'select * from GRADO')
    Left = 260
    Top = 140
    object qryGradosIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Origin = 'DB.GRADO.IDGRADO'
    end
    object qryGradosDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DB.GRADO.DESCRIPCION'
      Size = 50
    end
    object qryGradosABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Origin = 'DB.GRADO.ABREVIATURA'
      Size = 2
    end
    object qryGradosTIEMPO_MINIMO: TIntegerField
      FieldName = 'TIEMPO_MINIMO'
      Origin = 'DB.GRADO.TIEMPO_MINIMO'
    end
    object qryGradosCOD201: TFloatField
      FieldName = 'COD201'
      Origin = 'DB.GRADO.COD201'
      currency = True
    end
    object qryGradosCOD209: TFloatField
      FieldName = 'COD209'
      Origin = 'DB.GRADO.COD209'
      currency = True
    end
  end
end
