object frmMilitarNoOcupante: TfrmMilitarNoOcupante
  Left = 884
  Top = 367
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Militar no ocupante'
  ClientHeight = 146
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 371
    Height = 21
    Align = alTop
    Caption = 'Militar no ocupante'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 21
    Width = 371
    Height = 95
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 52
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
    object Label3: TLabel
      Left = 10
      Top = 7
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
    object edtMatricula: TDBEdit
      Left = 9
      Top = 66
      Width = 173
      Height = 21
      DataField = 'Matricula'
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
    object edtGrado: TEdit
      Left = 8
      Top = 21
      Width = 280
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
      Text = 'edtGrado'
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object btnElegirGrado: TBitBtn
      Left = 289
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Elegir'
      TabOrder = 1
      OnClick = btnElegirGradoClick
      Glyph.Data = {
        F60C0000424DF60C000000000000360000002800000040000000110000000100
        180000000000C00C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000000000000000FFFFFFFFFFFF000000000000000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0000000000000000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000C0C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0000000000000C0C0C0FFFFFEFFFFFEFFFFFE000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0FFFFFEFFFFFEFFFFFEFFFF
        FE000000C0C0C0FFFFFEFFFFFE000000000000000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000C0C0C0C0C0C0000000C0C0C0FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FE000000FFFFFE000000000000C0C0C0FFFFFEFFFFFEFFFFFE000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000C0C0C0C0C0C0000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFE000000C0C0C0FFFFFEFFFFFE000000000000000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFE000000FFFFFE000000000000C0C0C0FFFFFEFFFFFEFFFFFEFFFFFE00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFE000000C0C0C0FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFE000000FFFFFEFFFFFEFFFFFE00000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFE000000000000000000000000FFFFFEFFFFFEFFFFFEFFFFFEFF
        FFFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFE000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFF
        FFFE000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE00000000
        0000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFF00FFFF00000000000000FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE000000000000C0C0C0FF
        FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000000000000000FFFFFFFFFFFF000000000000FFFFFEFFFFFEFFFFFEFFFF
        FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE000000FFFFFEFFFFFEFFFFFEFF
        FFFEFFFFFEFFFFFEFFFFFE000000000000000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFEFFFF
        FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE00000000
        0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        00000000000000000000000000000000000000000000000000000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 116
    Width = 371
    Height = 30
    Align = alBottom
    TabOrder = 2
    object btnAceptar: TBitBtn
      Left = 217
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
      Left = 293
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
      Kind = bkCancel
    end
  end
  object PER_: TTable
    DatabaseName = 'ADB'
    TableName = 'PERSONA'
    Left = 112
    Top = 18
    object PER_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object PER_NOMBRE: TStringField
      FieldName = 'NOMBRE'
      Required = True
      Size = 25
    end
    object PER_APELLIDO: TStringField
      FieldName = 'APELLIDO'
      Required = True
      Size = 15
    end
  end
  object MNO_: TTable
    DatabaseName = 'ADB'
    TableName = 'MILITAR_NO_OCUPANTE'
    Left = 146
    Top = 18
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
  object DataSource1: TDataSource
    DataSet = ztblMNO_
    Left = 248
    Top = 36
  end
  object GR_: TTable
    DatabaseName = 'ADB'
    TableName = 'GRADO'
    Left = 176
    Top = 18
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
  object OM_: TTable
    DatabaseName = 'ADB'
    TableName = 'OCUPANTE_MILITAR'
    Left = 207
    Top = 18
    object OM_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
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
  end
  object ztblMNO_: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    TableName = 'militar_no_ocupante'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 144
    Top = 53
    object ztblMNO_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblMNO_idgrado: TIntegerField
      FieldName = 'idgrado'
      Required = True
    end
    object ztblMNO_matricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
  end
  object ztblGR_: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    TableName = 'grado'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 176
    Top = 53
    object ztblGR_idgrado: TIntegerField
      FieldName = 'idgrado'
      Required = True
    end
    object ztblGR_descripcion: TStringField
      FieldName = 'descripcion'
      Required = True
      Size = 150
    end
  end
  object ztblPER_: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    TableName = 'persona'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 112
    Top = 53
    object ztblPER_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblPER_nombre: TStringField
      FieldName = 'nombre'
      Required = True
      Size = 75
    end
    object ztblPER_apellido: TStringField
      FieldName = 'apellido'
      Required = True
      Size = 45
    end
  end
  object ztblOM_: TZTable
    Connection = frmPrincipal.mysql
    RequestLive = False
    CachedUpdates = False
    TableName = 'ocupante_militar'
    ShowRecordTypes = [utUnmodified, utModified, utInserted]
    UpdateMode = umUpdateChanged
    WhereMode = wmWhereKeyOnly
    Options = [doCalcDefaults]
    Left = 208
    Top = 53
    object ztblOM_idpersona: TIntegerField
      FieldName = 'idpersona'
      Required = True
    end
    object ztblOM_matricula: TStringField
      FieldName = 'matricula'
      Required = True
      Size = 24
    end
    object ztblOM_idgrado: TIntegerField
      FieldName = 'idgrado'
      Required = True
    end
    object ztblOM_GRADO: TStringField
      FieldKind = fkLookup
      FieldName = 'GRADO'
      LookupDataSet = ztblGR_
      LookupKeyFields = 'idgrado'
      LookupResultField = 'descripcion'
      KeyFields = 'idgrado'
      Size = 15
      Lookup = True
    end
  end
end
