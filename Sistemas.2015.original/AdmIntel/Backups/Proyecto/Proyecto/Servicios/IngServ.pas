unit IngServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask, DB,
  DBTables, DateUtils;

type
  TfrmIngServ = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlDatos: TPanel;
    dtpFecha: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnBuscarServ: TSpeedButton;
    Label5: TLabel;
    btnBuscarProv: TSpeedButton;
    SERVEDIF: TTable;
    SERVEDIFIDSERV_EDIF: TIntegerField;
    SERVEDIFIDSERVICIO: TIntegerField;
    SERVEDIFIDEDIFICIO: TIntegerField;
    SERVEDIFFECHA_PAGO: TDateTimeField;
    SERVEDIFCOSTO: TFloatField;
    SERVEDIFIDPROVEEDOR: TIntegerField;
    SERVEDIFVACIOS: TStringField;
    SERVEDIFEdificio: TStringField;
    SERVEDIFConcepto: TStringField;
    SERVEDIFProveedor: TStringField;
    ComboEdificio: TDBLookupComboBox;
    DataSource1: TDataSource;
    ComboServicio: TDBLookupComboBox;
    ComboProveedor: TDBLookupComboBox;
    edtCosto: TDBEdit;
    SERVEDIFPAGADO: TStringField;
    lblDECI: TLabel;
    edtDECI: TDBEdit;
    edtOrden: TDBEdit;
    lblOrden: TLabel;
    SERVEDIFNRO_ORDEN: TIntegerField;
    SERVEDIFNRO_DECI: TIntegerField;
    qryExisteNro: TQuery;
    SERVEDIFNRO_FACT: TIntegerField;
    Label6: TLabel;
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
    procedure SERVEDIFNewRecord(DataSet: TDataSet);

  private
    Teclas: Byte;
    gIdServEdif: Longword;
    gDECIIni, gOrdenIni: Integer;
    gVacios: Boolean;
    procedure PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
    function DatosValidos: Boolean;
    function Guardar: Boolean;
    function DeciValida: Boolean;
    function OrdenValido: Boolean;

  public
    function Agregar(var Id: Longword; const Vacios: Boolean): Boolean;
    function Eliminar(const Id: Longword): Boolean;
    function Modificar(const Id: Longword): Boolean;

  end;

var
  frmIngServ: TfrmIngServ;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, ElecProv, StoreProcs;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

{ACLARACION: FECHA_PAGO no representa la fecha de pago del gasto sino la fecha
 en la que se produce o se carga el gasto. La verdadera fecha de pago se encuentra
 en la tabla PAGOS}

function TfrmIngServ.Agregar(var Id: Longword; const Vacios: Boolean): Boolean;
begin
  gVacios := Vacios;
  PrepararFormulario(0,0);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then Id := gIdServEdif;
end;

function TfrmIngServ.Eliminar(const Id: Longword): Boolean;
begin
  Result := False;

  if Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then
  begin
    if not Existe(SERVEDIF,'IDSERV_EDIF',Id) or (SERVEDIFPAGADO.Text = 'Sí') then
    begin
      MsjError('No se puedo eliminar el gasto. No se encontró el registro o está pagado');
      Exit;
    end;
    try
      SERVEDIF.Delete;
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

function TfrmIngServ.Modificar(const Id: Longword): Boolean;
begin
  PrepararFormulario(2,Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}


procedure TfrmIngServ.PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
var
  F, S, E, P: String;
begin
  if Modo = 2 then //Modificación
  begin
    Caption := 'Modificar servicio';
    Existe(SERVEDIF,'IDSERV_EDIF',IdGasto);
    gDECIIni := SERVEDIFNRO_DECI.Value;
    gOrdenIni := SERVEDIFNRO_ORDEN.Value;
    pnlDatos.Enabled := (SERVEDIFPAGADO.Text = 'No');
    SERVEDIF.Edit;
  end
  else if Modo = 0 then //Alta
  begin
    if gVacios then Caption := 'Agregar servicio (dptos. vacios)'
    else Caption := 'Agregar servicio (dptos. ocupados)';
    pnlDatos.Enabled := True;
    SERVEDIF.Open;
    SERVEDIF.Append;

    S := RecuperarValorRegistro(Name,'IdServ');
    if S = 'Sin nombre' then S := '1';
    SERVEDIFIDSERVICIO.Value := StrToInt(S);

    F := RecuperarValorRegistro(Name,'Fecha');
    if F = 'Sin nombre' then F := DateToStr(Date);
    SERVEDIFFECHA_PAGO.Value := StrToDate(F);

    E := RecuperarValorRegistro(Name,'IdEdif');
    if E = 'Sin nombre' then E := '1';
    SERVEDIFIDEDIFICIO.Value := StrToInt(E);

    P := RecuperarValorRegistro(Name,'IdProv');
    if P = 'Sin nombre' then P := '1';
    SERVEDIFIDPROVEEDOR.Value := StrToInt(P);
  end;
  edtDECI.Visible := (SERVEDIFPAGADO.Text = 'Sí');
  edtOrden.Visible := (SERVEDIFPAGADO.Text = 'Sí');
  lblDECI.Visible := (SERVEDIFPAGADO.Text = 'Sí');
  lblOrden.Visible := (SERVEDIFPAGADO.Text = 'Sí');
  dtpFecha.Date := SERVEDIFFECHA_PAGO.Value;
  if pnlDatos.Enabled then ActiveControl := dtpFecha;
end;

function TfrmIngServ.DatosValidos: Boolean;
begin
  Result := False;

  if (ComboServicio.Text = '') or (ComboEdificio.Text = '') or
     (edtCosto.Text = '') or (ComboProveedor.Text = '') then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

function TfrmIngServ.Guardar: Boolean;
begin
  Result := False;

  if (gDECIIni <> SERVEDIFNRO_DECI.Value) and not DeciValida then Exit;
  if (gOrdenIni <> SERVEDIFNRO_ORDEN.Value) and not OrdenValido then Exit;  

  if Editando(SERVEDIF) then
    try
      SERVEDIFFECHA_PAGO.Value := DateOf(dtpFecha.Date);
      if gVacios then SERVEDIFVACIOS.Text := 'Sí'
      else SERVEDIFVACIOS.Text := 'No';
      SERVEDIF.Post;

      GuardarValorRegistro(Name,'Fecha',SERVEDIFFECHA_PAGO.Text);
      GuardarValorRegistro(Name,'IdServ',SERVEDIFIDSERVICIO.Text);
      GuardarValorRegistro(Name,'IdEdif',SERVEDIFIDEDIFICIO.Text);
      GuardarValorRegistro(Name,'IdProv',SERVEDIFIDPROVEEDOR.Text);
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
                 'datos están completos.');
        Exit;
      end;
    end;

  Result := True;
end;

function TfrmIngServ.DeciValida: Boolean;
begin
  if not Existe(dmDatos.DECI,'NRO_SERV',SERVEDIFNRO_DECI.Value) or
     (dmDatos.DECIIDEDIFICIO.Value = -1) or (dmDatos.DECIIDEDIFICIO.Value = -2) then
  begin
    MsjError('Número de DECI inválido');
    Result := False;
  end
  else Result := True;
end;

function TfrmIngServ.OrdenValido: Boolean;
begin
  with qryExisteNro do
  begin
    Close;
    ParamByName('N').AsInteger := SERVEDIFNRO_ORDEN.Value;
    ParamByName('I').AsInteger := SERVEDIFIDSERV_EDIF.Value;
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

procedure TfrmIngServ.Entrada_A_Campo(Sender: TObject);
begin
  if Sender = ComboProveedor then
    dmDatos.PROV.IndexFieldNames := 'RAZON_SOCIAL'
  else if Sender = ComboServicio then
    dmDatos.SERV.IndexFieldNames := 'DESCRIP';

  EntradaACampo(self,Sender);
end;

procedure TfrmIngServ.Salida_de_Campo(Sender: TObject);
begin
  if Sender = ComboProveedor then
    dmDatos.PROV.IndexFieldNames := ''
  else if Sender = ComboServicio then
    dmDatos.SERV.IndexFieldNames := '';

  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngServ.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngServ.PressEnter(Sender: TObject; var Key: Char);
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

procedure TfrmIngServ.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  if not Guardar then Exit;  
  ModalResult := mrOk;
end;

procedure TfrmIngServ.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngServ.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngServ.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngServ.btnBuscarServClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('SERVICIO',Id,Desc);
    Release;
  end;

  SERVEDIFIDSERVICIO.Value := Id;
  ComboServicio.Refresh;

  if not R then Exit;

end;

procedure TfrmIngServ.btnBuscarProvClick(Sender: TObject);
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

  SERVEDIFIDPROVEEDOR.Value := Id;
  ComboProveedor.Refresh;

  if not R then Exit;
end;

procedure TfrmIngServ.SERVEDIFNewRecord(DataSet: TDataSet);
begin
  gIdServEdif := dmStoreProc.getId('IDSERV_EDIF') + 1;
  SERVEDIFIDSERV_EDIF.Value := gIdServEdif;
end;

end.
