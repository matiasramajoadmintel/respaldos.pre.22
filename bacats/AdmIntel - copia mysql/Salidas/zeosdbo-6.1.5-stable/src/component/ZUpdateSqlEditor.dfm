object ZUpdateSQLEditForm: TZUpdateSQLEditForm
  Left = 466
  Top = 601
  Width = 473
  Height = 301
  ActiveControl = UpdateTableName
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object OkButton: TButton
    Left = 215
    Top = 271
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OkButtonClick
  end
  object CancelButton: TButton
    Left = 303
    Top = 271
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object HelpButton: TButton
    Left = 391
    Top = 271
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Help'
    TabOrder = 2
    OnClick = HelpButtonClick
  end
  object PageControl: TPageControl
    Left = 6
    Top = 6
    Width = 459
    Height = 256
    ActivePage = FieldsPage
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    OnChanging = PageControlChanging
    object FieldsPage: TTabSheet
      Caption = 'Options'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 4
        Width = 435
        Height = 216
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' SQL Generation '
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 18
          Width = 69
          Height = 15
          Caption = 'Table &Name:'
          FocusControl = UpdateTableName
        end
        object Label3: TLabel
          Left = 146
          Top = 18
          Width = 58
          Height = 15
          Caption = '&Key Fields:'
          FocusControl = KeyFieldList
        end
        object Label4: TLabel
          Left = 289
          Top = 18
          Width = 77
          Height = 15
          Caption = 'Update &Fields:'
          FocusControl = UpdateFieldList
        end
        object UpdateTableName: TComboBox
          Left = 9
          Top = 35
          Width = 130
          Height = 23
          ItemHeight = 17
          TabOrder = 0
          OnChange = UpdateTableNameChange
          OnClick = UpdateTableNameClick
        end
        object KeyFieldList: TListBox
          Left = 146
          Top = 35
          Width = 136
          Height = 167
          Anchors = [akTop, akRight, akBottom]
          MultiSelect = True
          PopupMenu = FieldListPopup
          TabOrder = 6
          OnClick = SettingsChanged
        end
        object UpdateFieldList: TListBox
          Left = 289
          Top = 35
          Width = 136
          Height = 167
          Anchors = [akTop, akRight, akBottom]
          MultiSelect = True
          PopupMenu = FieldListPopup
          TabOrder = 7
          OnClick = SettingsChanged
        end
        object GenerateButton: TButton
          Left = 17
          Top = 154
          Width = 114
          Height = 25
          Caption = '&Generate SQL'
          TabOrder = 4
          OnClick = GenerateButtonClick
        end
        object PrimaryKeyButton: TButton
          Left = 17
          Top = 124
          Width = 114
          Height = 25
          Caption = 'Select &Primary Keys'
          TabOrder = 3
          OnClick = PrimaryKeyButtonClick
        end
        object DefaultButton: TButton
          Left = 17
          Top = 93
          Width = 114
          Height = 25
          Caption = '&Dataset Defaults'
          Enabled = False
          TabOrder = 2
          OnClick = DefaultButtonClick
        end
        object QuoteFields: TCheckBox
          Left = 18
          Top = 184
          Width = 119
          Height = 17
          Caption = '&Quote Field Names'
          TabOrder = 5
          OnClick = SettingsChanged
        end
        object GetTableFieldsButton: TButton
          Left = 17
          Top = 62
          Width = 114
          Height = 25
          Caption = 'Get &Table Fields'
          TabOrder = 1
          OnClick = GetTableFieldsButtonClick
        end
      end
    end
    object SQLPage: TTabSheet
      Caption = 'SQL'
      object Label2: TLabel
        Left = 13
        Top = 53
        Width = 54
        Height = 15
        Caption = 'S&QL Text:'
        FocusControl = SQLMemo
      end
      object SQLMemo: TMemo
        Left = 9
        Top = 69
        Width = 433
        Height = 141
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyPress = SQLMemoKeyPress
      end
      object StatementType: TRadioGroup
        Left = 10
        Top = 6
        Width = 432
        Height = 40
        Items.Strings = (
          '&Modify'
          '&Insert'
          '&Delete')
        Caption = 'Statement Type'
        Columns = 3
        TabOrder = 1
        OnClick = StatementTypeClick
      end
    end
  end
  object FieldListPopup: TPopupMenu
    Left = 54
    Top = 270
    object miSelectAll: TMenuItem
      Caption = '&Select All'
      OnClick = SelectAllClick
    end
    object miClearAll: TMenuItem
      Caption = '&Clear All'
      OnClick = ClearAllClick
    end
  end
end
