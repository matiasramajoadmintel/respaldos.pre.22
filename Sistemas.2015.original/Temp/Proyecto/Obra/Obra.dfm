object frmObra: TfrmObra
  Left = 135
  Top = 41
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 447
  ClientWidth = 419
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 419
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
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 419
    Height = 30
    Align = alBottom
    TabOrder = 1
    object Panel1: TPanel
      Left = 233
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TBitBtn
        Left = 106
        Top = 2
        Width = 75
        Height = 25
        Cancel = True
        Caption = '&Cancelar'
        TabOrder = 0
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
      object btnAceptar: TBitBtn
        Left = 30
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Aceptar'
        TabOrder = 1
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 21
    Width = 419
    Height = 396
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 96
      Top = 5
      Width = 60
      Height = 13
      Caption = 'Tipo de obra'
      FocusControl = DBLookupComboBox1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 50
      Height = 13
      Caption = 'Propietario'
      FocusControl = DBLookupComboBox2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 81
      Width = 37
      Height = 13
      Caption = 'Nombre'
      FocusControl = edtNombre
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 121
      Width = 56
      Height = 13
      Caption = 'Descripcion'
      FocusControl = DBEdit2
    end
    object Label5: TLabel
      Left = 8
      Top = 201
      Width = 59
      Height = 13
      Caption = 'Presupuesto'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 147
      Top = 201
      Width = 51
      Height = 13
      Caption = 'Honorarios'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 243
      Width = 47
      Height = 13
      Caption = 'Superficie'
      FocusControl = DBEdit5
    end
    object Label8: TLabel
      Left = 111
      Top = 243
      Width = 49
      Height = 13
      Caption = 'Ambientes'
      FocusControl = DBEdit6
    end
    object Label9: TLabel
      Left = 214
      Top = 243
      Width = 30
      Height = 13
      Caption = 'Ba'#241'os'
      FocusControl = DBEdit7
    end
    object Label10: TLabel
      Left = 8
      Top = 283
      Width = 57
      Height = 13
      Caption = 'Fecha inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object lblFin: TLabel
      Left = 147
      Top = 283
      Width = 44
      Height = 13
      Caption = 'Fecha fin'
    end
    object Label12: TLabel
      Left = 288
      Top = 283
      Width = 33
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 318
      Top = 243
      Width = 80
      Height = 13
      Caption = 'Tiempo estimado'
      FocusControl = DBEdit11
    end
    object Label14: TLabel
      Left = 8
      Top = 330
      Width = 127
      Height = 13
      Caption = 'Porcentaje de progreso (%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object btnBuscarTipoObra: TSpeedButton
      Left = 385
      Top = 17
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de tipos de obra'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarTipoObraClick
    end
    object btnBuscarCliente: TSpeedButton
      Left = 385
      Top = 57
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de propietarios'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarClienteClick
    end
    object Label15: TLabel
      Left = 288
      Top = 200
      Width = 39
      Height = 13
      Caption = 'Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 18
      Top = 375
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label16: TLabel
      Left = 108
      Top = 375
      Width = 12
      Height = 13
      Caption = '25'
    end
    object Label17: TLabel
      Left = 204
      Top = 375
      Width = 12
      Height = 13
      Caption = '50'
    end
    object Label18: TLabel
      Left = 300
      Top = 375
      Width = 12
      Height = 13
      Caption = '75'
    end
    object Label19: TLabel
      Left = 390
      Top = 375
      Width = 18
      Height = 13
      Caption = '100'
    end
    object Label20: TLabel
      Left = 8
      Top = 5
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = edtNumero
    end
    object Label21: TLabel
      Left = 8
      Top = 162
      Width = 41
      Height = 13
      Caption = 'Fracci'#243'n'
      FocusControl = DBEdit8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 68
      Top = 162
      Width = 36
      Height = 13
      Caption = 'Parcela'
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 124
      Top = 162
      Width = 63
      Height = 13
      Caption = 'Un. funcional'
      FocusControl = DBEdit10
    end
    object Label24: TLabel
      Left = 195
      Top = 162
      Width = 66
      Height = 13
      Caption = 'Cta. municipal'
      FocusControl = DBEdit12
    end
    object Label25: TLabel
      Left = 308
      Top = 162
      Width = 76
      Height = 13
      Caption = 'Pda. inmobiliaria'
      FocusControl = DBEdit13
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 96
      Top = 19
      Width = 287
      Height = 19
      Ctl3D = False
      DataField = 'TipoObra'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 59
      Width = 375
      Height = 19
      Ctl3D = False
      DataField = 'Cliente'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNombre: TDBEdit
      Left = 8
      Top = 95
      Width = 400
      Height = 19
      Ctl3D = False
      DataField = 'Nombre'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 135
      Width = 400
      Height = 19
      Ctl3D = False
      DataField = 'Descripcion'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 215
      Width = 120
      Height = 19
      Ctl3D = False
      DataField = 'Presupuesto'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit4: TDBEdit
      Left = 147
      Top = 215
      Width = 120
      Height = 19
      Ctl3D = False
      DataField = 'Honorarios'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 257
      Width = 90
      Height = 19
      Ctl3D = False
      DataField = 'Superficie'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit6: TDBEdit
      Left = 111
      Top = 257
      Width = 90
      Height = 19
      Ctl3D = False
      DataField = 'CantidadAmbientes'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 14
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit7: TDBEdit
      Left = 214
      Top = 257
      Width = 90
      Height = 19
      Ctl3D = False
      DataField = 'CantidadBanos'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit11: TDBEdit
      Left = 318
      Top = 257
      Width = 90
      Height = 19
      Ctl3D = False
      DataField = 'TiempoEstimado'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 16
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object dtpInicio: TDateTimePicker
      Left = 8
      Top = 297
      Width = 120
      Height = 21
      Date = 38272.891874814820000000
      Time = 38272.891874814820000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object dtpFin: TDateTimePicker
      Left = 147
      Top = 297
      Width = 120
      Height = 21
      Date = 38272.891882951390000000
      Time = 38272.891882951390000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object TrackBar1: TTrackBar
      Left = 9
      Top = 345
      Width = 403
      Height = 30
      Ctl3D = False
      LineSize = 3
      Max = 100
      ParentCtl3D = False
      Frequency = 5
      TabOrder = 20
      OnChange = TrackBar1Change
    end
    object ComboEstado: TDBComboBox
      Left = 288
      Top = 297
      Width = 120
      Height = 21
      Ctl3D = False
      DataField = 'Estado'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'DETENIDA'
        'INICIADA'
        'TERMINADA')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 19
      OnChange = ComboEstadoClick
      OnClick = ComboEstadoClick
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBComboBox2: TDBComboBox
      Left = 288
      Top = 213
      Width = 120
      Height = 21
      Ctl3D = False
      DataField = 'Moneda'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'DOLARES'
        'PESOS')
      ParentCtl3D = False
      ParentFont = False
      Sorted = True
      TabOrder = 12
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtPorcentaje: TDBEdit
      Left = 355
      Top = 328
      Width = 50
      Height = 19
      Ctl3D = False
      DataField = 'Porcentaje'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 21
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNumero: TDBEdit
      Left = 8
      Top = 19
      Width = 82
      Height = 19
      Ctl3D = False
      DataField = 'NroObra'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit8: TDBEdit
      Left = 8
      Top = 176
      Width = 50
      Height = 19
      Ctl3D = False
      DataField = 'Fraccion'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit9: TDBEdit
      Left = 68
      Top = 176
      Width = 50
      Height = 19
      Ctl3D = False
      DataField = 'Parcela'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit10: TDBEdit
      Left = 130
      Top = 176
      Width = 50
      Height = 19
      Ctl3D = False
      DataField = 'UnidadFuncional'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit12: TDBEdit
      Left = 195
      Top = 176
      Width = 100
      Height = 19
      Ctl3D = False
      DataField = 'NroCuentaMuni'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit13: TDBEdit
      Left = 308
      Top = 176
      Width = 100
      Height = 19
      Ctl3D = False
      DataField = 'NroPartidaMuni'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
  end
  object Table: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Obra'
    Left = 316
    Top = 14
    object TableIdObra: TSmallintField
      FieldName = 'IdObra'
    end
    object TableIdTipoObra: TSmallintField
      FieldName = 'IdTipoObra'
      Required = True
    end
    object TableIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Required = True
    end
    object TableTipoObra: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoObra'
      LookupDataSet = TIPO
      LookupKeyFields = 'IdTipoObra'
      LookupResultField = 'Descrip'
      KeyFields = 'IdTipoObra'
      Size = 50
      Lookup = True
    end
    object TableCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'Cliente'
      LookupDataSet = CLI
      LookupKeyFields = 'IdCliente'
      LookupResultField = 'RazonSocial'
      KeyFields = 'IdCliente'
      Size = 60
      Lookup = True
    end
    object TableNombre: TStringField
      FieldName = 'Nombre'
      Required = True
      Size = 50
    end
    object TableDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 255
    end
    object TablePresupuesto: TFloatField
      FieldName = 'Presupuesto'
      currency = True
    end
    object TableHonorarios: TFloatField
      FieldName = 'Honorarios'
      currency = True
    end
    object TableMoneda: TStringField
      FieldName = 'Moneda'
      Required = True
      Size = 10
    end
    object TableSuperficie: TFloatField
      FieldName = 'Superficie'
    end
    object TableCantidadAmbientes: TSmallintField
      FieldName = 'CantidadAmbientes'
    end
    object TableCantidadBanos: TSmallintField
      FieldName = 'CantidadBanos'
    end
    object TableFechaInicio: TDateTimeField
      FieldName = 'FechaInicio'
      Required = True
    end
    object TableFechaFin: TDateTimeField
      FieldName = 'FechaFin'
    end
    object TableEstado: TStringField
      FieldName = 'Estado'
      Required = True
    end
    object TableTiempoEstimado: TSmallintField
      FieldName = 'TiempoEstimado'
    end
    object TablePorcentaje: TIntegerField
      FieldName = 'Porcentaje'
      Required = True
    end
    object TableFraccion: TStringField
      FieldName = 'Fraccion'
      Required = True
      Size = 10
    end
    object TableParcela: TStringField
      FieldName = 'Parcela'
      Required = True
      Size = 10
    end
    object TableUnidadFuncional: TStringField
      FieldName = 'UnidadFuncional'
      Size = 10
    end
    object TableNroCuentaMuni: TStringField
      FieldName = 'NroCuentaMuni'
    end
    object TableNroPartidaMuni: TStringField
      FieldName = 'NroPartidaMuni'
    end
    object TableNroObra: TStringField
      FieldName = 'NroObra'
      Size = 6
    end
  end
  object TIPO: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.TipoObra'
    Left = 348
    Top = 14
    object TIPOIdTipoObra: TSmallintField
      FieldName = 'IdTipoObra'
      Required = True
    end
    object TIPODescrip: TStringField
      FieldName = 'Descrip'
      Required = True
      Size = 50
    end
  end
  object CLI: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Cliente'
    Left = 380
    Top = 14
    object CLIIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Required = True
    end
    object CLIRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Required = True
      Size = 60
    end
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 288
    Top = 16
  end
end
