object frmEstServicios: TfrmEstServicios
  Left = -4
  Top = 133
  Width = 697
  Height = 484
  Caption = 'Estad'#237'scas de gastos en servicios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 427
    Width = 689
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 602
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
    Width = 689
    Height = 427
    ActivePage = tsTabla
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object tsTabla: TTabSheet
      Caption = 'Tabla'
      object DecisionGrid1: TDecisionGrid
        Left = 0
        Top = 0
        Width = 681
        Height = 399
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
            FieldName = 'FECHA_PAGO'
            Color = clNone
            Format = 'MMMM, YYYY'
            Alignment = taLeftJustify
            Subtotals = True
          end
          item
            DisplayName = 'Proveedor'
            FieldName = 'RAZON_SOCIAL'
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
    object TabSheet2: TTabSheet
      Caption = 'Barras'
      ImageIndex = 1
      object DecisionGraph1: TDecisionGraph
        Left = 0
        Top = 0
        Width = 681
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
          Title = 'Template: FECHA_PAGO'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: FECHA_PAGO'
          Style = 61
        end
        object Series2: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: RAZON_SOCIAL'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: RAZON_SOCIAL'
          Style = 61
        end
        object Series3: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'ADMINTEL'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'ADMINTEL'
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
        Width = 681
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Series4: TPieSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: FECHA_PAGO'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: FECHA_PAGO'
          Style = 61
        end
        object Series5: TPieSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: RAZON_SOCIAL'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: RAZON_SOCIAL'
          Style = 61
        end
        object Series6: TPieSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: EDIFICIO'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: EDIFICIO'
          Style = 61
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Lineas'
      ImageIndex = 3
      object DecisionGraph3: TDecisionGraph
        Left = 0
        Top = 0
        Width = 681
        Height = 399
        DecisionSource = DecisionSource1
        Title.Text.Strings = (
          'TDecisionGraph')
        View3D = False
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Series7: TLineSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: FECHA_PAGO'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: FECHA_PAGO'
          Style = 61
        end
        object Series8: TLineSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: RAZON_SOCIAL'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: RAZON_SOCIAL'
          Style = 61
        end
        object Series9: TLineSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: EDIFICIO'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: EDIFICIO'
          Style = 61
        end
      end
    end
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftDateTime
        Fieldname = 'FECHA'
        BaseName = 'VW_SERV_EDIF.FECHA_PAGO'
        Name = 'FECHA_PAGO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binMonth
        ValueCount = 2
        Active = True
        StartValue = 37622
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'PROVEEDOR'
        BaseName = 'VW_SERV_EDIF.RAZON_SOCIAL'
        Name = 'RAZON_SOCIAL'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 19
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'EDIFICIO'
        BaseName = 'VW_SERV_EDIF.EDIFICIO'
        Name = 'EDIFICIO'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 11
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'IMPORTE'
        BaseName = 'VW_SERV_EDIF.COSTO'
        Name = 'IMPORTE'
        DerivedFrom = -1
        DimensionType = dimSum
        BinType = binNone
        ValueCount = -1
        Active = True
      end>
    ShowProgressDialog = True
    MaxDimensions = 3
    MaxSummaries = 100
    MaxCells = 0
    Left = 570
    Top = 142
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 568
    Top = 172
    DimensionCount = 3
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
      -1
      2
      1
      -1)
  end
  object DecisionQuery1: TDecisionQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT FECHA_PAGO Fecha, RAZON_SOCIAL Proveedor, EDIFICIO, SUM( ' +
        'COSTO ) Importe'
      'FROM VW_SERV_EDIF'
      'WHERE  IDPAGO IS NOT NULL '
      'GROUP BY FECHA_PAGO, RAZON_SOCIAL, EDIFICIO')
    Left = 538
    Top = 140
  end
end
