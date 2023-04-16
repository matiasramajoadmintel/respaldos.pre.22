object frmIngOcupante: TfrmIngOcupante
  Left = 200
  Top = 158
  Width = 503
  Height = 250
  Caption = 'Ocupante'
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 21
    Align = alTop
    Caption = 'Datos Personales'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 21
    Width = 495
    Height = 172
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Apellido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 255
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 47
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 118
      Top = 47
      Width = 110
      Height = 13
      Caption = 'N'#250'mero de Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label7: TLabel
      Left = 10
      Top = 129
      Width = 28
      Height = 13
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtApellido: TDBEdit
      Left = 10
      Top = 21
      Width = 236
      Height = 21
      DataField = 'APELLIDO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNombre: TDBEdit
      Left = 255
      Top = 21
      Width = 230
      Height = 21
      DataField = 'NOMBRE'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object cmbTipoDoc: TDBComboBox
      Left = 10
      Top = 61
      Width = 103
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TIPODOCUMENTO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'DNI'
        'LC'
        'LE'
        'CI'
        'PAS'
        'REG'
        'CUS')
      ParentFont = False
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNroDoc: TDBEdit
      Left = 118
      Top = 61
      Width = 128
      Height = 21
      DataField = 'NRODOCUMENTO'
      DataSource = DataSource1
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
    object edtTelefono: TDBEdit
      Left = 10
      Top = 102
      Width = 236
      Height = 21
      DataField = 'TELEFONO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtEMail: TDBEdit
      Left = 10
      Top = 143
      Width = 236
      Height = 21
      DataField = 'EMAIL'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object grbTipoOcupante: TDBRadioGroup
      Left = 255
      Top = 52
      Width = 230
      Height = 111
      Caption = ' Tipo de persona: '
      DataField = 'TIPO'
      DataSource = DataSource1
      Items.Strings = (
        'Ocupante personal militar'
        'Ocupante personal civil'
        'Ocupante particular'
        'Militar no ocupante')
      TabOrder = 6
      Values.Strings = (
        'OCUP_MIL'
        'OCUP_CIV'
        'OCUP_PART'
        'MIL_NO_OCUP')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 193
    Width = 495
    Height = 30
    Align = alBottom
    TabOrder = 2
    object btnSiguiente: TBitBtn
      Left = 328
      Top = 2
      Width = 89
      Height = 25
      Caption = '&Siguiente'
      TabOrder = 0
      OnClick = btnSiguienteClick
      Glyph.Data = {
        8A020000424D8A02000000000000760000002800000038000000130000000100
        04000000000014020000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0200FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A200FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02A200FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00000000000000000A2A200FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF022A2A2222222222222A2A200FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF022A
        AAAA2A2A2A2A2A2A2A2A200FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0022AAA2A2A2
        A2A2A2A2A2A2A200FFFFFFFFFFFFFFFFFFFFFFFFFFFF022AAAAA2A2A2A2A2A2A
        2A2A2AA0FFFFFFFFFFFFFFFFFFFFFFFFFFFF0022AAA2A2A2A2A2A2A2A2A2AA0F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF022AAAAA2A2A2A2A2A2A2A2AA0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0022AAA2A2A2A2A2A2A2A2AA0FFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF022AAAAAAAAAAAAAAAAA2AA0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0020000000000000000AAA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF020A
        02222200FFFFFF0AA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02028888880
        FFFFFF0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000FFFFFF00
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 418
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object DataSource1: TDataSource
    DataSet = dmTablas.tblPersona
    Left = 220
    Top = 70
  end
end
