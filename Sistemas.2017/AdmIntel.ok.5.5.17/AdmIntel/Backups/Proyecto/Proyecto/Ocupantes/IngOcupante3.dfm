object frmIngOcupante3: TfrmIngOcupante3
  Left = 192
  Top = 151
  Width = 287
  Height = 215
  Caption = 'Ocupante'
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 279
    Height = 21
    Align = alTop
    Caption = 'Personal Militar'
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
    Width = 279
    Height = 137
    Align = alClient
    TabOrder = 1
    object Label10: TLabel
      Left = 41
      Top = 96
      Width = 33
      Height = 13
      Caption = 'Sueldo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 41
      Top = 6
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
    object Label4: TLabel
      Left = 41
      Top = 51
      Width = 43
      Height = 13
      Caption = 'Matricula'
    end
    object edtCategoria: TDBEdit
      Left = 41
      Top = 20
      Width = 196
      Height = 21
      DataField = 'Categoria'
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
    object edtLegajo: TDBEdit
      Left = 41
      Top = 65
      Width = 196
      Height = 21
      DataField = 'Legajo'
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
    object edtSueldo: TDBEdit
      Left = 41
      Top = 110
      Width = 196
      Height = 21
      DataField = 'Sueldo'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 158
    Width = 279
    Height = 30
    Align = alBottom
    TabOrder = 2
    object btnAceptar: TBitBtn
      Left = 126
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
      Left = 202
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
    object btnAnterior: TBitBtn
      Left = 45
      Top = 2
      Width = 80
      Height = 25
      Caption = 'A&nterior'
      ModalResult = 4
      TabOrder = 2
      Glyph.Data = {
        8A020000424D8A02000000000000760000002800000038000000130000000100
        04000000000014020000C40E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF00FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0020FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002A0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF002A20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF002A2A00000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF002A2A2222222222222A2A220FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002
        A2A2A2A2A2A2A2A2AAAAA220FFFFFFFFFFFFFFFFFFFFFFFFFFFF002A2A2A2A2A
        2A2A2A2A2AAA2200FFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA2A2A2A2A2A2A2A2A2
        AAAAA220FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA2A2A2A2A2A2A2A2A2AAA2200
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA2A2A2A2A2A2A2A2AAAAA220FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF0AA2A2A2A2A2A2A2A2AAA2200FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0AA2AAAAAAAAAAAAAAAAA220FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF0AAA0000000000000000A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0AA0FFFFFF002222202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0FF
        FFFF08888882020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF0000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
  end
  object Database: TDatabase
    SessionName = 'Default'
    Left = 128
    Top = 26
  end
  object Table1: TTable
    Left = 128
    Top = 66
  end
  object Table2: TTable
    Left = 128
    Top = 114
  end
  object DataSource1: TDataSource
    Left = 160
    Top = 66
  end
end
