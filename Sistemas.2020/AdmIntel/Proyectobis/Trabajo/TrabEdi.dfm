object frmTrabEdi: TfrmTrabEdi
  Left = 343
  Top = 156
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Trabajos en espacios comunes'
  ClientHeight = 303
  ClientWidth = 405
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
    Top = 275
    Width = 405
    Height = 28
    Align = alBottom
    TabOrder = 0
    object btnAceptar: TBitBtn
      Left = 252
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      TabOrder = 0
      OnClick = btnAceptarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 328
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 405
    Height = 224
    ActivePage = tsDatos
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object tsDatos: TTabSheet
      Caption = 'Datos del trabajo'
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 34
        Height = 13
        Caption = 'Edificio'
      end
      object btnConfigEC: TSpeedButton
        Left = 368
        Top = 16
        Width = 21
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnConfigECClick
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 70
        Height = 13
        Caption = 'Nro. de trabajo'
      end
      object Label3: TLabel
        Left = 7
        Top = 158
        Width = 72
        Height = 13
        Caption = 'Fecha de inicio'
      end
      object lblFecFin: TLabel
        Left = 293
        Top = 158
        Width = 59
        Height = 13
        Caption = 'Fecha de fin'
      end
      object Label5: TLabel
        Left = 292
        Top = 116
        Width = 27
        Height = 13
        Caption = 'Costo'
      end
      object Label6: TLabel
        Left = 88
        Top = 40
        Width = 49
        Height = 13
        Caption = 'Proveedor'
      end
      object btnBuscarProv: TSpeedButton
        Left = 367
        Top = 54
        Width = 21
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnBuscarProvClick
      end
      object Label7: TLabel
        Left = 188
        Top = 2
        Width = 73
        Height = 13
        Caption = 'Espacio com'#250'n'
      end
      object SpeedButton1: TSpeedButton
        Left = 367
        Top = 91
        Width = 23
        Height = 21
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Label8: TLabel
        Left = 134
        Top = 77
        Width = 29
        Height = 13
        Caption = 'Rubro'
      end
      object Label4: TLabel
        Left = 8
        Top = 78
        Width = 71
        Height = 13
        Caption = 'Nro. de factura'
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 54
        Width = 72
        Height = 21
        DataField = 'NRO_PEDIDO'
        DataSource = dsTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DateTimePicker1: TDateTimePicker
        Left = 7
        Top = 172
        Width = 100
        Height = 21
        CalAlignment = dtaLeft
        Date = 37635.8574666204
        Time = 37635.8574666204
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 8
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object dtpFecFin: TDateTimePicker
        Left = 293
        Top = 172
        Width = 100
        Height = 21
        CalAlignment = dtaLeft
        Date = 37635.8574924653
        Time = 37635.8574924653
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 10
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object edtCosto: TDBEdit
        Left = 292
        Top = 130
        Width = 100
        Height = 21
        DataField = 'COSTO'
        DataSource = dsTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object ComboProv: TDBLookupComboBox
        Left = 88
        Top = 54
        Width = 277
        Height = 21
        DataField = 'Proveedor'
        DataSource = dsTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object rgImp: TDBRadioGroup
        Left = 6
        Top = 120
        Width = 267
        Height = 35
        Caption = ' A cargo de: '
        Columns = 2
        DataField = 'IMPUTACION'
        DataSource = dsTrab
        Items.Strings = (
          'Alcald'#237'a (01)'
          'Todos (03)')
        TabOrder = 6
        Values.Strings = (
          '01'
          '03')
      end
      object ComboEdi: TComboBox
        Left = 8
        Top = 16
        Width = 179
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
        OnClick = ComboEdiClick
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object ComboEC: TComboBox
        Left = 188
        Top = 16
        Width = 179
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
        OnClick = ComboECClick
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object ComboRubro: TDBLookupComboBox
        Left = 134
        Top = 91
        Width = 231
        Height = 21
        DataField = 'Tipo'
        DataSource = dsTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object chkFin: TCheckBox
        Left = 158
        Top = 175
        Width = 97
        Height = 17
        Caption = 'Finalizado'
        TabOrder = 9
        OnClick = chkFinClick
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 91
        Width = 109
        Height = 21
        DataField = 'NRO_FACT'
        DataSource = dsTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Tareas'
      ImageIndex = 2
      object btnAgregar: TSpeedButton
        Left = 4
        Top = 166
        Width = 60
        Height = 22
        Caption = 'Agregar'
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
        Top = 166
        Width = 60
        Height = 22
        Caption = 'Eliminar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEliminarClick
      end
      object DBGrid1: TDBGrid
        Left = 3
        Top = 2
        Width = 491
        Height = 163
        Color = clBlack
        DataSource = dsTareas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'TAREA'
            Title.Alignment = taCenter
            Title.Caption = 'Tareas'
            Width = 467
            Visible = True
          end>
      end
    end
    object tsMateriales: TTabSheet
      Caption = 'Materiales'
      ImageIndex = 1
      object btnAgregarMat: TSpeedButton
        Left = 4
        Top = 254
        Width = 60
        Height = 22
        Caption = 'Agregar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnAgregarMatClick
      end
      object btnEliminarMat: TSpeedButton
        Left = 64
        Top = 254
        Width = 60
        Height = 22
        Caption = 'Eliminar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEliminarMatClick
      end
      object btnModificarMat: TSpeedButton
        Left = 124
        Top = 254
        Width = 60
        Height = 22
        Caption = 'Modificar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnModificarMatClick
      end
      object DBGrid2: TDBGrid
        Left = 3
        Top = 4
        Width = 491
        Height = 247
        Color = clBlack
        DataSource = dsMU
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'DESCRIP'
            Title.Alignment = taCenter
            Width = 299
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ABREV'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 224
    Width = 405
    Height = 51
    Align = alBottom
    TabOrder = 2
    object Bevel1: TBevel
      Left = 11
      Top = 4
      Width = 384
      Height = 43
    end
    object lblEstado: TLabel
      Left = 14
      Top = 18
      Width = 67
      Height = 16
      Caption = 'lblEstado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrden: TLabel
      Left = 352
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Orden'
    end
    object lblDECI: TLabel
      Left = 310
      Top = 8
      Width = 25
      Height = 13
      Caption = 'DECI'
    end
    object edtDECI: TDBEdit
      Left = 310
      Top = 22
      Width = 40
      Height = 21
      DataField = 'NRO_DECI'
      DataSource = dsTrab
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
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtOrden: TDBEdit
      Left = 352
      Top = 22
      Width = 40
      Height = 21
      DataField = 'NRO_ORDEN'
      DataSource = dsTrab
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
  end
  object dsTrab: TDataSource
    DataSet = dmDatos.TRAB
    Left = 78
    Top = 6
  end
  object qryTareas: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDTRABAJO, IDTAREA, DESCRIP AS Tarea FROM VW_TRAB_TAREAS'
      'WHERE IDTRABAJO = :N'
      'ORDER BY DESCRIP')
    Left = 108
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end>
    object qryTareasTAREA: TStringField
      FieldName = 'TAREA'
      Origin = 'ADB.VW_TRAB_TAREAS.DESCRIP'
      Size = 150
    end
    object qryTareasIDTAREA: TIntegerField
      FieldName = 'IDTAREA'
      Origin = 'ADB.VW_TRAB_TAREAS.IDTAREA'
    end
  end
  object dsTareas: TDataSource
    DataSet = qryTareas
    Left = 78
    Top = 36
  end
  object dsMU: TDataSource
    DataSet = qryMU
    Left = 78
    Top = 66
  end
  object qryMU: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_MAT_USADOS'
      'WHERE IDTRABAJO = :N')
    Left = 108
    Top = 66
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end>
    object qryMUIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.VW_MAT_USADOS.IDTRABAJO'
    end
    object qryMUDESCRIP: TStringField
      DisplayLabel = 'Material'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_MAT_USADOS.DESCRIP'
      Size = 45
    end
    object qryMUCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'ADB.VW_MAT_USADOS.CANTIDAD'
    end
    object qryMUABREV: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ABREV'
      Origin = 'ADB.VW_MAT_USADOS.ABREV'
      Size = 15
    end
    object qryMUIDMATERIAL: TIntegerField
      FieldName = 'IDMATERIAL'
      Origin = 'ADB.VW_MAT_USADOS.IDMATERIAL'
    end
    object qryMUIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ADB.VW_MAT_USADOS.IDTRABAJO'
    end
  end
  object Q: TQuery
    DatabaseName = 'ADB'
    Left = 330
    Top = 182
  end
  object qryExisteNro: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDTRABAJO, NRO_ORDEN FROM TRABAJO'
      'WHERE (NRO_ORDEN = :N) AND (IDTRABAJO <> :I)')
    Left = 300
    Top = 186
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I'
        ParamType = ptUnknown
      end>
  end
end
