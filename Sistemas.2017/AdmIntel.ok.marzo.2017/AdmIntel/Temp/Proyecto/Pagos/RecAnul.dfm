�
 TFRMRECANUL 0�  TPF0TfrmRecAnul
frmRecAnulLeft� ToplWidth� HeightvBorderIconsbiSystemMenu
biMinimize CaptionRecibos anuladosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top Width� Height$AlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth� HeightAlignalClientBorderStylebsNoneColorclCream
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickgrdDatosDblClickColumnsExpanded	FieldName
NRO_RECIBOFont.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold Title.AlignmenttaCenterTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 	AlignmenttaRightJustifyExpanded	FieldNameFECHAFont.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold Title.AlignmenttaCenterTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left Top=Width� HeightAlignalBottomTabOrder TPanelPanel4Left)TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCancelarClickKindbkClose  TBitBtn	btnElegirLeft TopWidthKHeightCaptionElegirFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ModalResult
ParentFontTabOrder
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs    TPanelPanel3Left Top$Width� HeightAlignalBottomTabOrder TSpeedButton
btnAgregarLeftTopWidth<HeightCaptionAgregarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnNuevoClick  TSpeedButtonbtnEliminarLeft@TopWidth<HeightCaptionEliminarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnEliminarClick   TQueryQuery1DatabaseNameADBSQL.StringsSELECT * FROM RECIBO_ANULADO LeftNTop` TIntegerFieldQuery1NRO_RECIBODisplayLabel
   Nº Recibo	FieldName
NRO_RECIBOOriginADB.RECIBO_ANULADO.NRO_RECIBO  TDateTimeFieldQuery1FECHADisplayLabel   Fecha Anulación	FieldNameFECHAOriginADB.RECIBO_ANULADO.FECHADisplayFormat
DD/MM/YYYY   TDataSourceDataSource1DataSetQuery1LeftnTop`  TTableRAOnNewRecordRANewRecordDatabaseNameADB	TableNameRECIBO_ANULADOLeftNTop�  TIntegerFieldRAIDRECIBO_ANULADO	FieldNameIDRECIBO_ANULADORequired	  TIntegerFieldRANRO_RECIBO	FieldName
NRO_RECIBORequired	  TDateTimeFieldRAFECHA	FieldNameFECHARequired	    