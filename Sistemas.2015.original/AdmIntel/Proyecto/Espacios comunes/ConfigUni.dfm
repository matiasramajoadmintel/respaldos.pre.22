ÿ
 TFRMCONFIGUNI 0   TPF0TfrmConfigUnifrmConfigUniLeft¨ Top BorderIconsbiSystemMenu BorderStylebsSingleCaption    ConfiguraciÃ³n de tipo de unidadClientHeightClientWidthIColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightñ	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterShowHint	OnClose	FormClosePixelsPerInch`
TextHeight TPanelPanel1Left Topò WidthIHeightAlignalBottomTabOrder TBitBtn	btnCerrarLeftüTopWidthKHeightCaption&CerrarFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder OnClickbtnCerrarClickKindbkClose   TPanelPanelTituloLeft Top WidthIHeightAlignalTopFont.CharsetDEFAULT_CHARSET
Font.ColorclHighlightFont.Heightó	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder   TPanelPanel2Left@Top)Width	Height¬ AlignalRight
BevelInner	bvLoweredBorderWidthTabOrder TDBGridDBGrid2LeftTopWidthÿ Height¢ AlignalClientBorderStylebsNone
DataSource
dsAtribNomFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold Options	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontReadOnly	TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameDescripTitle.AlignmenttaCenterTitle.CaptionAtributoWidth½ Visible	 	AlignmenttaCenterExpanded	FieldName	TipoAtribTitle.AlignmenttaCenterTitle.CaptionTipoWidth#Visible	     TPanelPanel3Left Top)Width	Height¬ AlignalLeft
BevelInner	bvLoweredBorderWidthTabOrder TDBGridDBGrid1LeftTopWidthÿ Height¢ AlignalClientBorderStylebsNone
DataSourcedsAtribFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameDescripTitle.AlignmenttaCenterTitle.CaptionAtributoVisible	 	AlignmenttaCenterExpanded	FieldName	TipoAtribTitle.AlignmenttaCenterTitle.CaptionTipoWidth'Visible	     TPanelPanel4Left	Top)Width7Height¬ AlignalClientTabOrder TBitBtnAgregarButtonLeftTop2Width(HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickAgregarButtonClick
Glyph.Data
z  v  BMv      6   (               @  Ä  Ä                                                                                                                   ÿ                         ÿ  ÿ  ÿ                                   ÿ  ÿ  ÿ  ÿ  ÿ               ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ                               ÿ  ÿ  ÿ  ÿ  ÿ                     ÿ  ÿ  ÿ                       ÿ                                                                                            TBitBtnQuitarButtonLeftTop`Width(HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderOnClickQuitarButtonClick
Glyph.Data
z  v  BMv      6   (               @  Ä  Ä                                                                                                    ÿ                       ÿ  ÿ  ÿ                     ÿ  ÿ  ÿ  ÿ  ÿ                               ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ  ÿ              ÿ  ÿ  ÿ  ÿ  ÿ                                   ÿ  ÿ  ÿ                         ÿ                                                                                                            TPanelPanel5Left TopWidthIHeightAlignalTopTabOrder TLabel	lblArribaLeftTopWidthvHeightCaptionAtributos disponiblesFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel1LeftFTopWidthpHeightCaptionAtributos asignadosFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont   TPanelPanel6Left TopÕ WidthIHeightAlignalBottomFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFontTabOrder TBitBtnbtnNuevoAtribLeftTopWidthiHeightCaptionNuevo atributoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnClickbtnNuevoAtribClick   TDataSourcedsAtribDataSetAtribLefttTopg  TTableAtribDatabaseNameMDBIndexFieldNamesDescrip	TableNamedbo.AtributoLeftXTope TFloatFieldAtribIdAtributo	FieldName
IdAtributoRequired	  TStringFieldAtribDescrip	FieldNameDescripReadOnly	Required	Size  TStringFieldAtribTipoAtribDefaultExpressionN	FieldName	TipoAtribRequired		FixedChar	Size   TDataSource
dsAtribNomDataSetqryAtribNomLeftTop   TQuery	qryUpdateDatabaseNameMDBLeft Topi  TQuery
qryCantNumDatabaseNameMDBSQL.Strings*select count(*) as Valor from parametronumDwhere (idnomenclatura=:N) and (idatributo=:A) and not(valor is null) Left¼ Top 	ParamDataDataTypeftFloatNameN	ParamType	ptUnknown DataTypeftFloatNameA	ParamType	ptUnknown   TIntegerFieldqryCantNumValor	FieldNameValor   TQueryqryCantAlfaDatabaseNameMDBSQL.Strings+select count(*) as Valor from parametroalfaDwhere (idnomenclatura=:N) and (idatributo=:A) and not(valor is null) Left Top 	ParamDataDataTypeftFloatNameN	ParamType	ptUnknown DataTypeftFloatNameA	ParamType	ptUnknown   TIntegerFieldqryCantAlfaValor	FieldNameValor   TQueryqryAtribNomDatabaseNameMDBSQL.StringsSELECT * FROM vwAtribNomWHERE IdNomenclatura = :NORDER BY Descrip Left<Top	ParamDataDataTypeftFloatNameN	ParamType	ptUnknown   TFloatFieldqryAtribNomIdNomenclatura	FieldNameIdNomenclaturaOrigin#SDB."dbo.vwAtribNom".IdNomenclatura  TFloatFieldqryAtribNomIdAtributo	FieldName
IdAtributoOriginSDB."dbo.vwAtribNom".IdAtributo  TStringFieldqryAtribNomDescrip	FieldNameDescripOriginSDB."dbo.vwAtribNom".DescripSize  TStringFieldqryAtribNomTipoAtrib	FieldName	TipoAtribOriginSDB."dbo.vwAtribNom".TipoAtrib	FixedChar	Size   TTableAtribNomDatabaseNameMDB	TableNamedbo.AtribNomLeftTop_ TFloatFieldAtribNomIdAtributo	FieldName
IdAtributoRequired	  TFloatFieldAtribNomIdNomenclatura	FieldNameIdNomenclaturaRequired	  TStringFieldAtribNomDescAtrib	FieldKindfkLookup	FieldName	DescAtribLookupDataSetAtribLookupKeyFields
IdAtributoLookupResultFieldDescrip	KeyFields
IdAtributoSizeLookup	  TStringFieldAtribNomTipo	FieldKindfkLookup	FieldNameTipoLookupDataSetAtribLookupKeyFields
IdAtributoLookupResultField	TipoAtrib	KeyFields
IdAtributoSizeLookup	    