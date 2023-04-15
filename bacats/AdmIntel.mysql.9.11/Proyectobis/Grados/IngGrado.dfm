object frmIngGrado: TfrmIngGrado
  Left = 174
  Top = 221
  Width = 433
  Height = 159
  Caption = 'Grado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 102
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 12
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Abreviatura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 79
      Top = 56
      Width = 72
      Height = 13
      Caption = 'Tiempo m'#237'nimo'
      FocusControl = DBEdit1
      WordWrap = True
    end
    object Label4: TLabel
      Left = 163
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Sueldo'
    end
    object Label5: TLabel
      Left = 288
      Top = 56
      Width = 42
      Height = 13
      Caption = 'R.G.A.S.'
    end
    object Label6: TLabel
      Left = 288
      Top = 12
      Width = 29
      Height = 13
      Caption = 'Orden'
      FocusControl = DBEdit4
    end
    object edtDescripcion: TDBEdit
      Left = 15
      Top = 26
      Width = 261
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object edtPorcentaje: TDBEdit
      Left = 15
      Top = 70
      Width = 55
      Height = 21
      DataField = 'ABREVIATURA'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 70
      Width = 75
      Height = 21
      DataField = 'TIEMPO_MINIMO'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit2: TDBEdit
      Left = 163
      Top = 70
      Width = 115
      Height = 21
      DataField = 'COD201'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit3: TDBEdit
      Left = 288
      Top = 70
      Width = 122
      Height = 21
      DataField = 'COD209'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnEnter = Entrada_A_Campo
      OnExit = Salida_de_Campo
      OnKeyDown = Teclitas
      OnKeyPress = PressEnter
      OnKeyUp = Teclitas
    end
    object DBEdit4: TDBEdit
      Left = 288
      Top = 26
      Width = 122
      Height = 21
      DataField = 'ORDEN'
      DataSource = dsGrado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 102
    Width = 425
    Height = 30
    Align = alBottom
    TabOrder = 1
    object btnAceptar: TBitBtn
      Left = 270
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Aceptar'
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 346
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsGrado: TDataSource
    DataSet = Grado
    Left = 380
    Top = 3
  end
  object Grado: TTable
    DatabaseName = 'ADB'
    TableName = 'GRADO'
    Left = 352
    Top = 2
    object GradoIDGRADO: TIntegerField
      FieldName = 'IDGRADO'
    end
    object GradoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Required = True
      Size = 50
    end
    object GradoABREVIATURA: TStringField
      FieldName = 'ABREVIATURA'
      Required = True
      Size = 2
    end
    object GradoTIEMPO_MINIMO: TIntegerField
      FieldName = 'TIEMPO_MINIMO'
    end
    object GradoCOD201: TFloatField
      FieldName = 'COD201'
      currency = True
    end
    object GradoCOD209: TFloatField
      FieldName = 'COD209'
      currency = True
    end
    object GradoORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
  end
end
