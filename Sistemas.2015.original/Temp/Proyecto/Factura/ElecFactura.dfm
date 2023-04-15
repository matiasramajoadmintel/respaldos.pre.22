object frmElecFacturas: TfrmElecFacturas
  Left = 137
  Top = 135
  Width = 572
  Height = 399
  Caption = 'Facturas impagas'
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
    Width = 564
    Height = 297
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Caption = 'Panel1'
    Color = clSkyBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object grdDatos: TDBGrid
      Left = 3
      Top = 3
      Width = 558
      Height = 291
      Align = alClient
      Color = clCream
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
      OnKeyPress = ControlKeyPress
      OnTitleClick = grdDatosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Numero'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fecha'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Proveedor'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Obra'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tipo'
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
          FieldName = 'Monto'
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
          FieldName = 'Saldo'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 5
      Width = 27
      Height = 13
      Caption = 'Texto'
    end
    object edtDesc: TEdit
      Left = 6
      Top = 19
      Width = 185
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = ControlKeyPress
      OnKeyUp = Teclitas
    end
    object btnBuscar: TBitBtn
      Left = 192
      Top = 18
      Width = 56
      Height = 21
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = btnBuscarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 342
    Width = 564
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Color = clGray
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Panel5: TPanel
      Left = 379
      Top = 0
      Width = 185
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      Color = clGray
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
  object DataSource1: TDataSource
    DataSet = Query
    Left = 48
    Top = 176
  end
  object Query: TQuery
    OnCalcFields = QueryCalcFields
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwFacturas'
      'WHERE Pagado = 0')
    Left = 18
    Top = 176
    object QueryIdFactura: TSmallintField
      FieldName = 'IdFactura'
      Origin = 'DBR.vwFacturas.IdFactura'
      Visible = False
    end
    object QueryNumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
      Origin = 'DBR.vwFacturas.Numero'
      Size = 15
    end
    object QueryFecha: TDateTimeField
      FieldName = 'Fecha'
      Origin = 'DBR.vwFacturas.Fecha'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object QueryProveedor: TStringField
      FieldName = 'Proveedor'
      Origin = 'DBR.vwFacturas.Proveedor'
      Size = 60
    end
    object QueryObra: TStringField
      FieldName = 'Obra'
      Origin = 'DBR.vwFacturas.Obra'
      Size = 50
    end
    object QueryPagado: TBooleanField
      FieldName = 'Pagado'
      Origin = 'DBR.vwFacturas.Pagado'
    end
    object QueryTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'DBR.vwFacturas.Tipo'
      Size = 10
    end
    object QueryMonto: TFloatField
      FieldName = 'Monto'
      Origin = 'DBR.vwFacturas.Monto'
      currency = True
    end
    object QuerySaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      Calculated = True
    end
  end
end
