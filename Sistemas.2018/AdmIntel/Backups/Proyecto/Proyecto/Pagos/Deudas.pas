unit Deudas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables, DateUtils;

type
  TfrmDeudas = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    pnlLeft: TPanel;
    Panel1: TPanel;
    grdDeudas: TDBGrid;
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
    TMPTIPO_PAGO: TStringField;
    TRAB: TTable;
    GASTO: TTable;
    SERV: TTable;
    TRABIDTRABAJO: TIntegerField;
    TRABPAGADO: TStringField;
    GASTOPAGADO: TStringField;
    SERVIDSERV_EDIF: TIntegerField;
    SERVPAGADO: TStringField;
    GASTOIDGASTO_AD: TIntegerField;
    TRABIDPAGO: TIntegerField;
    GASTOIDPAGO: TIntegerField;
    SERVIDPAGO: TIntegerField;
    Query1: TQuery;
    TMPIDEDIF: TIntegerField;
    TMPFECHA: TDateTimeField;
    TMPEdificio: TStringField;
    qryTrabIDTRABAJO: TIntegerField;
    qryTrabNRO_PEDIDO: TIntegerField;
    qryTrabFECHA: TDateTimeField;
    qryTrabCOSTO: TFloatField;
    qryTrabIDPROVEEDOR: TIntegerField;
    qryTrabIDEDIFICIO: TIntegerField;
    qryServIDEDIFICIO: TIntegerField;
    TMPNRO_ORDEN: TIntegerField;
    TMPNRO_DECI: TIntegerField;
    TRABNRO_ORDEN: TIntegerField;
    TRABNRO_DECI: TIntegerField;
    GASTONRO_ORDEN: TIntegerField;
    GASTONRO_DECI: TIntegerField;
    SERVNRO_ORDEN: TIntegerField;
    SERVNRO_DECI: TIntegerField;
    btnCerrar: TBitBtn;
    TMPVACIOS: TStringField;
    qryServVACIOS: TStringField;
    qryGastoFECHA: TDateTimeField;
    qryServFECHA: TDateTimeField;
    qryTrabTIPO_TRAB: TStringField;
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
    procedure btnCerrarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure grdPagosTitleClick(Column: TColumn);

  private
    Teclas: Byte;
    gImpCheque, gImpEfectivo: Currency;
    procedure PrepararFormulario;
    procedure MostrarImportesDeuda;
    function DatosValidos: Boolean;

  public
    procedure Mostrar;

  end;

var
  frmDeudas: TfrmDeudas;

implementation

uses Comunes, Util, StoreProcs, PoolDatos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmDeudas.Mostrar;
begin
  MostrarMSJ('Preparando listado de deudas...');
  Application.ProcessMessages;
  PrepararFormulario;
  OcultarMSJ;

  ShowModal;

  qryPagos.Close;
  dmDatos.DECI.Close;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmDeudas.PrepararFormulario;
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
      if qryTrabTIPO_TRAB.Text = 'D' then
        TMPDESCRIP.Text := 'Trab. dto. Nº ' + qryTrabNRO_PEDIDO.Text
      else
        TMPDESCRIP.Text := 'Trab. edif. Nº ' + qryTrabNRO_PEDIDO.Text;
      TMPIMPORTE.Value := qryTrabCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryTrabIDPROVEEDOR.Value;
      TMPIDEDIF.Value := qryTrabIDEDIFICIO.Value;
      if not qryTrabFECHA.IsNull then TMPFECHA.Value := qryTrabFECHA.Value;
      TMPVACIOS.Text := 'No';
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
      TMPIMPORTE.Value := qryGastoCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryGastoIDPROVEEDOR.Value;
      TMPFECHA.Value := qryGastoFECHA.Value;
      TMPVACIOS.Text := 'No';
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
      TMPIMPORTE.Value := qryServCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryServIDPROVEEDOR.Value;
      TMPIDEDIF.Value := qryServIDEDIFICIO.Value;
      TMPFECHA.Value := qryServFECHA.Value;
      TMPVACIOS.Text := qryServVACIOS.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  gImpCheque := 0;
  MostrarImportesDeuda;
end;

procedure TfrmDeudas.MostrarImportesDeuda;
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

function TfrmDeudas.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmDeudas.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmDeudas.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmDeudas.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmDeudas.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCerrarClick(nil);
end;

procedure TfrmDeudas.FormCreate(Sender: TObject);
var
  W: String;
begin
  RecuperarEstadoVentana(Name,Self);
  RecuperarEstadoGrilla(Name+'1.col',grdDeudas);
  RecuperarEstadoGrilla(Name+'2.col',grdPagos);
  W := RecuperarValorRegistro(Name,pnlLeft.Name);
  if W <> 'Sin nombre' then pnlLeft.Width := StrToInt(W);
end;

procedure TfrmDeudas.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
  GuardarEstadoGrilla(Name+'1.col',grdDeudas);
  GuardarEstadoGrilla(Name+'2.col',grdPagos);
  GuardarValorRegistro(Name,pnlLeft.Name,IntToStr(pnlLeft.Width));
end;

procedure TfrmDeudas.TMPNewRecord(DataSet: TDataSet);
begin
  TMPIDTEMP_PAGOS.Value := dmStoreProc.getId('IDTEMP_PAGOS') + 1;
end;

procedure TfrmDeudas.qryPagosAfterScroll(DataSet: TDataSet);
begin
  TMP.DisableControls;
  Filtrar(TMP,'IDPROVEEDOR = ' + qryPagosIDPROVEEDOR.Text);
  TMP.EnableControls;
end;

procedure TfrmDeudas.grdPagosDblClick(Sender: TObject);
begin
  TMP.DisableControls;
  TMP.Edit;
  if TMPTIPO_PAGO.IsNull then TMPTIPO_PAGO.Text := 'C'
  else if TMPTIPO_PAGO.Text = 'C' then TMPTIPO_PAGO.Text := 'E'
  else TMPTIPO_PAGO.Clear;
  TMP.Post;
  TMP.EnableControls;
end;

procedure TfrmDeudas.PAGONewRecord(DataSet: TDataSet);
begin
  PAGOIDPAGO.Value := dmStoreProc.getId('IDPAGO') + 1;
end;

procedure TfrmDeudas.btnCerrarClick(Sender: TObject);
begin
  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;

  ModalResult := mrCancel;
end;

procedure TfrmDeudas.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;

end;

procedure TfrmDeudas.grdPagosTitleClick(Column: TColumn);
begin
  TMP.IndexFieldNames := '';
  TMP.IndexFieldNames := Column.FieldName;
  TMP.Refresh;
  grdPagos.Refresh;
end;

end.
