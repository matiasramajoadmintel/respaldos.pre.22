�
 TFRMSERVEDIF 0y  TPF0TfrmServEdiffrmServEdifLeftOTop� Width�Height|BorderIconsbiSystemMenu
biMinimize Caption	ServiciosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)Width�HeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth~Height� AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickgrdDatosTitleClickColumnsExpanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style WidthUVisible	 Expanded	FieldNameEdificioTitle.AlignmenttaCenterTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width� Visible	 Expanded	FieldNameDESCRIPTitle.AlignmenttaCenterTitle.CaptionServicioTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width� Visible	 Expanded	FieldNameRAZON_SOCIALTitle.AlignmenttaCenterTitle.Caption	ProveedorTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width� Visible	 Expanded	FieldNameCOSTOTitle.AlignmenttaCenterTitle.CaptionCostoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Width6Visible	 Expanded	FieldName	TIPO_PAGOTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName
NRO_CHEQUETitle.AlignmenttaCenterTitle.Caption
   Nº chequeTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopCWidth�HeightAlignalBottomTabOrder TPanelPanel4Left�TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCancelarClickKindbkClose    TPanel
pnlBotonesLeft Top*Width�HeightAlignalBottomTabOrder TSpeedButton
btnAgregarLeftTopWidth<HeightCaption&AgregarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnNuevoClick  TSpeedButtonbtnEliminarLeft@TopWidth<HeightCaption	&EliminarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnEliminarClick  TSpeedButtonbtnModificarLeft|TopWidth<HeightCaption
&ModificarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnModificarClick   TPanelPanel5Left Top Width�Height)AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabelLabel1Left
TopWidth8HeightCaption   Descripción  TEditedtDescLeft
TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnEnterEntrada_A_CampoOnExitSalida_de_Campo	OnKeyDownTeclitas
OnKeyPress
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TQueryQuery1AfterScrollQuery1AfterScrollDatabaseNameADBSQL.StringsSELECT * FROM VW_SERV_EDIFORDER BY DESCRIP LeftNTop` TDateTimeFieldQuery1FECHA	FieldNameFECHAOriginADB.VW_SERV_EDIF.FECHADisplayFormat
DD/MM/YYYY  TIntegerFieldQuery1IDEDIFICIO	FieldName
IDEDIFICIOOriginADB.VW_SERV_EDIF.IDEDIFICIO  TFloatFieldQuery1COSTO	FieldNameCOSTOOriginADB.VW_SERV_EDIF.COSTOcurrency	  TStringFieldQuery1DESCRIP	FieldNameDESCRIPOriginADB.VW_SERV_EDIF.DESCRIPSize<  TIntegerFieldQuery1IDSERVICIO	FieldName
IDSERVICIOOriginADB.VW_SERV_EDIF.IDSERVICIO  TStringFieldQuery1TIPO_PAGODisplayLabelTipo	FieldName	TIPO_PAGOOriginADB.VW_SERV_EDIF.TIPO_PAGOSize  TStringFieldQuery1NRO_CHEQUE	FieldName
NRO_CHEQUEOriginADB.VW_SERV_EDIF.NRO_CHEQUE  TIntegerFieldQuery1IDPROVEEDOR	FieldNameIDPROVEEDOROriginADB.VW_SERV_EDIF.IDPROVEEDOR  TStringFieldQuery1RAZON_SOCIAL	FieldNameRAZON_SOCIALOriginADB.VW_SERV_EDIF.RAZON_SOCIALSize-  TStringFieldQuery1Edificio	FieldKindfkLookup	FieldNameEdificioLookupDataSetdmAlcaldia.qryEdificiosLookupKeyFields
IdEdificioLookupResultFieldDescrip	KeyFields
IDEDIFICIOSize<Lookup	  TStringFieldQuery1PAGADO	FieldNamePAGADOOriginADB.VW_SERV_EDIF.PAGADOSize  TIntegerFieldQuery1IDSERV_EDIF	FieldNameIDSERV_EDIFOriginADB.VW_SERV_EDIF.IDSERV_EDIF  TStringFieldQuery1VACIOS	FieldNameVACIOSOriginADB.VW_SERV_EDIF.VACIOSSize   TDataSourceDataSource1DataSetQuery1LeftnTop`  TTableSERVEDIFOnNewRecordSERVEDIFNewRecordDatabaseNameADB	TableName	SERV_EDIFLeftLTop�  TIntegerFieldSERVEDIFIDSERV_EDIF	FieldNameIDSERV_EDIFRequired	  TIntegerFieldSERVEDIFIDSERVICIO	FieldName
IDSERVICIORequired	  TIntegerFieldSERVEDIFIDEDIFICIO	FieldName
IDEDIFICIORequired	  TDateTimeFieldSERVEDIFFECHA_PAGO	FieldName
FECHA_PAGORequired	  TFloatFieldSERVEDIFCOSTO	FieldNameCOSTORequired	  TIntegerFieldSERVEDIFIDPROVEEDOR	FieldNameIDPROVEEDOR  TStringFieldSERVEDIFVACIOS	FieldNameVACIOSSize    