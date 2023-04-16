object frmConciliacion: TfrmConciliacion
  Left = 303
  Top = 121
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Conciliaci'#243'n Bancaria'
  ClientHeight = 547
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnActivate = FormCreate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 89
    Width = 588
    Height = 124
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 6
      Top = 4
      Width = 226
      Height = 13
      Caption = '2. D'#233'bitos bancarios sin contabilizar (+)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTot2: TLabel
      Left = 494
      Top = 102
      Width = 77
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot2'
    end
    object DBGrid2: TDBGrid
      Left = 6
      Top = 18
      Width = 485
      Height = 101
      Color = clBlack
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clHighlight
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha d'#233'bito'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 304
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 517
    Width = 588
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 510
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 0
      OnClick = btnCancelarClick
      Kind = bkClose
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 362
    Width = 588
    Height = 155
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 6
      Top = 4
      Width = 226
      Height = 13
      Caption = '4. Creditos bancarios sin contabilizar (-)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTot4: TLabel
      Left = 496
      Top = 58
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblA_B: TLabel
      Left = 496
      Top = 97
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotB: TLabel
      Left = 496
      Top = 77
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblLibro: TLabel
      Left = 330
      Top = 117
      Width = 158
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Seg'#250'n Libro Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDif: TLabel
      Left = 496
      Top = 136
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 330
      Top = 80
      Width = 158
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Subtotal B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 330
      Top = 98
      Width = 158
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'A - B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 330
      Top = 136
      Width = 158
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Diferencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnReporte: TSpeedButton
      Left = 4
      Top = 128
      Width = 65
      Height = 25
      Caption = 'Reporte'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnReporteClick
    end
    object lblSLibro: TLabel
      Left = 496
      Top = 116
      Width = 80
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCheqAnul: TLabel
      Left = 8
      Top = 80
      Width = 327
      Height = 35
      AutoSize = False
      Caption = 'Subtotal B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object DBGrid4: TDBGrid
      Left = 8
      Top = 20
      Width = 485
      Height = 55
      Color = clBlack
      DataSource = DataSource4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clHighlight
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha cr'#233'dito'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 272
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 588
    Height = 60
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 6
      Top = 4
      Width = 254
      Height = 13
      Caption = '1. Dep'#243'sitos no acreditados por el banco (+)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTot1: TLabel
      Left = 494
      Top = 40
      Width = 77
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot1'
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 18
      Width = 485
      Height = 39
      Color = clBlack
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clHighlight
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'Fecha dep'#243'sito'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIP'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 273
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTO'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 238
    Width = 588
    Height = 124
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label3: TLabel
      Left = 6
      Top = 4
      Width = 272
      Height = 13
      Caption = '3. Cheques emitidos no presentados al cobro (-)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTot3: TLabel
      Left = 496
      Top = 104
      Width = 77
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid3: TDBGrid
      Left = 8
      Top = 20
      Width = 485
      Height = 101
      Color = clBlack
      DataSource = DataSource3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clHighlight
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA_PAGO'
          Title.Alignment = taCenter
          Title.Caption = 'F/Emisi'#243'n'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRO_CHEQUE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#250'mero'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'Concepto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 221
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taCenter
          Title.Caption = 'Importe'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 588
    Height = 29
    Align = alTop
    TabOrder = 5
    object lblHoja: TLabel
      Left = 195
      Top = 7
      Width = 253
      Height = 16
      Caption = 'Saldo seg'#250'n extracto bancario: Hoja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSBanco: TLabel
      Left = 494
      Top = 7
      Width = 77
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTot1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 213
    Width = 588
    Height = 25
    Align = alTop
    TabOrder = 6
    object lblTotA: TLabel
      Left = 392
      Top = 5
      Width = 179
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblTotA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 168
    Top = 50
  end
  object DataSource2: TDataSource
    DataSet = qry2
    Left = 178
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = qry3
    Left = 178
    Top = 264
  end
  object DataSource4: TDataSource
    DataSet = qry4
    Left = 192
    Top = 370
  end
  object qry2: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_GASTO_FI'
      'WHERE FECHA >= :FI AND FECHA <= :FF'
      'ORDER BY DESCRIP')
    Left = 142
    Top = 134
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FF'
        ParamType = ptUnknown
      end>
    object qry2COSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_GASTO_FI.COSTO'
      currency = True
    end
    object qry2DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_GASTO_FI.DESCRIP'
      Size = 60
    end
    object qry2FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'ADB.VW_GASTO_FI.FECHA'
    end
  end
  object qry3: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_CHEQUES_NO_COBRADOS'
      'WHERE FECHA_PAGO >= :FI AND FECHA_PAGO <= :FF'
      'ORDER BY FECHA_PAGO, NRO_CHEQUE')
    Left = 150
    Top = 266
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FF'
        ParamType = ptUnknown
      end>
    object qry3NRO_CHEQUE: TStringField
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_CHEQUES_NO_COBRADOS.NRO_CHEQUE'
    end
    object qry3FECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_CHEQUES_NO_COBRADOS.FECHA_PAGO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qry3PROVEEDOR: TStringField
      FieldName = 'PROVEEDOR'
      Origin = 'ADB.VW_CHEQUES_NO_COBRADOS.PROVEEDOR'
      Size = 45
    end
    object qry3IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_CHEQUES_NO_COBRADOS.IMPORTE'
      currency = True
    end
  end
  object qry1: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_CHEQUES_DEVUELTOS'
      'WHERE TIPO = '#39'D'#39' AND FECHA_PAGO >= :FI AND FECHA_PAGO <= :FF'
      'ORDER BY FECHA_PAGO, NRO_CHEQUE')
    Left = 136
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FF'
        ParamType = ptUnknown
      end>
    object qry1FECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_CHEQUES_DEVUELTOS.FECHA_PAGO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qry1PROVEEDOR: TStringField
      FieldName = 'PROVEEDOR'
      Origin = 'ADB.VW_CHEQUES_DEVUELTOS.PROVEEDOR'
      Size = 45
    end
    object qry1IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_CHEQUES_DEVUELTOS.IMPORTE'
      currency = True
    end
  end
  object qry4: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_CREDITOS_BANCARIOS'
      'WHERE FECHA_PAGO >= :FI AND FECHA_PAGO <= :FF'
      'ORDER BY FECHA_PAGO')
    Left = 162
    Top = 372
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FF'
        ParamType = ptUnknown
      end>
    object qry4FECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_CREDITOS_BANCARIOS.FECHA_PAGO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qry4DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_CREDITOS_BANCARIOS.DESCRIP'
      Size = 30
    end
    object qry4COSTO: TFloatField
      FieldName = 'COSTO'
      Origin = 'ADB.VW_CREDITOS_BANCARIOS.COSTO'
      currency = True
    end
  end
end
