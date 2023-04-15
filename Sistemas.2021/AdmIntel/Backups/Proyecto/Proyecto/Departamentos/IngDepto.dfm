object frmIngDepto: TfrmIngDepto
  Left = 243
  Top = 197
  Width = 397
  Height = 277
  Caption = 'IngDepto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 220
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 34
      Height = 13
      Caption = 'Edificio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 53
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 96
      Width = 49
      Height = 13
      Caption = 'Ambientes'
    end
    object Label8: TLabel
      Left = 107
      Top = 96
      Width = 67
      Height = 13
      Caption = 'Llave T'#233'rmica'
    end
    object Label4: TLabel
      Left = 207
      Top = 96
      Width = 44
      Height = 13
      Caption = 'Disyuntor'
    end
    object Label9: TLabel
      Left = 273
      Top = 53
      Width = 53
      Height = 13
      Caption = 'Coeficiente'
    end
    object Label2: TLabel
      Left = 307
      Top = 96
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label3: TLabel
      Left = 8
      Top = 139
      Width = 71
      Height = 13
      Caption = 'Observaciones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtCantAmb: TDBEdit
      Left = 8
      Top = 110
      Width = 70
      Height = 21
      DataField = 'CANTAMB'
      DataSource = dsDEPTO
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
    object cmbLlaveTerm: TDBComboBox
      Left = 107
      Top = 110
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LLAVETERMICA'
      DataSource = dsDEPTO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'SI'
        'NO')
      ParentFont = False
      TabOrder = 4
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtDescripcion: TDBEdit
      Left = 8
      Top = 67
      Width = 260
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsDEPTO
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
    object cmbDisyuntor: TDBComboBox
      Left = 207
      Top = 110
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DISYUNTOR'
      DataSource = dsDEPTO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'SI'
        'NO')
      ParentFont = False
      TabOrder = 5
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtEdificio: TEdit
      Left = 9
      Top = 23
      Width = 373
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'edtEdificio'
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object cmbTipo: TDBComboBox
      Left = 307
      Top = 110
      Width = 78
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TIPO'
      DataSource = dsDEPTO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'CASA'
        'DEPTO')
      ParentFont = False
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object memObservaciones: TDBMemo
      Left = 8
      Top = 153
      Width = 374
      Height = 59
      DataField = 'OBSERVACIONES'
      DataSource = dsDEPTO
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnChange = Limpiar_Edit
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit2: TDBEdit
      Left = 273
      Top = 68
      Width = 109
      Height = 21
      DataField = 'COEFICIENTE'
      DataSource = dsDEPTO
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
      OnKeyPress = PressEnterFloat
      OnKeyUp = Teclitas
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 220
    Width = 389
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 235
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
      Left = 311
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object dsDEPTO: TDataSource
    DataSet = DEPTO
    Left = 94
    Top = 26
  end
  object DEPTO: TTable
    Active = True
    DatabaseName = 'ADB'
    TableName = 'DEPARTAMENTO'
    Left = 124
    Top = 28
    object DEPTOIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object DEPTOIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object DEPTOCANTAMB: TIntegerField
      FieldName = 'CANTAMB'
    end
    object DEPTOLLAVETERMICA: TStringField
      FieldName = 'LLAVETERMICA'
      Size = 2
    end
    object DEPTODISYUNTOR: TStringField
      FieldName = 'DISYUNTOR'
      Size = 2
    end
    object DEPTOTIPO: TStringField
      FieldName = 'TIPO'
      Required = True
      Size = 5
    end
    object DEPTOOBSERVACIONES: TStringField
      FieldName = 'OBSERVACIONES'
      Size = 200
    end
    object DEPTOCOEFICIENTE: TFloatField
      FieldName = 'COEFICIENTE'
      DisplayFormat = '0.00'
    end
    object DEPTODESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object EDIF: TTable
    DatabaseName = 'ADB'
    TableName = 'EDIFICIO'
    Left = 210
    Top = 12
    object EDIFIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object EDIFDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
  end
end