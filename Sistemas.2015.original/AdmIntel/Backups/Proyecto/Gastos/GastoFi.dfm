�
 TFRMGASTOFI 0d  TPF0TfrmGastoFi
frmGastoFiLeft� Top� WidthKHeight|BorderIconsbiSystemMenu
biMinimize CaptionGastos financierosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)WidthCHeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth9Height� AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickgrdDatosTitleClickColumnsExpanded	FieldNameNRO_HOJATitle.AlignmenttaCenterTitle.Caption   Nº HojaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName
FECHA_PAGOTitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameDESCRIPTitle.AlignmenttaCenterTitle.Caption   Concepto del débitoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style WidthUVisible	 Expanded	FieldNameCOSTOTitle.AlignmenttaCenterTitle.CaptionImporteTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopCWidthCHeightAlignalBottomTabOrder TPanelPanel4Left�TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCancelarClickKindbkClose    TPanel
pnlBotonesLeft Top*WidthCHeightAlignalBottomTabOrder TSpeedButton
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
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TQueryQuery1DatabaseNameADBSQL.StringsSELECT * FROM VW_GASTO_FIORDER BY DESCRIP LeftNTop` TDateTimeFieldQuery1FECHA_PAGO	FieldName
FECHA_PAGOOriginADB.VW_GASTO_FI.FECHA_PAGODisplayFormat
DD/MM/YYYY  TFloatFieldQuery1COSTO	FieldNameCOSTOOriginADB.VW_GASTO_FI.COSTOcurrency	  TStringFieldQuery1DESCRIP	FieldNameDESCRIPOriginADB.VW_GASTO_FI.DESCRIPSize<  TIntegerFieldQuery1IDTIPO_GASTO_FI	FieldNameIDTIPO_GASTO_FIOriginADB.VW_GASTO_FI.IDTIPO_GASTO_FI  TIntegerFieldQuery1NRO_HOJA	FieldNameNRO_HOJAOriginADB.VW_GASTO_FI.NRO_HOJA  TIntegerFieldQuery1IDGASTO_FI	FieldName
IDGASTO_FIOriginADB.VW_GASTO_FI.IDGASTO_FI   TDataSourceDataSource1DataSetQuery1LeftnTop`  TTableGASTOOnNewRecordGASTONewRecordDatabaseNameADB	TableNameGASTO_FILeftLTop�  TIntegerFieldGASTOIDTIPO_GASTO_FI	FieldNameIDTIPO_GASTO_FIRequired	  TDateTimeFieldGASTOFECHA_PAGO	FieldName
FECHA_PAGORequired	  TFloatField
GASTOCOSTO	FieldNameCOSTORequired	  TIntegerFieldGASTONRO_HOJA	FieldNameNRO_HOJA  TIntegerFieldGASTOIDGASTO_FI	FieldName
IDGASTO_FIRequired	    