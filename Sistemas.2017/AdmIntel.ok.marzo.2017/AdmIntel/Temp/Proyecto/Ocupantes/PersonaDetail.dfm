object frmPersonaDetail: TfrmPersonaDetail
  Left = 255
  Top = 164
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ocupante - Datos personales'
  ClientHeight = 255
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 225
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 7
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
      Left = 214
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
      Left = 7
      Top = 47
      Width = 45
      Height = 13
      Caption = 'Tipo doc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 79
      Top = 47
      Width = 76
      Height = 13
      Caption = 'N'#250'mero de doc.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 7
      Top = 88
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object Label7: TLabel
      Left = 7
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
    object edtApellido: TEdit
      Left = 6
      Top = 20
      Width = 200
      Height = 21
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNombre: TEdit
      Left = 214
      Top = 20
      Width = 200
      Height = 21
      TabOrder = 1
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object cmbTipoDoc: TComboBox
      Left = 6
      Top = 60
      Width = 70
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNroDoc: TEdit
      Left = 78
      Top = 60
      Width = 130
      Height = 21
      TabOrder = 3
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtTelefono: TEdit
      Left = 6
      Top = 102
      Width = 200
      Height = 21
      TabOrder = 4
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtEmail: TEdit
      Left = 8
      Top = 144
      Width = 200
      Height = 21
      TabOrder = 5
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object rgTipoPersona: TRadioGroup
      Left = 222
      Top = 52
      Width = 189
      Height = 107
      Caption = ' Tipo: '
      Items.Strings = (
        'Personal militar'
        'Personal civil'
        'Particular'
        'Militar no ocupante')
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 225
    Width = 420
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnSiguiente: TBitBtn
      Left = 252
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
      Left = 342
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
end
