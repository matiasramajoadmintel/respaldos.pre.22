object frmOcupanteMilitar: TfrmOcupanteMilitar
  Left = 1222
  Top = 324
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Personal militar'
  ClientHeight = 316
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDatos: TPanel
    Left = 0
    Top = 28
    Width = 322
    Height = 260
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
      Top = 199
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
    object Label10: TLabel
      Left = 136
      Top = 199
      Width = 79
      Height = 13
      Caption = 'Tel'#233'fono destino'
      FocusControl = DBEdit3
    end
    object edtDestino: TDBEdit
      Left = 8
      Top = 213
      Width = 120
      Height = 21
      DataField = 'Destino'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
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
      DataSource = DataSource2
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
    object edtAntGrado: TDBEdit
      Left = 14
      Top = 162
      Width = 50
      Height = 21
      DataField = 'AntGrado'
      DataSource = DataSource2
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
      TabOrder = 2
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
      TabOrder = 3
      TabStop = False
      OnClick = btnElegirEspecialidadClick
      NumGlyphs = 2
    end
    object dtpFecIng: TDateTimePicker
      Left = 141
      Top = 168
      Width = 116
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
      TabOrder = 8
    end
    object DBEdit1: TDBEdit
      Left = 146
      Top = 106
      Width = 90
      Height = 21
      DataField = 'RENTAPROPIA'
      DataSource = DataSource2
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
    object DBEdit2: TDBEdit
      Left = 79
      Top = 162
      Width = 50
      Height = 21
      DataField = 'ANT_SERVICIO'
      DataSource = DataSource2
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
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 6
      Top = 17
      Width = 230
      Height = 21
      DataField = 'Grado'
      DataSource = DataSource2
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
    object cmbEspecialidad: TDBLookupComboBox
      Left = 6
      Top = 62
      Width = 230
      Height = 21
      DataField = 'Especialidad'
      DataSource = DataSource2
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
    object DBEdit3: TDBEdit
      Left = 136
      Top = 213
      Width = 120
      Height = 21
      DataField = 'TELEFONO_DESTINO'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 286
    Width = 322
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
      Visible = False
      OnClick = BitBtn1Click
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 321
    Height = 25
    Caption = 'Personal Militar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object OM_: TTable
    DatabaseName = 'ADB'
    TableName = 'OCUPANTE_MILITAR'
    Left = 292
    Top = 200
    object OM_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object OM_IDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
    end
    object OM_ANTGRADO: TIntegerField
      FieldName = 'ANTGRADO'
      Required = True
    end
    object OM_DESTINO: TStringField
      FieldName = 'DESTINO'
      Size = 30
    end
    object OM_MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
    object OM_IDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
    end
    object OM_RENTAPROPIA: TFloatField
      FieldName = 'RENTAPROPIA'
    end
    object OM_FECHA_INGRESO: TDateTimeField
      FieldName = 'FECHA_INGRESO'
    end
    object OM_ANT_SERVICIO: TIntegerField
      FieldName = 'ANT_SERVICIO'
    end
    object OM_Grado: TStringField
      FieldKind = fkLookup
      FieldName = 'Grado'
      LookupDataSet = GR_
      LookupKeyFields = 'IDGRADO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDGRADO'
      Size = 50
      Lookup = True
    end
    object OM_Especialidad: TStringField
      FieldKind = fkLookup
      FieldName = 'Especialidad'
      LookupDataSet = ES_
      LookupKeyFields = 'IDESPECIALIDAD'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDESPECIALIDAD'
      Size = 50
      Lookup = True
    end
    object OM_TELEFONO_DESTINO: TStringField
      FieldName = 'TELEFONO_DESTINO'
      Size = 6
    end
  end
  object GR_: TTable
    Active = True
    DatabaseName = 'ADB'
    TableName = 'GRADO'
    Left = 290
    Top = 157
    object GR_IDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
    end
    object GR_DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object ES_: TTable
    Active = True
    DatabaseName = 'ADB'
    TableName = 'ESPECIALIDAD'
    Left = 288
    Top = 178
    object ES_IDESPECIALIDAD: TIntegerField
      FieldName = 'IDESPECIALIDAD'
      Required = True
    end
    object ES_DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = ztblOM_
    Left = 280
    Top = 124
  end
  object MNO_: TTable
    DatabaseName = 'ADB'
    TableName = 'MILITAR_NO_OCUPANTE'
    Left = 292
    Top = 232
    object MNO_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object MNO_IDGRADO: TIntegerField
      FieldName = 'IDGRADO'
      Required = True
    end
    object MNO_MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object ztblES_: TZTable
    Connection = frmPrincipal.masterkey
    RequestLive = True
    CachedUpdates = False
    Active = True
    TableName = 'especialidad'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 264
    Top = 184
    object ztblES_idespecialidad: TIntegerField
      FieldName = 'idespecialidad'
      Required = True
    end
    object strngfldES_descripcion: TStringField
      FieldName = 'descripcion'
      Required = True
      Size = 150
    end
  end
  object ztblGR_: TZTable
    Connection = frmPrincipal.masterkey
    RequestLive = True
    CachedUpdates = False
    Active = True
    TableName = 'grado'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 264
    Top = 160
    object ztblGR_IDGRADO: TIntegerField
      FieldName = 'IDGRADO'
    end
    object strngfldGR_DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  object ztblMNO_: TZTable
    Connection = frmPrincipal.masterkey
    RequestLive = True
    CachedUpdates = False
    Active = True
    TableName = 'militar_no_ocupante'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 264
    Top = 232
    object ztblMNO_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblMNO_idgrado: TIntegerField
      FieldName = 'idgrado'
      Required = True
    end
    object strngfldMNO_matricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
  end
  object ztblOM_: TZTable
    Connection = frmPrincipal.masterkey
    RequestLive = True
    CachedUpdates = False
    Active = True
    TableName = 'ocupante_militar'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 264
    Top = 208
    object ztblOM_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblOM_idespecialidad: TIntegerField
      FieldName = 'idespecialidad'
    end
    object ztblOM_antgrado: TIntegerField
      FieldName = 'antgrado'
      Required = True
    end
    object strngfldOM_destino: TStringField
      FieldName = 'destino'
      Size = 90
    end
    object strngfldOM_matricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
    object ztblOM_idgrado: TIntegerField
      FieldName = 'idgrado'
      Required = True
    end
    object ztblOM_rentapropia: TFloatField
      FieldName = 'rentapropia'
    end
    object ztblOM_fecha_ingreso: TDateTimeField
      FieldName = 'fecha_ingreso'
    end
    object ztblOM_ant_servicio: TIntegerField
      FieldName = 'ant_servicio'
    end
    object strngfldOM_Grado: TStringField
      FieldKind = fkLookup
      FieldName = 'Grado'
      LookupDataSet = GR_
      LookupKeyFields = 'IDGRADO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'idgrado'
      Size = 50
      Lookup = True
    end
    object strngfldOM_Especialidad: TStringField
      FieldKind = fkLookup
      FieldName = 'Especialidad'
      LookupDataSet = ES_
      LookupKeyFields = 'IDESPECIALIDAD'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'idespecialidad'
      Size = 50
      Lookup = True
    end
    object strngfldOM_telefono_destino: TStringField
      FieldName = 'telefono_destino'
      Size = 18
    end
  end
end
