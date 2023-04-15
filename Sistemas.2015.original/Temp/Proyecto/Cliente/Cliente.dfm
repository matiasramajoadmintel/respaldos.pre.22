object frmCliente: TfrmCliente
  Left = 217
  Top = 157
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Propietario'
  ClientHeight = 273
  ClientWidth = 414
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
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 243
    Width = 414
    Height = 30
    Align = alBottom
    TabOrder = 1
    object Panel1: TPanel
      Left = 228
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
  object PageControl1: TPageControl
    Left = 0
    Top = 21
    Width = 414
    Height = 222
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Datos propietario'
      object Label1: TLabel
        Left = 9
        Top = 6
        Width = 61
        Height = 13
        Caption = 'Raz'#243'n social'
        FocusControl = edtRazonSocial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 9
        Top = 41
        Width = 42
        Height = 13
        Caption = 'Domicilio'
        FocusControl = DBEdit2
      end
      object Label4: TLabel
        Left = 9
        Top = 118
        Width = 27
        Height = 13
        Caption = 'e-mail'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 9
        Top = 79
        Width = 46
        Height = 13
        Caption = 'Localidad'
        FocusControl = DBEdit1
      end
      object Label6: TLabel
        Left = 299
        Top = 79
        Width = 64
        Height = 13
        Caption = 'C'#243'digo postal'
        FocusControl = DBEdit5
      end
      object Label7: TLabel
        Left = 9
        Top = 156
        Width = 99
        Height = 13
        Caption = 'Fecha de nacimiento'
      end
      object Label8: TLabel
        Left = 128
        Top = 156
        Width = 19
        Height = 13
        Caption = 'DNI'
        FocusControl = DBEdit6
      end
      object Label9: TLabel
        Left = 255
        Top = 156
        Width = 54
        Height = 13
        Caption = 'CUIT/CUIL'
        FocusControl = DBEdit7
      end
      object edtRazonSocial: TDBEdit
        Left = 9
        Top = 20
        Width = 395
        Height = 19
        Ctl3D = False
        DataField = 'RazonSocial'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit2: TDBEdit
        Left = 9
        Top = 55
        Width = 395
        Height = 19
        Ctl3D = False
        DataField = 'Domicilio'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
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
        Top = 132
        Width = 395
        Height = 19
        Ctl3D = False
        DataField = 'Email'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit1: TDBEdit
        Left = 9
        Top = 93
        Width = 281
        Height = 19
        Ctl3D = False
        DataField = 'Localidad'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit5: TDBEdit
        Left = 299
        Top = 93
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'CodigoPostal'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit6: TDBEdit
        Left = 128
        Top = 170
        Width = 115
        Height = 19
        Ctl3D = False
        DataField = 'DNI'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit7: TDBEdit
        Left = 255
        Top = 170
        Width = 149
        Height = 19
        Ctl3D = False
        DataField = 'CUIT'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object DBEdit8: TDBEdit
        Left = 9
        Top = 170
        Width = 107
        Height = 19
        Ctl3D = False
        DataField = 'FechaNacimiento'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Tel'#233'fonos'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 406
        Height = 164
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        TabOrder = 0
        object Label3: TLabel
          Left = 122
          Top = 60
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
        end
        object grdDatos: TDBGrid
          Left = 5
          Top = 5
          Width = 396
          Height = 154
          Align = alClient
          BorderStyle = bsNone
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyPress = PressEnter
          Columns = <
            item
              Expanded = False
              FieldName = 'Telefono'
              Title.Alignment = taCenter
              Width = 372
              Visible = True
            end>
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 164
        Width = 406
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btnAgregar: TButton
          Left = 7
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Agregar (+)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnAgregarClick
          OnKeyPress = PressEnter
        end
        object btnEliminar: TButton
          Left = 83
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Eliminar (-)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnEliminarClick
          OnKeyPress = PressEnter
        end
      end
    end
  end
  object CLI: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Cliente'
    Left = 206
    Top = 24
    object CLIIdCliente: TSmallintField
      FieldName = 'IdCliente'
    end
    object CLIRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Required = True
      Size = 60
    end
    object CLIDomicilio: TStringField
      FieldName = 'Domicilio'
      Size = 60
    end
    object CLIEmail: TStringField
      FieldName = 'Email'
      Size = 30
    end
    object CLILocalidad: TStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object CLICodigoPostal: TStringField
      FieldName = 'CodigoPostal'
      Size = 10
    end
    object CLIFechaNacimiento: TDateTimeField
      FieldName = 'FechaNacimiento'
      DisplayFormat = 'DD/MM/YYYY'
      EditMask = '!99/99/0000;1;_'
    end
    object CLIDNI: TStringField
      FieldName = 'DNI'
      Size = 12
    end
    object CLICUIT: TStringField
      FieldName = 'CUIT'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = CLI
    Left = 234
    Top = 28
  end
  object qryTelefonos: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT Telefono FROM TelefonoCliente'
      'WHERE IdCliente = :N')
    Left = 198
    Top = 73
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'N'
        ParamType = ptUnknown
      end>
    object qryTelefonosTelefono: TStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'Telefono'
      Origin = 'DBR.TelefonoCliente.Telefono'
      Size = 30
    end
  end
  object TELCLI: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.TelefonoCliente'
    Left = 250
    Top = 73
    object TELCLIIdCliente: TSmallintField
      FieldName = 'IdCliente'
      Required = True
    end
    object TELCLITelefono: TStringField
      FieldName = 'Telefono'
      Required = True
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = qryTelefonos
    Left = 166
    Top = 74
  end
end
