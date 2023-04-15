object frmPedido: TfrmPedido
  Left = 174
  Top = 119
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Pedido'
  ClientHeight = 338
  ClientWidth = 561
  Color = clMoneyGreen
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
    Top = 308
    Width = 561
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Color = clGray
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 376
      Top = 0
      Width = 185
      Height = 30
      Align = alRight
      BevelOuter = bvNone
      Color = clGray
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
    Top = 129
    Width = 561
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object grdDatos: TDBGrid
      Left = 3
      Top = 3
      Width = 555
      Height = 143
      Align = alClient
      Color = clCream
      Ctl3D = False
      DataSource = dsDatos
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Material'
          Title.Alignment = taCenter
          Width = 458
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cantidad'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    Color = clSkyBlue
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 7
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = edtNumero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 73
      Top = 7
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 85
      Width = 49
      Height = 13
      Caption = 'Proveedor'
      FocusControl = DBLookupComboBox1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 45
      Width = 23
      Height = 13
      Caption = 'Obra'
      FocusControl = DBLookupComboBox2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnBuscarObra: TSpeedButton
      Left = 257
      Top = 59
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de obras'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarObraClick
    end
    object btnBuscarProveedor: TSpeedButton
      Left = 257
      Top = 99
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de proveedores'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarProveedorClick
    end
    object Label5: TLabel
      Left = 284
      Top = 85
      Width = 72
      Height = 13
      Caption = 'Procesado por:'
      FocusControl = DBLookupComboBox3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 284
      Top = 45
      Width = 71
      Height = 13
      Caption = 'Autorizado por:'
      FocusControl = DBLookupComboBox4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnBuscarAutorizado: TSpeedButton
      Left = 533
      Top = 58
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de empleados'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarEmpleadoClick
    end
    object btnBuscarProcesa: TSpeedButton
      Left = 533
      Top = 98
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de empleados'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarEmpleadoClick
    end
    object Label7: TLabel
      Left = 284
      Top = 7
      Width = 67
      Height = 13
      Caption = 'Solicitado por:'
      FocusControl = DBLookupComboBox5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnBuscarSolicitante: TSpeedButton
      Left = 533
      Top = 20
      Width = 23
      Height = 22
      Hint = 'Muestra la lista de empleados'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD77777DDDDD77777000007DDDD000007080007DDDD08000708000777DD08
        0007000000070000000700800000080000070080008008000007008000800800
        000DD0000000000000DDDD08000708000DDDDD00000D00000DDDDDD0007DD000
        7DDDDDD080DDD0807DDDDDD000DDD000DDDDDDDDDDDDDDDDDDDD}
      ParentShowHint = False
      ShowHint = True
      OnClick = btnBuscarEmpleadoClick
    end
    object Label8: TLabel
      Left = 164
      Top = 7
      Width = 29
      Height = 13
      Caption = 'Medio'
    end
    object edtNumero: TDBEdit
      Left = 8
      Top = 21
      Width = 59
      Height = 19
      DataField = 'Numero'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object dtpFecha: TDateTimePicker
      Left = 73
      Top = 21
      Width = 84
      Height = 21
      Date = 38311.616476053240000000
      Time = 38311.616476053240000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 99
      Width = 247
      Height = 19
      DataField = 'Proveedor'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 59
      Width = 247
      Height = 19
      DataField = 'Obra'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 284
      Top = 99
      Width = 247
      Height = 19
      DataField = 'Procesa'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 284
      Top = 59
      Width = 247
      Height = 19
      DataField = 'Autoriza'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 284
      Top = 21
      Width = 247
      Height = 19
      DataField = 'Solicitante'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBComboBox1: TDBComboBox
      Left = 164
      Top = 21
      Width = 91
      Height = 21
      DataField = 'Medio'
      DataSource = DataSource1
      ItemHeight = 13
      Items.Strings = (
        'TELEFONO'
        'FAX'
        'E-MAIL')
      TabOrder = 2
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 278
    Width = 561
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = clSilver
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object btnAgregar: TBitBtn
      Left = 2
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Agregar (+)'
      TabOrder = 0
      OnClick = btnAgregarClick
    end
    object btnEliminar: TBitBtn
      Left = 78
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Eliminar (-)'
      TabOrder = 1
      OnClick = btnEliminarClick
    end
  end
  object Table: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Pedido'
    Left = 446
    Top = 210
    object TableIdPedido: TSmallintField
      FieldName = 'IdPedido'
      Visible = False
    end
    object TableNumero: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'Numero'
      Required = True
      Size = 15
    end
    object TableIdSolicitante: TSmallintField
      FieldName = 'IdSolicitante'
      Required = True
      Visible = False
    end
    object TableIdProcesa: TSmallintField
      FieldName = 'IdProcesa'
      Required = True
      Visible = False
    end
    object TableIdAutoriza: TSmallintField
      FieldName = 'IdAutoriza'
      Required = True
      Visible = False
    end
    object TableIdProveedor: TSmallintField
      FieldName = 'IdProveedor'
      Required = True
      Visible = False
    end
    object TableIdObra: TSmallintField
      FieldName = 'IdObra'
      Required = True
      Visible = False
    end
    object TableIdRemito: TSmallintField
      FieldName = 'IdRemito'
      Visible = False
    end
    object TableFecha: TDateTimeField
      FieldName = 'Fecha'
      Required = True
    end
    object TableMedio: TStringField
      FieldName = 'Medio'
      Required = True
    end
    object TableSolicitante: TStringField
      FieldKind = fkLookup
      FieldName = 'Solicitante'
      LookupDataSet = EMP
      LookupKeyFields = 'IdEmpleado'
      LookupResultField = 'NombreEmpleado'
      KeyFields = 'IdSolicitante'
      Size = 75
      Lookup = True
    end
    object TableAutoriza: TStringField
      FieldKind = fkLookup
      FieldName = 'Autoriza'
      LookupDataSet = EMP
      LookupKeyFields = 'IdEmpleado'
      LookupResultField = 'NombreEmpleado'
      KeyFields = 'IdAutoriza'
      Size = 75
      Lookup = True
    end
    object TableProcesa: TStringField
      FieldKind = fkLookup
      FieldName = 'Procesa'
      LookupDataSet = EMP
      LookupKeyFields = 'IdEmpleado'
      LookupResultField = 'NombreEmpleado'
      KeyFields = 'IdProcesa'
      Size = 75
      Lookup = True
    end
    object TableObra: TStringField
      FieldKind = fkLookup
      FieldName = 'Obra'
      LookupDataSet = OBRA
      LookupKeyFields = 'IdObra'
      LookupResultField = 'Nombre'
      KeyFields = 'IdObra'
      Size = 50
      Lookup = True
    end
    object TableProveedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Proveedor'
      LookupDataSet = PROV
      LookupKeyFields = 'IdProveedor'
      LookupResultField = 'RazonSocial'
      KeyFields = 'IdProveedor'
      Size = 60
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = Table
    Left = 414
    Top = 210
  end
  object PROV: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Proveedor'
    Left = 300
    Top = 246
    object PROVIdProveedor: TSmallintField
      FieldName = 'IdProveedor'
      Required = True
    end
    object PROVRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Required = True
      Size = 60
    end
  end
  object OBRA: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Obra'
    Left = 330
    Top = 246
    object OBRAIdObra: TSmallintField
      FieldName = 'IdObra'
      Required = True
    end
    object OBRANombre: TStringField
      FieldName = 'Nombre'
      Required = True
      Size = 50
    end
  end
  object dsDatos: TDataSource
    DataSet = ITEM
    Left = 56
    Top = 195
  end
  object EMP: TTable
    OnCalcFields = EMPCalcFields
    DatabaseName = 'DBR'
    TableName = 'dbo.Empleado'
    Left = 361
    Top = 246
    object EMPIdEmpleado: TSmallintField
      FieldName = 'IdEmpleado'
      Required = True
    end
    object EMPApellido: TStringField
      FieldName = 'Apellido'
      Required = True
      Size = 50
    end
    object EMPNombres: TStringField
      FieldName = 'Nombres'
      Required = True
      Size = 50
    end
    object EMPNombreEmpleado: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreEmpleado'
      Size = 75
      Calculated = True
    end
  end
  object MAT: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.Material'
    Left = 423
    Top = 248
    object MATIdMaterial: TSmallintField
      FieldName = 'IdMaterial'
      Required = True
    end
    object MATDescrip: TStringField
      FieldName = 'Descrip'
      Required = True
      Size = 100
    end
  end
  object ITEM: TTable
    DatabaseName = 'DBR'
    TableName = 'dbo.ItemPedido'
    Left = 392
    Top = 247
    object ITEMIdPedido: TSmallintField
      FieldName = 'IdPedido'
      Required = True
    end
    object ITEMIdMaterial: TSmallintField
      FieldName = 'IdMaterial'
      Required = True
    end
    object ITEMCantidad: TSmallintField
      FieldName = 'Cantidad'
      Required = True
    end
    object ITEMMaterial: TStringField
      FieldKind = fkLookup
      FieldName = 'Material'
      LookupDataSet = MAT
      LookupKeyFields = 'IdMaterial'
      LookupResultField = 'Descrip'
      KeyFields = 'IdMaterial'
      Size = 100
      Lookup = True
    end
  end
end
