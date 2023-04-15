object frmMovCobro: TfrmMovCobro
  Left = 189
  Top = 188
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Movimiento de cobro'
  ClientHeight = 301
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
    Top = 271
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
    Height = 271
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
    object Bevel2: TBevel
      Left = 8
      Top = 139
      Width = 330
      Height = 50
    end
    object Bevel1: TBevel
      Left = 8
      Top = 79
      Width = 330
      Height = 50
    end
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 61
      Height = 13
      Caption = 'Nombre obra'
    end
    object Label2: TLabel
      Left = 290
      Top = 59
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label3: TLabel
      Left = 8
      Top = 39
      Width = 50
      Height = 13
      Caption = 'Propietario'
    end
    object Label4: TLabel
      Left = 18
      Top = 73
      Width = 97
      Height = 13
      Caption = ' Presupuestado: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 15
      Top = 90
      Width = 23
      Height = 13
      Caption = 'Obra'
    end
    object Label6: TLabel
      Left = 181
      Top = 90
      Width = 51
      Height = 13
      Caption = 'Honorarios'
    end
    object Label7: TLabel
      Left = 8
      Top = 195
      Width = 72
      Height = 13
      Caption = 'Monto cobrado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtSaldoPres: TLabel
      Left = 15
      Top = 150
      Width = 23
      Height = 13
      Caption = 'Obra'
    end
    object lblCheque: TLabel
      Left = 208
      Top = 233
      Width = 51
      Height = 13
      Caption = 'N'#186' cheque'
    end
    object Label9: TLabel
      Left = 18
      Top = 133
      Width = 51
      Height = 13
      Caption = ' Saldos: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 181
      Top = 150
      Width = 51
      Height = 13
      Caption = 'Honorarios'
    end
    object Label8: TLabel
      Left = 8
      Top = 233
      Width = 39
      Height = 13
      Caption = 'Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtAPagar: TEdit
      Left = 8
      Top = 209
      Width = 100
      Height = 19
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object rgFormaPago: TRadioGroup
      Left = 208
      Top = 193
      Width = 130
      Height = 36
      Caption = ' Forma de pago: '
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
      TabOrder = 2
      OnClick = rgFormaPagoClick
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
    end
    object edtSaldoHon: TEdit
      Left = 181
      Top = 163
      Width = 150
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtCheque: TEdit
      Left = 208
      Top = 247
      Width = 130
      Height = 19
      TabOrder = 1
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtObra: TEdit
      Left = 15
      Top = 104
      Width = 150
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtHonorarios: TEdit
      Left = 181
      Top = 104
      Width = 150
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object edtPropietario: TEdit
      Left = 8
      Top = 53
      Width = 330
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object edtSaldoObra: TEdit
      Left = 15
      Top = 163
      Width = 150
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edtNombreObra: TEdit
      Left = 8
      Top = 17
      Width = 330
      Height = 19
      TabStop = False
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
    object rgTipoCobro: TRadioGroup
      Left = 115
      Top = 194
      Width = 87
      Height = 72
      Caption = ' Tipo de cobro: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Obra'
        'Honorarios')
      ParentFont = False
      TabOrder = 9
      OnClick = rgFormaPagoClick
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
    end
    object edtMoneda: TEdit
      Left = 8
      Top = 247
      Width = 100
      Height = 19
      TabStop = False
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
  end
end
