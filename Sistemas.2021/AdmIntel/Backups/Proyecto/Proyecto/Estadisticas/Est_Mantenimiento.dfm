object frmEstMantenimiento: TfrmEstMantenimiento
  Left = 29
  Top = 95
  Width = 760
  Height = 484
  Caption = 'Estad'#237'scas de gastos en mantenimiento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnDeactivate = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 427
    Width = 752
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 665
      Top = 1
      Width = 86
      Height = 28
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 10
        Top = 1
        Width = 75
        Height = 25
        Caption = '&Cerrar'
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 752
    Height = 427
    ActivePage = tsTabla
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object tsTabla: TTabSheet
      Caption = 'Tabla'
      object DecisionPivot1: TDecisionPivot
        Left = 0
        Top = 45
        Width = 744
        Height = 354
        ButtonAutoSize = True
        GroupLayout = xtHorizontal
        Groups = [xtRows, xtColumns, xtSummaries]
        ButtonSpacing = 0
        ButtonWidth = 64
        ButtonHeight = 24
        GroupSpacing = 10
        BorderWidth = 0
        BorderStyle = bsNone
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DecisionGrid1: TDecisionGrid
          Left = 0
          Top = 24
          Width = 744
          Height = 330
          DefaultColWidth = 100
          DefaultRowHeight = 21
          CaptionColor = clActiveCaption
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clCaptionText
          CaptionFont.Height = -11
          CaptionFont.Name = 'MS Sans Serif'
          CaptionFont.Style = []
          DataColor = clInfoBk
          DataSumColor = clNone
          DataFont.Charset = DEFAULT_CHARSET
          DataFont.Color = clWindowText
          DataFont.Height = -11
          DataFont.Name = 'MS Sans Serif'
          DataFont.Style = []
          LabelFont.Charset = DEFAULT_CHARSET
          LabelFont.Color = clWindowText
          LabelFont.Height = -11
          LabelFont.Name = 'MS Sans Serif'
          LabelFont.Style = []
          LabelColor = clBtnFace
          LabelSumColor = clInactiveCaption
          DecisionSource = DecisionSource1
          Dimensions = <
            item
              DisplayName = 'Fecha de pago'
              FieldName = 'FECHA'
              Color = clNone
              Format = 'MMMM, YYYY'
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'Rubro'
              FieldName = 'RUBRO'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'Proveedor'
              FieldName = 'PROVEEDOR'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'Edificio'
              FieldName = 'EDIFICIO'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'Importe'
              FieldName = 'IMPORTE'
              Color = clNone
              Format = '#,0.00'
              Alignment = taRightJustify
              Subtotals = True
            end>
          Totals = True
          ShowCubeEditor = False
          Align = alClient
          Color = clBtnFace
          Ctl3D = True
          DefaultDrawing = False
          GridLineWidth = 1
          GridLineColor = clWindowText
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 744
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 4
          Top = 6
          Width = 57
          Height = 13
          Caption = 'Fecha inicio'
        end
        object Label5: TLabel
          Left = 104
          Top = 6
          Width = 52
          Height = 13
          Caption = 'Fecha final'
        end
        object dtpIni: TDateTimePicker
          Left = 4
          Top = 20
          Width = 100
          Height = 21
          CalAlignment = dtaLeft
          Date = 37792.8118759954
          Time = 37792.8118759954
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
          OnCloseUp = ComboClick
        end
        object dtpFin: TDateTimePicker
          Left = 104
          Top = 20
          Width = 100
          Height = 21
          CalAlignment = dtaLeft
          Date = 37792.8118873495
          Time = 37792.8118873495
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
          TabOrder = 1
          OnCloseUp = ComboClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Barras'
      ImageIndex = 1
      object DecisionGraph1: TDecisionGraph
        Left = 0
        Top = 0
        Width = 744
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Series1: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: RUBRO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: RUBRO'
          Style = 61
        end
        object Series2: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: FECHA'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: FECHA'
          Style = 61
        end
        object Series3: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: PROVEEDOR'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: PROVEEDOR'
          Style = 61
        end
        object Series4: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: EDIFICIO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: EDIFICIO'
          Style = 61
        end
        object Series5: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clWhite
          Title = 'Cloacas'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Cloacas'
          Style = 40
        end
        object Series6: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Compra materiales'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Compra materiales'
          Style = 40
        end
        object Series7: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clFuchsia
          Title = 'Electricidad'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Electricidad'
          Style = 40
        end
        object Series8: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clTeal
          Title = 'Fletes'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Fletes'
          Style = 40
        end
        object Series9: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clNavy
          Title = 'Gas'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Gas'
          Style = 40
        end
        object Series10: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clMaroon
          Title = 'Gasista- artefactos de gas'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Gasista- artefactos de gas'
          Style = 40
        end
        object Series11: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'Impermeabilizacion'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Impermeabilizacion'
          Style = 40
        end
        object Series12: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clOlive
          Title = 'Limpieza deptos.'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Limpieza deptos.'
          Style = 40
        end
        object Series13: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clPurple
          Title = 'Mantenimiento Ascensor'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Mantenimiento Ascensor'
          Style = 40
        end
        object Series14: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clSilver
          Title = 'Pintura'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Pintura'
          Style = 40
        end
        object Series15: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clAqua
          Title = 'Plomer'#237'a'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Plomer'#237'a'
          Style = 40
        end
        object Series16: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clBlack
          Title = 'Sanitarios'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Sanitarios'
          Style = 40
        end
        object Series17: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Termotanque'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Termotanque'
          Style = 40
        end
        object Series18: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Vidrieria'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Vidrieria'
          Style = 40
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Torta'
      ImageIndex = 2
      object DecisionGraph2: TDecisionGraph
        Left = 0
        Top = 0
        Width = 744
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Lineas'
      ImageIndex = 3
      object DecisionGraph3: TDecisionGraph
        Left = 0
        Top = 0
        Width = 744
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 568
    Top = 172
    DimensionCount = 4
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      2
      0
      1
      0
      -1
      1
      0
      1
      0
      -1
      1
      1
      1
      1
      0
      1
      2
      1
      2
      0)
  end
  object DecisionQuery1: TDecisionQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT FECHA, RUBRO, PROVEEDOR, EDIFICIO, SUM( COSTO ) IMPORTE'
      'FROM VW_CUENTA_MANT'
      'GROUP BY FECHA, RUBRO, PROVEEDOR, EDIFICIO')
    Left = 542
    Top = 142
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'FECHA'
        BaseName = 'VW_CUENTA_MANT.FECHA'
        Name = 'FECHA'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binMonth
        ValueCount = 21
        Active = True
        StartValue = 37622
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'RUBRO'
        BaseName = 'VW_CUENTA_MANT.RUBRO'
        Name = 'RUBRO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 18
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PROVEEDOR'
        BaseName = 'VW_CUENTA_MANT.PROVEEDOR'
        Name = 'PROVEEDOR'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 84
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'EDIFICIO'
        BaseName = 'VW_CUENTA_MANT.EDIFICIO'
        Name = 'EDIFICIO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 9
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'IMPORTE'
        BaseName = 'VW_CUENTA_MANT.COSTO'
        Name = 'IMPORTE'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 5
    MaxSummaries = 10
    MaxCells = 0
    Left = 570
    Top = 142
  end
end
