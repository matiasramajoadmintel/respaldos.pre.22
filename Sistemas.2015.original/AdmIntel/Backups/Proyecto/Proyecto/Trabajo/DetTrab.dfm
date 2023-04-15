object frmDetTrab: TfrmDetTrab
  Left = 135
  Top = 129
  Width = 509
  Height = 305
  BorderIcons = []
  Caption = 'Detalle de trabajos'
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
  object Panel2: TPanel
    Left = 0
    Top = 248
    Width = 501
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 315
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
    Top = 21
    Width = 501
    Height = 227
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
      Width = 491
      Height = 217
      Align = alClient
      BorderStyle = bsNone
      Color = clBlack
      DataSource = dsDatos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          FieldName = 'TAREA'
          Title.Alignment = taCenter
          Title.Caption = 'Tareas'
          Width = 466
          Visible = True
        end>
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 501
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object dsDatos: TDataSource
    DataSet = qryTareas
    Left = 274
    Top = 106
  end
  object qryTareas: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT IDTRABAJO, IDTAREA, DESCRIP AS Tarea FROM VW_TRAB_TAREAS'
      'WHERE IDTRABAJO = :N'
      'ORDER BY DESCRIP')
    Left = 244
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end>
    object qryTareasTAREA: TStringField
      FieldName = 'TAREA'
      Origin = 'ADB.VW_TRAB_TAREAS.DESCRIP'
      Size = 150
    end
  end
end
