�
 TFRMCHEQUES 0�  TPF0TfrmCheques
frmChequesLeft�Top� Width�Height�BorderIconsbiSystemMenu
biMinimize CaptionCheques emitidosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	Position	poDefaultOnCreate
FormCreate	OnDestroyFormDestroyOnDeactivateFormDestroyPixelsPerInch`
TextHeight TPanelPanel1Left Top)Width�HeightAlignalClient
BevelInner	bvLoweredBorderWidthCaptionPanel1TabOrder  TDBGridgrdDatosLeftTopWidth�Height�AlignalClientBorderStylebsNoneColorclBlack
DataSourceDataSource1Font.CharsetDEFAULT_CHARSET
Font.ColorclLimeFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgColumnResize
dgColLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickgrdDatosDblClickOnTitleClickgrdDatosTitleClickColumnsExpanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName	PROVEEDORTitle.AlignmenttaCenterTitle.CaptionA la orden deTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameIMPORTETitle.AlignmenttaCenterTitle.CaptionImporteTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldName	NROCHEQUETitle.AlignmenttaCenterTitle.Caption
   Nº ChequeTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameCOBRADOTitle.AlignmenttaCenterTitle.CaptionCobradoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclWindowTextTitle.Font.Height�Title.Font.NameMS Sans SerifTitle.Font.Style Visible	     TPanelPanel2Left TopJWidth�HeightAlignalBottomTabOrder TPanelPanel4Left�TopWidth� HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbtnCancelarLeftlTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style ModalResult
ParentFontTabOrder 
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  	NumGlyphs    TPanelPanel3Left Top1Width�HeightAlignalBottomTabOrder TSpeedButton
btnDetalleLeftTopWidthFHeightCaption&DetalleFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnDetalleClick  TSpeedButtonbtnDevolucionLeftJTopWidthFHeightCaption   De&voluciónFlat	Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontOnClickbtnDevolucionClick   TPanelPanel5Left Top Width�Height)AlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TLabelLabel1Left
TopWidth8HeightCaption   Descripción  TEditedtDescLeft
TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnEnterEntrada_A_CampoOnExitSalida_de_Campo	OnKeyDownTeclitas
OnKeyPress
PressEnterOnKeyUpTeclitas  TBitBtn	btnBuscarLeft� TopWidth;HeightCaption&BuscarTabOrderOnClickbtnBuscarClick   TDataSourceDataSource1DataSet
qryChequesLeft� Topr  TQuery
qryChequesAutoCalcFieldsDatabaseNameADBSQL.StringsSELECT DISTINCT *FROM VW_CHEQUES_EMITIDOS Left� Topr TDateTimeFieldqryChequesFECHA	FieldNameFECHAOriginADB.VW_CHEQUES_EMITIDOS.FECHA  TStringFieldqryChequesPROVEEDOR	FieldName	PROVEEDOROrigin!ADB.VW_CHEQUES_EMITIDOS.PROVEEDORSize-  TFloatFieldqryChequesIMPORTE	FieldNameIMPORTEOriginADB.VW_CHEQUES_EMITIDOS.IMPORTEDisplayFormat#,0.00  TStringFieldqryChequesNROCHEQUE	FieldName	NROCHEQUEOrigin!ADB.VW_CHEQUES_EMITIDOS.NROCHEQUE  TStringFieldqryChequesCOBRADO	FieldNameCOBRADOOriginADB.VW_CHEQUES_EMITIDOS.COBRADOSize  TIntegerFieldqryChequesIDPAGO	FieldNameIDPAGOOriginADB.VW_CHEQUES_EMITIDOS.IDPAGO    