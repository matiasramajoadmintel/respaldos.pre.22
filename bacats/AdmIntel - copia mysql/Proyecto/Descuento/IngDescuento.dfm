object frmIngDescuento: TfrmIngDescuento
  Left = 205
  Top = 294
  Width = 350
  Height = 230
  Caption = 'Descuento'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 342
    Height = 173
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 48
      Width = 93
      Height = 13
      Caption = 'Tipo De Descuento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMes: TLabel
      Left = 9
      Top = 90
      Width = 20
      Height = 13
      Caption = 'Mes'
    end
    object LAnio: TLabel
      Left = 153
      Top = 90
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
    end
    object Label3: TLabel
      Left = 9
      Top = 128
      Width = 30
      Height = 13
      Caption = 'Monto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 6
      Width = 47
      Height = 13
      Caption = 'Ocupante'
      FocusControl = DBLookupComboBox1
    end
    object Label1: TLabel
      Left = 153
      Top = 128
      Width = 51
      Height = 13
      Caption = 'N'#186' Factura'
      FocusControl = DBEdit2
    end
    object btnBuscarServ: TSpeedButton
      Left = 309
      Top = 20
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 309
      Top = 64
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbMes: TDBComboBox
      Left = 9
      Top = 104
      Width = 124
      Height = 21
      CharCase = ecUpperCase
      DataField = 'Mes'
      DataSource = dsDESC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'ENERO'
        'FEBRERO'
        'MARZO'
        'ABRIL'
        'MAYO'
        'JUNIO'
        'JULIO'
        'AGOSTO'
        'SETIEMBRE'
        'OCTUBRE'
        'NOVIEMBRE'
        'DICIEMBRE')
      ParentFont = False
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object UpDown1: TUpDown
      Left = 193
      Top = 104
      Width = 15
      Height = 21
      Associate = edtAnio
      Min = 1800
      Max = 2100
      Position = 1900
      TabOrder = 6
      Thousands = False
      OnClick = UpDown1Click
    end
    object edtAnio: TEdit
      Left = 153
      Top = 104
      Width = 40
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '1900'
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 9
      Top = 20
      Width = 300
      Height = 21
      DataField = 'Ocupante'
      DataSource = dsDESC
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
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 9
      Top = 64
      Width = 300
      Height = 21
      DataField = 'TipoDescuento'
      DataSource = dsDESC
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
    object DBEdit1: TDBEdit
      Left = 9
      Top = 142
      Width = 121
      Height = 21
      DataField = 'MONTO'
      DataSource = dsDESC
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
      Left = 153
      Top = 142
      Width = 134
      Height = 21
      DataField = 'NRO_FACT'
      DataSource = dsDESC
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 173
    Width = 342
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 188
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
      Left = 264
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object dsDESC: TDataSource
    DataSet = DESC
    Left = 248
    Top = 128
  end
  object DESC: TTable
    DatabaseName = 'ADB'
    TableName = 'DESCUENTO'
    Left = 252
    Top = 96
    object DESCIDDESCUENTO: TIntegerField
      FieldName = 'IDDESCUENTO'
    end
    object DESCIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Required = True
    end
    object DESCIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Required = True
    end
    object DESCMES: TStringField
      FieldName = 'MES'
      Size = 10
    end
    object DESCANIO: TIntegerField
      FieldName = 'ANIO'
    end
    object DESCMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object DESCNRO_FACT: TIntegerField
      FieldName = 'NRO_FACT'
    end
    object DESCOcupante: TStringField
      FieldKind = fkLookup
      FieldName = 'Ocupante'
      LookupDataSet = PERS
      LookupKeyFields = 'IDPERSONA'
      LookupResultField = 'Ocupante'
      KeyFields = 'IDOCUPANTE'
      Size = 45
      Lookup = True
    end
    object DESCTipoDescuento: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoDescuento'
      LookupDataSet = TDESC
      LookupKeyFields = 'IDTIPODESCUENTO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDTIPODESCUENTO'
      Size = 25
      Lookup = True
    end
  end
  object PERS: TTable
    OnCalcFields = PERSCalcFields
    DatabaseName = 'ADB'
    TableName = 'PERSONA'
    Left = 222
    Top = 98
    object PERSIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object PERSNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 25
    end
    object PERSAPELLIDO: TStringField
      FieldName = 'APELLIDO'
      Required = True
      Size = 15
    end
    object PERSOcupante: TStringField
      FieldKind = fkCalculated
      FieldName = 'Ocupante'
      Size = 45
      Calculated = True
    end
  end
  object TDESC: TTable
    DatabaseName = 'ADB'
    TableName = 'TIPO_DESCUENTO'
    Left = 228
    Top = 64
    object TDESCIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Required = True
    end
    object TDESCDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 25
    end
  end
end
