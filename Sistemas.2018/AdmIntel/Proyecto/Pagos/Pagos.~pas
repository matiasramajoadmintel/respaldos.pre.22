unit Pagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables, DateUtils;

type
  TfrmPagos = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel1: TPanel;
    grdPagos: TDBGrid;
    dsPagos: TDataSource;
    dsTMP: TDataSource;
    PAGO: TTable;
    PAGOIDPAGO: TIntegerField;
    PAGOFECHA_PAGO: TDateTimeField;
    PAGOIMPORTE: TFloatField;
    PAGOTIPO_PAGO: TStringField;
    PAGONRO_CHEQUE: TStringField;
    PAGOCOBRADO: TStringField;
    TMP: TTable;
    TMPTIPO_GASTO: TStringField;
    TMPIDGASTO: TIntegerField;
    TMPDESCRIP: TStringField;
    TMPIMPORTE: TFloatField;
    Splitter1: TSplitter;
    Panel4: TPanel;
    TMPIDTEMP_PAGOS: TIntegerField;
    qryTrab: TQuery;
    qryPagos: TQuery;
    qryPagosIDPROVEEDOR: TIntegerField;
    qryPagosPROVEEDOR: TStringField;
    qryPagosIMPORTE: TFloatField;
    TMPIDPROVEEDOR: TIntegerField;
    qryGasto: TQuery;
    qryGastoIDGASTO_AD: TIntegerField;
    qryGastoCOSTO: TFloatField;
    qryGastoIDPROVEEDOR: TIntegerField;
    qryGastoDESCRIP: TStringField;
    qryServ: TQuery;
    qryServIDSERV_EDIF: TIntegerField;
    qryServCOSTO: TFloatField;
    qryServIDPROVEEDOR: TIntegerField;
    qryServDESCRIP: TStringField;
    lblTotDeuda: TLabel;
    lblCheque: TLabel;
    lblEfectivo: TLabel;
    TMPTIPO_PAGO: TStringField;
    btnPago: TSpeedButton;
    TRAB: TTable;
    GASTO: TTable;
    SERV: TTable;
    TRABIDTRABAJO: TIntegerField;
    TRABPAGADO: TStringField;
    GASTOPAGADO: TStringField;
    SERVIDSERV_EDIF: TIntegerField;
    SERVPAGADO: TStringField;
    edtNroCheque: TEdit;
    GASTOIDGASTO_AD: TIntegerField;
    TRABIDPAGO: TIntegerField;
    GASTOIDPAGO: TIntegerField;
    SERVIDPAGO: TIntegerField;
    Query1: TQuery;
    TMPIDEDIF: TIntegerField;
    TMPFECHA: TDateTimeField;
    qryTrabIDTRABAJO: TIntegerField;
    qryTrabNRO_PEDIDO: TIntegerField;
    qryTrabFECHA: TDateTimeField;
    qryTrabCOSTO: TFloatField;
    qryTrabIDPROVEEDOR: TIntegerField;
    qryTrabIDEDIFICIO: TIntegerField;
    qryServIDEDIFICIO: TIntegerField;
    btnNumerar: TSpeedButton;
    TMPNRO_ORDEN: TIntegerField;
    TMPNRO_DECI: TIntegerField;
    TRABNRO_ORDEN: TIntegerField;
    TRABNRO_DECI: TIntegerField;
    GASTONRO_ORDEN: TIntegerField;
    GASTONRO_DECI: TIntegerField;
    SERVNRO_ORDEN: TIntegerField;
    SERVNRO_DECI: TIntegerField;
    btnCerrar: TBitBtn;
    dtpFechaPago: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    TMPVACIOS: TStringField;
    qryServVACIOS: TStringField;
    qryGastoFECHA: TDateTimeField;
    qryServFECHA: TDateTimeField;
    qryTrabTIPO_TRAB: TStringField;
    CHDEV: TTable;
    CHDEVNRO_CHEQUE: TStringField;
    CHDEVFECHA_DEV: TDateTimeField;
    CHDEVTIPO: TStringField;
    PAGOProveedor: TStringField;
    PAGOIdProveedor: TIntegerField;
    TMPEDIFICIO: TStringField;
    qryTrabEdificio: TStringField;
    qryServEdificio: TStringField;
    Bevel4: TBevel;
    qryTrabNRO_FACT: TIntegerField;
    TMPNRO_CHEQUE: TStringField;
    qryServNRO_FACT: TIntegerField;
    Panel3: TPanel;
    pnlLeft: TPanel;
    grdDeudas: TDBGrid;
    Panel5: TPanel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Label3: TLabel;
    PAGOIDPERSONAL: TIntegerField;
    TRABNRO_FACT: TIntegerField;
    SERVNRO_FACT: TIntegerField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TMPNewRecord(DataSet: TDataSet);
    procedure qryPagosAfterScroll(DataSet: TDataSet);
    procedure grdPagosDblClick(Sender: TObject);
    procedure PAGONewRecord(DataSet: TDataSet);
    procedure btnPagoClick(Sender: TObject);
    procedure btnNumerarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure grdPagosTitleClick(Column: TColumn);

  private
    Teclas, Modo: Byte;
    gImpCheque, gImpEfectivo, gImpRae: Currency;
    IndexFieldNames: String;
    procedure PrepararFormulario(const M: Byte);
    procedure MostrarImportesDeuda;
    procedure MostrarImportesPagos;
    procedure SetPagadoNo(const Id: Longword);
    function DatosValidos: Boolean;

  public
    procedure Mostrar(const M: Byte);
    function Eliminar(const Id: Longword): Boolean;
    function DevolverChequeExt(const IdPago: Longword): Boolean;

  end;

var
  frmPagos: TfrmPagos;

implementation

uses Comunes, Util, StoreProcs, PoolDatos, PoolQuerys, IngPersonal,
  ElecPersonal;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmPagos.Mostrar(const M: Byte);
begin
  Modo := M;
  MostrarMSJ('Preparando listado de pagos pendientes...');
  Application.ProcessMessages;
  PrepararFormulario(M);
  OcultarMSJ;

  ShowModal;

  qryPagos.Close;
  dmDatos.DECI.Close;
end;

function TfrmPagos.Eliminar(const Id: Longword): Boolean;
begin
  Result := False;
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
  begin
    if not Existe(PAGO,'IDPAGO',Id) then
      MsjError('No se encontró el registro')
    else if (PAGOTIPO_PAGO.Text = 'C') and (PAGOCOBRADO.Text = 'Sí') then
      MsjError('No se puede eliminar un pago hecho con cheque que ya fue cobrado')
    else
    begin
      SetPagadoNo(Id);
      BajaSQL('PAGO','IDPAGO='+IntToStr(Id),dmQuerys.Q);
      Result := True;
    end;
  end;
end;

function TfrmPagos.DevolverChequeExt(const IdPago: Longword): Boolean;
begin
  Result := False;
  if Confirmar('¿Está seguro de devolver el cheque seleccionado?') then
  begin
    if not Existe(PAGO,'IDPAGO',IdPago) then
      MsjError('No se encontró el registro')
    else
    begin
      try
        Filtrar(TRAB,'IDPAGO='+IntToStr(IdPago));
        TRAB.First;
        while not TRAB.Eof do
        begin
          TRAB.Edit;
          TRABPAGADO.Text := 'No';
          TRAB.Next;
        end;

        Filtrar(GASTO,'IDPAGO='+IntToStr(IdPago));
        GASTO.First;
        while not GASTO.Eof do
        begin
          GASTO.Edit;
          GASTOPAGADO.Text := 'No';
          GASTO.Next;
        end;

        Filtrar(SERV,'IDPAGO='+IntToStr(IdPago));
        SERV.First;
        while not SERV.Eof do
        begin
          SERV.Edit;
          SERVPAGADO.Text := 'No';
          SERV.Next;
        end;

        PAGO.Edit;
        PAGOCOBRADO.Text := 'D';
        PAGO.Post;

        CHDEV.Open;
        CHDEV.Append;
        CHDEVNRO_CHEQUE.Text := PAGONRO_CHEQUE.Text;
        CHDEVFECHA_DEV.Value := DateOf(Date);
        CHDEVTIPO.Text := 'E';
        CHDEV.Post;
        except on EDatabaseError do
        begin
          MsjError('Se produjo un error al intentar registrar la devolución del cheque');
          Exit;
        end;
      end;
      Result := True;
      MsjInfo('Se ha registrado la devolución sin problemas');
    end;
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmPagos.PrepararFormulario(const M: Byte);
begin
  TMP.Open;
  TMP.EmptyTable;

  with qryTrab do
  begin
    Open;
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'T';
      TMPIDGASTO.Value := qryTrabIDTRABAJO.Value;
      TMPNRO_CHEQUE.Text := qryTrabNRO_FACT.Text;
      if qryTrabTIPO_TRAB.Text = 'D' then
        TMPDESCRIP.Text := 'Depto. '
      else
        TMPDESCRIP.Text := 'Edificio ';
      TMPIMPORTE.Value := qryTrabCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryTrabIDPROVEEDOR.Value;
      TMPIDEDIF.Value := qryTrabIDEDIFICIO.Value;
      TMPFECHA.Value := qryTrabFECHA.Value;
      TMPVACIOS.Text := 'No';
      TMPEDIFICIO.Text := qryTrabEdificio.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  with qryGasto do
  begin
    Open;
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'G';
      TMPIDGASTO.Value := qryGastoIDGASTO_AD.Value;
      TMPDESCRIP.Text := qryGastoDESCRIP.Text;
      TMPNRO_CHEQUE.Text := ''; //Nro factura;
      TMPIMPORTE.Value := qryGastoCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryGastoIDPROVEEDOR.Value;
      TMPFECHA.Value := qryGastoFECHA.Value;
      TMPVACIOS.Text := 'No';
      TMPEDIFICIO.Text := '';
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  with qryServ do
  begin
    Open;
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'S';
      TMPIDGASTO.Value := qryServIDSERV_EDIF.Value;
      TMPDESCRIP.Text := qryServDESCRIP.Text;
      TMPNRO_CHEQUE.Text := qryServNRO_FACT.Text;
      TMPIMPORTE.Value := qryServCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryServIDPROVEEDOR.Value;
      TMPIDEDIF.Value := qryServIDEDIFICIO.Value;
      TMPFECHA.Value := qryServFECHA.Value;
      TMPVACIOS.Text := qryServVACIOS.Text;
      TMPEDIFICIO.Text := qryServEdificio.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  IndexFieldNames := '';
  gImpCheque := 0;
  gImpRae := 0;
  btnPago.Enabled := False;
  dtpFechaPago.Date := Date;
  MostrarImportesDeuda;
end;

procedure TfrmPagos.MostrarImportesDeuda;
var
  T: Currency;
  Id: Integer;
begin
  qryPagos.DisableControls;
  Id := qryPagosIDPROVEEDOR.Value;
  qryPagos.Open;
  if qryPagos.IsEmpty then T := 0
  else
  begin
    qryPagos.Close;
    T := SumaColumna(qryPagos,'IMPORTE');
    Existe(qryPagos,'IDPROVEEDOR',Id);
  end;
  lblTotDeuda.Caption := 'Total a pagar: ' + CurrToStrF(T,ffCurrency ,2);
  qryPagos.EnableControls;
end;

procedure TfrmPagos.MostrarImportesPagos;
var
  C, E, R: Currency;
  Id: Integer;
begin
  with TMP do
  begin
    Id := TMPIDTEMP_PAGOS.Value;
    Close;  Open;
    First;
    C := 0;
    E := 0;
    R := 0;
    while not Eof do
    begin
      if TMPTIPO_PAGO.Text = 'C' then C := C + TMPIMPORTE.Value;
      if TMPTIPO_PAGO.Text = 'E' then E := E + TMPIMPORTE.Value;
      if TMPTIPO_PAGO.Text = 'R' then R := R + TMPIMPORTE.Value;
      Next;
    end;
    lblCheque.Caption := 'Cheque: ' + CurrToStrF(C,ffCurrency ,2);
    lblEfectivo.Caption := 'Efectivo: ' + CurrToStrF(E,ffCurrency ,2);
  end;
  Existe(TMP,'IDTEMP_PAGOS',Id);
  gImpCheque := C;
  gImpEfectivo := E;
  gImpRae := R;
end;

procedure TfrmPagos.SetPagadoNo(const Id: Longword);
begin
  ModifSQL('TRABAJO','PAGADO='+#39+'No'+#39+',IDPAGO=NULL'+',NRO_DECI=NULL'+',NRO_ORDEN=NULL','IDPAGO='+IntToStr(Id),dmQuerys.Q);
  ModifSQL('GASTO_AD','PAGADO='+#39+'No'+#39+',IDPAGO=NULL'+',NRO_DECI=NULL'+',NRO_ORDEN=NULL','IDPAGO='+IntToStr(Id),dmQuerys.Q);
  ModifSQL('SERV_EDIF','PAGADO='+#39+'No'+#39+',IDPAGO=NULL'+',NRO_DECI=NULL'+',NRO_ORDEN=NULL','IDPAGO='+IntToStr(Id),dmQuerys.Q);
end;

function TfrmPagos.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmPagos.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmPagos.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmPagos.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmPagos.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);

    if Sender = edtDesc then btnBuscarClick(nil)
    else Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCerrarClick(nil);
end;

procedure TfrmPagos.FormCreate(Sender: TObject);
var
  W: String;
begin
  RecuperarEstadoVentana(Name,Self);
  RecuperarEstadoGrilla(Name+'1.col',grdDeudas);
  RecuperarEstadoGrilla(Name+'2.col',grdPagos);
  W := RecuperarValorRegistro(Name,pnlLeft.Name);
  if W <> 'Sin nombre' then pnlLeft.Width := StrToInt(W);
  W := RecuperarValorRegistro(Name,'FechaPago');
  if W = 'Sin nombre' then dtpFechaPago.Date := Date
  else dtpFechaPago.Date := StrToDate(W);
end;

procedure TfrmPagos.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
  GuardarEstadoGrilla(Name+'1.col',grdDeudas);
  GuardarEstadoGrilla(Name+'2.col',grdPagos);
  GuardarValorRegistro(Name,pnlLeft.Name,IntToStr(pnlLeft.Width));
  GuardarValorRegistro(Name,'FechaPago',DateToStr(dtpFechaPago.Date));
  dmDatos.DECI.Close;
end;

procedure TfrmPagos.TMPNewRecord(DataSet: TDataSet);
begin
  TMPIDTEMP_PAGOS.Value := dmStoreProc.getId('IDTEMP_PAGOS') + 1;
end;

procedure TfrmPagos.qryPagosAfterScroll(DataSet: TDataSet);
begin
  if qryPagos.RecordCount > 0 then
  begin
    TMP.DisableControls;
    Filtrar(TMP,'IDPROVEEDOR = ' + qryPagosIDPROVEEDOR.Text);
    MostrarImportesPagos;
    TMP.IndexFieldNames := IndexFieldNames;
    TMP.Refresh;
    TMP.EnableControls;
    btnPago.Enabled := False;
  end;
end;

procedure TfrmPagos.grdPagosDblClick(Sender: TObject);
var
  Indice: String;
  Marca: TBookmark;
begin
  TMP.DisableControls;
  Indice := TMP.IndexFieldNames;
  Marca := TMP.GetBookmark;
  TMP.Edit;
  if TMPTIPO_PAGO.IsNull then TMPTIPO_PAGO.Text := 'C'
  else if TMPTIPO_PAGO.Text = 'C' then TMPTIPO_PAGO.Text := 'E'
  else if TMPTIPO_PAGO.Text = 'E' then TMPTIPO_PAGO.Text := 'R'
 // else if TMPTIPO_PAGO.Text = 'R' then TMPTIPO_PAGO.Text := 'P'
  else TMPTIPO_PAGO.Clear;
  TMP.Post;
  MostrarImportesPagos;
  TMP.IndexFieldNames := Indice;
  TMP.GotoBookmark(Marca);
  TMP.EnableControls;
end;

procedure TfrmPagos.PAGONewRecord(DataSet: TDataSet);
begin
  PAGOIDPAGO.Value := dmStoreProc.getId('IDPAGO') + 1;
end;

procedure TfrmPagos.btnPagoClick(Sender: TObject);
var
  IdPagoCheque, IdPagoEfectivo, IdPagoRae: Integer;
  IdPersonal: Integer;
  Indice: String;
  form: TfrmElecPersonal;
  R: Boolean;
begin
  form := TfrmElecPersonal.Create(nil);
  R := form.getId(IdPersonal, 2);
  form.Release;
  if not R then Exit;

  PAGO.Open;

  if gImpCheque <> 0 then
  begin
    if edtNroCheque.Text = '' then
    begin
      MsjError('Falta el Nº de cheque');
      Exit
    end;

    if Existe(PAGO,'NRO_CHEQUE',edtNroCheque.Text) then
    begin
      if Confirmar('El cheque ya existe. ¿Desea continuar de todas formas?') then
      begin
        if PAGOIdProveedor.Value <> qryPagosIDPROVEEDOR.Value then
        begin
          MsjError(PChar('El proveedor no coincide. Un cheque con el mismo ' +
                   'número fue hecho a ' + PAGOProveedor.Text));
          Exit;
        end;
        PAGO.Edit;
        PAGOIMPORTE.Value := PAGOIMPORTE.Value + gImpCheque;
        PAGOIDPERSONAL.Value := IdPersonal;
        PAGO.Post;
      end
      else Exit;
    end
    else
    begin
      PAGO.Append;
      PAGOFECHA_PAGO.Value := DateOf(dtpFechaPago.Date);
      PAGOIMPORTE.Value := gImpCheque;
      PAGOTIPO_PAGO.Text := 'C';
      PAGONRO_CHEQUE.Text := edtNroCheque.Text;
      PAGOCOBRADO.Text := 'No';
      PAGOIDPERSONAL.Value := IdPersonal;
      PAGO.Post;
    end;
    IdPagoCheque := PAGOIDPAGO.Value;
  end;


    if gImpEfectivo <> 0 then
    begin
      PAGO.Append;
      PAGOFECHA_PAGO.Value := DateOf(dtpFechaPago.Date);
      PAGOIMPORTE.Value := gImpEfectivo;
      PAGOTIPO_PAGO.Text := 'E';
      PAGOCOBRADO.Text := 'Sí';
      PAGOIDPERSONAL.Value := IdPersonal;
      PAGO.Post;

      IdPagoEfectivo := PAGOIDPAGO.Value;
    end;

    if gImpRae <> 0 then
    begin
      PAGO.Append;
      PAGOFECHA_PAGO.Value := DateOf(dtpFechaPago.Date);
      PAGOIMPORTE.Value := gImpRae;
      PAGOTIPO_PAGO.Text := 'R';
      PAGOCOBRADO.Text := 'Sí';
      PAGOIDPERSONAL.Value := IdPersonal;
      PAGO.Post;

      IdPagoRae := PAGOIDPAGO.Value;
    end;

  with TMP do
  begin
    Indice := IndexFieldNames;
    IndexFieldNames := '';
    DisableControls;

    try
      First;
      while not Eof do
      begin
        if not TMPTIPO_PAGO.IsNull then
        begin
          if TMPTIPO_GASTO.Text = 'T' then
          begin
            Existe(TRAB,'IDTRABAJO',TMPIDGASTO.Value);
            if (TRABNRO_FACT.Value = 0) then
            begin
              MsjError('Se encontraron trabajos sin número de factura, los ' +
              'cuales no pueden ser pagados.');
              Exit;
            end;
            TRAB.Edit;
            TRABPAGADO.Text := 'Sí';
            if TMPTIPO_PAGO.Text = 'C' then TRABIDPAGO.Value := IdPagoCheque
            else if TMPTIPO_PAGO.Text = 'R' then TRABIDPAGO.Value := IdPagoRae
            else TRABIDPAGO.Value := IdPagoEfectivo;
            TRABNRO_DECI.Value := TMPNRO_DECI.Value;
            TRABNRO_ORDEN.Value := TMPNRO_ORDEN.Value;
            TRAB.Post;
          end
          else if TMPTIPO_GASTO.Text = 'G' then
          begin
            Existe(GASTO,'IDGASTO_AD',TMPIDGASTO.Value);
            GASTO.Edit;
            GASTOPAGADO.Text := 'Sí';
            if TMPTIPO_PAGO.Text = 'C' then GASTOIDPAGO.Value := IdPagoCheque
            else if TMPTIPO_PAGO.Text = 'R' then GASTOIDPAGO.Value := IdPagoRae
            else GASTOIDPAGO.Value := IdPagoEfectivo;
            GASTONRO_DECI.Value := TMPNRO_DECI.Value;
            GASTONRO_ORDEN.Value := TMPNRO_ORDEN.Value;
            GASTO.Post;
          end
          else if TMPTIPO_GASTO.Text = 'S' then
          begin
            Existe(SERV,'IDSERV_EDIF',TMPIDGASTO.Value);
            if (SERVNRO_FACT.Value = 0) then
            begin
              MsjError('Se encontraron servicios sin número de factura, los ' +
              'cuales no pueden ser pagados.');
              Exit;
            end;
            SERV.Edit;
            SERVPAGADO.Text := 'Sí';
            if TMPTIPO_PAGO.Text = 'C' then SERVIDPAGO.Value := IdPagoCheque
            else if TMPTIPO_PAGO.Text = 'R' then SERVIDPAGO.Value := IdPagoRae
            else SERVIDPAGO.Value := IdPagoEfectivo;
            SERVNRO_DECI.Value := TMPNRO_DECI.Value;
            SERVNRO_ORDEN.Value := TMPNRO_ORDEN.Value;
            SERV.Post;
          end;
          Delete;
        end
        else Next;
      end;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar registrar los pagos.');
        dmDatos.ADB.Rollback;
        EnableControls;
        Exit;
      end;
    end;

    IndexFieldNames := Indice;
    EnableControls;
  end;

  MostrarImportesDeuda;
  MostrarImportesPagos;
  edtNroCheque.Text := '';

  dmDatos.ADB.Commit;
end;

procedure TfrmPagos.btnNumerarClick(Sender: TObject);
var
  D,O: Longword;
  Fecha: TDateTime;
  Indice: String;
begin
  Fecha := DateOf(dtpFechaPago.Date);

  with dmDatos,TMP do
  begin
    Indice := IndexFieldNames;
    IndexFieldNames := '';
    if not ADB.InTransaction then ADB.StartTransaction;

    DisableControls;

    try
      First;
      while not Eof do
      begin
        if not TMPTIPO_PAGO.IsNull then
        begin
          if TMPTIPO_GASTO.Text = 'T' then
          begin
            RetornarNrosDECI(TMPIDEDIF.Value,'M',Fecha,D,O);
            IncNrosDECI(TMPIDEDIF.Value,'M',Fecha);
          end
          else if TMPTIPO_GASTO.Text = 'G' then
          begin
            RetornarNrosDECI(-1,'A',Fecha,D,O);
            IncNrosDECI(-1,'A',Fecha);
          end
          else if TMPTIPO_GASTO.Text = 'S' then
          begin
            if TMPVACIOS.Text = 'Sí' then
            begin
              RetornarNrosDECI(-3,'S',Fecha,D,O);
              IncNrosDECI(-3,'S',Fecha);
            end
            else
            begin
              RetornarNrosDECI(TMPIDEDIF.Value,'S',Fecha,D,O);
              IncNrosDECI(TMPIDEDIF.Value,'S',Fecha);
            end;
          end;

          Edit;
          TMPNRO_DECI.Value := D;
          TMPNRO_ORDEN.Value := O;
        end;
        TMP.Next;
      end;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar asignar los números de DECI y orden.');
        ADB.Rollback;
        EnableControls;
        Exit;
      end;
    end;

    IndexFieldNames := Indice;
    EnableControls;
    grdPagos.Refresh;
  end;

  btnPago.Enabled := True;
end;

procedure TfrmPagos.btnCerrarClick(Sender: TObject);
begin
  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;

  ModalResult := mrCancel;
end;

procedure TfrmPagos.btnBuscarClick(Sender: TObject);
begin
  if edtDesc.Text <> '' then
  begin
    qryPagos.DisableControls;
    qryPagos.Filter := 'PROVEEDOR = ' + QuotedStr(edtDesc.Text + '*');
    qryPagos.Filtered := True;
    qryPagos.EnableControls;
  end
  else qryPagos.Filtered := False;
  grdDeudas.Refresh;
end;

procedure TfrmPagos.grdPagosTitleClick(Column: TColumn);
begin
  TMP.IndexFieldNames := '';
  TMP.IndexFieldNames := Column.FieldName;
  IndexFieldNames := TMP.IndexFieldNames;
  TMP.Refresh;
  grdPagos.Refresh;
end;

end.
