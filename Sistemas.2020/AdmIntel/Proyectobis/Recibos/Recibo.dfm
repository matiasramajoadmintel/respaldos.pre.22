object frmRecibo: TfrmRecibo
  Left = 193
  Top = 190
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Emitir recibo'
  ClientHeight = 193
  ClientWidth = 450
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
  object Label4: TLabel
    Left = 126
    Top = 66
    Width = 83
    Height = 13
    Caption = 'Fecha de emisi'#243'n'
  end
  object Panel2: TPanel
    Left = 0
    Top = 163
    Width = 450
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 264
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
    Top = 0
    Width = 450
    Height = 163
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Bevel2: TBevel
      Left = 248
      Top = 99
      Width = 189
      Height = 55
    end
    object Bevel1: TBevel
      Left = 9
      Top = 99
      Width = 203
      Height = 55
    end
    object Label1: TLabel
      Left = 9
      Top = 9
      Width = 83
      Height = 13
      Caption = 'Fecha de emisi'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 170
      Top = 9
      Width = 47
      Height = 13
      Caption = 'Ocupante'
      FocusControl = ComboOcupante
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 413
      Top = 23
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 111
      Width = 72
      Height = 13
      Caption = 'Fecha de inicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 113
      Top = 111
      Width = 59
      Height = 13
      Caption = 'Fecha de fin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 254
      Top = 111
      Width = 69
      Height = 13
      Caption = 'Mantenimiento'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 348
      Top = 111
      Width = 46
      Height = 13
      Caption = 'Expensas'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 51
      Width = 41
      Height = 13
      Caption = 'Vivienda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 17
      Top = 93
      Width = 56
      Height = 13
      Caption = ' Periodo: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 254
      Top = 93
      Width = 61
      Height = 13
      Caption = ' Importes: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 107
      Top = 9
      Width = 49
      Height = 13
      Caption = 'N'#186' Recibo'
      FocusControl = DBEdit3
    end
    object DBEdit2: TDBEdit
      Left = 348
      Top = 125
      Width = 80
      Height = 21
      DataField = 'MONTO_EXPENSAS'
      DataSource = DataSource1
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
    object dtpEmision: TDateTimePicker
      Left = 9
      Top = 23
      Width = 95
      Height = 21
      Date = 38239.966133530100000000
      Time = 38239.966133530100000000
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
    object ComboOcupante: TDBLookupComboBox
      Left = 170
      Top = 23
      Width = 242
      Height = 21
      DataField = 'Persona'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ComboOcupanteClick
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object dtpInicio: TDateTimePicker
      Left = 13
      Top = 125
      Width = 95
      Height = 21
      Date = 38239.966133530100000000
      Time = 38239.966133530100000000
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
    object DBEdit1: TDBEdit
      Left = 254
      Top = 125
      Width = 81
      Height = 21
      DataField = 'MONTO_MANTENIMIENTO'
      DataSource = DataSource1
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
    object DBEdit3: TDBEdit
      Left = 107
      Top = 23
      Width = 59
      Height = 21
      DataField = 'NRO_RECIBO'
      DataSource = DataSource1
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
    object DBEdit4: TDBEdit
      Left = 9
      Top = 66
      Width = 428
      Height = 21
      TabStop = False
      DataField = 'Vivienda'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
  end
  object dtpFin: TDateTimePicker
    Left = 112
    Top = 125
    Width = 95
    Height = 21
    Date = 38239.966133530100000000
    Time = 38239.966133530100000000
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
    OnKeyPress = PressEnter
    OnKeyUp = Teclitas
  end
  object REC: TTable
    DatabaseName = 'ADB'
    TableName = 'RECIBO'
    Left = 220
    Top = 8
    object RECIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
    end
    object RECFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Required = True
    end
    object RECNRO_RECIBO: TStringField
      FieldName = 'NRO_RECIBO'
      Required = True
      Size = 10
    end
    object RECIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object RECFECHA_INICIO: TDateTimeField
      FieldName = 'FECHA_INICIO'
    end
    object RECFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object RECMONTO_MANTENIMIENTO: TFloatField
      FieldName = 'MONTO_MANTENIMIENTO'
      Required = True
      currency = True
    end
    object RECMONTO_EXPENSAS: TFloatField
      FieldName = 'MONTO_EXPENSAS'
      Required = True
      currency = True
    end
    object RECIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object RECIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object RECPersona: TStringField
      FieldKind = fkLookup
      FieldName = 'Persona'
      LookupDataSet = qryOcup
      LookupKeyFields = 'IDOCUPANTE'
      LookupResultField = 'OCUPANTE'
      KeyFields = 'IDPERSONA'
      Size = 45
      Lookup = True
    end
    object RECVivienda: TStringField
      FieldKind = fkLookup
      FieldName = 'Vivienda'
      LookupDataSet = qryOcup
      LookupKeyFields = 'IDOCUPANTE'
      LookupResultField = 'LOCACION'
      KeyFields = 'IDPERSONA'
      Size = 120
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = REC
    Left = 362
    Top = 12
  end
  object RA: TTable
    DatabaseName = 'ADB'
    TableName = 'RECIBO_ANULADO'
    Left = 224
    Top = 46
    object RAIDRECIBO_ANULADO: TIntegerField
      FieldName = 'IDRECIBO_ANULADO'
      Required = True
    end
    object RANRO_RECIBO: TIntegerField
      FieldName = 'NRO_RECIBO'
      Required = True
    end
    object RAFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
  end
  object qryOcup: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_OCUPANTES_ACTUALES'
      'ORDER BY OCUPANTE')
    Left = 262
    Top = 46
    object qryOcupIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDOCUPANTE'
    end
    object qryOcupOCUPANTE: TStringField
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.OCUPANTE'
      Size = 41
    end
    object qryOcupLOCACION: TStringField
      FieldName = 'LOCACION'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.LOCACION'
      Size = 111
    end
    object qryOcupIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDEDIFICIO'
    end
    object qryOcupIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDDEPARTAMENTO'
    end
  end
end
