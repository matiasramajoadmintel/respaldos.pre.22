�
 TFRMELECPERSONAL 0�  TPF0TfrmElecPersonalfrmElecPersonalLeft� Top� WidthYHeightuBorderIconsbiSystemMenu
biMinimize CaptionPersonalColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefault
OnActivate
FormCreateOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top-WidthQHeight� AlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder  TDBGridgrdDatosLeftTopWidthGHeight� AlignalClientBorderStylebsNoneColorclCream
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickgrdDatosDblClickColumnsExpanded	FieldNameDescripTitle.AlignmenttaCenterTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left Top<WidthQHeightAlignalBottomTabOrder TPanelPanel5Left� TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder KindbkClose  TBitBtn	btnElegirLeft TopWidthKHeightCaptionElegirFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ModalResult
ParentFontTabOrder
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs    TPanelPanel3Left Top WidthQHeight-AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabelLabel1Left
TopWidthQHeightCaptionNombre a buscar  TEditedtDescLeft
TopWidthHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnEnterEntrada_A_CampoOnExitSalida_de_Campo	OnKeyDownTeclitas
OnKeyPress
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeftTopWidthKHeightCaptionBuscarTabOrderOnClickbtnBuscarClick   TPanelPanel4Left Top#WidthQHeightAlignalBottomFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TSpeedButton
btnAgregarLeftTopWidth<HeightCaptionAgregarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnAgregarClick  TSpeedButtonbtnEliminarLeft@TopWidth<HeightCaptionEliminarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnEliminarClick  TSpeedButtonbtnModificarLeft|TopWidth<HeightCaption	ModificarFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnModificarClick   TQueryqryPersOnCalcFieldsqryPersCalcFieldsDatabaseNameADBSQL.StringsSELECT * FROM Personalorder by apellido, nombre LeftJTop�  TIntegerFieldqryPersIDPERSONAL	FieldName
IDPERSONALOriginADB.PERSONAL.IDPERSONAL  TStringFieldqryPersNOMBRE	FieldNameNOMBREOriginADB.PERSONAL.NOMBRESize  TStringFieldqryPersAPELLIDO	FieldNameAPELLIDOOriginADB.PERSONAL.APELLIDOSize  TStringFieldqryPersMATRICULA	FieldName	MATRICULAOriginADB.PERSONAL.MATRICULASize  TIntegerFieldqryPersIDGRADO	FieldNameIDGRADOOriginADB.PERSONAL.IDGRADO  TStringFieldqryPersDescrip	FieldKindfkCalculated	FieldNameDescripSize(
Calculated	   TDataSourceDataSource1DataSetqryPersLeftjTop�    