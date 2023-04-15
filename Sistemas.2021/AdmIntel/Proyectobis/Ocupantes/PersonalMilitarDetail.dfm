object frmPersonalMilitarDetail: TfrmPersonalMilitarDetail
  Left = 344
  Top = 158
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ocupante - Personal militar'
  ClientHeight = 263
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 264
    Height = 233
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = 6
      Top = 136
      Width = 131
      Height = 53
    end
    object Label1: TLabel
      Left = 6
      Top = 92
      Width = 45
      Height = 13
      Caption = 'Matr'#237'cula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 141
      Top = 138
      Width = 82
      Height = 26
      Caption = 'Fecha de ingreso a la Armada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 6
      Top = 4
      Width = 29
      Height = 13
      Caption = 'Grado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 11
      Top = 130
      Width = 63
      Height = 13
      Caption = ' Antiguedad: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 6
      Top = 48
      Width = 60
      Height = 13
      Caption = 'Especialidad'
    end
    object Label9: TLabel
      Left = 8
      Top = 194
      Width = 36
      Height = 13
      Caption = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 146
      Top = 92
      Width = 29
      Height = 13
      Caption = 'Renta'
    end
    object Label7: TLabel
      Left = 14
      Top = 148
      Width = 29
      Height = 13
      Caption = 'Grado'
    end
    object Label8: TLabel
      Left = 79
      Top = 148
      Width = 38
      Height = 13
      Caption = 'Servicio'
    end
    object edtDestino: TDBEdit
      Left = 8
      Top = 208
      Width = 250
      Height = 21
      DataField = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtMatricula: TDBEdit
      Left = 6
      Top = 106
      Width = 90
      Height = 21
      DataField = 'Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtAntGrado: TDBEdit
      Left = 14
      Top = 162
      Width = 50
      Height = 21
      DataField = 'AntGrado'
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
    object btnElegirGrado: TBitBtn
      Left = 237
      Top = 17
      Width = 21
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = btnElegirGradoClick
      NumGlyphs = 2
    end
    object btnElegirEspecialidad: TBitBtn
      Left = 237
      Top = 61
      Width = 21
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnElegirEspecialidadClick
      NumGlyphs = 2
    end
    object dtpFecIng: TDateTimePicker
      Left = 141
      Top = 168
      Width = 108
      Height = 21
      Date = 29221.986930879600000000
      Time = 29221.986930879600000000
      ShowCheckbox = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object DBEdit1: TDBEdit
      Left = 146
      Top = 106
      Width = 90
      Height = 21
      DataField = 'RENTAPROPIA'
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
    object DBEdit2: TDBEdit
      Left = 79
      Top = 162
      Width = 50
      Height = 21
      DataField = 'ANT_SERVICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 6
      Top = 62
      Width = 230
      Height = 21
      DataField = 'Especialidad'
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
    object cmbGrado: TComboBox
      Left = 6
      Top = 18
      Width = 200
      Height = 21
      ItemHeight = 13
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 233
    Width = 264
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 110
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
      Left = 186
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 32
      Top = 2
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end
