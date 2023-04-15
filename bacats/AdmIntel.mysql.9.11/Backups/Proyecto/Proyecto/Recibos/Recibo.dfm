object frmRecibo: TfrmRecibo
  Left = 193
  Top = 190
  Width = 486
  Height = 310
  BorderIcons = []
  Caption = 'Emitir recibo'
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
  object Panel2: TPanel
    Left = 0
    Top = 253
    Width = 478
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 292
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
    Width = 478
    Height = 253
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Fecha de emisi'#243'n'
    end
    object Label2: TLabel
      Left = 118
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Ocupante'
      FocusControl = DBLookupComboBox1
    end
    object SpeedButton1: TSpeedButton
      Left = 420
      Top = 30
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
    object DateTimePicker1: TDateTimePicker
      Left = 18
      Top = 30
      Width = 95
      Height = 21
      CalAlignment = dtaLeft
      Date = 38239.9661335301
      Time = 38239.9661335301
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 118
      Top = 30
      Width = 300
      Height = 21
      DataField = 'Persona'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object REC: TTable
    DatabaseName = 'ADB'
    TableName = 'RECIBO'
    Left = 220
    Top = 8
    object RECIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
      Required = True
    end
    object RECFECHA_EMISION: TDateTimeField
      FieldName = 'FECHA_EMISION'
      Required = True
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
    end
    object RECMONTO_EXPENSAS: TFloatField
      FieldName = 'MONTO_EXPENSAS'
      Required = True
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
      LookupDataSet = PERS
      LookupKeyFields = 'IDPERSONA'
      LookupResultField = 'ApeNom'
      KeyFields = 'IDPERSONA'
      Size = 45
      Lookup = True
    end
  end
  object PERS: TTable
    OnCalcFields = PERSCalcFields
    DatabaseName = 'ADB'
    Filter = 'TIPO='#39'OCUP_PART'#39
    Filtered = True
    TableName = 'PERSONA'
    Left = 254
    Top = 8
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
    object PERSApeNom: TStringField
      FieldKind = fkCalculated
      FieldName = 'ApeNom'
      Size = 45
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = REC
    Left = 190
    Top = 10
  end
  object DEPTO: TTable
    DatabaseName = 'ADB'
    TableName = 'DEPARTAMENTO'
    Left = 288
    Top = 10
    object DEPTOIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object DEPTOIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Required = True
    end
    object DEPTODESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object DEPTODescEdif: TStringField
      FieldKind = fkLookup
      FieldName = 'DescEdif'
      LookupDataSet = EDIF
      LookupKeyFields = 'IDEDIFICIO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDEDIFICIO'
      Size = 50
      Lookup = True
    end
  end
  object EDIF: TTable
    DatabaseName = 'ADB'
    TableName = 'EDIFICIO'
    Left = 320
    Top = 10
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
