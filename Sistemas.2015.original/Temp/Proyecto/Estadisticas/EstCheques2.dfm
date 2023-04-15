object frmEstCheques2: TfrmEstCheques2
  Left = 95
  Top = 99
  Width = 760
  Height = 484
  Caption = 'Estad'#237'scas de cheques emitidos'
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
  object Label1: TLabel
    Left = 4
    Top = 6
    Width = 57
    Height = 13
    Caption = 'Fecha inicio'
  end
  object Label2: TLabel
    Left = 104
    Top = 6
    Width = 52
    Height = 13
    Caption = 'Fecha final'
  end
  object DecisionPivot1: TDecisionPivot
    Left = 0
    Top = 0
    Width = 752
    Height = 457
    ButtonAutoSize = True
    GroupLayout = xtHorizontal
    Groups = [xtRows, xtColumns, xtSummaries]
    ButtonSpacing = 0
    ButtonWidth = 64
    ButtonHeight = 30
    GroupSpacing = 10
    BorderWidth = 0
    BorderStyle = bsNone
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 4
      Top = 9
      Width = 57
      Height = 13
      Caption = 'Fecha inicio'
    end
    object Label5: TLabel
      Left = 168
      Top = 9
      Width = 52
      Height = 13
      Caption = 'Fecha final'
    end
    object Label3: TLabel
      Left = 422
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Tipo de gr'#225'fico'
    end
    object cmbTipoGrafico: TComboBox
      Left = 496
      Top = 4
      Width = 89
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Text = 'Barras'
      Items.Strings = (
        'Barras'
        'Lineas'
        'Torta')
    end
    object BitBtn2: TBitBtn
      Left = 590
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Ver gr'#225'fico'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 666
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cerrar'
      TabOrder = 2
      Kind = bkClose
    end
    object DecisionGrid1: TDecisionGrid
      Left = 0
      Top = 30
      Width = 752
      Height = 427
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
      TabOrder = 3
    end
  end
  object dtpFin: TDateTimePicker
    Left = 224
    Top = 4
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
    TabOrder = 0
    OnCloseUp = ComboClick
  end
  object dtpIni: TDateTimePicker
    Left = 64
    Top = 4
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
    TabOrder = 1
    OnCloseUp = ComboClick
  end
  object DecisionSource1: TDecisionSource
    DecisionCube = DecisionCube1
    ControlType = xtCheck
    SparseRows = False
    SparseCols = False
    Left = 542
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
      'SELECT NRO_CHEQUE, NRO_DECI, NRO_ORDEN, SUM( IMPORTE )'
      'FROM TEMP_PAGOS'
      'GROUP BY NRO_CHEQUE, NRO_DECI, NRO_ORDEN')
    Left = 542
    Top = 142
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
        ValueCount = -1
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
