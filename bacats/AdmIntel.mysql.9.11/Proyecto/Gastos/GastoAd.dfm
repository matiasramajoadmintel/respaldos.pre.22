�
 TFRMGASTOAD 0�  TPF0TfrmGastoAd
frmGastoAdLeft� Top� WidthKHeight|BorderIconsbiSystemMenu
biMinimize CaptionGastos administrativosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)WidthCHeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth9Height� AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickgrdDatosTitleClickColumnsExpanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameRAZON_SOCIALTitle.AlignmenttaCenterTitle.Caption	ProveedorTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width� Visible	 Expanded	FieldNameDESCRIPTitle.AlignmenttaCenterTitle.CaptionTipo de gastoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width|Visible	 Expanded	FieldNameCOSTOTitle.AlignmenttaCenterTitle.CaptionCostoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName	TIPO_PAGOTitle.CaptionTipoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName
NRO_CHEQUETitle.AlignmenttaCenterTitle.Caption
   Nº chequeTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopCWidthCHeightAlignalBottomTabOrder TPanelPanel4Left�TopWidth� HeightAlignalRight
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
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TQueryQuery1AfterScrollQuery1AfterScrollDatabaseNameADBSQL.StringsSELECT * FROM VW_GASTO_ADORDER BY DESCRIP LeftRTop` TDateTimeFieldQuery1FECHA	FieldNameFECHAOriginADB.VW_GASTO_AD.FECHADisplayFormat
DD/MM/YYYY  TFloatFieldQuery1COSTO	FieldNameCOSTOOriginADB.VW_GASTO_AD.COSTOcurrency	  TStringFieldQuery1DESCRIP	FieldNameDESCRIPOriginADB.VW_GASTO_AD.DESCRIPSize<  TIntegerFieldQuery1IDTIPO_GASTO_AD	FieldNameIDTIPO_GASTO_ADOriginADB.VW_GASTO_AD.IDTIPO_GASTO_AD  TStringFieldQuery1TIPO_PAGO	FieldName	TIPO_PAGOOriginADB.VW_GASTO_AD.TIPO_PAGOSize  TStringFieldQuery1NRO_CHEQUE	FieldName
NRO_CHEQUEOriginADB.VW_GASTO_AD.NRO_CHEQUE  TIntegerFieldQuery1IDPROVEEDOR	FieldNameIDPROVEEDOROriginADB.VW_GASTO_AD.IDPROVEEDOR  TStringFieldQuery1RAZON_SOCIAL	FieldNameRAZON_SOCIALOriginADB.VW_GASTO_AD.RAZON_SOCIALSize-  TStringFieldQuery1PAGADO	FieldNamePAGADOOriginADB.VW_GASTO_AD.PAGADOSize  TIntegerFieldQuery1IDGASTO_AD	FieldName
IDGASTO_ADOriginADB.VW_GASTO_AD.IDGASTO_AD   TDataSourceDataSource1DataSetQuery1LeftnTop`  TTableGASTOOnNewRecordGASTONewRecordDatabaseNameADB	TableNameGASTO_ADLeftNTop�  TIntegerFieldGASTOIDGASTO_AD	FieldName
IDGASTO_AD  TDateTimeFieldGASTOFECHA_PAGO	FieldName
FECHA_PAGORequired	  TFloatField
GASTOCOSTO	FieldNameCOSTORequired	  TIntegerFieldGASTOIDTIPO_GASTO_AD	FieldNameIDTIPO_GASTO_ADRequired	  TIntegerFieldGASTOIDPROVEEDOR	FieldNameIDPROVEEDOR  TStringFieldGASTOPAGADO	FieldNamePAGADOSize    