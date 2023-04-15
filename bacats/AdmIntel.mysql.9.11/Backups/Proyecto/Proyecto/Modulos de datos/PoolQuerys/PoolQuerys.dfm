object dmQuerys: TdmQuerys
  OldCreateOrder = False
  Left = 381
  Top = 179
  Height = 332
  Width = 371
  object qryTrab: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_TRABAJOS')
    Left = 18
    Top = 12
    object qryTrabIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.VW_TRABAJOS.IDTRABAJO'
      Visible = False
    end
    object qryTrabNRO_PEDIDO: TIntegerField
      DisplayLabel = 'N'#186' Trab.'
      FieldName = 'NRO_PEDIDO'
      Origin = 'ADB.VW_TRABAJOS.NRO_PEDIDO'
    end
    object qryTrabIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'ADB.VW_TRABAJOS.IDDEPARTAMENTO'
      Visible = False
    end
    object qryTrabDESC_DEPTO: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'DESC_DEPTO'
      Origin = 'ADB.VW_TRABAJOS.DESC_DEPTO'
      Size = 164
    end
    object qryTrabFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INI'
      Origin = 'ADB.VW_TRABAJOS.FECHA_INI'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryTrabFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.VW_TRABAJOS.FECHA_FIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryTrabRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_TRABAJOS.RAZON_SOCIAL'
      Size = 45
    end
    object qryTrabCOSTO: TFloatField
      DisplayLabel = 'Costo'
      FieldName = 'COSTO'
      Origin = 'ADB.VW_TRABAJOS.COSTO'
      DisplayFormat = '#,0.00'
    end
    object qryTrabIMPUTACION: TStringField
      Alignment = taCenter
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
      Origin = 'ADB.VW_TRABAJOS.IMPUTACION'
      Size = 2
    end
    object qryTrabDESCRIP: TStringField
      DisplayLabel = 'Rubro'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_TRABAJOS.DESCRIP'
      Size = 45
    end
    object qryTrabTIPO_PAGO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_TRABAJOS.TIPO_PAGO'
      Size = 1
    end
    object qryTrabNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_TRABAJOS.NRO_CHEQUE'
    end
    object qryTrabPAGADO: TStringField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
      Origin = 'ADB.VW_TRABAJOS.PAGADO'
      Size = 2
    end
    object qryTrabIDEDIF: TIntegerField
      FieldName = 'IDEDIF'
      Origin = 'ADB.VW_TRABAJOS.IDEDIF'
      Visible = False
    end
    object qryTrabEDIFICIO: TStringField
      FieldName = 'EDIFICIO'
      Origin = 'ADB.VW_TRABAJOS.EDIFICIO'
      Visible = False
      Size = 150
    end
    object qryTrabNRO_DECI: TIntegerField
      DisplayLabel = 'DECI'
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_TRABAJOS.NRO_DECI'
    end
    object qryTrabNRO_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_TRABAJOS.NRO_ORDEN'
    end
    object qryTrabNRO_FACTURA: TIntegerField
      DisplayLabel = 'N'#186' Factura'
      FieldName = 'NRO_FACTURA'
      Origin = 'ADB.VW_TRABAJOS.NRO_FACTURA'
    end
  end
  object qryDetTareas: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT Tarea.DESCRIP, Trab_depto.IDDEPARTAMENTO, Trabajo.FECHA_F' +
        'IN, Proveedor.RAZON_SOCIAL'
      'FROM TRABAJO Trabajo'
      '   INNER JOIN TRAB_DEPTO Trab_depto'
      '   ON  (Trabajo.IDTRABAJO = Trab_depto.IDTRABAJO)'
      '   INNER JOIN TRAB_TAREA Trab_tarea'
      '   ON  (Trabajo.IDTRABAJO = Trab_tarea.IDTRABAJO)'
      '   LEFT OUTER JOIN PROVEEDOR Proveedor'
      '   ON  (Trabajo.IDPROVEEDOR = Proveedor.IDPROVEEDOR)'
      '   INNER JOIN TAREA Tarea'
      '   ON  (Trab_tarea.IDTAREA = Tarea.IDTAREA)')
    Left = 88
    Top = 12
    object qryDetTareasDESCRIP: TStringField
      DisplayLabel = 'Tarea'
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      Size = 150
    end
    object qryDetTareasIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Visible = False
    end
    object qryDetTareasFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_FIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryDetTareasRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Size = 45
    end
    object qryDetTareasDepartamento: TStringField
      FieldKind = fkLookup
      FieldName = 'Departamento'
      LookupDataSet = dmDatos.DEPTO
      LookupKeyFields = 'IDDEPARTAMENTO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDDEPARTAMENTO'
      Size = 100
      Lookup = True
    end
  end
  object qryResTareas: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      
        'SELECT Tarea.DESCRIP, Trab_depto.IDDEPARTAMENTO, COUNT( Trab_tar' +
        'ea.IDTAREA ) Cantidad'
      'FROM TRABAJO Trabajo'
      '   INNER JOIN TRAB_DEPTO Trab_depto'
      '   ON  (Trabajo.IDTRABAJO = Trab_depto.IDTRABAJO)  '
      '   INNER JOIN TRAB_TAREA Trab_tarea'
      '   ON  (Trabajo.IDTRABAJO = Trab_tarea.IDTRABAJO)  '
      '   INNER JOIN TAREA Tarea'
      '   ON  (Trab_tarea.IDTAREA = Tarea.IDTAREA)  '
      'WHERE (FECHA_FIN >= :F1) AND (FECHA_FIN <= :F2)'
      'GROUP BY Tarea.DESCRIP, Trab_depto.IDDEPARTAMENTO')
    Left = 162
    Top = 12
    ParamData = <
      item
        DataType = ftDate
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'F2'
        ParamType = ptUnknown
      end>
    object qryResTareasDESCRIP: TStringField
      DisplayLabel = 'Tarea'
      DisplayWidth = 100
      FieldName = 'DESCRIP'
      Size = 150
    end
    object qryResTareasIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Visible = False
    end
    object qryResTareasCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object qryResTareasDepartamento: TStringField
      FieldKind = fkLookup
      FieldName = 'Departamento'
      LookupDataSet = dmDatos.DEPTO
      LookupKeyFields = 'IdDepartamento'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'IDDEPARTAMENTO'
      Size = 100
      Lookup = True
    end
  end
  object qryCantTareas: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT COUNT( Tarea.IDTAREA ) Cantidad, Tarea.DESCRIP Tarea'
      'FROM TRAB_TAREA Trab_tarea'
      '   INNER JOIN TAREA Tarea'
      '   ON  (Trab_tarea.IDTAREA = Tarea.IDTAREA)  '
      '   INNER JOIN TRABAJO Trabajo'
      '   ON  (Trab_tarea.IDTRABAJO = Trabajo.IDTRABAJO)  '
      'WHERE (FECHA_FIN >= :F1) AND (FECHA_FIN <= :F2)'
      'GROUP BY Tarea.DESCRIP, Tarea.DESCRIP')
    Left = 236
    Top = 12
    ParamData = <
      item
        DataType = ftDate
        Name = 'F1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'F2'
        ParamType = ptUnknown
      end>
    object qryCantTareasTAREA: TStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Origin = 'ADB.TAREA.DESCRIP'
      Size = 100
    end
    object qryCantTareasCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'ADB.TAREA.IDTAREA'
    end
  end
  object qryEC: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_ESPACIOS_COMUNES'
      'WHERE IDEDIFICIO = :N')
    Left = 18
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'N'
        ParamType = ptUnknown
      end>
  end
  object qryTrabEdi: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_TRAB_EDIF'
      'ORDER BY NRO_PEDIDO')
    Left = 88
    Top = 62
    object qryTrabEdiIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.VW_TRAB_EDIF.IDTRABAJO'
      Visible = False
    end
    object qryTrabEdiNRO_PEDIDO: TIntegerField
      DisplayLabel = 'Nro. Trabajo'
      FieldName = 'NRO_PEDIDO'
      Origin = 'ADB.VW_TRAB_EDIF.NRO_PEDIDO'
    end
    object qryTrabEdiIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_TRAB_EDIF.IDEDIFICIO'
      Visible = False
    end
    object qryTrabEdiEDIFICIO: TStringField
      DisplayLabel = 'Edificio'
      FieldName = 'EDIFICIO'
      Origin = 'ADB.VW_TRAB_EDIF.EDIFICIO'
      Size = 150
    end
    object qryTrabEdiESPACIO: TStringField
      DisplayLabel = 'Espacio com'#250'n'
      FieldName = 'ESPACIO'
      Origin = 'ADB.VW_TRAB_EDIF.ESPACIO'
      Size = 60
    end
    object qryTrabEdiDESCRIP: TStringField
      DisplayLabel = 'Rubro'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_TRAB_EDIF.DESCRIP'
      Size = 60
    end
    object qryTrabEdiFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INI'
      Origin = 'ADB.VW_TRAB_EDIF.FECHA_INI'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryTrabEdiFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.VW_TRAB_EDIF.FECHA_FIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryTrabEdiRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_TRAB_EDIF.RAZON_SOCIAL'
      Size = 45
    end
    object qryTrabEdiCOSTO: TFloatField
      DisplayLabel = 'Costo'
      FieldName = 'COSTO'
      Origin = 'ADB.VW_TRAB_EDIF.COSTO'
      DisplayFormat = '#,0.00'
    end
    object qryTrabEdiIMPUTACION: TStringField
      DisplayLabel = 'Imputaci'#243'n'
      FieldName = 'IMPUTACION'
      Origin = 'ADB.VW_TRAB_EDIF.IMPUTACION'
      Size = 2
    end
    object qryTrabEdiPAGADO: TStringField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
      Origin = 'ADB.VW_TRAB_EDIF.PAGADO'
      Size = 2
    end
    object qryTrabEdiNRO_DECI: TIntegerField
      DisplayLabel = 'DECI'
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_TRAB_EDIF.NRO_DECI'
    end
    object qryTrabEdiNRO_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_TRAB_EDIF.NRO_ORDEN'
    end
    object qryTrabEdiNRO_FACTURA: TIntegerField
      DisplayLabel = 'N'#186' Factura'
      FieldName = 'NRO_FACTURA'
      Origin = 'ADB.VW_TRAB_EDIF.NRO_FACTURA'
    end
    object qryTrabEdiTIPO_PAGO: TStringField
      DisplayLabel = 'Pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_TRAB_EDIF.TIPO_PAGO'
      Size = 1
    end
  end
  object qryPagados: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_PAGADOS'
      'ORDER BY FECHA_PAGO')
    Left = 162
    Top = 108
    object qryPagadosIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_PAGADOS.IDPAGO'
      Visible = False
    end
    object qryPagadosFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha pago'
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_PAGADOS.FECHA_PAGO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryPagadosRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_PAGADOS.IDPROVEEDOR'
      Size = 45
    end
    object qryPagadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_PAGADOS.IMPORTE'
      DisplayFormat = '#,0.00'
    end
    object qryPagadosTIPO_PAGO: TStringField
      DisplayLabel = 'Pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_PAGADOS.TIPO_PAGO'
      Size = 1
    end
    object qryPagadosNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_PAGADOS.NRO_CHEQUE'
    end
    object qryPagadosCOBRADO: TStringField
      DisplayLabel = 'Cobrado'
      FieldName = 'COBRADO'
      Origin = 'ADB.VW_PAGADOS.COBRADO'
      Size = 2
    end
    object qryPagadosIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_PAGADOS.IDPROVEEDOR'
      Visible = False
    end
  end
  object qryGastoAd: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_GASTO_AD'
      'ORDER BY DESCRIP')
    Left = 164
    Top = 60
    object qryGastoAdFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'ADB.VW_GASTO_AD.FECHA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryGastoAdDESCRIP: TStringField
      DisplayLabel = 'Concepto'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_GASTO_AD.DESCRIP'
      Size = 60
    end
    object qryGastoAdCOSTO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'COSTO'
      Origin = 'ADB.VW_GASTO_AD.COSTO'
      DisplayFormat = '#,0.00'
    end
    object qryGastoAdRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_GASTO_AD.RAZON_SOCIAL'
      Size = 45
    end
    object qryGastoAdPAGADO: TStringField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
      Origin = 'ADB.VW_GASTO_AD.PAGADO'
      Size = 2
    end
    object qryGastoAdTIPO_PAGO: TStringField
      DisplayLabel = 'Pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_GASTO_AD.TIPO_PAGO'
      Size = 1
    end
    object qryGastoAdNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_GASTO_AD.NRO_CHEQUE'
    end
    object qryGastoAdIDTIPO_GASTO_AD: TIntegerField
      FieldName = 'IDTIPO_GASTO_AD'
      Origin = 'ADB.VW_GASTO_AD.IDTIPO_GASTO_AD'
      Visible = False
    end
    object qryGastoAdIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_GASTO_AD.IDPROVEEDOR'
      Visible = False
    end
    object qryGastoAdIDGASTO_AD: TIntegerField
      FieldName = 'IDGASTO_AD'
      Origin = 'ADB.VW_GASTO_AD.IDGASTO_AD'
      Visible = False
    end
    object qryGastoAdFECHA_PAGO: TDateTimeField
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_GASTO_AD.FECHA_PAGO'
      Visible = False
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryGastoAdNRO_DECI: TIntegerField
      DisplayLabel = 'DECI'
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_GASTO_AD.NRO_DECI'
    end
    object qryGastoAdNRO_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_GASTO_AD.NRO_ORDEN'
    end
    object qryGastoAdNRO_FACT: TIntegerField
      DisplayLabel = 'N'#186' Factura'
      FieldName = 'NRO_FACT'
      Origin = 'ADB.VW_GASTO_AD.NRO_FACT'
    end
  end
  object qryGastoFi: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_GASTO_FI'
      'ORDER BY DESCRIP')
    Left = 236
    Top = 60
    object qryGastoFiFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'ADB.VW_GASTO_FI.FECHA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryGastoFiCOSTO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'COSTO'
      Origin = 'ADB.VW_GASTO_FI.COSTO'
      DisplayFormat = '#,0.00'
      currency = True
    end
    object Concepto: TStringField
      DisplayLabel = 'Concepto'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_GASTO_FI.DESCRIP'
      Size = 60
    end
    object qryGastoFiNRO_HOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'NRO_HOJA'
      Origin = 'ADB.VW_GASTO_FI.NRO_HOJA'
    end
    object qryGastoFiIDTIPO_GASTO_FI: TIntegerField
      FieldName = 'IDTIPO_GASTO_FI'
      Origin = 'ADB.VW_GASTO_FI.IDTIPO_GASTO_FI'
      Visible = False
    end
    object qryGastoFiIDGASTO_FI: TIntegerField
      FieldName = 'IDGASTO_FI'
      Origin = 'ADB.VW_GASTO_FI.IDGASTO_FI'
      Visible = False
    end
  end
  object qryServEdif: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_SERV_EDIF'
      'ORDER BY DESCRIP')
    Left = 18
    Top = 108
    object qryServEdifFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'ADB.VW_SERV_EDIF.FECHA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryServEdifEDIFICIO: TStringField
      DisplayLabel = 'Edificio'
      FieldName = 'EDIFICIO'
      Origin = 'ADB.VW_SERV_EDIF.EDIFICIO'
      Size = 150
    end
    object qryServEdifDESCRIP: TStringField
      DisplayLabel = 'Concepto'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_SERV_EDIF.DESCRIP'
      Size = 60
    end
    object qryServEdifCOSTO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'COSTO'
      Origin = 'ADB.VW_SERV_EDIF.COSTO'
      DisplayFormat = '#,0.00'
      currency = True
    end
    object qryServEdifRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_SERV_EDIF.RAZON_SOCIAL'
      Size = 45
    end
    object qryServEdifPAGADO: TStringField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
      Origin = 'ADB.VW_SERV_EDIF.PAGADO'
      Size = 2
    end
    object qryServEdifTIPO_PAGO: TStringField
      DisplayLabel = 'Pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_SERV_EDIF.TIPO_PAGO'
      Size = 1
    end
    object qryServEdifNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_SERV_EDIF.NRO_CHEQUE'
    end
    object qryServEdifVACIOS: TStringField
      DisplayLabel = 'Vacios'
      FieldName = 'VACIOS'
      Origin = 'ADB.VW_SERV_EDIF.VACIOS'
      Size = 2
    end
    object qryServEdifIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_SERV_EDIF.IDEDIFICIO'
      Visible = False
    end
    object qryServEdifIDSERVICIO: TIntegerField
      FieldName = 'IDSERVICIO'
      Origin = 'ADB.VW_SERV_EDIF.IDSERVICIO'
      Visible = False
    end
    object qryServEdifIDPROVEEDOR: TIntegerField
      FieldName = 'IDPROVEEDOR'
      Origin = 'ADB.VW_SERV_EDIF.IDPROVEEDOR'
      Visible = False
    end
    object qryServEdifIDSERV_EDIF: TIntegerField
      FieldName = 'IDSERV_EDIF'
      Origin = 'ADB.VW_SERV_EDIF.IDSERV_EDIF'
      Visible = False
    end
    object qryServEdifNRO_DECI: TIntegerField
      DisplayLabel = 'DECI'
      FieldName = 'NRO_DECI'
      Origin = 'ADB.VW_SERV_EDIF.NRO_DECI'
    end
    object qryServEdifNRO_ORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'NRO_ORDEN'
      Origin = 'ADB.VW_SERV_EDIF.NRO_ORDEN'
    end
    object qryServEdifNRO_FACT: TIntegerField
      DisplayLabel = 'N'#186' Fact.'
      FieldName = 'NRO_FACT'
      Origin = 'ADB.VW_SERV_EDIF.NRO_FACT'
    end
  end
  object Q: TQuery
    DatabaseName = 'ADB'
    Left = 286
    Top = 176
  end
end
