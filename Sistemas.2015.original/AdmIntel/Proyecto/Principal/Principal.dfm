object frmPrincipal: TfrmPrincipal
  Left = 29
  Top = 109
  Width = 812
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
    Top = 444
    Width = 804
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
    Width = 804
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
    Width = 804
    Height = 390
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BorderWidth = 2
    Color = clHighlight
    TabOrder = 2
    object pnlTitulo: TPanel
      Left = 4
      Top = 4
      Width = 796
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
      Width = 796
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
        Left = 776
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
    end
    object pnlGrid: TPanel
      Left = 4
      Top = 179
      Width = 796
      Height = 184
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      TabOrder = 2
      object grdDatos: TDBGrid
        Left = 5
        Top = 5
        Width = 786
        Height = 174
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
      Top = 363
      Width = 796
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
        Left = 420
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
      Width = 796
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
        Left = 776
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
    Left = 566
    Top = 24
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
    Left = 202
    Top = 16
    Bitmap = {
      494C010107000900040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000006000000001001000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      0000000010421042104210421042104210421042104210421042104210421042
      1042104210420000000010420000000000000000000018639452945294529452
      9452945294529452945294529452945294529452945294529452945294529452
      9452945294529452945294529452734E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000010421042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003967396739677B6F7B6F
      FE7FFE7FFF7F734E0821082108210821082108210821082108214A2908218410
      4208FF7FCE39CE398C318C314A298C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000104210420000000000001863
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000039671863396739677B6F
      7B6FFE7FFE7F734E0821F97F737EF97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F734ECE39CE398C318C318C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000001042104210420000104200001042
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318630000000000000000000039671863186339673967
      7B6F7B6FFE7F734E0821F97F737EF97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F734E734ECE39CE398C318C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000001042104210420000104200001042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210421042104210420000000000000000000039679452186318633967
      39677B6F7B6F734E0821FF673F4FFF673F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7F9452734E734ECE39CE398C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      10001F001F001F00000000000000000000001042104200001042000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000018630000000039679452945218631863
      396739677B6F734E0821F97F737EF97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F94529452734E734ECE398C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1000
      1F00FF03FF031F00000000000000000000000000000010420000104218631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863FF7F00000000000039679452945294521863
      186339673967734E0821FF673F4F84103F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7F945294529452734E734E8C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F00
      FF03FF031F001F00000000000000000000000000000010420000104218630000
      1863000018630000186300001863000018630000186300001863000018630000
      1863000018630000186300001863FF7F00000000000039679452945294529452
      186318633967734E0821F97F00008410F97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F9452945294529452734E8C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F00FF03
      FF031F001F00FF7F000000000000000000000000000010420000104218631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863FF7F0000000000003967734E945294529452
      945218631863734E08218410807D207F3F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7F186394529452945294528C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F00FF03FF03
      1F001F00FF7FFF7F000000000000000000000000000010420000104218631863
      1863186318631863186318631863186310001000186318631863186318631863
      1863186318631000100018631863FF7F0000000000003967734E734E94529452
      945294521863734E08218410607E9452F97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F186318639452945294528C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F00FF03FF031F00
      1F00FF7FFF7FFF7F000000000000000000000000000010420000104218631863
      18631863186318631863186318631863FF03FF03186318631863186318631863
      186318631863FF03FF0318631863FF7F0000000000003967CE39734E734E9452
      945294529452734E8410807D207FFF673F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7F396718631863945294528C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10001F00FF03FF031F001F00
      FF7FFF7FFF7FFF7F000000000000000000000000000010420000104218631863
      1863186318631863186318631863186318631863186318631863186318631863
      1863186318631863186318631863FF7F0000000000003967CE39CE39734E734E
      945294529452734E8410607E9452F97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F396739671863186394528C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10421F00FF03FF031F001F00FF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000000000001863FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000039678C31CE39CE39734E
      734E9452734E8410807D207F3F4FFF673F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7F7B6F39673967186318638C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F000000000000000000000000104200001002FF031F001F00FF7FFF7F
      FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039678C318C31CE39CE39
      734E734E734E8410607E9452737EF97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7F7B6F7B6F3967396718638C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      0000000010421042104210421042104200000000000010421F00FF7FFF7FFF7F
      00400040FF7FFF7F000000000000000000000000000000000000186300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001863FF7F000000000000000000000000000039674A298C318C31CE39
      CE39734E84108C7DE002FF673F4FFF673F4FFF673F4FFF673F4FFF673F4FFF67
      4208FF7FFE7F7B6F7B6F396739678C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7F0000
      000000000040FF7FFF7F00400040FF7F1042000000001042FF7FFF7FFF7F0040
      FF7FFF7F0040FF7F000000000000000000000000000000000000186310420000
      1863186318631863186318631863186318631863186318631863186318631863
      186300001863FF7F000000000000000000000000000039674A294A298C318C31
      CE39CE398410737E006CF97F737EF97FF97FF97FF97FF97FF97FF97FF97FF97F
      4208FF7FFE7FFE7F7B6F7B6F39678C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F00000000
      000000400040FF7FFF7F00400040FF7FFF7F104200000000FF7FFF7FFF7F0040
      FF7FFF7F0040FF7F000000000000000000000000000000001863186310420000
      1863186310421042104210421863104210421042104218631042104210421863
      FF7F0000FF7F00000000000000000000000000000000396708214A294A298C31
      8C31CE398410006C082108210821082108210821082108210821082108210821
      4208FF7FFF7FFE7FFE7F7B6F7B6F8C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F00000000
      FF7F00400040FF7FFF7F00400040FF7F004000401042000000400040FF7F0040
      FF7FFF7F0040FF7F000000000000000000000000000000001863186310420000
      1863186318631863186318631863186318631863186318631863186318631863
      FF7F0000FF7F000000000000000000000000000000003967082108214A294A29
      8C318C31CE39CE39734E734E734E734E734E734E734E734E734E734E734E734E
      734EFF7FFF7FFF7FFE7FFE7F7B6F8C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      FF7F00400040FF7FFF7F00400040004000400040FF7F10420000FF7FFF7F0040
      FF7FFF7F0040FF7F000000000000000000000000000018631863104210420000
      186318631042186310421042104218631042104218631042104210421042FF7F
      FF7F0000000000000000000000000000000000000000FE7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F945200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      FF7F00400040FF7FFF7F0040004000400040FF7FFF7F104200000040FF7FFF7F
      00400040FF7FFF7F0000000000000000000000000000FF7FFF7F104210420000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000FF7F000000000000000000000000000000000000000039677B6FFE7F7B6F
      3967186394529452734ECE398C314A294A290000000000000000000000000000
      0000000000000000000000000000000094520000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      FF7F00400040FF7FFF7F004000400040FF7FFF7FFF7F10420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000FF7F
      FF7F18631863FF7F1863FF7F186318631863FF7F1863186318631863FF7FFF7F
      000000000000000000000000000000000000000000000000000039677B6FFE7F
      7B6F3967186394529452734ECE398C3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      0040004000400040FF7F00400040FF7FFF7FFF7FFF7F10420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F00000000000000000000000000000000000000000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000000000000000000000000000000000000000000000000000000039677B6F
      FE7F7B6F3967186394529452734E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F10420000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000000000000000FF7FFF7F
      18631863FF7F186318631863FF7F18631863FF7F186318631863FF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000003967
      7B6FFE7F7B6F3967186394520000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000104210420000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000000000000000000000000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F10420000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7F1042
      0000000000000000000000000000000000000000000000000000FF7FFF7F1863
      18631863FF7F186318631863FF7F18631863FF7F18631863FF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7F10420000
      0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F1042
      FF7FFF7F00001042000000000000000000000000000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7F1042
      00000000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F1042
      FF7F00001042000000000000000000000000000000000000FF7FFF7F18631863
      FF7F1863186318631863FF7F18631863FF7F18631863FF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      1042104200000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F1042
      000010420000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7F104210421042104210421042FF7FFF7FFF7FFF7FFF7FFF7FFF7F1042
      10420000000000000000000000000000000000000000FF7FFF7F186318631863
      FF7F186318631863FF7F1863FF7F186318631863FF7FFF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1042
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863186318631863186318630000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000001042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000004A294A294A294A29
      4A294A2900000000000000000000000000000000000000000000000000000000
      00000000000400040004000400040004000400040004AD39AD39AD3900000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000400040004000400040004000400040004AD39AD39AD3900000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000734E8C3194529452734ECE39
      CE398C318C314A29000000000000000000000000000000000000000000000004
      000400047D6F9E73BE77DF7BFF7FFF7FFF7FDF7B7E73000400040004AD39AD39
      AD39000000000000000000000000000000000000000000000000000000000004
      000400047D6F9E73BE77DF7BFF7FFF7FFF7FDF7B7E73000400040004AD39AD39
      AD39000000000000000000000000000000000000000010421042104210421042
      1042104210421042104210421042104210421042104210421042104210421042
      1042104210420000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000734EFE7FFF7F0821420842084208
      420842084A298C314A2900000000000000000000000000000000000400041C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9D733C67FB5E9A5600040004
      AD39AD39AD390000000000000000000000000000000000000000000400041C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9D733C67FB5E9A5600040004
      AD39AD39AD390000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000000000000000000000000000000000
      00000000000000000000000000000000734E186339670821841084107B6F8410
      8410420842084A298C3100000000000000000000000000000004BB5AFB5E1C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9E733C67FB5E9A56794E794E
      0004AD39AD39AD39000000000000000000000000000000000004BB5AFB5E1C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9E733C67FB5E9A56794E794E
      0004AD39AD39AD390000000000000000000000000000FF7F0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000104200000000000000000000000000000000000000000000
      00000000000000000000000000007F4E8C31945208217B6F8410420800000000
      84107B6F420842084A290821000000000000000000000004BA56BA5AFB5E1C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9E733C67FB5EBA56794E794E
      794E0004AD39AD39AD390000000000000000000000000004007C007C007C1C63
      3C675D6B7D6F9E73BE77DF7BFF7FFF7FFF7FDF7B9E733C67FB5EBA56794E794E
      794E0004007C007C007C007C00000000000000000000FF7F0000FF7F00000000
      0000000000001042FF7F0000000000000000000000001042FF7F000000000000
      00000000FF7FFF7F000010420000000000000000000000000000000000000000
      00000000000000000000000000008C31734E0821841084108410FE7FFE7FFE7F
      00008410841042084A290821000000000000000000049952BA56DB5AFB5E1C63
      3C675D6B2004210820042004210400040004000400043D6BFB5EBA56794E794E
      794E794E0004AD39AD39AD39000000000000000000049952007C007C007C007C
      3C675D6B2004210820042004210400040004000400043D6BFB5EBA56794E794E
      794E007C007C007C007C007C00000000000000000000FF7F1042000000001042
      1F0010421000000010420000FF7FE07FFF7FE07F004200001042000010421F7C
      10421F7C0000104210420000104200000000000000000000000000007F4E7F4E
      7F4E7F4E7F4E7F4E7F4E7F4E7F4E8C31734E082184108410FE7F945294529452
      FE7F0000841042084A2908217F4E7F4E7F4E0004794E9A52BA56DB5AFB5E2108
      21082108BD779C737B737B6F5A6B5A6B396718671863000400040004794E794E
      794E794E794E0004AD39AD390000000000000004794E9A52007C007C007C007C
      007C2108BD779C737B737B6F5A6B5A6B396718671863000400040004794E794E
      007C007C007C007C007CAD3900000000000000000000FF7F0000104200001F00
      10421F001000100000000000E07FFF7FE07FFF7F00420042000000001F7C1042
      1F7C104210400000104210420000104200000000000000000000000000000000
      0000000000000000000000000000CE39CE3908217B6F84107B6F945294529452
      FE7F00007B6F42084A290821000000007F4E200479529A52BA5621082108FE7F
      DE7BBD77BD77BC779C737B6F5A6F5A6B396739671863F762F762D65A00040004
      794E794E794E0004AD39AD39AD3900000000200479529A52BA562108007C007C
      007C007CBD77BC779C737B6F5A6F5A6B396739671863F762F762D65A0004007C
      007C007C007C0004AD39AD39AD390000000000000000FF7F1042104200001042
      1F0010421000100010000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000001042104200001042000000001863CE39CE39CE39CE39
      CE39CE39CE39CE39CE39CE39CE398C31CE390821841084107B6F945294529452
      FE7F420884104208945208214A2900007F4E00049A529A562008FF7FFF7FFE7F
      DE7B210C410C410C210C400821082004210421082004F762F662D65AB556B556
      0004794E794E0004AD39AD39AD390000000000049A529A562008FF7F007C007C
      007C007C007C410C210C400821082004210421082004F762F662D65A007C007C
      007C007C007C0004AD39AD39AD390000000000000000FF7F0000104200001F00
      10421F001000100010000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6F1863945294529452
      94529452945294529452945294528C318C31FF7F841084108410FE7FFE7FFE7F
      8410841084104A29186308214A2900007F4E200479522108FF7FFF7FFF7F4210
      41109A569A569A569A569A5679527952795279527952000400040004B556B556
      94520004794E0004AD39AD39AD3900000000200479522108FF7FFF7FFF7F007C
      007C007C007C007C9A569A567952795279527952795200040004007C007C007C
      007C007C794E0004AD39AD39AD390000000000000000FF7F1042104200001042
      1F0010421000100010000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7F7B6F7B6F7B6F
      39677B6F396739673967186339674A298C31CE3908217B6F8410841084108410
      84107B6F0821FE7F396708214A2900007F4E21082108FF7FFF7FFF7F42109D56
      9D56BD5ABD5ABD5ABD5A9D569D529D527D527D527C4E7C4E7C4E7C4E0004B556
      9452945200040004AD39AD39AD390000000021082108FF7FFF7FFF7F42109D56
      007C007C007C007C007C9D569D529D527D527D527C4E7C4E007C007C007C007C
      007C945200040004AD39AD39AD390000000000000000FF7F0000104200001F00
      10421F001000100010000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7F7B6F7B6F
      7B6F39677B6F39673967396718634A294A29CE39CE390821841084107B6F8410
      8410082118633967FE7F4A294A2900007F4E2108FF7FFF7FFF7F42107756BF5A
      BF62BF62BF62BF62BF629F5A9F569F527F527F527F4E7F4E7F4E7F4E7F4E0004
      94529452734E0004AD39AD39AD39000000002108FF7FFF7FFF7F42107756BF5A
      BF62BF62007C007C007C007C9F569F527F527F527F4E007C007C007C007C0004
      94529452734E0004AD39AD39AD390000000000000000FF7F1042104200001042
      1F0010421000100010000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7F7B6FFE7F7B6F
      7B6F7B6F39677B6F3967396739674A294A294A294A29082108214A294A294A29
      4A2908214A294A294A294A294A2900007F4E420CFF7FFF7F63109C629C627756
      DF62DF62DF62DF62BF5EBF629F5A7F567F527F527F527F527F4E7F4E985ACD14
      00049352734E0004AD39AD39000000000000420CFF7FFF7F63109C629C627756
      DF62DF62007C007C007C007C007C7F567F527F52007C007C007C007C007CCD14
      00049352734E0004AD39AD3900000000000000000000FF7F0000104200001F00
      10421F001000100010000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7F7B6FFE7F
      7B6F7B6F7B6F39677B6F396739677B6F08210821000084108410000000000000
      000000004A2984104A29734E4A2900007F4E2108FF7FFF7F63149C629C629C62
      77567756BF62BF62BF629F5E9F5E9F569F529F527F527F527D56985ACE14CD14
      00049452734E0004AD39AD390000000000002108FF7FFF7F63149C629C629C62
      77567756BF62007C007C007C007C007C9F52007C007C007C007C007CCE14CD14
      00049452734E0004AD39AD3900000000000000000000FF7F1042104200001042
      1F0010421000100010000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7FFE7FFE7F7B6F
      FE7F7B6F7B6F7B6F39677B6F396739670821FE7F000042084208420842084208
      420800004A29FE7F4A29734E4A2900007F4E2008FF7FFF7F42109C629C629C62
      9C5E9C5E7756985A985A985A985A985A985A985A985A985A7429EF1CEE18ED1C
      410CB45693524008AD3900000000000000002008FF7FFF7F42109C629C629C62
      9C5E9C5E7756985A007C007C007C007C007C007C007C007C007CEF1CEE18ED1C
      410CB45693524008AD39000000000000000000000000FF7F0000104200001F00
      10421F001000100010000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      7B6FFE7F7B6F7B6F7B6F39677B6F39670821FE7F0000420818638C314A290821
      420800004A29FE7F4A29734E4A2900007F4E2108FF7FFF7FFF7F42189C629C62
      9C5E9C5E9C5E7B5A39523952F84DB6399531742D5225312530212F210E1D2108
      95569452744E0100000000000000000000002108FF7FFF7FFF7F42189C629C62
      9C5E9C5E9C5E7B5A39523952007C007C007C007C007C312530212F210E1D2108
      95569452744E01000000000000000000000000000000FF7F1042104200000000
      000000001000100010000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7F7B6FFE7F7B6F7B6F7B6F39677B6F4A29FE7F4A2942089452420842088410
      42080000734EFE7F4A29734E4A2900007F4E00002108FF7FFF7FFF7F84309C62
      9C5E9C5E9C5E7B5A39523952F84DD63D9535742D5225512550250F1D0104B556
      94529352000400000000000000000000000000002108FF7FFF7FFF7F84309C62
      9C5E9C5E9C5E7B5A39523952007C007C007C007C007C007C50250F1D0104B556
      94529352000400000000000000000000000000000000FF7F0000104200001F00
      1F001F001042100010000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7F7B6FFE7F7B6F7B6F7B6F18637B6F0821FE7F420894528C318C314208
      42084208FE7F734E1863734E4A2900007F4E000000002108FF7FFF7FFF7FC530
      083DD1519C5E7B5A39521952F849B6399535742D732D522922088C31B556B556
      945200040000000000000000000000000000000000002108FF7FFF7FFF7FC530
      083DD1519C5E7B5A39521952007C007C007C007C007C007C007C8C31B556B556
      94520004000000000000000000000000000000000000FF7F1042000010420000
      1F001F001F00104210000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7F7B6FFE7F7B6F7B6F7B6F18634A29FE7F734E4208CE39CE390000
      4208FE7FFE7F4A291863734E4A2900007F4E000000000000420CFF7FFF7FFF7F
      FF7FEF3DA530C630842C842C64186218210821088C318C31734ED65ED55AB55A
      200CAD39AD39000000000000000000000000000000000000420CFF7FFF7FFF7F
      FF7FEF3DA530C630842C007C007C007C007C007C007C007C007C007CD55AB55A
      200CAD39AD3900000000000000000000000000000000FF7F0000104200001042
      00001F001F001F0010420000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7F7B6FFE7F7B6F7B6F7B6F18634A29FE7FFE7F734E734E0000
      FE7FFE7F4A2918631863734E4A2900007F4E000000000000000063106314FF7F
      FF7FFF7FDE7BBD7BBC779C737B6F5A6B396B396718671767F762F66240104004
      934E2000AD39AD3900000000000000000000000000000000000063106314FF7F
      FF7FFF7FDE7BBD7B007C007C007C007C007C3967007C007C007C007C007C4004
      934E2000AD39AD390000000000000000000000000000FF7F1042000010420000
      104200000000000000000000FF7FE07FFF7FE07F004200420042000010421F7C
      10421F7C1040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7F7B6FFE7F7B6F7B6F7B6F18630821734E945294520000
      734E4A29186318631863734E4A2900007F4E0000000000000000000000006314
      63186318BD7BBD779C737B735A6F5A6B5A6B39679B6B1767410C410C396BD65A
      734E734E6108AD39AD3900000000000000000000000000000000000000006314
      63186318007C007C007C007C007C5A6B5A6B39679B6B007C007C007C007C007C
      734E734E6108AD39AD39000000000000000000000000FF7F0000104200001042
      000000000000000000000000E07FFF7FE07FFF7F00420042004200001F7C1042
      1F7C10421040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7F7B6FFE7F7B6F7B6F7B6F42088410186318634208
      42080000186318631863734E4A2900007F4E0000000000000000000000000000
      00000000421042104210420C21082108410C410C410C410C1863BD77FF7F1863
      9452734E830C4004AD39AD390000000000000000000000000000000000000000
      00000000007C007C007C007C21082108410C410C410C410C007C007C007C007C
      007C734E830C4004AD39AD3900000000000000000000FF7F1042000010420000
      104200000000000000000000FF7FE07FFF7FE07F00420042004200001F7C1F7C
      1F7C1F7C1040104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7FFE7F7B6FFE7F7B6F7B6FCE390000000000000000
      00000000186318631863734E4A2900007F4E0000000000000000000000000000
      000000000000000000000000000000000000000000000000410C1863BD77FF7F
      D75E071DC514820C2008AD39AD39000000000000000000000000000000000000
      0000007C007C007C007C007C000000000000000000000000410C007C007C007C
      007C007CC514820C2008AD39AD390000000000000000FF7F0000104200001042
      000000000000000000000000E07FFF7FE07FFF7F004200420042000000001F7C
      1F7C1F7C1042104000000000000000000000000000007B6FFE7FFE7FFE7FFE7F
      FE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7F7B6FFE7F7B6FCE390000000000000000
      00000000186339671863734E4A2900007F4E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000410C20040004
      00044925071DC414610C0004AD39AD3900000000000000000000000000000000
      007C007C007C007C007C00000000000000000000000000000000410C007C007C
      007C007C007CC414610C0004AD39AD39000000000000FF7F1042000010420000
      104200000000000000000000FF7FE07FFF7FE07F004200420042000000000000
      1F7C1F7C1F7C1042000000000000000000000000000018631863186318631863
      18631863186318631863186318637B6FFE7F7B6F7B6FCE390821082108210821
      08210000396718631863734E4A2900007F4E0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000004004EF3D
      CE39524A4925E61C831421040004AD39AD3900000000000000000000007C007C
      007C007C007C000000000000000000000000000000000000000000004004007C
      007C007C007C007C831421040004AD39AD39000000000000FF7F104200001042
      000000000000000000000000FF7FFF7FFF7FFF7F004200420042000000000000
      00000000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F18637B6FFE7F7B6FCE39CE39CE39CE39CE39
      CE390000186339671863734E4A2900007F4E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002000
      0F3ECD39524A2829A514630C00040004AD3900000000000000000000007C007C
      007C007C00000000000000000000000000000000000000000000000000002000
      007C007C007C007C007C630C00040004AD390000000000000000FF7F10420000
      104200000000000000000000E07FE07FE07FE07F000000420042000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      186318631863186318631863FF7FFF7F186318631863CE399452945294529452
      9452000018631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      2008EF41AD39524AE71CA5144208000400040000000000000000007C007C007C
      007C007C00000000000000000000000000000000000000000000000000000000
      2008007C007C007C007C007C42080004000400000000000000000000FF7F1042
      0000000000000000000000000000E07FE07FE07FE07F00000042000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      1863186318631863186318631863FF7FFF7FFF7FFF7FCE39CE39CE39CE39CE39
      CE390000FF7FFF7FFF7FFF7FFF7F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000004CE398C31524AE71C841021040004000000000000007C007C007C007C
      007C000000000000000000000000000000000000000000000000000000000000
      00000004007C007C007C007C841021040004000000000000000000000000FF7F
      10420000000000000000000000000000E07FE07FE07FE07F0000000000000000
      0000000000000000000000000000000000000000000018631863186318631863
      18631863186318631863186318631863186318631863CE390821082108210821
      0821000018631863186318631863000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000004CE396B2D524AC618630C2104000000000000007C007C007C0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000004007C007C007CC618630C21040000000000000000000000000000
      FF7F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000009452945294529452
      9452945294529452945294529452945200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000004AD396B2DAD39A514630C000000000000007C007C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000004007C007CAD39A514630C0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000734E734E734E
      734E734E734E734E734E734E734E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000004000400046B2D00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000004000400046B2D00000000000000000000000000000000
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
    Left = 228
    Top = 18
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
    Left = 264
    Top = 18
  end
  object PAR_: TTable
    DatabaseName = 'ADB'
    TableName = 'PARAMETRO'
    Left = 524
    Top = 22
    object PAR_DIVISOR_RENTA: TFloatField
      FieldName = 'DIVISOR_RENTA'
    end
  end
end
