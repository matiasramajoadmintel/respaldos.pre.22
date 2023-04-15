object frmDeudas: TfrmDeudas
  Left = 203
  Top = 148
  Width = 770
  Height = 393
  BorderIcons = []
  Caption = 'Deudas a proveedores'
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
  object Splitter1: TSplitter
    Left = 245
    Top = 0
    Width = 1
    Height = 312
    Cursor = crHSplit
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 312
    Width = 762
    Height = 24
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lblTotDeuda: TLabel
      Left = 8
      Top = 5
      Width = 87
      Height = 16
      Caption = 'lblTotDeuda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 762
    Height = 30
    Align = alBottom
    TabOrder = 1
    object Panel4: TPanel
      Left = 576
      Top = 1
      Width = 185
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnCerrar: TBitBtn
        Left = 108
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        OnClick = btnCerrarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 245
    Height = 312
    Align = alLeft
    BevelInner = bvLowered
    BorderWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object grdDeudas: TDBGrid
      Left = 5
      Top = 5
      Width = 235
      Height = 302
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      DataSource = dsPagos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
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
      Columns = <
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Proveedor'
          Width = 207
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 246
    Top = 0
    Width = 516
    Height = 312
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object grdPagos: TDBGrid
      Left = 5
      Top = 5
      Width = 506
      Height = 302
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      DataSource = dsTMP
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
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
      OnDblClick = grdPagosDblClick
      OnTitleClick = grdPagosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha fin'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Edificio'
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Width = 51
          Visible = True
        end>
    end
  end
  object dsPagos: TDataSource
    DataSet = qryPagos
    Left = 88
    Top = 104
  end
  object dsTMP: TDataSource
    DataSet = TMP
    Left = 332
    Top = 102
  end
  object PAGO: TTable
    OnNewRecord = PAGONewRecord
    DatabaseName = 'ADB'
    TableName = 'PAGO'
    Left = 20
    Top = 216
    object PAGOIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Required = True
    end
    object PAGOFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
    end
    object PAGOIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Required = True
    end
    object PAGOTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
    object PAGONRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
    end
    object PAGOCOBRADO: TStringField
      FieldName = 'COBRADO'
      Size = 2
    end
  end
  object TMP: TTable
    OnNewRecord = TMPNewRecord
    DatabaseName = 'ADB'
    Exclusive = True
    TableName = 'TEMP_PAGOS'
    Left = 364
    Top = 104
    object TMPIDTEMP_PAGOS: TIntegerField
      FieldName = 'IDTEMP_PAGOS'
      Required = True
    end
    object TMPTIPO_GASTO: TStringField
      FieldName = 'TIPO_GASTO'
      Size = 1
    end
    object TMPIDGASTO: TIntegerField
      FieldName = 'IDGASTO'
      Required = True
    end
    object TMPDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Required = True
      Size = 50
    end
    object TMPIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object TMPIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Required = True
    end
    object TMPTIPO_PAGO: TStringField
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
    object TMPIDEDIF: TIntegerField
      FieldName = 'IDEDIF'
    end
    object TMPFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object TMPEdificio: TStringField
      FieldKind = fkLookup
      FieldName = 'Edificio'
      LookupDataSet = dmDatos.EDIF
      LookupKeyFields = 'IDEDIFICIO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDEDIF'
      Size = 60
      Lookup = True
    end
    object TMPNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object TMPNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
    object TMPVACIOS: TStringField
      FieldName = 'VACIOS'
      Size = 2
    end
  end
  object qryTrab: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_TRAB_NO_PAGADOS')
    Left = 19
    Top = 246
    object qryTrabIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.IDTRABAJO'
    end
    object qryTrabNRO_PEDIDO: TIntegerField
      FieldName = 'NRO_PEDIDO'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.NRO_PEDIDO'
    end
    object qryTrabFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.FECHA'
    end
    object qryTrabCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.COSTO'
    end
    object qryTrabIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.IDPROVEEDOR'
    end
    object qryTrabIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.IDEDIFICIO'
    end
    object qryTrabTIPO_TRAB: TStringField
      FieldName = 'TIPO_TRAB'
      Origin = 'ADB.VW_TRAB_NO_PAGADOS.TIPO_TRAB'
      Size = 1
    end
  end
  object qryPagos: TQuery
    AfterScroll = qryPagosAfterScroll
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDPROVEEDOR, PROVEEDOR, SUM(IMPORTE) AS IMPORTE'
      'FROM VW_DEUDAS'
      'GROUP BY PROVEEDOR, IDPROVEEDOR')
    Left = 120
    Top = 108
    object qryPagosIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_PAGOS.IDPROVEEDOR'
    end
    object qryPagosPROVEEDOR: TStringField
      FieldName = 'PROVEEDOR'
      Origin = 'ADB.VW_PAGOS.PROVEEDOR'
      Size = 45
    end
    object qryPagosIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_PAGOS.IMPORTE'
      DisplayFormat = '#,0.00'
    end
  end
  object qryGasto: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDGASTO_AD, COSTO, IDPROVEEDOR, DESCRIP, FECHA'
      'FROM VW_GASTO_AD'
      'WHERE PAGADO = '#39'No'#39)
    Left = 52
    Top = 246
    object qryGastoIDGASTO_AD: TIntegerField
      FieldName = 'IDGASTO_AD'
      Origin = 'ADB.VW_GASTO_AD.IDGASTO_AD'
    end
    object qryGastoCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_GASTO_AD.COSTO'
    end
    object qryGastoIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_GASTO_AD.IDPROVEEDOR'
    end
    object qryGastoDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_GASTO_AD.DESCRIP'
      Size = 60
    end
    object qryGastoFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_GASTO_AD.FECHA'
    end
  end
  object qryServ: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT IDSERV_EDIF, COSTO, IDPROVEEDOR, DESCRIP, IDEDIFICIO, FEC' +
        'HA, VACIOS'
      'FROM VW_SERV_EDIF'
      'WHERE PAGADO = '#39'No'#39)
    Left = 84
    Top = 246
    object qryServIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Origin = 'ADB.VW_SERV_EDIF.IDSERV_EDIF'
    end
    object qryServCOSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_SERV_EDIF.COSTO'
    end
    object qryServIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_SERV_EDIF.IDPROVEEDOR'
    end
    object qryServDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_SERV_EDIF.DESCRIP'
      Size = 60
    end
    object qryServIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_SERV_EDIF.IDEDIFICIO'
    end
    object qryServVACIOS: TStringField
      FieldName = 'VACIOS'
      Origin = 'ADB.VW_SERV_EDIF.VACIOS'
      Size = 2
    end
    object qryServFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_SERV_EDIF.FECHA'
    end
  end
  object TRAB: TTable
    DatabaseName = 'ADB'
    TableName = 'TRABAJO'
    Left = 52
    Top = 214
    object TRABIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Required = True
    end
    object TRABPAGADO: TStringField
      FieldName = 'PAGADO'
      Size = 2
    end
    object TRABIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
    end
    object TRABNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object TRABNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
  end
  object GASTO: TTable
    DatabaseName = 'ADB'
    TableName = 'GASTO_AD'
    Left = 82
    Top = 216
    object GASTOPAGADO: TStringField
      FieldName = 'PAGADO'
      Size = 2
    end
    object GASTOIDGASTO_AD: TIntegerField
      FieldName = 'IDGASTO_AD'
      Required = True
    end
    object GASTOIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
    end
    object GASTONRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object GASTONRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
  end
  object SERV: TTable
    DatabaseName = 'ADB'
    TableName = 'SERV_EDIF'
    Left = 114
    Top = 216
    object SERVIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Required = True
    end
    object SERVPAGADO: TStringField
      FieldName = 'PAGADO'
      Size = 2
    end
    object SERVIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
    end
    object SERVNRO_ORDEN: TIntegerField
      FieldName = 'NRO_ORDEN'
    end
    object SERVNRO_DECI: TIntegerField
      FieldName = 'NRO_DECI'
    end
  end
  object Query1: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT Trabajo.IDTRABAJO, Trabajo.IDPAGO, Trabajo.COSTO, Trabajo' +
        '.FECHA_FIN,   ( ('#39'Factura N'#186' '#39' || Trabajo.NRO_FACT)  || '#39' - '#39')  ' +
        '|| Categoria.DESCRIP '
      'FROM TRABAJO Trabajo'
      '   INNER JOIN CATEGORIA Categoria'
      '   ON  (Trabajo.IDCATEGORIA = Categoria.IDCATEGORIA)  '
      'WHERE  Trabajo.PAGADO = '#39'S'#237#39' ')
    Left = 200
    Top = 104
  end
end
