object frmIngServ: TfrmIngServ
  Left = 313
  Top = 168
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ingresar gasto de servicio'
  ClientHeight = 258
  ClientWidth = 287
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
    Top = 228
    Width = 287
    Height = 30
    Align = alBottom
    TabOrder = 0
    object btnAceptar: TBitBtn
      Left = 134
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
      Left = 210
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
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
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 0
    Width = 287
    Height = 228
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 6
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label2: TLabel
      Left = 12
      Top = 78
      Width = 46
      Height = 13
      Caption = 'Concepto'
    end
    object Label3: TLabel
      Left = 12
      Top = 42
      Width = 34
      Height = 13
      Caption = 'Edificio'
    end
    object Label4: TLabel
      Left = 12
      Top = 150
      Width = 35
      Height = 13
      Caption = 'Importe'
    end
    object btnBuscarServ: TSpeedButton
      Left = 253
      Top = 91
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnBuscarServClick
    end
    object Label5: TLabel
      Left = 12
      Top = 114
      Width = 49
      Height = 13
      Caption = 'Proveedor'
    end
    object btnBuscarProv: TSpeedButton
      Left = 254
      Top = 127
      Width = 23
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnBuscarProvClick
    end
    object lblDECI: TLabel
      Left = 194
      Top = 188
      Width = 25
      Height = 13
      Caption = 'DECI'
    end
    object lblOrden: TLabel
      Left = 237
      Top = 188
      Width = 29
      Height = 13
      Caption = 'Orden'
    end
    object Label6: TLabel
      Left = 12
      Top = 188
      Width = 51
      Height = 13
      Caption = 'N'#186' Factura'
      FocusControl = DBEdit1
    end
    object dtpFecha: TDateTimePicker
      Left = 12
      Top = 20
      Width = 101
      Height = 21
      CalAlignment = dtaLeft
      Date = 37704.8491248495
      Time = 37704.8491248495
      DateFormat = dfShort
      DateMode = dmComboBox
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = dtkDate
      ParseInput = False
      ParentFont = False
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object ComboEdificio: TDBLookupComboBox
      Left = 12
      Top = 56
      Width = 265
      Height = 21
      DataField = 'Edificio'
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
    object ComboServicio: TDBLookupComboBox
      Left = 12
      Top = 92
      Width = 241
      Height = 21
      DataField = 'Concepto'
      DataSource = DataSource1
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
    object ComboProveedor: TDBLookupComboBox
      Left = 12
      Top = 128
      Width = 241
      Height = 21
      DataField = 'Proveedor'
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
    object edtCosto: TDBEdit
      Left = 12
      Top = 164
      Width = 134
      Height = 21
      DataField = 'COSTO'
      DataSource = DataSource1
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
    object edtDECI: TDBEdit
      Left = 193
      Top = 202
      Width = 40
      Height = 21
      DataField = 'NRO_DECI'
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
    object edtOrden: TDBEdit
      Left = 237
      Top = 202
      Width = 40
      Height = 21
      DataField = 'NRO_ORDEN'
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
    object DBEdit1: TDBEdit
      Left = 12
      Top = 202
      Width = 134
      Height = 21
      DataField = 'NRO_FACT'
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
  object SERVEDIF: TTable
    OnNewRecord = SERVEDIFNewRecord
    DatabaseName = 'ADB'
    TableName = 'SERV_EDIF'
    Left = 214
    Top = 4
    object SERVEDIFIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Required = True
    end
    object SERVEDIFIDSERVICIO: TIntegerField
      FieldName = 'IDSERVICIO'
      Required = True
    end
    object SERVEDIFIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Required = True
    end
    object SERVEDIFFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Required = True
    end
    object SERVEDIFCOSTO: TFloatField
      FieldName = 'COSTO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object SERVEDIFIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
    end
    object SERVEDIFVACIOS: TStringField
      DefaultExpression = #39'No'#39
      FieldName = 'VACIOS'
      Size = 2
    end
    object SERVEDIFEdificio: TStringField
      FieldKind = fkLookup
      FieldName = 'Edificio'
      LookupDataSet = dmDatos.EDIF
      LookupKeyFields = 'IdEdificio'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDEDIFICIO'
      Size = 60
      Lookup = True
    end
    object SERVEDIFConcepto: TStringField
      FieldKind = fkLookup
      FieldName = 'Concepto'
      LookupDataSet = dmDatos.SERV
      LookupKeyFields = 'IDSERVICIO'
      LookupResultField = 'DESCRIP'
      KeyFields = 'IDSERVICIO'
      Size = 60
      Lookup = True
    end
    object SERVEDIFProveedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Proveedor'
      LookupDataSet = dmDatos.PROV
      LookupKeyFields = 'IDPROVEEDOR'
      LookupResultField = 'RAZON_SOCIAL'
      KeyFields = 'IDPROVEEDOR'
      Size = 45
      Lookup = True
    end
    object SERVEDIFPAGADO: TStringField
      FieldName = 'PAGADO'
      Size = 2
    end
    object SERVEDIFNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object SERVEDIFNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
    object SERVEDIFNRO_FACT: TIntegerField
      FieldName = 'NRO_FACT'
    end
  end
  object DataSource1: TDataSource
    DataSet = SERVEDIF
    Left = 182
    Top = 2
  end
  object qryExisteNro: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDSERV_EDIF, NRO_ORDEN FROM SERV_EDIF'
      'WHERE (NRO_ORDEN = :N) AND (IDSERV_EDIF <> :I)')
    Left = 154
    Top = 2
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'I'
        ParamType = ptUnknown
      end>
  end
end
