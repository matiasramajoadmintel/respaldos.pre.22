object frmProv: TfrmProv
  Left = 145
  Top = 159
  Width = 421
  Height = 337
  BorderIcons = [biSystemMenu]
  Caption = 'Proveedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 413
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
    Top = 280
    Width = 413
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 259
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
      Left = 335
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
  object PageControl1: TPageControl
    Left = 0
    Top = 21
    Width = 413
    Height = 259
    ActivePage = tsRubros
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Datos de la empresa'
      object Label1: TLabel
        Left = 110
        Top = 5
        Width = 106
        Height = 13
        Caption = 'Nombre de la empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 41
        Width = 42
        Height = 13
        Caption = 'Domicilio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 116
        Width = 42
        Height = 13
        Caption = 'Tel'#233'fono'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 6
        Top = 154
        Width = 27
        Height = 13
        Caption = 'e-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 212
        Top = 154
        Width = 25
        Height = 13
        Caption = 'CUIT'
      end
      object Label5: TLabel
        Left = 6
        Top = 5
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCodigo
      end
      object Label8: TLabel
        Left = 212
        Top = 116
        Width = 17
        Height = 13
        Caption = 'Fax'
        FocusControl = DBEdit4
      end
      object Label2: TLabel
        Left = 6
        Top = 79
        Width = 46
        Height = 13
        Caption = 'Localidad'
        FocusControl = DBEdit2
      end
      object Label11: TLabel
        Left = 295
        Top = 79
        Width = 64
        Height = 13
        Caption = 'C'#243'digo postal'
        FocusControl = DBEdit9
      end
      object Label12: TLabel
        Left = 6
        Top = 193
        Width = 56
        Height = 13
        Caption = 'PaginaWeb'
        FocusControl = DBEdit10
      end
      object edtRazon: TDBEdit
        Left = 110
        Top = 19
        Width = 290
        Height = 19
        Ctl3D = False
        DataField = 'RazonSocial'
        DataSource = dsPROV
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
      object DBEdit3: TDBEdit
        Left = 5
        Top = 55
        Width = 395
        Height = 19
        Ctl3D = False
        DataField = 'Domicilio'
        DataSource = dsPROV
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
      object DBEdit6: TDBEdit
        Left = 6
        Top = 130
        Width = 190
        Height = 19
        Ctl3D = False
        DataField = 'Telefono'
        DataSource = dsPROV
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
        Left = 6
        Top = 168
        Width = 190
        Height = 19
        Ctl3D = False
        DataField = 'Email'
        DataSource = dsPROV
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
      object DBEdit1: TDBEdit
        Left = 210
        Top = 168
        Width = 190
        Height = 19
        Ctl3D = False
        DataField = 'Cuit'
        DataSource = dsPROV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
      object edtCodigo: TDBEdit
        Left = 6
        Top = 19
        Width = 91
        Height = 19
        Ctl3D = False
        DataField = 'Codigo'
        DataSource = dsPROV
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
      object DBEdit4: TDBEdit
        Left = 210
        Top = 130
        Width = 190
        Height = 19
        Ctl3D = False
        DataField = 'Fax'
        DataSource = dsPROV
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
      object DBEdit2: TDBEdit
        Left = 6
        Top = 93
        Width = 281
        Height = 19
        Ctl3D = False
        DataField = 'Localidad'
        DataSource = dsPROV
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
      object DBEdit9: TDBEdit
        Left = 295
        Top = 93
        Width = 105
        Height = 19
        Ctl3D = False
        DataField = 'CodigoPostal'
        DataSource = dsPROV
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
      object DBEdit10: TDBEdit
        Left = 5
        Top = 207
        Width = 395
        Height = 19
        Ctl3D = False
        DataField = 'PaginaWeb'
        DataSource = dsPROV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 9
        OnEnter = Entrada_A_Campo
        OnExit = Salida_de_Campo
        OnKeyDown = Teclitas
        OnKeyPress = PressEnter
        OnKeyUp = Teclitas
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Datos del contacto'
      ImageIndex = 2
      object Label9: TLabel
        Left = 10
        Top = 10
        Width = 37
        Height = 13
        Caption = 'Nombre'
        FocusControl = DBEdit5
      end
      object Label10: TLabel
        Left = 10
        Top = 47
        Width = 58
        Height = 13
        Caption = 'Tel'#233'fono fijo'
        FocusControl = DBEdit8
      end
      object Label13: TLabel
        Left = 10
        Top = 85
        Width = 69
        Height = 13
        Caption = 'Tel'#233'fono m'#243'vil'
        FocusControl = DBEdit11
      end
      object Label14: TLabel
        Left = 10
        Top = 123
        Width = 27
        Height = 13
        Caption = 'e-mail'
        FocusControl = DBEdit12
      end
      object DBEdit5: TDBEdit
        Left = 10
        Top = 24
        Width = 250
        Height = 19
        Ctl3D = False
        DataField = 'Contacto'
        DataSource = dsPROV
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
      object DBEdit8: TDBEdit
        Left = 10
        Top = 61
        Width = 250
        Height = 19
        Ctl3D = False
        DataField = 'TelefonoContacto'
        DataSource = dsPROV
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
      object DBEdit11: TDBEdit
        Left = 10
        Top = 99
        Width = 250
        Height = 19
        Ctl3D = False
        DataField = 'MovilContacto'
        DataSource = dsPROV
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
      object DBEdit12: TDBEdit
        Left = 10
        Top = 137
        Width = 250
        Height = 19
        Ctl3D = False
        DataField = 'EmailContacto'
        DataSource = dsPROV
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
    end
    object tsRubros: TTabSheet
      Caption = 'Rubros'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 405
        Height = 201
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        TabOrder = 0
        object grdDatos: TDBGrid
          Left = 5
          Top = 5
          Width = 395
          Height = 191
          Align = alClient
          BorderStyle = bsNone
          DataSource = DataSource1
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
              FieldName = 'Rubro'
              Title.Alignment = taCenter
              Width = 373
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 201
        Width = 405
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
  object dsPROV: TDataSource
    DataSet = PROV
    Left = 266
    Top = 46
  end
  object PROV: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Proveedor'
    Left = 326
    Top = 47
    object PROVIdProveedor: TSmallintField
      FieldName = 'IdProveedor'
    end
    object PROVRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Required = True
      Size = 60
    end
    object PROVDomicilio: TStringField
      FieldName = 'Domicilio'
      Size = 60
    end
    object PROVTelefono: TStringField
      FieldName = 'Telefono'
      Size = 30
    end
    object PROVCuit: TStringField
      FieldName = 'Cuit'
      Size = 15
    end
    object PROVEmail: TStringField
      FieldName = 'Email'
      Size = 30
    end
    object PROVCodigo: TStringField
      FieldName = 'Codigo'
    end
    object PROVFax: TStringField
      FieldName = 'Fax'
      Size = 30
    end
    object PROVContacto: TStringField
      FieldName = 'Contacto'
      Size = 50
    end
    object PROVTelefonoContacto: TStringField
      FieldName = 'TelefonoContacto'
      Size = 30
    end
    object PROVLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object PROVCodigoPostal: TStringField
      FieldName = 'CodigoPostal'
      Size = 10
    end
    object PROVPaginaWeb: TStringField
      FieldName = 'PaginaWeb'
      Size = 50
    end
    object PROVMovilContacto: TStringField
      FieldName = 'MovilContacto'
      Size = 30
    end
    object PROVEmailContacto: TStringField
      FieldName = 'EmailContacto'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = qryRubroProveedor
    Left = 286
    Top = 77
  end
  object qryRubroProveedor: TQuery
    DatabaseName = 'DBR'
    SQL.Strings = (
      'SELECT * FROM vwRubroProveedor'
      'WHERE IdProveedor = :P'
      'ORDER BY Rubro')
    Left = 320
    Top = 83
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P'
        ParamType = ptUnknown
      end>
    object qryRubroProveedorIdProveedor: TSmallintField
      FieldName = 'IdProveedor'
      Origin = 'DBR.vwRubroProveedor.IdProveedor'
      Visible = False
    end
    object qryRubroProveedorIdRubro: TSmallintField
      FieldName = 'IdRubro'
      Origin = 'DBR.vwRubroProveedor.IdRubro'
      Visible = False
    end
    object qryRubroProveedorRubro: TStringField
      FieldName = 'Rubro'
      Origin = 'DBR.vwRubroProveedor.Rubro'
      Size = 50
    end
  end
  object RP: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.RubroProveedor'
    Left = 252
    Top = 99
    object RPIdProveedor: TSmallintField
      FieldName = 'IdProveedor'
      Required = True
    end
    object RPIdRubro: TSmallintField
      FieldName = 'IdRubro'
      Required = True
    end
  end
end
