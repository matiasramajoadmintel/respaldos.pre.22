object frmLstTrab: TfrmLstTrab
  Left = 78
  Top = 128
  Width = 640
  Height = 375
  BorderIcons = []
  Caption = 'Listado de trabajos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormCreate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 632
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 446
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TBitBtn
        Left = 110
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        OnClick = btnCancelarClick
        Kind = bkClose
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 318
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object grdDatos: TDBGrid
      Left = 5
      Top = 5
      Width = 622
      Height = 308
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdDatosDblClick
    end
  end
  object dsDatos: TDataSource
    DataSet = qryTrab
    Left = 276
    Top = 106
  end
  object qryTrab: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT Trabajo.IDTRABAJO, Trabajo.NRO_PEDIDO, Trabajo.IDDEPTO, T' +
        'rabajo.FECHA_INI, Trabajo.FECHA_FIN, Proveedor.RAZON_SOCIAL, Tra' +
        'bajo.COSTO'
      'FROM TRABAJO Trabajo'
      '   INNER JOIN PROVEEDOR Proveedor'
      '   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)  ')
    Left = 244
    Top = 106
    object qryTrabIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.TRABAJO.IDTRABAJO'
      Visible = False
    end
    object qryTrabNRO_PEDIDO: TIntegerField
      DisplayWidth = 12
      FieldName = 'NRO_PEDIDO'
      Origin = 'ADB.TRABAJO.NRO_PEDIDO'
    end
    object qryTrabDepto: TStringField
      DisplayWidth = 31
      FieldKind = fkLookup
      FieldName = 'Depto'
      LookupDataSet = dmAlcaldia.qryDeptos
      LookupKeyFields = 'IdDepartamento'
      LookupResultField = 'Descrip'
      KeyFields = 'IDDEPTO'
      Size = 150
      Lookup = True
    end
    object qryTrabIDDEPTO: TIntegerField
      FieldName = 'IDDEPTO'
      Origin = 'ADB.TRABAJO.IDDEPTO'
      Visible = False
    end
    object qryTrabFECHA_INI: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FECHA_INI'
      Origin = 'ADB.TRABAJO.FECHA_INI'
    end
    object qryTrabFECHA_FIN: TDateTimeField
      DisplayWidth = 18
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.TRABAJO.FECHA_FIN'
    end
    object qryTrabRAZON_SOCIAL: TStringField
      DisplayWidth = 45
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.PROVEEDOR.RAZON_SOCIAL'
      Size = 45
    end
    object qryTrabCOSTO: TFloatField
      DisplayWidth = 10
      FieldName = 'COSTO'
      Origin = 'ADB.TRABAJO.COSTO'
    end
  end
end
