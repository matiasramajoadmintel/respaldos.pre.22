�
 TFRMINGRESO 0&  TPF0TfrmIngreso
frmIngresoLeft\Top� WidthKHeight|BorderIconsbiSystemMenu
biMinimize CaptionIngresos de dineroColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)WidthCHeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth9Height� AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickgrdDatosTitleClickColumnsExpanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameCONCEPTOTitle.AlignmenttaCenterTitle.CaptionConceptoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameSRTitle.AlignmenttaCenterTitle.CaptionRecibido deTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName
NRO_RECIBOTitle.AlignmenttaCenterTitle.Caption
   Nº ReciboTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameIMPORTE_MANTTitle.AlignmenttaCenterTitle.Caption
Imp. mant.Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameIMPORTE_SERVTitle.AlignmenttaCenterTitle.Caption
Imp. serv.Title.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName	TIPO_PAGOTitle.AlignmenttaCenterTitle.Caption	Tipo pagoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName
NRO_CHEQUETitle.AlignmenttaCenterTitle.Caption
   Nº ChequeTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopCWidthCHeightAlignalBottomTabOrder TPanelPanel4Left�TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCancelarClickKindbkClose    TPanelPanel3Left Top*WidthCHeightAlignalBottomTabOrder TSpeedButton
btnAgregarLeftTopWidth<HeightCaptionAgregarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnNuevoClick  TSpeedButtonbtnEliminarLeft@TopWidth<HeightCaptionEliminarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnEliminarClick  TSpeedButtonbtnModificarLeft|TopWidth<HeightCaption	ModificarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnModificarClick   TPanelPanel5Left Top WidthCHeight)AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabelLabel1Left
TopWidth8HeightCaption   Descripción  TEditedtDescLeft
TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnEnterEntrada_A_CampoOnExitSalida_de_Campo	OnKeyDownTeclitas
OnKeyPress
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TDataSourceDataSource1DataSetQuery1LeftnTop`  TTableINGOnNewRecordINGNewRecordDatabaseNameADB	TableNameINGRESOLeftNTop�  TIntegerFieldINGIDINGRESO	FieldName	IDINGRESORequired	  TIntegerFieldINGIDTIPO_INGRESO	FieldNameIDTIPO_INGRESORequired	  TDateTimeFieldINGFECHA_PAGO	FieldName
FECHA_PAGORequired	  TStringFieldINGTIPO_PAGO	FieldName	TIPO_PAGOSize  TStringFieldINGNRO_CHEQUE	FieldName
NRO_CHEQUE  TFloatFieldINGIMPORTE_MANT	FieldNameIMPORTE_MANT  TFloatFieldINGIMPORTE_SERV	FieldNameIMPORTE_SERV  TStringFieldINGSR	FieldNameSRSize-  TIntegerFieldINGNRO_RECIBO	FieldName
NRO_RECIBORequired	   TQueryQuery1DatabaseNameADBSQL.StringsSELECT * FROM VW_INGRESOS LeftLTop` TIntegerFieldQuery1IDINGRESO	FieldName	IDINGRESOOriginADB.VW_INGRESOS.FECHA_PAGO  TStringFieldQuery1CONCEPTO	FieldNameCONCEPTOOriginADB.VW_INGRESOS.IMPORTE_MANTSize<  TDateTimeFieldQuery1FECHA	FieldNameFECHAOriginADB.VW_INGRESOS.IMPORTE_SERV  TStringFieldQuery1TIPO_PAGO	FieldName	TIPO_PAGOOriginADB.VW_INGRESOS.TIPO_INGRESOSize  TStringFieldQuery1NRO_CHEQUE	FieldName
NRO_CHEQUEOriginADB.VW_INGRESOS.TIPO_PAGO  TFloatFieldQuery1IMPORTE_MANT	FieldNameIMPORTE_MANTOriginADB.VW_INGRESOS.IDTIPO_INGRESODisplayFormat#,0.00  TStringFieldQuery1SR	FieldNameSROriginADB.VW_INGRESOS.NRO_RECIBOSize-  TFloatFieldQuery1IMPORTE_SERV	FieldNameIMPORTE_SERVOriginADB.VW_INGRESOS.NRO_RECIBODisplayFormat#,0.00  TIntegerFieldQuery1IDTIPO_INGRESO	FieldNameIDTIPO_INGRESOOriginADB.VW_INGRESOS.IMPORTE_MANT  TIntegerFieldQuery1NRO_RECIBO	FieldName
NRO_RECIBOOriginADB.VW_INGRESOS.NRO_RECIBO    