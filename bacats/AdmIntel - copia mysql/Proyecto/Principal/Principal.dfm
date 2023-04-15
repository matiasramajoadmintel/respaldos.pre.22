object frmPrincipal: TfrmPrincipal
  Left = 355
  Top = 217
  Width = 948
  Height = 509
  Caption = 'Sistema administrativo del departamento de Alcald'#237'a - BNMDP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormCreate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 932
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 932
    Height = 54
    ButtonHeight = 52
    ButtonWidth = 74
    Caption = 'ToolBar1'
    Customizable = True
    DisabledImages = ImageList1
    Flat = True
    HotImages = ImageList1
    Images = ImageList1
    ShowCaptions = True
    TabOrder = 1
    object btnCerrar: TToolButton
      Left = 0
      Top = 0
      Caption = '&Cerrar listado'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCerrarClick
    end
    object btnAplicar: TToolButton
      Left = 74
      Top = 0
      Caption = 'Aplicar filtro'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAplicarClick
    end
    object btnQuitar: TToolButton
      Left = 148
      Top = 0
      Caption = 'Quitar filtro'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnQuitarClick
    end
    object btnGrafico: TToolButton
      Left = 222
      Top = 0
      Caption = 'Gr'#225'fico'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGraficoClick
    end
    object btnPrevia: TToolButton
      Left = 296
      Top = 0
      Caption = 'Vista previa'
      ImageIndex = 4
      OnClick = btnPreviaClick
    end
    object btnImprimir: TToolButton
      Left = 370
      Top = 0
      Caption = 'Imprimir'
      ImageIndex = 5
      OnClick = btnImprimirClick
    end
    object btnColumnas: TToolButton
      Left = 444
      Top = 0
      Caption = 'Columnas'
      ImageIndex = 6
      OnClick = btnColumnasClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 54
    Width = 932
    Height = 378
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BorderWidth = 2
    Color = clHighlight
    TabOrder = 2
    object pnlTitulo: TPanel
      Left = 4
      Top = 4
      Width = 924
      Height = 21
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object pnlFiltro: TPanel
      Left = 4
      Top = 102
      Width = 924
      Height = 77
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 3
        Width = 34
        Height = 13
        Caption = 'Edificio'
      end
      object Label2: TLabel
        Left = 6
        Top = 39
        Width = 49
        Height = 13
        Caption = 'Proveedor'
      end
      object Label3: TLabel
        Left = 178
        Top = 40
        Width = 31
        Height = 13
        Caption = 'Desde'
      end
      object Label4: TLabel
        Left = 280
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Hasta'
      end
      object Label5: TLabel
        Left = 178
        Top = 3
        Width = 32
        Height = 13
        Caption = 'Depto.'
      end
      object Label6: TLabel
        Left = 256
        Top = 3
        Width = 52
        Height = 13
        Caption = 'Imputaci'#243'n'
      end
      object Label7: TLabel
        Left = 386
        Top = 2
        Width = 102
        Height = 13
        Caption = 'Rubro o tipo de gasto'
      end
      object ComboEdi: TComboBox
        Left = 6
        Top = 17
        Width = 171
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 0
        OnChange = ComboEdiChange
        OnClick = ComboEdiClick
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object ComboProv: TComboBox
        Left = 6
        Top = 53
        Width = 169
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 1
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object dtpIni: TDateTimePicker
        Left = 178
        Top = 53
        Width = 100
        Height = 21
        Date = 37644.742040925900000000
        Time = 37644.742040925900000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object dtpFin: TDateTimePicker
        Left = 280
        Top = 53
        Width = 100
        Height = 21
        Date = 37644.742067476900000000
        Time = 37644.742067476900000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object ComboDepto: TComboBox
        Left = 178
        Top = 17
        Width = 75
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 4
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object ComboImp: TComboBox
        Left = 256
        Top = 17
        Width = 125
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 5
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
        Items.Strings = (
          'Alcald'#237'a (01)'
          'Todos (03)'
          'Permisionario (04)')
      end
      object pnlCerrarFiltro: TPanel
        Left = 904
        Top = 1
        Width = 19
        Height = 75
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 6
        object btnCerrarPanelFiltro: TSpeedButton
          Left = 1
          Top = 0
          Width = 17
          Height = 17
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnCerrarPanelFiltroClick
        end
      end
      object rgTipoPago: TRadioGroup
        Left = 552
        Top = 4
        Width = 135
        Height = 69
        Caption = ' Tipo de pago '
        Columns = 2
        ItemIndex = 3
        Items.Strings = (
          'Cheque'
          'Efectivo'
          'CUTE'
          'Todos')
        TabOrder = 7
      end
      object rgPagado: TRadioGroup
        Left = 387
        Top = 43
        Width = 162
        Height = 30
        Caption = ' Pagado '
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'S'#237
          'No'
          'Ambos')
        TabOrder = 8
        OnClick = rgPagadoClick
      end
      object ComboRubro: TComboBox
        Left = 387
        Top = 16
        Width = 162
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        Sorted = True
        TabOrder = 9
      end
      object rgVacios: TRadioGroup
        Left = 690
        Top = 4
        Width = 69
        Height = 69
        Caption = ' Vacios '
        ItemIndex = 2
        Items.Strings = (
          'S'#237
          'No'
          'Ambos')
        TabOrder = 10
      end
      object btn1: TBitBtn
        Left = 760
        Top = 9
        Width = 64
        Height = 63
        Caption = 'Excel'
        TabOrder = 11
        OnClick = btn1Click
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000007777777777777777770000007777777777770007770000007444
          4400000006007700000074FFFF08880600080700000074F008000060EE070700
          000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
          00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
          080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
          000074F444F444F444F477000000744444444444444477000000777777777777
          777777000000777777777777777777000000}
        Layout = blGlyphBottom
      end
    end
    object pnlGrid: TPanel
      Left = 4
      Top = 179
      Width = 924
      Height = 172
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 2
      object grdDatos: TDBGrid
        Left = 5
        Top = 5
        Width = 914
        Height = 162
        Align = alClient
        BorderStyle = bsNone
        Color = clCream
        DataSource = dsDatos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = grdDatosDblClick
        OnTitleClick = grdDatosTitleClick
      end
    end
    object pnlBotones: TPanel
      Left = 4
      Top = 351
      Width = 924
      Height = 23
      Align = alBottom
      TabOrder = 3
      object btnAgregar: TSpeedButton
        Left = 4
        Top = 1
        Width = 85
        Height = 21
        Caption = 'Agregar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777777777777777777777777777777700007777770007770AA077777
          70007770AA07777777770000AA00007770000AAAAAAAA07770000AAAAAAAA077
          70000000AA00007770007770AA07777770007770AA0777777000777000077777
          7777777777777777777777777777777777777777777777777777}
        ParentFont = False
        OnClick = btnAgregarClick
      end
      object btnEliminar: TSpeedButton
        Left = 89
        Top = 1
        Width = 85
        Height = 21
        Caption = 'Eliminar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777771777777777777000117777771777
          7000711777771777777771177711777770007711771177777000771111177777
          7000777111777777700077111177777770001117711777777000777777117777
          7777777777711777777777777777777777777777777777777777}
        ParentFont = False
        OnClick = btnEliminarClick
      end
      object btnModificar: TSpeedButton
        Left = 174
        Top = 1
        Width = 85
        Height = 21
        Caption = 'Modificar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888880808888888888888888888888888
          8000808080888888800088888008888888880808800088888000888880BB0888
          8000888880BB088880008888880BB08880008888880B00888000888888801108
          8000888888800088888888888888888888888888888888888888}
        ParentFont = False
        OnClick = btnModificarClick
      end
      object btnDetalle: TSpeedButton
        Left = 259
        Top = 1
        Width = 85
        Height = 21
        Caption = 'Ver detalle'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000000
          DDDD8777777777770DDD8FFFFFFFFFF70DDD8FFFFF00FFF70DDD877777730000
          0DDD8FFFFFFF3BF300DD8FFFFFFFF3BF380D87777777773B30008FFFFFFFFFF3
          00048FFFFFFFFFF700C487777777777704FC8FFFFFFFFFF704CF8FFFFFFFFFF7
          0D4C8F0F0F0F0F0F0DD4D0F8F8F8F8F0DDDDDD0D0D0D0D0DDDDD}
        ParentFont = False
        OnClick = btnDetalleClick
      end
      object Panel2: TPanel
        Left = 548
        Top = 1
        Width = 375
        Height = 21
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object StaticText1: TStaticText
          Left = 203
          Top = 1
          Width = 170
          Height = 19
          AutoSize = False
          BorderStyle = sbsSunken
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object StaticText2: TStaticText
          Left = 31
          Top = 1
          Width = 170
          Height = 19
          AutoSize = False
          BorderStyle = sbsSunken
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object DBNavigator1: TDBNavigator
        Left = 344
        Top = 1
        Width = 100
        Height = 21
        DataSource = dsDatos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        TabOrder = 1
      end
    end
    object pnlFiltroDesc: TPanel
      Left = 4
      Top = 25
      Width = 924
      Height = 77
      Align = alTop
      TabOrder = 4
      Visible = False
      object Label8: TLabel
        Left = 6
        Top = 2
        Width = 47
        Height = 13
        Caption = 'Ocupante'
      end
      object Label9: TLabel
        Left = 6
        Top = 38
        Width = 89
        Height = 13
        Caption = 'Tipo de descuento'
      end
      object Label10: TLabel
        Left = 236
        Top = 38
        Width = 19
        Height = 13
        Caption = 'A'#241'o'
      end
      object Label11: TLabel
        Left = 236
        Top = 2
        Width = 20
        Height = 13
        Caption = 'Mes'
      end
      object Panel4: TPanel
        Left = 904
        Top = 1
        Width = 19
        Height = 75
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 1
          Top = 0
          Width = 17
          Height = 17
          Caption = 'X'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnCerrarPanelFiltroClick
        end
      end
      object edtOcupante: TEdit
        Left = 6
        Top = 16
        Width = 200
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
      object cmbTipoDescuento: TComboBox
        Left = 6
        Top = 52
        Width = 200
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object cmbMes: TComboBox
        Left = 236
        Top = 16
        Width = 200
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
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
      object cmbAnio: TComboBox
        Left = 236
        Top = 52
        Width = 200
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemHeight = 13
        ParentFont = False
        TabOrder = 4
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 598
    Top = 8
    object Archivo1: TMenuItem
      Caption = '&Archivo'
      object Reestablecercolumnas1: TMenuItem
        Caption = 'Reestablecer columnas'
        OnClick = Reestablecercolumnas1Click
      end
      object ReenumerarDECIs1: TMenuItem
        Caption = 'Reenumerar DECI'#39's'
        object Servicios5: TMenuItem
          Caption = 'Servicios en deptos. ocupados'
          OnClick = Servicios5Click
        end
        object Serviciosendeptosvacios1: TMenuItem
          Caption = 'Servicios en deptos. vacios'
          OnClick = Serviciosendeptosvacios1Click
        end
        object rabajos2: TMenuItem
          Caption = 'Trabajos'
          OnClick = rabajos2Click
        end
        object Gastosadministrativos1: TMenuItem
          Caption = 'Gastos administrativos'
          OnClick = Gastosadministrativos1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Salir1: TMenuItem
        Caption = '&Salir'
        OnClick = Salir1Click
      end
    end
    object Actualizaciones1: TMenuItem
      Caption = 'Actualizaciones'
      object itmOcupantes: TMenuItem
        Caption = 'Datos de personas'
        OnClick = itmOcupantesClick
      end
      object itmOcupaciones: TMenuItem
        Caption = 'Ocupaciones'
        OnClick = itmOcupacionesClick
      end
      object itmEspecialidades: TMenuItem
        Caption = 'Especialidades'
        OnClick = itmEspecialidadesClick
      end
      object itmGrados: TMenuItem
        Caption = 'Grados'
        OnClick = itmGradosClick
      end
      object itmCoeficientesAlquiler: TMenuItem
        Caption = 'Coeficientes de alquiler'
        OnClick = itmCoeficientesAlquilerClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object itmEdificios: TMenuItem
        Caption = 'Edificios'
        OnClick = itmEdificiosClick
      end
      object itmDepartamentos: TMenuItem
        Caption = 'Departamentos'
        OnClick = itmDepartamentosClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Personal1: TMenuItem
        Caption = 'Personal'
        OnClick = Personal1Click
      end
      object Proveedor1: TMenuItem
        Caption = 'Proveedores'
        OnClick = Proveedor1Click
      end
      object Material1: TMenuItem
        Caption = 'Materiales'
        OnClick = Material1Click
      end
      object iposdetareas1: TMenuItem
        Caption = 'Rubros'
        OnClick = iposdetareas1Click
      end
      object areas1: TMenuItem
        Caption = 'Tareas'
        OnClick = areas1Click
      end
      object Unidad1: TMenuItem
        Caption = 'Unidades de medida'
        OnClick = Unidad1Click
      end
      object Coeficientederenta1: TMenuItem
        Caption = 'Coeficiente de renta'
        OnClick = Coeficientederenta1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object itmTiposdeartefacto: TMenuItem
        Caption = 'Tipos de artefactos'
        OnClick = itmTiposdeartefactoClick
      end
      object iposdeespacioscomunes1: TMenuItem
        Caption = 'Tipos de espacios comunes'
        OnClick = iposdeespacioscomunes1Click
      end
      object Configuracindeespacioscomunes1: TMenuItem
        Caption = 'Configuraci'#243'n de espacios comunes'
        OnClick = Configuracindeespacioscomunes1Click
      end
      object iposdegastosadministrativos1: TMenuItem
        Caption = 'Tipos de gastos administrativos'
        OnClick = iposdegastosadministrativos1Click
      end
      object Servicios1: TMenuItem
        Caption = 'Tipos de servicios'
        OnClick = iposdeservicio1Click
      end
      object iposdegastosfinancieros1: TMenuItem
        Caption = 'Tipos de d'#233'bitos'
        OnClick = iposdegastosfinancieros1Click
      end
      object iposdeingresos1: TMenuItem
        Caption = 'Tipos de ingresos'
        OnClick = iposdeingresos1Click
      end
      object itmTiposdedescuentos: TMenuItem
        Caption = 'Tipos de descuentos'
        OnClick = itmTiposdedescuentosClick
      end
    end
    object Ingresos1: TMenuItem
      Caption = '&Ingresos'
      object Depsitos1: TMenuItem
        Caption = 'Cobros y dep'#243'sitos'
        OnClick = Depsitos1Click
      end
      object Crditosbancarios1: TMenuItem
        Caption = 'Cr'#233'ditos bancarios'
        OnClick = Crditosbancarios1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object itmEmitirRecibos: TMenuItem
        Caption = 'Emitir recibos'
        OnClick = itmEmitirRecibosClick
      end
      object RecibosAnulados1: TMenuItem
        Caption = 'Anular recibos'
        OnClick = RecibosAnulados1Click
      end
    end
    object Gastos1: TMenuItem
      Caption = '&Egresos'
      object Administrativos1: TMenuItem
        Caption = 'Gastos administrativos'
        OnClick = Administrativos1Click
      end
      object Financieros1: TMenuItem
        Caption = 'Gastos financieros'
        OnClick = Financieros1Click
      end
      object Mantenimiento1: TMenuItem
        Caption = 'Gastos de mantenimiento'
        object rabajosenunidades1: TMenuItem
          Caption = 'Trabajos en departamentos'
          OnClick = itmTrabajoClick
        end
        object rabajos1: TMenuItem
          Caption = 'Trabajos en edificios'
          OnClick = Edificios1Click
        end
      end
      object Gastosdeservicios1: TMenuItem
        Caption = 'Gastos de servicios'
        OnClick = Gastosdeservicios1Click
      end
    end
    object Pagos1: TMenuItem
      Caption = '&Pagos'
      object Generarpagos1: TMenuItem
        Caption = 'Generaci'#243'n pagos'
        OnClick = Pagos1Click
      end
      object Listadedeudasaproveedores1: TMenuItem
        Caption = 'Deudas a proveedores'
        OnClick = Listadedeudasaproveedores1Click
      end
      object Listapagos1: TMenuItem
        Tag = 7
        Caption = 'Pagos efectuados'
        OnClick = Listapagos1Click
      end
    end
    object Descuentos3: TMenuItem
      Caption = '&Descuentos'
      object itmDecuentosAlquileres: TMenuItem
        Caption = 'Generaci'#243'n de descuentos de alquileres'
        OnClick = itmDecuentosAlquileresClick
      end
      object itmDescuentosExpensas: TMenuItem
        Caption = 'Generaci'#243'n de descuentos de expensas'
        OnClick = itmDescuentosExpensasClick
      end
      object Descuentos2: TMenuItem
        Tag = 4
        Caption = 'Consulta de descuentos'
        OnClick = Descuentos2Click
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object Generacinexpensasdeptosvacios1: TMenuItem
        Caption = 'Generaci'#243'n expensas deptos. vacios'
        OnClick = Generacinexpensasdeptosvacios1Click
      end
    end
    object Consultas1: TMenuItem
      Caption = 'Consultas'
      object Gastos2: TMenuItem
        Caption = 'Gastos'
        object Administrativos2: TMenuItem
          Tag = 8
          Caption = 'Administrativos'
          OnClick = Administrativos2Click
        end
        object Financieros2: TMenuItem
          Tag = 9
          Caption = 'Financieros'
          OnClick = Financieros2Click
        end
        object itmLstTrab: TMenuItem
          Caption = 'Mantenimiento'
          object Departamentos2: TMenuItem
            Tag = 10
            Caption = 'Trabajos en departamentos'
            OnClick = itmLstTrabClick
          end
          object Edificios2: TMenuItem
            Tag = 11
            Caption = 'Trabajos en edificios'
            OnClick = Edificios2Click
          end
        end
        object Servicios3: TMenuItem
          Tag = 302
          Caption = 'Servicios'
          OnClick = Servicios3Click
        end
      end
      object itmIngresos: TMenuItem
        Tag = 1
        Caption = 'Ingresos de dinero'
        OnClick = itmIngresosClick
      end
      object Conciliacinbancaria1: TMenuItem
        Caption = 'Conciliaci'#243'n bancaria'
        OnClick = Conciliacinbancaria1Click
      end
      object Cheques1: TMenuItem
        Caption = 'Cheques'
        OnClick = Cheques1Click
      end
      object itmRecibosEmitidos: TMenuItem
        Tag = 13
        Caption = 'Recibos emitidos'
        Visible = False
        OnClick = itmRecibosEmitidosClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object areas2: TMenuItem
        Caption = 'Tareas'
        object Detalle1: TMenuItem
          Tag = 14
          Caption = 'Detalle'
          OnClick = Detalle1Click
        end
        object Resumen1: TMenuItem
          Tag = 15
          Caption = 'Resumen por departamento'
          OnClick = Resumen1Click
        end
        object Resumengeneral1: TMenuItem
          Tag = 16
          Caption = 'Resumen general'
          OnClick = Resumengeneral1Click
        end
      end
      object Materialesusados1: TMenuItem
        Tag = 17
        Caption = 'Materiales usados'
        OnClick = Materialesusados1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object itmOcupantesActuales: TMenuItem
        Tag = 5
        Caption = 'Ocupantes actuales'
        OnClick = itmOcupantesActualesClick
      end
      object Ocupantes1: TMenuItem
        Tag = 6
        Caption = 'Hist'#243'rico de ocupantes'
        OnClick = Ocupantes1Click
      end
      object Ocupaciones1: TMenuItem
        Caption = 'Hist'#243'rico de ocupaciones'
        OnClick = Ocupaciones1Click
      end
      object Viviendasvacias1: TMenuItem
        Caption = 'Viviendas vacias'
        OnClick = Viviendasvacias1Click
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object Cobrosaparticulares1: TMenuItem
        Tag = 2
        Caption = 'Cobros a particulares'
        OnClick = Cobrosaparticulares1Click
      end
      object Deudores1: TMenuItem
        Tag = 19
        Caption = 'Deudores'
        OnClick = Deudores1Click
      end
    end
    object Informes1: TMenuItem
      Caption = 'Informes'
      object CuentaMantenimiento1: TMenuItem
        Caption = 'Cuenta Mantenimiento'
        object porrubro1: TMenuItem
          Caption = 'por rubro'
          OnClick = CuentaMantenimiento1Click
        end
        object poredificio1: TMenuItem
          Caption = 'por edificio'
          OnClick = poredificio1Click
        end
      end
      object Cuentaservicos1: TMenuItem
        Caption = 'Cuenta Servicios (dptos. ocupados)'
        OnClick = Cuentaservicos1Click
      end
      object CuentaServiciosdptosvacios1: TMenuItem
        Caption = 'Cuenta Servicios (dptos. vacios)'
        OnClick = CuentaServiciosdptosvacios1Click
      end
      object CuentaAdministracin1: TMenuItem
        Caption = 'Cuenta Administraci'#243'n'
        OnClick = CuentaAdministracin1Click
      end
      object CuentaBanco1: TMenuItem
        Caption = 'Cuenta Gastos Financieros'
        OnClick = CuentaBanco1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object ResumenDECIsMantenimiento1: TMenuItem
        Caption = 'Resumen DECIs Mantenimiento'
        OnClick = ResumenDECIsMantenimiento1Click
      end
      object ResumenDECIsServicios1: TMenuItem
        Caption = 'Resumen DECIs Servicios'
        OnClick = ResumenDECIsServicios1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object CociliacinBancaria1: TMenuItem
        Caption = 'Cociliaci'#243'n Bancaria'
      end
      object Listadodecheques1: TMenuItem
        Caption = 'Listado de Cheques ordenado por'
        object Fecha1: TMenuItem
          Caption = 'Fecha'
          OnClick = Listadodecheques1Click
        end
        object NCheque1: TMenuItem
          Tag = 1
          Caption = 'N'#186' Cheque'
          OnClick = Listadodecheques1Click
        end
        object Proveedor2: TMenuItem
          Tag = 2
          Caption = 'Proveedor'
          OnClick = Listadodecheques1Click
        end
        object Importe1: TMenuItem
          Tag = 3
          Caption = 'Importe'
          OnClick = Listadodecheques1Click
        end
        object Cobrado1: TMenuItem
          Tag = 4
          Caption = 'Cobrado'
          OnClick = Listadodecheques1Click
        end
      end
      object Emisinlistadepagos1: TMenuItem
        Caption = 'Pagos realizados'
        OnClick = Emisinlistadepagos1Click
      end
      object Pagosporpagador1: TMenuItem
        Caption = 'Pagos por pagador'
        OnClick = Pagosporpagador1Click
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Descuentos1: TMenuItem
        Caption = 'Descuentos'
        object Alquilerpersonalcivil1: TMenuItem
          Caption = 'Alquiler personal civil'
          OnClick = Alquilerpersonalcivil1Click
        end
        object Alquilerpersonalmilitar1: TMenuItem
          Caption = 'Alquiler personal militar'
          OnClick = Alquilerpersonalmilitar1Click
        end
        object Expensaspersonalcivil1: TMenuItem
          Caption = 'Expensas personal civil'
          OnClick = Expensaspersonalcivil1Click
        end
        object Expenaspersonalmilitar1: TMenuItem
          Caption = 'Expenas personal militar'
          OnClick = Expenaspersonalmilitar1Click
        end
        object RAEpersonalcivil1: TMenuItem
          Caption = 'RAE personal civil'
          OnClick = RAEpersonalcivil1Click
        end
        object RAEpersonalmilitar1: TMenuItem
          Caption = 'RAE personal militar'
          OnClick = RAEpersonalmilitar1Click
        end
      end
      object Resumendescuentospersonalmilitar1: TMenuItem
        Caption = 'Resumen descuentos personal militar'
        OnClick = Resumendescuentospersonalmilitar1Click
      end
      object Resulemdescuentospersonalcivil1: TMenuItem
        Caption = 'Resumen descuentos personal civil'
        OnClick = Resulemdescuentospersonalcivil1Click
      end
      object Cobrosaparticulares2: TMenuItem
        Caption = 'Cobros a particulares'
        OnClick = Cobrosaparticulares2Click
      end
      object Formulariodepagos1: TMenuItem
        Caption = 'Formulario de pagos'
        OnClick = Formulariodepagos1Click
      end
      object Resumendecobros1: TMenuItem
        Caption = 'Resumen de cobros'
        OnClick = Resumendecobros1Click
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object ListadoPermisionariosTitulares1: TMenuItem
        Caption = 'Listado permisionarios titulares'
        object Personalsuperior1: TMenuItem
          Caption = 'Personal superior'
          OnClick = Personalsuperior1Click
        end
        object Personalsubalterno1: TMenuItem
          Caption = 'Personal subalterno'
          OnClick = Personalsubalterno1Click
        end
        object Personalcivil1: TMenuItem
          Caption = 'Personal civil'
          OnClick = Personalcivil1Click
        end
        object Remanentes1: TMenuItem
          Caption = 'Remanentes'
          OnClick = Remanentes1Click
        end
      end
      object Listadodedeudores1: TMenuItem
        Caption = 'Listado de deudores'
        OnClick = Listadodedeudores1Click
      end
    end
    object Estadsticas1: TMenuItem
      Caption = 'Estad'#237'sticas'
      object Servicios4: TMenuItem
        Caption = 'Servicios'
        OnClick = Servicios4Click
      end
      object Mantenimiento2: TMenuItem
        Caption = 'Mantenimiento'
        OnClick = Mantenimiento2Click
      end
      object Ingresos2: TMenuItem
        Caption = 'Ingresos'
        OnClick = Ingresos2Click
      end
      object Cheques2: TMenuItem
        Caption = 'Cheques'
        Visible = False
        OnClick = Cheques2Click
      end
      object Gastosadministrativos2: TMenuItem
        Caption = 'Gastos administrativos'
        OnClick = Gastosadministrativos2Click
      end
      object Gastosfinancieros1: TMenuItem
        Caption = 'Gastos financieros'
        OnClick = Gastosfinancieros1Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
      Visible = False
      object Contenido1: TMenuItem
        Caption = 'Contenido...'
      end
      object Novedades1: TMenuItem
        Caption = 'Novedades'
        OnClick = Novedades1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Acercade1: TMenuItem
        Caption = 'Acerca de'
      end
    end
  end
  object dsDatos: TDataSource
    Left = 620
    Top = 22
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 722
    Top = 16
    Bitmap = {
      494C010107000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000848484000000000000000000000000000000000000000000C6C6C600A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE00CECE
      CE00CECECE00DEDEDE00DEDEDE00F7FFFF00F7FFFF00FFFFFF009C9C9C004242
      4200424242004242420042424200424242004242420042424200424242004242
      420052525200424242002121210010101000FFFFFF0073737300737373006363
      6300636363005252520063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000084848400848484000000
      00000000000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000CECECE00C6C6
      C600CECECE00CECECE00DEDEDE00DEDEDE00F7FFFF00F7FFFF009C9C9C004242
      4200CEFFFF009C9CFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF009C9C9C00737373007373
      7300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484000000
      0000848484000000000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000CECECE00C6C6
      C600C6C6C600CECECE00CECECE00DEDEDE00DEDEDE00F7FFFF009C9C9C004242
      4200CEFFFF009C9CFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF009C9C9C009C9C9C007373
      7300737373006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484000000
      0000848484000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000CECECE00A5A5
      A500C6C6C600C6C6C600CECECE00CECECE00DEDEDE00DEDEDE009C9C9C004242
      4200FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00A5A5A5009C9C9C009C9C
      9C00737373007373730063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000008484840084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000CECECE00A5A5
      A500A5A5A500C6C6C600C6C6C600CECECE00CECECE00DEDEDE009C9C9C004242
      4200CEFFFF009C9CFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00A5A5A500A5A5A5009C9C
      9C009C9C9C007373730063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FF000000FFFF0000FFFF0000FF0000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000CECECE00A5A5
      A500A5A5A500A5A5A500C6C6C600C6C6C600CECECE00CECECE009C9C9C004242
      4200FFFFCE00FFCE9C0021212100FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00A5A5A500A5A5A500A5A5
      A5009C9C9C009C9C9C0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084000000FF000000FFFF0000FFFF0000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C600FFFFFF00000000000000000000000000CECECE00A5A5
      A500A5A5A500A5A5A500A5A5A500C6C6C600C6C6C600CECECE009C9C9C004242
      4200CEFFFF000000000021212100CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00A5A5A500A5A5A500A5A5
      A500A5A5A5009C9C9C0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FF000000FFFF0000FFFF0000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000CECECE009C9C
      9C00A5A5A500A5A5A500A5A5A500A5A5A500C6C6C600C6C6C6009C9C9C004242
      4200212121000063FF0000CEFF00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00C6C6C600A5A5A500A5A5
      A500A5A5A500A5A5A50063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FF000000FFFF0000FFFF0000FF000000FF000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6008400000084000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600840000008400
      0000C6C6C600C6C6C600FFFFFF00000000000000000000000000CECECE009C9C
      9C009C9C9C00A5A5A500A5A5A500A5A5A500A5A5A500C6C6C6009C9C9C004242
      420021212100009CFF00A5A5A500CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00C6C6C600C6C6C600A5A5
      A500A5A5A500A5A5A50063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FF00
      0000FFFF0000FFFF0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600FFFF0000FFFF0000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF0000FFFF
      0000C6C6C600C6C6C600FFFFFF00000000000000000000000000CECECE007373
      73009C9C9C009C9C9C00A5A5A500A5A5A500A5A5A500A5A5A5009C9C9C002121
      21000063FF0000CEFF00FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00CECECE00C6C6C600C6C6
      C600A5A5A500A5A5A50063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FF000000FFFF
      0000FFFF0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00000000000000000000000000CECECE007373
      7300737373009C9C9C009C9C9C00A5A5A500A5A5A500A5A5A5009C9C9C002121
      2100009CFF00A5A5A500CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00CECECE00CECECE00C6C6
      C600C6C6C600A5A5A50063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400FF000000FFFF0000FFFF
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000CECECE006363
      630073737300737373009C9C9C009C9C9C00A5A5A5009C9C9C00212121000063
      FF0000CEFF00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00DEDEDE00CECECE00CECE
      CE00C6C6C600C6C6C60063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000848484000000000084840000FFFF0000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CECECE006363
      63006363630073737300737373009C9C9C009C9C9C009C9C9C0021212100009C
      FF00A5A5A5009C9CFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00DEDEDE00DEDEDE00CECE
      CE00CECECE00C6C6C60063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00000000000000000084848400848484008484
      840084848400848484008484840000000000000000000000000084848400FF00
      0000FFFFFF00FFFFFF00FFFFFF000000840000008400FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000CECECE005252
      5200636363006363630073737300737373009C9C9C00212121006363FF0000BD
      0000FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE9C00FFFFCE00FFCE
      9C00FFFFCE00FFCE9C00FFFFCE0010101000FFFFFF00F7FFFF00DEDEDE00DEDE
      DE00CECECE00CECECE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF0000000000000000000000000000008400FFFFFF00FFFF
      FF000000840000008400FFFFFF0084848400000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000008400FFFFFF00FFFFFF0000008400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6008484840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000000000C6C6C600FFFFFF000000
      0000000000000000000000000000000000000000000000000000CECECE005252
      52005252520063636300636363007373730073737300212121009C9CFF000000
      DE00CEFFFF009C9CFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
      FF00CEFFFF00CEFFFF00CEFFFF0010101000FFFFFF00F7FFFF00F7FFFF00DEDE
      DE00DEDEDE00CECECE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000000000000000840000008400FFFFFF00FFFF
      FF000000840000008400FFFFFF00FFFFFF00848484000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000008400FFFFFF00FFFFFF0000008400FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6008484840000000000C6C6C600C6C6C60084848400848484008484
      840084848400C6C6C60084848400848484008484840084848400C6C6C6008484
      84008484840084848400C6C6C600FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000CECECE004242
      42005252520052525200636363006363630073737300212121000000DE004242
      4200424242004242420042424200424242004242420042424200424242004242
      420042424200424242004242420010101000FFFFFF00FFFFFF00F7FFFF00F7FF
      FF00DEDEDE00DEDEDE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF000000000000000000FFFFFF000000840000008400FFFFFF00FFFF
      FF000000840000008400FFFFFF00000084000000840084848400000000000000
      840000008400FFFFFF0000008400FFFFFF00FFFFFF0000008400FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6008484840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000CECECE004242
      4200424242005252520052525200636363006363630073737300737373009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C00FFFFFF00FFFFFF00FFFFFF00F7FF
      FF00F7FFFF00DEDEDE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF000000840000008400FFFFFF00FFFF
      FF000000840000008400000084000000840000008400FFFFFF00848484000000
      0000FFFFFF00FFFFFF0000008400FFFFFF00FFFFFF0000008400FFFFFF000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600848484008484840000000000C6C6C600C6C6C60084848400C6C6C6008484
      84008484840084848400C6C6C6008484840084848400C6C6C600848484008484
      84008484840084848400FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7FFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF000000840000008400FFFFFF00FFFF
      FF0000008400000084000000840000008400FFFFFF00FFFFFF00848484000000
      000000008400FFFFFF00FFFFFF000000840000008400FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00848484008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE00DEDEDE00F7FFFF00DEDEDE00CECECE00C6C6C600A5A5A500A5A5A5009C9C
      9C00737373006363630052525200525252000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF000000840000008400FFFFFF00FFFF
      FF00000084000000840000008400FFFFFF00FFFFFF00FFFFFF00848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00DEDEDE00F7FFFF00DEDEDE00CECECE00C6C6C600A5A5A500A5A5
      A5009C9C9C007373730063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF0000008400000084000000840000008400FFFF
      FF000000840000008400FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CECECE00DEDEDE00F7FFFF00DEDEDE00CECECE00C6C6C600A5A5
      A500A5A5A5009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CECECE00DEDEDE00F7FFFF00DEDEDE00CECECE00C6C6
      C600A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF008484840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00848484000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF0000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF000000000084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00848484008484840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000008484840000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084848400848484008484
      8400848484008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005252
      5200525252005252520052525200525252005252520000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000800000008000000
      08000000080000000800000008000000080000000800000008006B6B73006B6B
      73006B6B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000800000008000000
      08000000080000000800000008000000080000000800000008006B6B73006B6B
      73006B6B73000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C0063636300A5A5
      A500A5A5A5009C9C9C0073737300737373006363630063636300525252000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000008000000080000000800EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7DEE700000008000000
      0800000008006B6B73006B6B73006B6B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000008000000080000000800EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7DEE700000008000000
      0800000008006B6B73006B6B73006B6B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00F7FFFF00FFFFFF004242
      4200101010001010100010101000101010001010100052525200636363005252
      5200000000000000000000000000000000000000000000000000000000000000
      00000000080000000800E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700EFE7E700E7CECE00DEBD
      BD00D6A5AD0000000800000008006B6B73006B6B73006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000080000000800E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700EFE7E700E7CECE00DEBD
      BD00D6A5AD0000000800000008006B6B73006B6B73006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009C9C9C00C6C6C600CECECE00424242002121
      210021212100DEDEDE0021212100212121001010100010101000525252006363
      6300000000000000000000000000000000000000000000000000000000000000
      0800DEADB500DEBDBD00E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7E7E700E7CECE00DEBD
      BD00D6A5AD00CE9C9C00CE9C9C00000008006B6B73006B6B73006B6B73000000
      0000000000000000000000000000000000000000000000000000000000000000
      0800DEADB500DEBDBD00E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7E7E700E7CECE00DEBD
      BD00D6A5AD00CE9C9C00CE9C9C00000008006B6B73006B6B73006B6B73000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF9C9C0063636300A5A5A50042424200DEDEDE002121
      210010101000000000000000000021212100DEDEDE0010101000101010005252
      520042424200000000000000000000000000000000000000000000000800D6AD
      AD00D6ADB500DEBDBD00E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7E7E700E7CECE00DEBD
      BD00D6ADAD00CE9C9C00CE9C9C00CE9C9C00000008006B6B73006B6B73006B6B
      7300000000000000000000000000000000000000000000000000000008000000
      FF000000FF000000FF00E7C6C600E7CECE00EFD6D600EFDEDE00F7E7E700F7EF
      EF00FFF7F700FFFFFF00FFFFFF00FFFFFF00FFF7F700F7E7E700E7CECE00DEBD
      BD00D6ADAD00CE9C9C00CE9C9C00CE9C9C00000008000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00000000000000000000000000000000000000000084848400FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000636363009C9C9C004242420021212100212121002121
      2100F7FFFF00F7FFFF00F7FFFF00000000002121210021212100101010005252
      5200424242000000000000000000000000000000000000000800CEA5A500D6AD
      AD00DEB5B500DEBDBD00E7C6C600E7CECE00EFD6D60000080800080810000008
      0800000808000808080000000800000008000000080000000800EFCED600DEBD
      BD00D6ADAD00CE9C9C00CE9C9C00CE9C9C00CE9C9C00000008006B6B73006B6B
      73006B6B73000000000000000000000000000000000000000800CEA5A5000000
      FF000000FF000000FF000000FF00E7CECE00EFD6D60000080800080810000008
      0800000808000808080000000800000008000000080000000800EFCED600DEBD
      BD00D6ADAD00CE9C9C00CE9C9C00CE9C9C000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000FFFFFF008484
      8400000000000000000084848400FF0000008484840084000000000000008484
      840000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400000000008484
      84000000000084848400FF00FF0084848400FF00FF0000000000848484008484
      8400000000008484840000000000000000000000000000000000000000000000
      000000000000FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C00636363009C9C9C00424242002121210021212100F7FF
      FF00A5A5A500A5A5A500A5A5A500F7FFFF000000000021212100101010005252
      520042424200FF9C9C00FF9C9C00FF9C9C0000000800CE9C9C00D6A5A500D6AD
      AD00DEB5B500DEBDBD00080810000808100008081000EFEFEF00E7E7E700DEDE
      E700DEDEDE00D6D6D600D6D6D600CECECE00C6C6CE00C6C6C600000008000000
      080000000800CE9C9C00CE9C9C00CE9C9C00CE9C9C00CE9C9C00000008006B6B
      73006B6B730000000000000000000000000000000800CE9C9C00D6A5A5000000
      FF000000FF000000FF000000FF000000FF0008081000EFEFEF00E7E7E700DEDE
      E700DEDEDE00D6D6D600D6D6D600CECECE00C6C6CE00C6C6C600000008000000
      080000000800CE9C9C00CE9C9C000000FF000000FF000000FF000000FF000000
      FF006B6B73000000000000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF00000084848400FF00000084000000840000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000000
      000000000000FF00FF0084848400FF00FF008484840084008400000000008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000737373007373730042424200DEDEDE0021212100DEDE
      DE00A5A5A500A5A5A500A5A5A500F7FFFF0000000000DEDEDE00101010005252
      5200424242000000000000000000FF9C9C0000080800CE9CA500D6A5A500D6AD
      AD000808100008081000F7FFFF00F7F7F700EFEFEF00EFEFEF00E7EFEF00E7E7
      E700DEDEDE00D6D6DE00D6D6D600CECECE00CECECE00C6C6C600BDBDC600BDBD
      C600B5B5B5000000080000000800CE9C9C00CE9C9C00CE9C9C00000008006B6B
      73006B6B73006B6B7300000000000000000000080800CE9CA500D6A5A500D6AD
      AD00080810000000FF000000FF000000FF000000FF00EFEFEF00E7EFEF00E7E7
      E700DEDEDE00D6D6DE00D6D6D600CECECE00CECECE00C6C6C600BDBDC600BDBD
      C600B5B5B500000008000000FF000000FF000000FF000000FF00000008006B6B
      73006B6B73006B6B730000000000000000000000000000000000FFFFFF008484
      8400848484000000000084848400FF0000008484840084000000840000008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000848484008484840000000000848484000000000000000000C6C6C6007373
      7300737373007373730073737300737373007373730073737300737373007373
      730073737300737373006363630073737300424242002121210021212100DEDE
      DE00A5A5A500A5A5A500A5A5A500F7FFFF00101010002121210010101000A5A5
      A500424242005252520000000000FF9C9C0000000800D6A5A500D6A5AD000008
      1000FFFFFF00FFFFFF00F7FFFF00F7F7F7000808180008101800081018000808
      1800001010000808100000080800080808000808100000080800BDBDC600B5BD
      C600B5B5B500ADADAD00ADADAD0000000800CE9C9C00CE9C9C00000008006B6B
      73006B6B73006B6B7300000000000000000000000800D6A5A500D6A5AD000008
      1000FFFFFF000000FF000000FF000000FF000000FF000000FF00081018000808
      1800001010000808100000080800080808000808100000080800BDBDC600B5BD
      C600B5B5B5000000FF000000FF000000FF000000FF000000FF00000008006B6B
      73006B6B73006B6B730000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF00000084848400FF00000084000000840000008400
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00C6C6
      C600A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A5006363630063636300FFFFFF0021212100212121002121
      2100F7FFFF00F7FFFF00F7FFFF0021212100212121002121210052525200C6C6
      C600424242005252520000000000FF9C9C0000080800CE9CA50008081000FFFF
      FF00FFFFFF00FFFFFF001010210008102100D6A5AD00D6A5AD00D6A5AD00D6A5
      AD00D6A5AD00CE9CA500CE9CA500CE9CA500CE9CA500CE9CA500000008000000
      080000000800ADADAD00ADADAD00A5A5A50000000800CE9C9C00000008006B6B
      73006B6B73006B6B7300000000000000000000080800CE9CA50008081000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000FF00D6A5
      AD00D6A5AD00CE9CA500CE9CA500CE9CA500CE9CA500CE9CA500000008000000
      08000000FF000000FF000000FF000000FF000000FF00CE9C9C00000008006B6B
      73006B6B73006B6B730000000000000000000000000000000000FFFFFF008484
      8400848484000000000084848400FF0000008484840084000000840000008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDEDE00CECECE00CECECE00CECE
      CE00C6C6C600CECECE0052525200636363007373730042424200DEDEDE002121
      210021212100212121002121210021212100DEDEDE0042424200F7FFFF00CECE
      CE00424242005252520000000000FF9C9C000808100008081000FFFFFF00FFFF
      FF00FFFFFF0010102100EFA5AD00EFA5AD00EFADB500EFADB500EFADB500EFAD
      B500EFA5AD00EFA5A500EFA5A500EF9CA500EF9CA500E79C9C00E79C9C00E79C
      9C00E79C9C0000000800ADADAD00A5A5A500A5A5A50000000800000008006B6B
      73006B6B73006B6B730000000000000000000808100008081000FFFFFF00FFFF
      FF00FFFFFF0010102100EFA5AD000000FF000000FF000000FF000000FF000000
      FF00EFA5AD00EFA5A500EFA5A500EF9CA500EF9CA500E79C9C00E79C9C000000
      FF000000FF000000FF000000FF000000FF00A5A5A50000000800000008006B6B
      73006B6B73006B6B730000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF00000084848400FF00000084000000840000008400
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDEDE00CECECE00CECE
      CE00CECECE00C6C6C60052525200525252007373730073737300424242002121
      210021212100DEDEDE00212121002121210042424200C6C6C600CECECE00F7FF
      FF00525252005252520000000000FF9C9C0008081000FFFFFF00FFFFFF00FFFF
      FF0010102100BD9CAD00FFADB500FFADC600FFADC600FFADC600FFADC600FFAD
      C600FFA5B500FFA5AD00FFA5A500FF9CA500FF9CA500FF9C9C00FF9C9C00FF9C
      9C00FF9C9C00FF9C9C0000000800A5A5A500A5A5A5009C9C9C00000008006B6B
      73006B6B73006B6B7300000000000000000008081000FFFFFF00FFFFFF00FFFF
      FF0010102100BD9CAD00FFADB500FFADC600FFADC6000000FF000000FF000000
      FF000000FF00FFA5AD00FFA5A500FF9CA500FF9CA500FF9C9C000000FF000000
      FF000000FF000000FF0000000800A5A5A500A5A5A5009C9C9C00000008006B6B
      73006B6B73006B6B730000000000000000000000000000000000FFFFFF008484
      8400848484000000000084848400FF0000008484840084000000840000008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDEDE00CECE
      CE00CECECE00CECECE0052525200525252005252520052525200424242004242
      4200525252005252520052525200525252004242420052525200525252005252
      5200525252005252520000000000FF9C9C0010101800FFFFFF00FFFFFF001818
      2100E7A5C600E7A5C600BD9CAD00FFB5C600FFB5C600FFB5C600FFB5C600FFAD
      BD00FFADC600FFA5B500FF9CAD00FF9CA500FF9CA500FF9CA500FF9CA500FF9C
      9C00FF9C9C00C6A5B5006B312900000008009CA5A5009C9C9C00000008006B6B
      73006B6B730000000000000000000000000010101800FFFFFF00FFFFFF001818
      2100E7A5C600E7A5C600BD9CAD00FFB5C600FFB5C6000000FF000000FF000000
      FF000000FF000000FF00FF9CAD00FF9CA500FF9CA5000000FF000000FF000000
      FF000000FF000000FF006B312900000008009CA5A5009C9C9C00000008006B6B
      73006B6B73000000000000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF00000084848400FF00000084000000840000008400
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00CECECE00DEDE
      DE00CECECE00CECECE00DEDEDE00424242004242420000000000212121002121
      2100000000000000000000000000000000000000000052525200212121005252
      52009C9C9C005252520000000000FF9C9C0008081000FFFFFF00FFFFFF001818
      2900E7A5C600E7A5C600E7A5C600BD9CAD00BD9CAD00FFADC600FFADC600FFAD
      C600FFA5BD00FFA5BD00FFA5AD00FFA5A500FFA5A500FF9CA500FF9CA500EF9C
      AD00C6A5B500733129006B31290000000800A5A5A5009C9C9C00000008006B6B
      73006B6B730000000000000000000000000008081000FFFFFF00FFFFFF001818
      2900E7A5C600E7A5C600E7A5C600BD9CAD00BD9CAD00FFADC6000000FF000000
      FF000000FF000000FF000000FF00FFA5A5000000FF000000FF000000FF000000
      FF000000FF00733129006B31290000000800A5A5A5009C9C9C00000008006B6B
      73006B6B73000000000000000000000000000000000000000000FFFFFF008484
      8400848484000000000084848400FF0000008484840084000000840000008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00CECE
      CE00DEDEDE00CECECE00CECECE0042424200F7FFFF0000000000101010001010
      1000101010001010100010101000101010000000000052525200F7FFFF005252
      52009C9C9C005252520000000000FF9C9C0000081000FFFFFF00FFFFFF001010
      2100E7A5C600E7A5C600E7A5C600E7A5BD00E7A5BD00BD9CAD00C6A5B500C6A5
      B500C6A5B500C6A5B500C6A5B500C6A5B500C6A5B500C6A5B500C6A5B500A55A
      52007B393900733931006B39390008101800A5ADAD009CA5A500001010006B6B
      73000000000000000000000000000000000000081000FFFFFF00FFFFFF001010
      2100E7A5C600E7A5C600E7A5C600E7A5BD00E7A5BD00BD9CAD00C6A5B5000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF007B393900733931006B39390008101800A5ADAD009CA5A500001010006B6B
      7300000000000000000000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF00000084848400FF00000084000000840000008400
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDE
      DE00CECECE00DEDEDE00CECECE0042424200F7FFFF000000000010101000C6C6
      C600636363005252520042424200101010000000000052525200F7FFFF005252
      52009C9C9C005252520000000000FF9C9C0008081000FFFFFF00FFFFFF00FFFF
      FF0010103100E7A5C600E7A5C600E7A5BD00E7A5BD00E7A5BD00DE9CB500CE8C
      A500CE8CA500C67B9C00B56B7300AD636300A55A5A0094524A008C4A4A00844A
      42007B4A42007342390008081000ADA5AD00A5A5A500A59C9C00080000000000
      00000000000000000000000000000000000008081000FFFFFF00FFFFFF00FFFF
      FF0010103100E7A5C600E7A5C600E7A5BD00E7A5BD00E7A5BD00DE9CB500CE8C
      A500CE8CA5000000FF000000FF000000FF000000FF000000FF008C4A4A00844A
      42007B4A42007342390008081000ADA5AD00A5A5A500A59C9C00080000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400848484000000000000000000000000000000000084000000840000008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDE
      DE00DEDEDE00CECECE00DEDEDE0052525200F7FFFF005252520010101000A5A5
      A50010101000101010002121210010101000000000009C9C9C00F7FFFF005252
      52009C9C9C005252520000000000FF9C9C000000000008081000FFFFFF00FFFF
      FF00FFFFFF0021216300E7A5C600E7A5BD00E7A5BD00E7A5BD00DE9CB500CE8C
      A500CE8CA500C67B9C00B5737B00AD636B00A55A5A0094524A008C524A008452
      4A007B42390008000800ADADAD00A5A5A5009CA5A50000000800000000000000
      0000000000000000000000000000000000000000000008081000FFFFFF00FFFF
      FF00FFFFFF0021216300E7A5C600E7A5BD00E7A5BD00E7A5BD00DE9CB500CE8C
      A500CE8CA5000000FF000000FF000000FF000000FF000000FF000000FF008452
      4A007B42390008000800ADADAD00A5A5A5009CA5A50000000800000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00008484840000000000FF000000FF000000FF00000084848400840000008400
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDE
      DE00DEDEDE00DEDEDE00C6C6C600DEDEDE0042424200F7FFFF0010101000A5A5
      A5006363630063636300101010001010100010101000F7FFFF009C9C9C00C6C6
      C6009C9C9C005252520000000000FF9C9C00000000000000000008081000FFFF
      FF00FFFFFF00FFFFFF002931630042427B008C73A500E7A5BD00DE9CB500CE8C
      A500CE84A500C67B9400B56B7300AD636B00A55A5A009C5A5A00945252001008
      100063636300ADADAD00ADADAD00A5A5A5000000080000000000000000000000
      000000000000000000000000000000000000000000000000000008081000FFFF
      FF00FFFFFF00FFFFFF002931630042427B008C73A500E7A5BD00DE9CB500CE8C
      A500CE84A5000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0063636300ADADAD00ADADAD00A5A5A5000000080000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000008484840000000000FF000000FF000000FF000000848484008400
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00DEDEDE00F7FF
      FF00DEDEDE00DEDEDE00DEDEDE00C6C6C60052525200F7FFFF009C9C9C001010
      100073737300737373000000000010101000F7FFFF00F7FFFF0052525200C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000001010
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B0029296300313163002121
      5A0021215A002118310010183100080810000808100063636300636363009C9C
      9C00B5B5BD00ADB5B500ADADB500000818006B6B73006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF007B7B7B0029296300313163002121
      5A000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00ADB5B500ADADB500000818006B6B73006B6B7300000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000084848400000000008484840000000000FF000000FF000000FF0000008484
      84000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00DEDE
      DE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C60052525200F7FFFF00F7FF
      FF009C9C9C009C9C9C0000000000F7FFFF00F7FFFF0052525200C6C6C600C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      00001818210018182900FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFF700E7EF
      EF00E7E7E700DEDEDE00D6D6D600CECED600CECECE00C6C6CE00BDC6CE00BDBD
      C600B5BDC60000102100001008009CA59C00000800006B6B73006B6B73000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001818210018182900FFFFFF00FFFFFF00FFFFFF00F7F7F700EFEFF7000000
      FF000000FF000000FF000000FF000000FF00CECECE000000FF000000FF000000
      FF000000FF000000FF00001008009CA59C00000800006B6B73006B6B73000000
      0000000000000000000000000000000000000000000000000000FFFFFF008484
      8400000000008484840000000000848484000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      84000000000084848400FF00FF0084848400FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00C6C6C600424242009C9C
      9C00A5A5A500A5A5A500000000009C9C9C0052525200C6C6C600C6C6C600C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      00000000000000000000181829001818310018183100EFEFF700EFEFEF00E7E7
      E700DEDEE700D6D6DE00D6D6D600D6D6D600CECECE00DEE7D600BDC6CE000810
      180008101800CECED600B5B5B5009C9C9C009C9C9C00081810006B6B73006B6B
      7300000000000000000000000000000000000000000000000000000000000000
      000000000000000000001818290018183100181831000000FF000000FF000000
      FF000000FF000000FF00D6D6D600D6D6D600CECECE00DEE7D6000000FF000000
      FF000000FF000000FF000000FF009C9C9C009C9C9C00081810006B6B73006B6B
      7300000000000000000000000000000000000000000000000000FFFFFF000000
      0000848484000000000084848400000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      840000000000FF00FF0084848400FF00FF008484840084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00DEDEDE00101010002121
      2100C6C6C600C6C6C600101010001010100000000000C6C6C600C6C6C600C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000010102100101021001010
      210010101800080810000808100008101800081018000810180008101800C6C6
      C600EFEFEF00FFFFFF00C6C6C600A5A5A5009C9C9C0018211800001008006B6B
      73006B6B73000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000808100008081000081018000810180008101800081018000000
      FF000000FF000000FF000000FF000000FF009C9C9C0018211800001008006B6B
      73006B6B73000000000000000000000000000000000000000000FFFFFF008484
      8400000000008484840000000000848484000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      840000000000FF00FF00FF00FF00FF00FF00FF00FF0084008400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00DEDEDE00737373000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C600C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000810
      1800C6C6C600EFEFEF00FFFFFF00BDB5BD003942390029312900102118000008
      10006B6B73006B6B730000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000810
      18000000FF000000FF000000FF000000FF000000FF0029312900102118000008
      10006B6B73006B6B730000000000000000000000000000000000FFFFFF000000
      0000848484000000000084848400000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000848400008484000084
      84000000000000000000FF00FF00FF00FF00FF00FF0084848400840084000000
      0000000000000000000000000000000000000000000000000000DEDEDE00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00F7FFFF00DEDEDE00F7FFFF00DEDEDE00737373000000
      00000000000000000000000000000000000000000000C6C6C600CECECE00C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000081018000008080000000800000008004A524A0039423900213129000818
      1800000008006B6B73006B6B7300000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000081018000000FF000000FF000000FF000000FF000000FF00213129000818
      1800000008006B6B73006B6B7300000000000000000000000000FFFFFF008484
      8400000000008484840000000000848484000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000848400008484000084
      8400000000000000000000000000FF00FF00FF00FF00FF00FF00848484000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600DEDEDE00F7FFFF00DEDEDE00DEDEDE00737373004242
      42004242420042424200424242004242420000000000CECECE00C6C6C600C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000001008007B7B7B0073737300949494004A524A00313939001821
      290008080800000008006B6B73006B6B73000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000001008000000FF000000FF000000FF000000FF000000FF001821
      290008080800000008006B6B73006B6B7300000000000000000000000000FFFF
      FF00848484000000000084848400000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000848400008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600DEDEDE00F7FFFF00DEDEDE00737373007373
      73007373730073737300737373007373730000000000C6C6C600CECECE00C6C6
      C6009C9C9C005252520000000000FF9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000800007B847B006B73730094949400424A52002929
      29001818180000000800000008006B6B73000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000800000000FF000000FF000000FF000000FF000000
      FF001818180000000800000008006B6B73000000000000000000000000000000
      0000FFFFFF008484840000000000848484000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60073737300A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A50000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000810007B7B84006B6B7300949494003939
      3900292929001010100000000800000008000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000810000000FF000000FF000000FF000000
      FF000000FF001010100000000800000008000000000000000000000000000000
      000000000000FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00737373007373
      73007373730073737300737373007373730000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000080073737300636363009494
      9400393939002121210008080800000008000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000008000000FF000000FF000000
      FF000000FF002121210008080800000008000000000000000000000000000000
      00000000000000000000FFFFFF00848484000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600737373004242
      42004242420042424200424242004242420000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000800737373005A5A
      5A00949494003131310018181800080808000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000008000000FF000000
      FF000000FF003131310018181800080808000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A5
      A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5A500A5A5
      A500A5A5A500A5A5A500A5A5A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000008006B6B
      73005A5A5A006B6B730029292900181818000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000008000000
      FF000000FF006B6B730029292900181818000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      080000000800000008005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      080000000800000008005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E0000007F800000F8000000000000000
      EFFFFFF7E00000078000000000000000E0000017C00000038000000000000000
      E0000017800000038000000000000000E0000017000000038000000000000000
      E0000017000000038000000000000000E0000017000000008000000000000000
      E0000017800000008000000000000000E0000017800000008000000000000000
      E0000017800000008000000000000000E0000017800000008000000000000000
      E0000017800000008000000000000000E0000017800000008000000000000000
      E0000017C00000008000000000000000E0008017C00000018000000000000000
      E0004017E000000F8000000000000000E0000017E000000F8000000000000000
      E0000017C000001F8000000000000000E0000017C000001F8000000000000000
      E00000178000003F8000000000000000E00000178000003FC000000000000000
      E00000178000003FE000FFFF00000000E0000017F80000FFF001FFFF00000000
      E0000017F00001FFF803FFFF00000000E0000017F00001FFFC07FFFF00000000
      E0000007E00003FFFFFFFFFF00000000E000004FE00003FFFFFFFFFF00000000
      E000009FC00007FFFFFFFFFF00000000E000013FC00007FFFFFFFFFF00000000
      E000007F80000FFFFFFFFFFF00000000E00000FF80000FFFFFFFFFFF00000000
      E00001FF80001FFFFFFFFFFF00000000FFFFE07FFF8007FFFF8007FFFFFFFFFF
      FFFF801FFC0000FFFC0000FFC000003FFFFF000FF000003FF000003F8000001F
      FFFE000FE000001FE000001F9FFFFFCFFFFC0007C000000FC000000780000007
      FFFC0007800000078000000780000003F8000000000000070000000790000001
      800000000000000300000003800000008000000000000003000000039000000E
      800000000000000300000003800000008000000000000003000000039000000F
      8000000000000003000000038000000F8000000000000007000000079000000F
      8000000000000007000000078000000F800000000000000F0000000F9000000F
      800000000000001F0000001F8380000F800000008000003F8000003F9000000F
      80000000C000007FC000007F8800000F80000000E000003FE000003F9400000F
      80000000F000001FF000001F8A00000F80000000FC00000FFC00000F9570000F
      80000000FF800007FF8000078A70000F80000000FFFFE003FF07E0039570000F
      80000000FFFFF001FE0FF0018A70040F80000000FFFFF800F83FF800C570060F
      80000000FFFFFC00F87FFC00E27047FF80000001FFFFFE00F07FFE00F17827FF
      80000001FFFFFF00E0FFFF00F87C17FF80000001FFFFFF80E3FFFF80FC7E07FF
      C0000003FFFFFFC0E7FFFFC0FE7FFFFFE001C07FFFFFFFE1FFFFFFE1FF7FFFFF
      F003FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object dsDepto: TDataSource
    Left = 652
    Top = 26
  end
  object Q: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT Serv_edif.COSTO, Serv_edif.NRO_FACT, Serv_edif.IDPERSONA,' +
        ' Vw_personas_2.OCUPANTE, Vw_personas_2.TIPO, Vw_personas_2.MATRI' +
        'CULA, serv_edif.fecha_pago'
      'FROM SERV_EDIF Serv_edif'
      '   LEFT OUTER JOIN VW_PERSONAS_2 Vw_personas_2'
      '   ON  (Serv_edif.IDPERSONA = Vw_personas_2.IDOCUPANTE)'
      'WHERE  Serv_edif.A_PAGAR_OCUPANTE = '#39'Si'#39';')
    Left = 688
    Top = 18
  end
  object PAR_: TTable
    DatabaseName = 'ADB'
    TableName = 'PARAMETRO'
    Left = 644
    Top = 6
    object PAR_DIVISOR_RENTA: TFloatField
      FieldName = 'DIVISOR_RENTA'
    end
  end
  object scExcelExport1: TscExcelExport
    DataPipe = dpDataSet
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = -19
    FontHeader.Name = 'MS Sans Serif'
    FontHeader.Style = [fsBold]
    FontHeader.Alignment = haGeneral
    FontHeader.WrapText = False
    FontHeader.Orientation = 0
    HeaderText.Strings = (
      'REPORTE DE CONSULTA'
      'ARMADA ARGENTINA - ALCALDIA BNMDP'
      ''
      '-----------------------------------------------------'
      '')
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = False
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.WrapText = False
    FontTitles.Orientation = 0
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.WrapText = False
    FontData.Orientation = 0
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.WrapText = False
    FontSummary.Orientation = 0
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'MS Sans Serif'
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.WrapText = False
    FontFooter.Orientation = 0
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'MS Sans Serif'
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.WrapText = False
    FontGroup.Orientation = 0
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    BeginRowTitles = 6
    BeginRowData = 7
    Left = 840
    Top = 184
  end
  object masterkey: TZConnection
    Protocol = 'mysql-3.20'
    HostName = 'localhost'
    Port = 3306
    Database = 'admintel_test'
    User = 'root'
    AutoCommit = True
    ReadOnly = False
    TransactIsolationLevel = tiNone
    Connected = True
    SQLHourGlass = False
    Left = 856
    Top = 16
  end
end
