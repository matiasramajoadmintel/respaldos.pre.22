object frmOcupante: TfrmOcupante
  Left = 723
  Top = 344
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Datos personales'
  ClientHeight = 304
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
    Height = 274
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
    object Label5: TLabel
      Left = 8
      Top = 169
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object edtApellido: TDBEdit
      Left = 7
      Top = 21
      Width = 200
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
      Left = 214
      Top = 21
      Width = 200
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
      Left = 7
      Top = 61
      Width = 70
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
        'PAS')
      ParentFont = False
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtNroDoc: TDBEdit
      Left = 79
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
      Left = 7
      Top = 102
      Width = 200
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
      Left = 7
      Top = 143
      Width = 200
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
      Left = 214
      Top = 53
      Width = 200
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
    object DBMemo1: TDBMemo
      Left = 8
      Top = 184
      Width = 405
      Height = 81
      DataField = 'OBS'
      DataSource = DataSource1
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 274
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
    object btn1: TButton
      Left = 16
      Top = 0
      Width = 33
      Height = 25
      Caption = 'xls'
      TabOrder = 2
      Visible = False
      OnClick = btn1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = PER_
    Left = 220
    Top = 222
  end
  object PER_: TTable
    OnNewRecord = PER_NewRecord
    DatabaseName = 'ADB'
    TableName = 'PERSONA'
    Left = 260
    Top = 222
    object PER_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
    end
    object PER_NRODOCUMENTO: TIntegerField
      FieldName = 'NRODOCUMENTO'
      Required = True
    end
    object PER_TIPODOCUMENTO: TStringField
      FieldName = 'TIPODOCUMENTO'
      Required = True
      Size = 5
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
    object PER_TELEFONO: TStringField
      FieldName = 'TELEFONO'
    end
    object PER_EMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object PER_TIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
    object PER_OBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
  end
  object scExcelExport1: TscExcelExport
    DataPipe = dpDataSet
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = 1
    FontHeader.Name = 'MS Sans Serif'
    FontHeader.Style = []
    FontHeader.Alignment = haGeneral
    FontHeader.WrapText = False
    FontHeader.Orientation = 0
    BorderHeader.BackAlternateColor = clBlack
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.WrapText = False
    FontTitles.Orientation = 0
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.WrapText = False
    FontData.Orientation = 0
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.WrapText = False
    FontSummary.Orientation = 0
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'MS Sans Serif'
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.WrapText = False
    FontFooter.Orientation = 0
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'MS Sans Serif'
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.WrapText = False
    FontGroup.Orientation = 0
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    Left = 184
    Top = 224
  end
end
