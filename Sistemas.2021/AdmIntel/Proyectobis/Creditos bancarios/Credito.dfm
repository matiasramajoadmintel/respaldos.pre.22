�
 TFRMCREDITO 0�  TPF0TfrmCredito
frmCreditoLeftpTop� WidthHeight|BorderIconsbiSystemMenu
biMinimize Caption   Créditos bancariosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)WidthHeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidthHeight� AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickgrdDatosDblClickColumnsExpanded	FieldName
FECHA_PAGOTitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameDESCRIPTitle.AlignmenttaCenterTitle.Caption   Concepto del créditoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style WidthUVisible	 Expanded	FieldNameCOSTOTitle.AlignmenttaCenterTitle.CaptionImporteTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopCWidthHeightAlignalBottomTabOrder TPanelPanel4LeftQTopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCancelarClickKindbkClose    TPanelPanel3Left Top*WidthHeightAlignalBottomTabOrder TSpeedButton
btnAgregarLeftTopWidth<HeightCaptionAgregarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnNuevoClick  TSpeedButtonbtnEliminarLeft@TopWidth<HeightCaptionEliminarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnEliminarClick  TSpeedButtonbtnModificarLeft|TopWidth<HeightCaption	ModificarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnModificarClick   TPanelPanel5Left Top WidthHeight)AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabelLabel1Left
TopWidth8HeightCaption   Descripción  TEditedtDescLeft
TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnEnterEntrada_A_CampoOnExitSalida_de_Campo	OnKeyDownTeclitas
OnKeyPress
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TDataSourceDataSource1DataSetQuery1LeftpTop`  TTableCBDatabaseNameADB	TableNameCREDITO_BANCARIOLeftRTop�  TDateTimeFieldCBFECHA_PAGO	FieldName
FECHA_PAGORequired	  TFloatFieldCBCOSTO	FieldNameCOSTORequired	  TIntegerFieldCBIDCREDITO_BANCARIO	FieldNameIDCREDITO_BANCARIO  TStringField	CBDESCRIP	FieldNameDESCRIPRequired	Size2   TQueryQuery1DatabaseNameADBSQL.Strings#SELECT * FROM VW_CREDITOS_BANCARIOSORDER BY FECHA_PAGO LeftPTop^ TDateTimeFieldQuery1FECHA_PAGO	FieldName
FECHA_PAGOOrigin$ADB.VW_CREDITOS_BANCARIOS.FECHA_PAGO  TFloatFieldQuery1COSTO	FieldNameCOSTOOriginADB.VW_CREDITOS_BANCARIOS.COSTOcurrency	  TIntegerFieldQuery1IDCREDITO_BANCARIO	FieldNameIDCREDITO_BANCARIOOrigin$ADB.VW_CREDITOS_BANCARIOS.FECHA_PAGO  TStringFieldQuery1DESCRIP	FieldNameDESCRIPOrigin!ADB.VW_CREDITOS_BANCARIOS.DESCRIPSize2    