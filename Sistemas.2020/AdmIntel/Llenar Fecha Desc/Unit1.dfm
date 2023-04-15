object Form1: TForm1
  Left = 354
  Top = 225
  Width = 341
  Height = 226
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnEjecutar: TBitBtn
    Left = 124
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Ejecutar'
    TabOrder = 0
    OnClick = btnEjecutarClick
  end
  object qryDesc: TQuery
    DatabaseName = 'DB'
    SQL.Strings = (
      
        'SELECT IDTIPODESCUENTO, MES, ANIO, SUM(MONTO) AS MONTO, COUNT(*)' +
        ' AS CANT_ACTIVOS FROM DESCUENTO'
      'WHERE IDTIPODESCUENTO = 1 OR IDTIPODESCUENTO = 3'
      'GROUP BY IDTIPODESCUENTO, MES, ANIO')
    Left = 14
    Top = 18
    object qryDescIDTIPODESCUENTO: TIntegerField
      FieldName = 'IDTIPODESCUENTO'
      Origin = 'DBADMIN.DESCUENTO.IDTIPODESCUENTO'
    end
    object qryDescMES: TStringField
      FieldName = 'MES'
      Origin = 'DBADMIN.DESCUENTO.MES'
      Size = 10
    end
    object qryDescANIO: TIntegerField
      FieldName = 'ANIO'
      Origin = 'DBADMIN.DESCUENTO.ANIO'
    end
    object qryDescMONTO: TFloatField
      FieldName = 'MONTO'
      Origin = 'DBADMIN.DESCUENTO.MONTO'
    end
    object qryDescCANT_ACTIVOS: TIntegerField
      FieldName = 'CANT_ACTIVOS'
    end
  end
  object Database1: TDatabase
    AliasName = 'DBAdmin'
    DatabaseName = 'DBAdmin'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=D:\Sistemas\AdmIntel\Datos\DBADMIN.GDB'
      'USER NAME=SYSDBA'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'WAIT ON LOCKS=true'
      'COMMIT RETAIN=FALSE'
      'ROLE NAME='
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 14
    Top = 50
  end
  object tblFechaDesc: TTable
    DatabaseName = 'DB'
    Exclusive = True
    TableName = 'FECHA_DESCUENTO'
    Left = 72
    Top = 24
    object tblFechaDescIDTIPO_DESCUENTO: TIntegerField
      FieldName = 'IDTIPO_DESCUENTO'
      Required = True
    end
    object tblFechaDescFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
    object tblFechaDescMES: TStringField
      FieldName = 'MES'
      Required = True
      Size = 10
    end
    object tblFechaDescANIO: TIntegerField
      FieldName = 'ANIO'
      Required = True
    end
    object tblFechaDescMONTO: TFloatField
      FieldName = 'MONTO'
      Required = True
    end
    object tblFechaDescDEPTOS_ACTIVOS: TIntegerField
      FieldName = 'DEPTOS_ACTIVOS'
      Required = True
    end
  end
end
