object frmElecCoef: TfrmElecCoef
  Left = 805
  Top = 188
  Width = 408
  Height = 410
  Caption = 'Coeficiente de Alquiler'
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
    Top = 0
    Width = 392
    Height = 317
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 312
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Coef#3'
    end
    object lbl2: TLabel
      Left = 312
      Top = 95
      Width = 35
      Height = 13
      Caption = 'Coef#4'
    end
    object lbl3: TLabel
      Left = 312
      Top = 142
      Width = 35
      Height = 13
      Caption = 'Coef#5'
    end
    object lbl4: TLabel
      Left = 312
      Top = 189
      Width = 35
      Height = 13
      Caption = 'Coef#6'
    end
    object grdDatos: TDBGrid
      Left = 5
      Top = 5
      Width = 212
      Height = 228
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
      TitleFont.Height = -15
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
      OnKeyDown = grdDatosKeyDown
      OnTitleClick = grdDatosTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERSONAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANT_AMB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE2'
          Visible = True
        end>
    end
    object dbgrd1: TDBGrid
      Left = 5
      Top = 5
      Width = 300
      Height = 316
      Align = alCustom
      BorderStyle = bsNone
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERSONAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANT_AMB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTAJE2'
          Width = 50
          Visible = True
        end>
    end
    object Edit3: TEdit
      Left = 312
      Top = 67
      Width = 40
      Height = 22
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 312
      Top = 114
      Width = 40
      Height = 22
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 312
      Top = 161
      Width = 40
      Height = 22
      TabOrder = 4
      Text = 'Edit5'
    end
    object Edit6: TEdit
      Left = 312
      Top = 208
      Width = 40
      Height = 22
      TabOrder = 5
      Text = 'Edit6'
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 317
    Width = 392
    Height = 25
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object btnAgregar: TSpeedButton
      Left = 4
      Top = 2
      Width = 69
      Height = 22
      Hint = 'o presione la tecla "A"'
      Caption = '&Agregar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnAgregarClick
    end
    object btnEliminar: TSpeedButton
      Left = 73
      Top = 2
      Width = 69
      Height = 22
      Hint = 'o presione la tecla "Delete"'
      Caption = '&Eliminar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnEliminarClick
    end
    object btnModificar: TSpeedButton
      Left = 142
      Top = 2
      Width = 75
      Height = 22
      Hint = 'o presione la tecla "Enter"'
      Caption = '&Modificar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 3
      OnClick = btnModificarClick
    end
    object btn1: TSpeedButton
      Left = 218
      Top = 2
      Width = 75
      Height = 22
      Caption = '&Respaldar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btn1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 342
    Width = 392
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Panel5: TPanel
      Left = 206
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
        Cancel = True
        Caption = '&Cerrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 2
        ParentFont = False
        TabOrder = 1
        Glyph.Data = {
          66070000424D660700000000000036000000280000001E000000140000000100
          18000000000030070000C40E0000C40E000000000000000000006D797A6C7779
          6C75736E7273686F71686F726B6F726B71706E73717278777073746D72726D74
          746B76766B747500808000808000808000808000808000808000808000808000
          80800080800080800080800080800080800080800000D62C2ED825279A565452
          6A7836517540597B455B7F455F7F475F834E65849EACB78C99979A4948D42322
          D026250080800080800080800080800080800080800080800080800080800080
          800080800080800080800080800080800000FF0000FF0000B246444A697B2C4D
          783A59873B5B8B3758873353832F517FACBFD19AACA9AD3737FF0000FF000000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800000FE0100FF0000AF48454D6C7E304F7B385783
          3A5A8536557E35537B30507CA7B8CA97A9A6AA3A39FF0000FD01000080800080
          8000808000808000808000808000808000808000808000808000808000808000
          80800080800080800000FE0100FF0000AE47444F6E8031507B33517735527A3C
          5C883656802C4D7AA8BACC99ABA6AA3938FF0000FE0100008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          800080800000FE0100FF0000AE47444F6D80304F7837537A3E5C873D5E8E3553
          7E355986ABBDD099A9A5AB3939FF0000FE010000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0000FE0100FF0000B048464D6C7C2F507A39577F3A59833B5B8A3C5B88345783
          AABDCE99A9A6AA3A38FF0000FE01000080800080800080800080800080800080
          800080800080800080800080800080800080800080800080800080800000FE01
          00FF0000AF4846506E7E32527E35547D3A59833E5B88385784335785A9BCCC9A
          A9A6AA3939FF0000FE0100008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800000FE0100FF0000
          AD47444F6C7D33547E35557D3A5A853D5D873356814B729CBBCBDC95A4A4AB39
          39FF0000FE010000808000808000808000808000808000808000808000808000
          80800080800080800080800080800080800080800000FE0100FF0000AD47454E
          6A7E33527D36547C3A5A843C5C86385A863B5E89AFBDD097A8A4AB3A38FF0000
          FE01000080800080800080800080800080800080800080800080800080800080
          800080800080800080800080800080800000FE0100FF0000AF47454E6C803151
          7F2A4B762F548131558327487131527FACBCCE98A9A5AA3A39FF0000FE010000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800000FE0100FF0000AF474449687B43608796A6B9
          8B9FB3879AB09FAEBF49668EA2B3C697A9A7AA3939FF0000FE01000080800080
          8000808000808000808000808000808000808000808000808000808000808000
          80800080800080800000FE0100FF0000AF4946416170577190F2F5F7E1E5E7CF
          D4D9FEFFFF607A9B9FAFC39AABA7AA3938FF0000FE0100008080008080008080
          0080800080800080800080800080800080800080800080800080800080800080
          800080800000FE0100FF0000AF484644637449668BBFC9D3AAB3C1A1ADBFC1CB
          D8547097A6B5C998A8A5A93839FF0000FE010000808000808000808000808000
          8080008080008080008080008080008080008080008080008080008080008080
          0000FE0100FF0000AF474546667B4F6D93C4CDD5B2BCC8ADB8C7D5D9E0566F94
          A2B3C798A8A5A93839FF0000FE01000080800080800080800080800080800080
          800080800080800080800080800080800080800080800080800080800000FE01
          00FF0000AF4846426377587495F2F5F6E1E4E8D1D7DEFDFDFD5B70919EAFC49A
          ABA7A93838FF0000FE0100008080008080008080008080008080008080008080
          0080800080800080800080800080800080800080800080800000FE0100FF0000
          AF47474968783D5B7F889BAD7B8FA86E87A7798FA73D5A84A5B6C897A9A5AA39
          38FF0000FE010000808000808000808000808000808000808000808000808000
          80800080800080800080800080800080800080800000FE0100FF0000AF474550
          6F802F4F7D284B78325687315587264779325487AEC0D296A7A5AA3939FF0000
          FE01000080800080800080800080800080800080800080800080800080800080
          800080800080800080800080800080800000FE0000FF0000B14C49506B783D57
          77435B7A4C6280536884566D865E728C9EA9B2809190B03E3FFF0000FE010000
          8080008080008080008080008080008080008080008080008080008080008080
          0080800080800080800080800000FE0000FF0000B251536C7E806F7172727373
          7174747376777679777A7A767175766D8181BB4A49FF0000FE01000080800080
          8000808000808000808000808000808000808000808000808000808000808000
          80800080800080800000}
        NumGlyphs = 2
      end
      object btnElegir: TBitBtn
        Left = 32
        Top = 2
        Width = 75
        Height = 25
        Caption = '&Elegir'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
        Glyph.Data = {
          36090000424D36090000000000003600000028000000400000000C0000000100
          18000000000000090000C40E0000C40E00000000000000000000FFFFFF000000
          000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          800000800000800000800000800000000000FFFFFFFFFFFFFFFFFF0000000000
          00808080808080808080000000000000808080808080808080000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          8000008000008000008000008000000000000000000000000000008080808080
          80808080000000000000FFFFFEFFFFFE808080000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          800000FF0000800000FF00008000000000008080808080808080808080808080
          80808080000000FFFFFEFFFFFE000000000000808080808080808080000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000
          FF0000800000FF0000800000FF00000000008080808080808080808080808080
          80808080808080000000000000FFFFFEFFFFFE808080000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080808080808080FFFFFEFFFF
          FEFFFFFE808080000000FFFFFEFFFFFE00000000000080808080808080808000
          0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080808080FFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFE808080000000000000FFFFFEFFFFFEFFFFFE00000000000000
          0000000000000000000000000000808080808080808080000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000808080FFFFFEFFFFFEFFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFE808080000000FFFFFEFFFFFE00000080808080808080
          8080000000808080808080808080FFFFFEFFFFFE808080000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          FF0000FF0000FF0000FF0000FF0000000000000000000000000000FFFFFEFFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFE80808000000000000080808080808080808000
          0000808080808080FFFFFEFFFFFE000000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
          000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF000000FFFF
          FEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE80808000000080
          8080808080000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00FFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFE80808000000000000000
          0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000000000000000000000000000000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
      end
    end
  end
  object Query1: TQuery
    Active = True
    DatabaseName = 'ADB'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM COEFICIENTE_ALQUILER ')
    Left = 16
    Top = 248
    object Query1TIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'DB.COEFICIENTE_ALQUILER.TIPO'
      Size = 5
    end
    object Query1PERSONAL: TStringField
      DisplayLabel = 'Personal'
      FieldName = 'PERSONAL'
      Origin = 'DB.COEFICIENTE_ALQUILER.PERSONAL'
      Size = 3
    end
    object Query1CANT_AMB: TIntegerField
      DisplayLabel = 'Cant. Amb.'
      FieldName = 'CANT_AMB'
      Origin = 'DB.COEFICIENTE_ALQUILER.CANT_AMB'
    end
    object Query1PORCENTAJE: TFloatField
      DisplayLabel = 'Coef #1'
      FieldName = 'PORCENTAJE'
      Origin = 'ADB.COEFICIENTE_ALQUILER.PORCENTAJE'
      DisplayFormat = '0.0%'
    end
    object Query1PORCENTAJE2: TFloatField
      DisplayLabel = 'Coef #2'
      FieldName = 'PORCENTAJE2'
      Origin = 'ADB.COEFICIENTE_ALQUILER.PORCENTAJE2'
      DisplayFormat = '0.0%'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 56
    Top = 248
  end
  object scExcelExport1: TscExcelExport
    DataPipe = dpDataSet
    WorksheetName = 'Coef.Alquiler'
    Dataset = Query1
    StyleColumnWidth = cwDefault
    ColumnWidth = 0
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = -16
    FontHeader.Name = 'MS Sans Serif'
    FontHeader.Style = [fsBold]
    FontHeader.Alignment = haGeneral
    FontHeader.WrapText = False
    FontHeader.Orientation = 0
    HeaderText.Strings = (
      'RESPALDO COEFICIENTES DE ALQUILER'
      'ARMADA ARGENTINA - ALCALDIA BNMDP')
    BorderHeader.BackAlternateColor = clBlack
    BorderHeader.Weight = bwThick
    BorderHeader.LineStyle = blDashDot
    MergeHeaderCells = True
    FontTitles.Charset = DEFAULT_CHARSET
    FontTitles.Color = clWindowText
    FontTitles.Height = 1
    FontTitles.Name = 'MS Sans Serif'
    FontTitles.Style = []
    FontTitles.Alignment = haGeneral
    FontTitles.WrapText = False
    FontTitles.Orientation = 0
    BorderTitles.BackAlternateColor = clBlack
    AutoFilter = False
    FontData.Charset = DEFAULT_CHARSET
    FontData.Color = clWindowText
    FontData.Height = 1
    FontData.Name = 'MS Sans Serif'
    FontData.Style = []
    FontData.Alignment = haGeneral
    FontData.WrapText = False
    FontData.Orientation = 0
    FontSummary.Charset = DEFAULT_CHARSET
    FontSummary.Color = clWindowText
    FontSummary.Height = 1
    FontSummary.Name = 'MS Sans Serif'
    FontSummary.Style = []
    FontSummary.Alignment = haGeneral
    FontSummary.WrapText = False
    FontSummary.Orientation = 0
    BorderSummary.BackAlternateColor = clBlack
    SummarySelection = ssNone
    SummaryCalculation = scSUM
    SummaryDisplayFormat = '0.0%'
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = 1
    FontFooter.Name = 'MS Sans Serif'
    FontFooter.Style = []
    FontFooter.Alignment = haGeneral
    FontFooter.WrapText = False
    FontFooter.Orientation = 0
    BorderFooter.BackAlternateColor = clBlack
    MergeFooterCells = True
    FontGroup.Charset = DEFAULT_CHARSET
    FontGroup.Color = clWindowText
    FontGroup.Height = 1
    FontGroup.Name = 'MS Sans Serif'
    FontGroup.Style = []
    FontGroup.Alignment = haGeneral
    FontGroup.WrapText = False
    FontGroup.Orientation = 0
    BorderGroup.BackAlternateColor = clBlack
    GroupOptions.ClearContents = True
    GroupOptions.BorderRange = bsRow
    GroupOptions.IntervalFontSize = 2
    BeginRowTitles = 5
    BeginRowData = 6
    Left = 96
    Top = 248
  end
end
