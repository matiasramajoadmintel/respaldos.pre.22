object dmQuerys: TdmQuerys
  OldCreateOrder = False
  Left = 300
  Top = 142
  Height = 382
  Width = 383
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
      'SELECT * FROM VW_DET_TAREAS')
    Left = 88
    Top = 12
    object qryDetTareasDESCRIP: TStringField
      DisplayLabel = 'Tarea'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_DET_TAREAS.DESCRIP'
      Size = 150
    end
    object qryDetTareasFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha fin'
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.VW_DET_TAREAS.FECHA_FIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryDetTareasRAZON_SOCIAL: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'RAZON_SOCIAL'
      Origin = 'ADB.VW_DET_TAREAS.RAZON_SOCIAL'
      Size = 45
    end
    object qryDetTareasEDIFICO: TStringField
      DisplayLabel = 'Edificio'
      FieldName = 'EDIFICO'
      Origin = 'ADB.VW_DET_TAREAS.EDIFICO'
      Size = 50
    end
    object qryDetTareasIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_DET_TAREAS.IDEDIFICIO'
      Visible = False
    end
    object qryDetTareasLUGAR: TStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Origin = 'ADB.VW_DET_TAREAS.LUGAR'
      Size = 60
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
    object qryPagadosPERSONAL: TStringField
      DisplayLabel = 'Personal'
      FieldName = 'PERSONAL'
      Origin = 'ADB.VW_PAGADOS.PERSONAL'
      Size = 42
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
  object qryMatUsados: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'select * from vw_mat_usados')
    Left = 16
    Top = 160
    object qryMatUsadosIDTRABAJO: TIntegerField
      FieldName = 'IDTRABAJO'
      Origin = 'ADB.VW_MAT_USADOS.IDTRABAJO'
      Visible = False
    end
    object qryMatUsadosIDMATERIAL: TIntegerField
      FieldName = 'IDMATERIAL'
      Origin = 'ADB.VW_MAT_USADOS.IDMATERIAL'
      Visible = False
    end
    object qryMatUsadosIDUNIDAD: TIntegerField
      FieldName = 'IDUNIDAD'
      Origin = 'ADB.VW_MAT_USADOS.IDUNIDAD'
      Visible = False
    end
    object qryMatUsadosDESCRIP: TStringField
      DisplayLabel = 'Material'
      FieldName = 'DESCRIP'
      Origin = 'ADB.VW_MAT_USADOS.DESCRIP'
      Size = 45
    end
    object qryMatUsadosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      Origin = 'ADB.VW_MAT_USADOS.CANTIDAD'
    end
    object qryMatUsadosABREV: TStringField
      DisplayLabel = 'Unidad'
      FieldName = 'ABREV'
      Origin = 'ADB.VW_MAT_USADOS.ABREV'
      Size = 15
    end
    object qryMatUsadosNROPEDIDO: TIntegerField
      DisplayLabel = 'N'#186' Pedido'
      FieldName = 'NROPEDIDO'
      Origin = 'ADB.VW_MAT_USADOS.NROPEDIDO'
    end
    object qryMatUsadosEDIFICO: TStringField
      DisplayLabel = 'Edificio'
      FieldName = 'EDIFICO'
      Origin = 'ADB.VW_MAT_USADOS.EDIFICO'
      Size = 50
    end
    object qryMatUsadosFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha fin'
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.VW_MAT_USADOS.FECHAFIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryMatUsadosLUGAR: TStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Origin = 'ADB.VW_MAT_USADOS.LUGAR'
      Size = 60
    end
    object qryMatUsadosPROVEEDOR: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      Origin = 'ADB.VW_MAT_USADOS.PROVEEDOR'
      Size = 45
    end
    object qryMatUsadosNROFACTURA: TIntegerField
      DisplayLabel = 'N'#186' Factura'
      FieldName = 'NROFACTURA'
      Origin = 'ADB.VW_MAT_USADOS.NROFACTURA'
    end
    object qryMatUsadosIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_MAT_USADOS.LUGAR'
      Visible = False
    end
  end
  object qryOcupActuales: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'select * from vw_ocupantes_actuales')
    Left = 90
    Top = 108
    object qryOcupActualesIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDOCUPANTE'
      Visible = False
    end
    object qryOcupActualesOCUPANTE: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.OCUPANTE'
      Size = 41
    end
    object qryOcupActualesTIPO: TStringField
      FieldName = 'Tipo'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.TIPO'
    end
    object qryOcupActualesMATRICULA: TStringField
      FieldName = 'Matricula'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.MATRICULA'
      Size = 10
    end
    object qryOcupActualesLOCACION: TStringField
      DisplayLabel = 'Vivienda'
      FieldName = 'LOCACION'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.LOCACION'
      Size = 111
    end
    object qryOcupActualesFECHAINI: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHAINI'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.FECHAINI'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryOcupActualesFECHAFIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHAFIN'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.FECHAFIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryOcupActualesIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDOCUPANTE'
      Visible = False
    end
    object qryOcupActualesIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'ADB.VW_OCUPANTES_ACTUALES.IDOCUPANTE'
      Visible = False
    end
  end
  object qryRecibos: TQuery
    OnCalcFields = qryRecibosCalcFields
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_RECIBOS')
    Left = 90
    Top = 160
    object qryRecibosIDRECIBO: TIntegerField
      FieldName = 'IDRECIBO'
      Origin = 'ADB.VW_RECIBOS.IDRECIBO'
      Visible = False
    end
    object qryRecibosNRO_RECIBO: TStringField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRO_RECIBO'
      Origin = 'ADB.VW_RECIBOS.IDRECIBO'
      Size = 10
    end
    object qryRecibosFECHA_EMISION: TDateTimeField
      DisplayLabel = 'Fecha emisi'#243'n'
      FieldName = 'FECHA_EMISION'
      Origin = 'ADB.VW_RECIBOS.FECHA_EMISION'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecibosOCUPANTE: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_RECIBOS.OCUPANTE'
      Size = 41
    end
    object qryRecibosFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha inicio'
      FieldName = 'FECHA_INICIO'
      Origin = 'ADB.VW_RECIBOS.FECHA_INICIO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecibosFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha fin'
      FieldName = 'FECHA_FIN'
      Origin = 'ADB.VW_RECIBOS.FECHA_FIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecibosMONTO_MANT: TFloatField
      DisplayLabel = 'Monto mantenimiento'
      FieldName = 'MONTO_MANT'
      Origin = 'ADB.VW_RECIBOS.MONTO_MANT'
      currency = True
    end
    object qryRecibosMONTO_EXP: TFloatField
      DisplayLabel = 'Monto expensas'
      FieldName = 'MONTO_EXP'
      Origin = 'ADB.VW_RECIBOS.MONTO_EXP'
      currency = True
    end
    object qryRecibosDEPTO: TStringField
      DisplayLabel = 'Vivienda'
      FieldName = 'DEPTO'
      Origin = 'ADB.VW_RECIBOS.DEPTO'
      Size = 111
    end
    object qryRecibosANULADO: TStringField
      DisplayLabel = 'Anulado'
      FieldName = 'ANULADO'
      Origin = 'ADB.VW_RECIBOS.IDRECIBO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryRecibosRecAnulado: TBooleanField
      DisplayLabel = 'Anulado'
      FieldKind = fkCalculated
      FieldName = 'RecAnulado'
      DisplayValues = 'S'#237';'
      Calculated = True
    end
  end
  object qryOcupHistoricos: TQuery
    OnCalcFields = qryOcupHistoricosCalcFields
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_OCUPANTES_HISTORICOS')
    Left = 166
    Top = 162
    object qryOcupHistoricosIDOCUPANTE: TIntegerField
      FieldName = 'IDOCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.IDOCUPANTE'
      Visible = False
    end
    object qryOcupHistoricosOCUPANTE: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.OCUPANTE'
      Size = 41
    end
    object qryOcupHistoricosTipoPers: TStringField
      DisplayLabel = 'Tipo'
      FieldKind = fkCalculated
      FieldName = 'TipoPers'
      Calculated = True
    end
    object qryOcupHistoricosMatricula: TStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldKind = fkCalculated
      FieldName = 'Matricula'
      Size = 15
      Calculated = True
    end
    object qryOcupHistoricosLOCACION: TStringField
      DisplayLabel = 'Vivienda'
      FieldName = 'LOCACION'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.LOCACION'
      Size = 111
    end
    object qryOcupHistoricosFECHAINI: TDateTimeField
      DisplayLabel = 'Fecha inicio'
      FieldName = 'FECHAINI'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.FECHAINI'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryOcupHistoricosFECHAFIN: TDateTimeField
      DisplayLabel = 'Fecha fin'
      FieldName = 'FECHAFIN'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.FECHAFIN'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryOcupHistoricosFECHARETIRO: TDateTimeField
      DisplayLabel = 'Fecha retiro'
      FieldName = 'FECHARETIRO'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.FECHARETIRO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryOcupHistoricosIDEDIFICIO: TIntegerField
      FieldName = 'IDEDIFICIO'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.IDEDIFICIO'
      Visible = False
    end
    object qryOcupHistoricosIDDEPARTAMENTO: TIntegerField
      FieldName = 'IDDEPARTAMENTO'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.IDDEPARTAMENTO'
      Visible = False
    end
    object qryOcupHistoricosTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'ADB.VW_OCUPANTES_HISTORICOS.TIPO'
      Visible = False
      Size = 12
    end
  end
  object qryIngresos: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_INGRESOS')
    Left = 18
    Top = 208
    object qryIngresosIDINGRESO: TIntegerField
      FieldName = 'IDINGRESO'
      Origin = 'ADB.VW_INGRESOS.IDINGRESO'
      Visible = False
    end
    object qryIngresosIDTIPO_INGRESO: TIntegerField
      FieldName = 'IDTIPO_INGRESO'
      Origin = 'ADB.VW_INGRESOS.IDTIPO_INGRESO'
      Visible = False
    end
    object qryIngresosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      Origin = 'ADB.VW_INGRESOS.FECHA'
    end
    object qryIngresosCONCEPTO: TStringField
      DisplayLabel = 'Concepto'
      FieldName = 'CONCEPTO'
      Origin = 'ADB.VW_INGRESOS.CONCEPTO'
      Size = 60
    end
    object qryIngresosTIPO_PAGO: TStringField
      DisplayLabel = 'Tipo de pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_INGRESOS.TIPO_PAGO'
      Size = 1
    end
    object qryIngresosNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_INGRESOS.NRO_CHEQUE'
    end
    object qryIngresosNRO_RECIBO: TIntegerField
      DisplayLabel = 'N'#186' Recibo'
      FieldName = 'NRO_RECIBO'
      Origin = 'ADB.VW_INGRESOS.NRO_RECIBO'
    end
    object qryIngresosIMPORTE_MANT: TFloatField
      DisplayLabel = 'Importe Mant.'
      FieldName = 'IMPORTE_MANT'
      Origin = 'ADB.VW_INGRESOS.IMPORTE_MANT'
      currency = True
    end
    object qryIngresosIMPORTE_SERV: TFloatField
      DisplayLabel = 'Importe Serv.'
      FieldName = 'IMPORTE_SERV'
      Origin = 'ADB.VW_INGRESOS.IMPORTE_SERV'
      currency = True
    end
    object qryIngresosSR: TStringField
      DisplayLabel = 'Recibido de:'
      FieldName = 'SR'
      Origin = 'ADB.VW_INGRESOS.SR'
      Size = 45
    end
  end
  object OcupCiv: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_CIVIL'
    Left = 228
    Top = 300
    object OcupCivIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object OcupCivLEGAJO: TStringField
      FieldName = 'LEGAJO'
      Size = 10
    end
  end
  object OcupMil: TTable
    DatabaseName = 'DB'
    TableName = 'OCUPANTE_MILITAR'
    Left = 278
    Top = 298
    object OcupMilIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object OcupMilMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object MNO_: TTable
    DatabaseName = 'ADB'
    TableName = 'MILITAR_NO_OCUPANTE'
    Left = 320
    Top = 297
    object MNO_IDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Required = True
    end
    object MNO_MATRICULA: TStringField
      FieldName = 'MATRICULA'
      Required = True
      Size = 8
    end
  end
  object qryCobrosPart: TQuery
    OnCalcFields = qryCobrosPartCalcFields
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_COBROS_PART')
    Left = 90
    Top = 210
    object qryCobrosPartIDPERSONA: TIntegerField
      FieldName = 'IDPERSONA'
      Origin = 'ADB.VW_COBROS_PART.IDPERSONA'
      Visible = False
    end
    object qryCobrosPartOCUPANTE: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'OCUPANTE'
      Origin = 'ADB.VW_COBROS_PART.OCUPANTE'
      Size = 41
    end
    object qryCobrosPartDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Origin = 'ADB.VW_COBROS_PART.DOCUMENTO'
      Size = 17
    end
    object qryCobrosPartLOCACION: TStringField
      DisplayLabel = 'Depto.'
      FieldName = 'LOCACION'
      Origin = 'ADB.VW_COBROS_PART.IDPERSONA'
      Size = 111
    end
    object qryCobrosPartMES: TStringField
      DisplayLabel = 'Mes'
      FieldName = 'MES'
      Origin = 'ADB.VW_COBROS_PART.MES'
      Size = 10
    end
    object qryCobrosPartANIO: TIntegerField
      DisplayLabel = 'A'#241'o'
      FieldName = 'ANIO'
      Origin = 'ADB.VW_COBROS_PART.ANIO'
    end
    object qryCobrosPartEXPENSAS: TFloatField
      DisplayLabel = 'Expensas'
      FieldName = 'EXPENSAS'
      Origin = 'ADB.VW_COBROS_PART.EXPENSAS'
      currency = True
    end
    object qryCobrosPartRAE: TFloatField
      FieldName = 'RAE'
      Origin = 'ADB.VW_COBROS_PART.RAE'
      currency = True
    end
    object qryCobrosPartALQUILER: TFloatField
      DisplayLabel = 'Alquiler'
      FieldName = 'ALQUILER'
      Origin = 'ADB.VW_COBROS_PART.ALQUILER'
      currency = True
    end
    object qryCobrosPartTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object qryCobrosPartDEPTO: TStringField
      FieldName = 'DEPTO'
      Origin = 'ADB.VW_COBROS_PART.DEPTO'
      Visible = False
      Size = 111
    end
    object qryCobrosPartEDIFICIO: TStringField
      FieldName = 'EDIFICIO'
      Origin = 'ADB.VW_COBROS_PART.EDIFICIO'
      Visible = False
      Size = 50
    end
  end
  object qryPagosEfectuados: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_PAGOS_EFECTUADOS')
    Left = 186
    Top = 210
    object qryPagosEfectuadosIDPAGO: TIntegerField
      FieldName = 'IDPAGO'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.IDPAGO'
      Visible = False
    end
    object qryPagosEfectuadosFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha de pago'
      FieldName = 'FECHA_PAGO'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.FECHA_PAGO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryPagosEfectuadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.IMPORTE'
      currency = True
    end
    object qryPagosEfectuadosTIPO_PAGO: TStringField
      DisplayLabel = 'Tipo de pago'
      FieldName = 'TIPO_PAGO'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.TIPO_PAGO'
      Size = 1
    end
    object qryPagosEfectuadosNRO_CHEQUE: TStringField
      DisplayLabel = 'N'#186' de cheque'
      FieldName = 'NRO_CHEQUE'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.NRO_CHEQUE'
    end
    object qryPagosEfectuadosCOBRADO: TStringField
      DisplayLabel = 'Cobrado'
      FieldName = 'COBRADO'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.COBRADO'
      Size = 2
    end
    object qryPagosEfectuadosPROVEEDOR: TStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.PROVEEDOR'
      Size = 45
    end
    object qryPagosEfectuadosCOBRADOR: TStringField
      DisplayLabel = 'Cobrador'
      FieldName = 'COBRADOR'
      Origin = 'ADB.VW_PAGOS_EFECTUADOS.COBRADOR'
      Size = 41
    end
  end
  object qryDescuentos: TQuery
    DatabaseName = 'ADB'
    SQL.Strings = (
      'SELECT * FROM VW_DESCUENTO')
    Left = 234
    Top = 108
    object qryDescuentosIDDESCUENTO: TIntegerField
      FieldName = 'IDDESCUENTO'
      Origin = 'ADB.VW_DESCUENTO.IDDESCUENTO'
      Visible = False
    end
    object qryDescuentosAPENOM: TStringField
      DisplayLabel = 'Ocupante'
      FieldName = 'APENOM'
      Origin = 'ADB.VW_DESCUENTO.APENOM'
      Size = 41
    end
    object qryDescuentosDESCRIPCION: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Origin = 'ADB.VW_DESCUENTO.DESCRIPCION'
      Size = 25
    end
    object qryDescuentosMES: TStringField
      DisplayLabel = 'Mes'
      FieldName = 'MES'
      Origin = 'ADB.VW_DESCUENTO.MES'
      Size = 10
    end
    object qryDescuentosANIO: TIntegerField
      DisplayLabel = 'A'#241'o'
      FieldName = 'ANIO'
      Origin = 'ADB.VW_DESCUENTO.ANIO'
    end
    object qryDescuentosMONTO: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'MONTO'
      Origin = 'ADB.VW_DESCUENTO.MONTO'
      currency = True
    end
    object qryDescuentosNRO_FACT: TIntegerField
      DisplayLabel = 'N'#186' Factura'
      FieldName = 'NRO_FACT'
      Origin = 'ADB.VW_DESCUENTO.NRO_FACT'
    end
  end
end
