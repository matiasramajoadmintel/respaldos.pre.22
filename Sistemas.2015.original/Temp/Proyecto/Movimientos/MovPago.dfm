object frmMovPago: TfrmMovPago
  Left = 244
  Top = 195
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Movimiento de pago'
  ClientHeight = 231
  ClientWidth = 349
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
    Top = 201
    Width = 349
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Color = clGray
    TabOrder = 0
    object Panel1: TPanel
      Left = 164
      Top = 0
      Width = 185
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      Color = clGray
      Ctl3D = False
      ParentCtl3D = False
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
    Width = 349
    Height = 201
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clSkyBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 146
      Top = 6
      Width = 30
      Height = 13
      Caption = 'Fecha'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 4
      Top = 44
      Width = 49
      Height = 13
      Caption = 'Proveedor'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 4
      Top = 82
      Width = 23
      Height = 13
      Caption = 'Obra'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 4
      Top = 120
      Width = 21
      Height = 13
      Caption = 'Tipo'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 123
      Top = 120
      Width = 30
      Height = 13
      Caption = 'Monto'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 4
      Top = 160
      Width = 69
      Height = 13
      Caption = 'Monto a pagar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 242
      Top = 120
      Width = 27
      Height = 13
      Caption = 'Saldo'
    end
    object lblCheque: TLabel
      Left = 242
      Top = 160
      Width = 51
      Height = 13
      Caption = 'N'#186' cheque'
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 20
      Width = 135
      Height = 19
      Color = clTeal
      DataField = 'Numero'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 146
      Top = 20
      Width = 197
      Height = 19
      Color = clTeal
      DataField = 'Fecha'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 3
      Top = 58
      Width = 340
      Height = 19
      Color = clTeal
      DataField = 'Proveedor'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 3
      Top = 96
      Width = 340
      Height = 19
      Color = clTeal
      DataField = 'Obra'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 4
      Top = 134
      Width = 100
      Height = 19
      Color = clTeal
      DataField = 'Tipo'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 123
      Top = 134
      Width = 100
      Height = 19
      Color = clTeal
      DataField = 'Monto'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtAPagar: TEdit
      Left = 4
      Top = 174
      Width = 100
      Height = 19
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object rgFormaPago: TRadioGroup
      Left = 109
      Top = 160
      Width = 129
      Height = 33
      Caption = 'Forma de pago'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Efectivo'
        'Cheque')
      ParentFont = False
      TabOrder = 7
      OnClick = rgFormaPagoClick
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
    end
    object edtSaldo: TEdit
      Left = 243
      Top = 134
      Width = 100
      Height = 19
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtCheque: TEdit
      Left = 242
      Top = 174
      Width = 100
      Height = 19
      TabOrder = 9
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
  end
  object qryFact: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwFacturas')
    Left = 290
    Top = 77
    object qryFactIdFactura: TSmallintField
      FieldName = 'IdFactura'
      Origin = 'DBR.vwFacturas.IdFactura'
    end
    object qryFactNumero: TStringField
      FieldName = 'Numero'
      Origin = 'DBR.vwFacturas.Numero'
      Size = 15
    end
    object qryFactFecha: TDateTimeField
      FieldName = 'Fecha'
      Origin = 'DBR.vwFacturas.Fecha'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryFactProveedor: TStringField
      FieldName = 'Proveedor'
      Origin = 'DBR.vwFacturas.Proveedor'
      Size = 60
    end
    object qryFactObra: TStringField
      FieldName = 'Obra'
      Origin = 'DBR.vwFacturas.Obra'
      Size = 50
    end
    object qryFactTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'DBR.vwFacturas.Tipo'
      Size = 10
    end
    object qryFactMonto: TFloatField
      FieldName = 'Monto'
      Origin = 'DBR.vwFacturas.Monto'
      currency = True
    end
  end
  object DataSource2: TDataSource
    DataSet = qryFact
    Left = 258
    Top = 78
  end
  object PAGO: TTable
    DatabaseName = 'DBR'
    Left = 204
    Top = 64
  end
end
