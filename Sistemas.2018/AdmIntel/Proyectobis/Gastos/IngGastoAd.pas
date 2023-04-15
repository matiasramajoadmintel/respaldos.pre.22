unit IngGastoAd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask, DB,
  DBTables, DateUtils;

type
  TfrmIngGastoAd = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlDatos: TPanel;
    dtpFecha: TDateTimePicker;
    Label1: TLabel;
    Label4: TLabel;
    btnBuscarServ: TSpeedButton;
    btnBuscarProv: TSpeedButton;
    GASTO: TTable;
    GASTOIDGASTO_AD: TIntegerField;
    GASTOFECHA_PAGO: TDateTimeField;
    GASTOCOSTO: TFloatField;
    GASTOIDTIPO_GASTO_AD: TIntegerField;
    GASTOIDPROVEEDOR: TIntegerField;
    GASTOPAGADO: TStringField;
    dsGASTO: TDataSource;
    edtCosto: TDBEdit;
    GASTOConcepto: TStringField;
    Label3: TLabel;
    ComboConcepto: TDBLookupComboBox;
    GASTOProveedor: TStringField;
    Label2: TLabel;
    ComboProveedor: TDBLookupComboBox;
    lblDECI: TLabel;
    edtDECI: TDBEdit;
    edtOrden: TDBEdit;
    lblOrden: TLabel;
    GASTONRO_ORDEN: TIntegerField;
    GASTONRO_DECI: TIntegerField;
    qryExisteNro: TQuery;
    GASTONRO_FACT: TIntegerField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarServClick(Sender: TObject);
    procedure btnBuscarProvClick(Sender: TObject);
    procedure GASTONewRecord(DataSet: TDataSet);

  private
    Teclas: Byte;
    gId: Longword;
    gDECIIni, gOrdenIni: Integer;
    procedure PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
    function DatosValidos: Boolean;
    function Guardar: Boolean;
    function DeciValida: Boolean;
    function OrdenValido: Boolean;

  public
    function Agregar(var Id: Longword): Boolean;
    function Eliminar(const Id: Longword): Boolean;
    function Modificar(const Id: Longword): Boolean;

  end;

var
  frmIngGastoAd: TfrmIngGastoAd;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, ElecProv, StoreProcs;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

{ACLARACION: FECHA_PAGO no representa la fecha de pago del gasto sino la fecha
 en la que se produce o se carga el gasto. La verdadera fecha de pago se encuentra
 en la tabla PAGOS}

function TfrmIngGastoAd.Agregar(var Id: Longword): Boolean;
begin
  PrepararFormulario(0,0);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then Id := gId;
end;

function TfrmIngGastoAd.Eliminar(const Id: Longword): Boolean;
begin
  Result := False;

  if Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then
  begin
    if not Existe(GASTO,'IDGASTO_AD',Id) or (GASTOPAGADO.Text = 'Sí') then
    begin
      MsjError('No se puedo eliminar el gasto. No se encontró el registro o esta pagado');
      Exit;
    end;
    try
      GASTO.Delete;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
                 'dato que desea eliminar no esté siendo usado.');
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function TfrmIngGastoAd.Modificar(const Id: Longword): Boolean;
begin
  PrepararFormulario(2,Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmIngGastoAd.PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
var
  F, S, P: String;
begin
  if Modo = 2 then //Modificación
  begin
    Caption := 'Modificar gasto administrativo';
    Existe(GASTO,'IDGASTO_AD',IdGasto);
    gDECIIni := GASTONRO_DECI.Value;
    gOrdenIni := GASTONRO_ORDEN.Value;
    pnlDatos.Enabled := (GASTOPAGADO.Text = 'No');
    GASTO.Edit;
  end
  else if Modo = 0 then //Alta
  begin
    Caption := 'Agregar gasto administrativo';
    pnlDatos.Enabled := True;
    GASTO.Open;
    GASTO.Append;

    S := RecuperarValorRegistro(Name,'IdGasto');
    if S = 'Sin nombre' then S := '1';
    GASTOIDTIPO_GASTO_AD.Value := StrToInt(S);

    F := RecuperarValorRegistro(Name,'Fecha');
    if F = 'Sin nombre' then F := DateToStr(Date);
    GASTOFECHA_PAGO.Value := StrToDate(F);

    P := RecuperarValorRegistro(Name,'IdProv');
    if P = 'Sin nombre' then P := '1';
    GASTOIDPROVEEDOR.Value := StrToInt(P);
  end;
  edtDECI.Visible := (GASTOPAGADO.Text = 'Sí');
  edtOrden.Visible := (GASTOPAGADO.Text = 'Sí');
  lblDECI.Visible := (GASTOPAGADO.Text = 'Sí');
  lblOrden.Visible := (GASTOPAGADO.Text = 'Sí');
  dtpFecha.Date := GASTOFECHA_PAGO.Value;
end;

function TfrmIngGastoAd.DatosValidos: Boolean;
begin
  Result := False;

  if (ComboConcepto.Text = '') or (edtCosto.Text = '') or
     (ComboProveedor.Text = '') then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

function TfrmIngGastoAd.Guardar: Boolean;
begin
  Result := False;

  if (gDECIIni <> GASTONRO_DECI.Value) and not DeciValida then Exit;
  if (gOrdenIni <> GASTONRO_ORDEN.Value) and not OrdenValido then Exit;

  if Editando(GASTO) then
    try
      GASTOFECHA_PAGO.Value := DateOf(dtpFecha.Date);
      GASTO.Post;

      GuardarValorRegistro(Name,'Fecha',GASTOFECHA_PAGO.Text);
      GuardarValorRegistro(Name,'IdGasto',GASTOIDTIPO_GASTO_AD.Text);
      GuardarValorRegistro(Name,'IdProv',GASTOIDPROVEEDOR.Text);
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
                 'datos están completos.');
        Exit;
      end;
    end;

  Result := True;
end;

function TfrmIngGastoAd.DeciValida: Boolean;
begin
  if not Existe(dmDatos.DECI,'NRO_SERV',GASTONRO_DECI.Value) or
     (dmDatos.DECIIDEDIFICIO.Value <> -1) then
  begin
    MsjError('Número de DECI inválido');
    Result := False;
  end
  else Result := True;
end;

function TfrmIngGastoAd.OrdenValido: Boolean;
begin
  with qryExisteNro do
  begin
    Close;
    ParamByName('N').AsInteger := GASTONRO_ORDEN.Value;
    ParamByName('I').AsInteger := GASTOIDGASTO_AD.Value;
    Open;
    if RecordCount > 0 then
    begin
      MsjError('Número de orden inválido');
      Result := False;
    end
    else Result := True;
  end;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngGastoAd.Entrada_A_Campo(Sender: TObject);
begin
  if Sender = ComboProveedor then
    dmDatos.PROV.IndexFieldNames := 'RAZON_SOCIAL'
  else if Sender = ComboConcepto then
    dmDatos.TGASTOAD.IndexFieldNames := 'DESCRIP';

  EntradaACampo(self,Sender);
end;

procedure TfrmIngGastoAd.Salida_de_Campo(Sender: TObject);
begin
  if Sender = ComboProveedor then
    dmDatos.PROV.IndexFieldNames := ''
  else if Sender = ComboConcepto then
    dmDatos.TGASTOAD.IndexFieldNames := '';

  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngGastoAd.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngGastoAd.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCosto then
  begin
    case key of
      '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
       else key:=#0;
    end;

    if (Key = ',') or (Key = '.') then key := DecimalSeparator;
  end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngGastoAd.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  if not Guardar then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngGastoAd.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngGastoAd.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngGastoAd.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngGastoAd.btnBuscarServClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('TIPO_GASTO_AD',Id,Desc);
    Release;
  end;

  GASTOIDTIPO_GASTO_AD.Value := Id;
  ComboConcepto.Refresh;

  if not R then Exit;

end;

procedure TfrmIngGastoAd.btnBuscarProvClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecProv.Create(nil) do
  begin
    R := get(Id,Desc);
    Release;
  end;

  GASTOIDPROVEEDOR.Value := Id;
  ComboProveedor.Refresh;

  if not R then Exit;
end;

procedure TfrmIngGastoAd.GASTONewRecord(DataSet: TDataSet);
begin
  gId := dmStoreProc.getId('IDGASTO_AD') + 1;
  GASTOIDGASTO_AD.Value := gId;
end;

end.
