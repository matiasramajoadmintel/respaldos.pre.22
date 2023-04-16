object frmEstCheques: TfrmEstCheques
  Left = 131
  Top = 150
  Width = 620
  Height = 419
  Caption = 'Estad'#237'scas de cheques'
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
    Top = 362
    Width = 612
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 525
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
    Width = 612
    Height = 362
    ActivePage = tsTabla
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    object tsTabla: TTabSheet
      Caption = 'Tabla'
      object DecisionPivot1: TDecisionPivot
        Left = 0
        Top = 0
        Width = 604
        Height = 334
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
          Width = 604
          Height = 310
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
              DisplayName = 'N'#186' cheque'
              FieldName = 'NRO_CHEQUE'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'N'#186' DECI'
              FieldName = 'NRO_DECI'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'N'#186' orden'
              FieldName = 'NRO_ORDEN'
              Color = clNone
              Alignment = taLeftJustify
              Subtotals = True
            end
            item
              DisplayName = 'Importe'
              FieldName = 'SUM'
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
        object ComboBox1: TComboBox
          Left = 6
          Top = 2
          Width = 145
          Height = 21
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
          OnClick = ComboBox1Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Barras'
      ImageIndex = 1
      object DecisionGraph1: TDecisionGraph
        Left = 0
        Top = 0
        Width = 604
        Height = 334
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
          Title = 'Template: NRO_CHEQUE'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: NRO_CHEQUE'
          Style = 61
        end
        object Series2: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_DECI'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: NRO_DECI'
          Style = 61
        end
        object Series3: TBarSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_ORDEN'
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1
          YValues.Order = loNone
          Identifier = 'Template: NRO_ORDEN'
          Style = 61
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Torta'
      ImageIndex = 2
      object DecisionGraph2: TDecisionGraph
        Left = 0
        Top = 0
        Width = 604
        Height = 334
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
          Title = 'Template: NRO_CHEQUE'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: NRO_CHEQUE'
          Style = 61
        end
        object Series5: TPieSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_DECI'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: NRO_DECI'
          Style = 61
        end
        object Series6: TPieSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_ORDEN'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1
          PieValues.Order = loNone
          Identifier = 'Template: NRO_ORDEN'
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
        Width = 604
        Height = 334
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
          Title = 'Template: NRO_CHEQUE'
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
          Identifier = 'Template: NRO_CHEQUE'
          Style = 61
        end
        object Series8: TLineSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_DECI'
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
          Identifier = 'Template: NRO_DECI'
          Style = 61
        end
        object Series9: TLineSeries
          Active = False
          Marks.ArrowLength = 20
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Template: NRO_ORDEN'
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
          Identifier = 'Template: NRO_ORDEN'
          Style = 61
        end
      end
    end
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 572
    Top = 172
    DimensionCount = 3
    SummaryCount = 1
    CurrentSummary = 0
    SparseRows = False
    SparseCols = False
    DimensionInfo = (
      1
      0
      1
      0
      -1
      2
      0
      1
      0
      0
      2
      1
      1
      1
      0)
  end
  object DecisionQuery1: TDecisionQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT NRO_CHEQUE, NRO_DECI, NRO_ORDEN, SUM( IMPORTE )'
      'FROM TEMP_PAGOS'
      'GROUP BY NRO_CHEQUE, NRO_DECI, NRO_ORDEN')
    Left = 540
    Top = 144
  end
  object DecisionCube1: TDecisionCube
    DataSet = DecisionQuery1
    DimensionMap = <
      item
        ActiveFlag = diAsNeeded
        FieldType = ftString
        Fieldname = 'NRO_CHEQUE'
        BaseName = 'TEMP_PAGOS.NRO_CHEQUE'
        Name = 'NRO_CHEQUE'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = 28
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftInteger
        Fieldname = 'NRO_DECI'
        BaseName = 'TEMP_PAGOS.NRO_DECI'
        Name = 'NRO_DECI'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftInteger
        Fieldname = 'NRO_ORDEN'
        BaseName = 'TEMP_PAGOS.NRO_ORDEN'
        Name = 'NRO_ORDEN'
        DerivedFrom = -1
        DimensionType = dimDimension
        BinType = binNone
        ValueCount = -1
        Active = True
      end
      item
        ActiveFlag = diAsNeeded
        FieldType = ftFloat
        Fieldname = 'SUM'
        BaseName = 'TEMP_PAGOS.IMPORTE'
        Name = 'SUM'
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
