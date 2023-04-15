unit Trabajo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Mask, DBCtrls, DateUtils;

type
  TfrmTrabajos = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    dsTrab: TDataSource;
    qryTareas: TQuery;
    dsTareas: TDataSource;
    qryTareasTAREA: TStringField;
    qryTareasIDTAREA: TIntegerField;
    PageControl1: TPageControl;
    tsDatos: TTabSheet;
    tsMateriales: TTabSheet;
    Label1: TLabel;
    btnBuscarDepto: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnBuscarProv: TSpeedButton;
    DBEdit2: TDBEdit;
    edtCosto: TDBEdit;
    ComboProv: TDBLookupComboBox;
    edtDepto: TEdit;
    DBGrid2: TDBGrid;
    dsMU: TDataSource;
    btnAgregarMat: TSpeedButton;
    btnEliminarMat: TSpeedButton;
    btnModificarMat: TSpeedButton;
    qryMU: TQuery;
    qryMUIDTRABAJO: TIntegerField;
    qryMUDESCRIP: TStringField;
    qryMUCANTIDAD: TFloatField;
    qryMUABREV: TStringField;
    qryMUIDMATERIAL: TIntegerField;
    qryMUIDUNIDAD: TIntegerField;
    rgImp: TDBRadioGroup;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    ComboRubro: TDBLookupComboBox;
    Label4: TLabel;
    btnBuscarRubro: TSpeedButton;
    Label3: TLabel;
    lblFecFin: TLabel;
    DateTimePicker1: TDateTimePicker;
    dtpFecFin: TDateTimePicker;
    chkFin: TCheckBox;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Q: TQuery;
    pnlBottom: TPanel;
    lblEstado: TLabel;
    Bevel1: TBevel;
    lblDECI: TLabel;
    edtDECI: TDBEdit;
    edtOrden: TDBEdit;
    lblOrden: TLabel;
    qryExisteNro: TQuery;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarDeptoClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnBuscarProvClick(Sender: TObject);
    procedure btnAgregarMatClick(Sender: TObject);
    procedure btnEliminarMatClick(Sender: TObject);
    procedure btnModificarMatClick(Sender: TObject);
    procedure chkFinClick(Sender: TObject);
    procedure btnBuscarRubroClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdTrab, gIdDepto, gDECIIni, gOrdenIni: Integer;
    procedure PrepararFormulario(const M: Byte; const IdTrab: Integer);
    procedure AbrirQryTrabajos;
    procedure AbrirQryMateriales;
    function DatosValidos: Boolean;
    function Guardar: Boolean;
    function DeciValida: Boolean;
    function OrdenValido: Boolean;


  public
    function Mostrar(const M: Byte; const IdTrab: Integer): Boolean;
    function Eliminar(const Id: Longword): Boolean;

  end;

var
  frmTrabajos: TfrmTrabajos;

implementation

uses Comunes, Util, PoolDatos, ElecDepto, ElecEnt, StoreProcs, ElecProv,
  IngMat, PoolAux;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmTrabajos.Mostrar(const M: Byte; const IdTrab: Integer): Boolean;
begin
  Modo := M;
  PrepararFormulario(M,IdTrab);

  ShowModal;

  Result := (ModalResult = mrOk);
  qryTareas.Close;
  qryMU.Close;
end;

function TfrmTrabajos.Eliminar(const Id: Longword): Boolean;
begin
  Result := False;
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
  begin
    if not Existe(dmDatos.TRAB,'IDTRABAJO',Id) then
      MsjError('No se encontró el registro')
    else if dmDatos.TRABPAGADO.Text = 'Sí' then
      MsjError('No se puede eliminar un trabajo que ya fue pagado')
    else
    begin
      BajaSQL('TRAB_TAREA','IDTRABAJO='+IntToStr(Id),Q);
      BajaSQL('MAT_USADO','IDTRABAJO='+IntToStr(Id),Q);
      BajaSQL('TRAB_DEPTO','IDTRABAJO='+IntToStr(Id),Q);
      BajaSQL('TRABAJO','IDTRABAJO='+IntToStr(Id),Q);
      Result := True;
    end;
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmTrabajos.PrepararFormulario(const M: Byte; const IdTrab: Integer);
var
  F: String;
begin
  F := RecuperarValorRegistro(Name,'FECHAINI');
  if F = 'Sin nombre' then DateTimePicker1.Date := Date - 7
  else DateTimePicker1.Date := StrToDate(F);

  F := RecuperarValorRegistro(Name,'FECHAFIN');
  if F = 'Sin nombre' then dtpFecFin.Date := Date
  else dtpFecFin.Date := StrToDate(F);

  F := RecuperarValorRegistro(Name,'DEPTO');

  with dmDatos do
  begin
    if not ADB.Connected then ADB.Open;
    if not ADB.InTransaction then ADB.StartTransaction;
    if M = 0 then //Alta
    begin
      TRAB.Open;
      TRAB.Append;
      TRABIMPUTACION.Text := '01';

      TD.Open;
      TD.Append;
      gIdTrab := dmStoreProc.getId('IDTRABAJO') + 1;
      TDIDTRABAJO.Value := gIdTrab;
      if F <> 'Sin nombre' then
      begin
        TDIDDEPARTAMENTO.Value := StrToInt(F);
        gIdDepto := TDIDDEPARTAMENTO.Value;
        Existe(qrySoloDeptos,'IdDepartamento',gIdDepto);
        edtDepto.Text := qrySoloDeptosDESCRIPCION.Text;
      end
      else edtDepto.Text := '';

      btnEliminarMat.Enabled := False;
      btnModificarMat.Enabled := False;
      btnEliminar.Enabled := False;

      lblEstado.Caption := '';
    end
    else //Modificación
    begin
      Existe(TRAB,'IDTRABAJO',IdTrab);
      gIdTrab := IdTrab;
      gDECIIni := TRABNRO_DECI.Value;
      gOrdenIni := TRABNRO_ORDEN.Value;
      DateTimePicker1.Date := TRABFECHA_INI.Value;
      if TRABFECHA_FIN.IsNull then dtpFecFin.Date := Date
      else dtpFecFin.Date := TRABFECHA_FIN.Value;
      AbrirQryTrabajos;
      AbrirQryMateriales;
      Existe(TD,'IDTRABAJO',TRABIDTRABAJO.Value);
      gIdDepto := TDIDDEPARTAMENTO.Value;
      Existe(DEPTO,'IdDepartamento',TDIDDEPARTAMENTO.Value);
      edtDepto.Text := DEPTODescEdif.Text + ' ' + DEPTODESCRIPCION.Text;

      if TRABPAGADO.Value  = 'Sí' then
      begin
        Existe(PAGO,'IDPAGO',TRABIDPAGO.Value);
        if PAGOTIPO_PAGO.Text = 'E' then
          lblEstado.Caption := 'Pagado en efectivo'
        else lblEstado.Caption := 'Pagado con cheque Nº ' + PAGONRO_CHEQUE.Text;
//        tsDatos.Enabled := False;
      end
      else
      begin
        lblEstado.Caption := 'Pendiente de pago';
        tsDatos.Enabled := True;
      end;
      TRAB.Edit;
      TD.Edit;
      self.Height := 326;
    end;
    chkFin.Checked := not(TRABFECHA_FIN.IsNull);
    edtDECI.Visible := (TRABPAGADO.Text = 'Sí');
    edtOrden.Visible := (TRABPAGADO.Text = 'Sí');
    lblDECI.Visible := (TRABPAGADO.Text = 'Sí');
    lblOrden.Visible := (TRABPAGADO.Text = 'Sí');
  end;

  chkFinClick(nil);
  PageControl1.ActivePage := tsDatos;
end;

procedure TfrmTrabajos.AbrirQryTrabajos;
begin
  with qryTareas do
  begin
    Close;
    ParamByName('N').AsInteger := gIdTrab;
    Open;
    btnEliminar.Enabled := (RecordCount > 0);
  end;
end;

procedure TfrmTrabajos.AbrirQryMateriales;
begin
  with qryMU do
  begin
    Close;
    ParamByName('N').AsInteger := gIdTrab;
    Open;
    btnEliminarMat.Enabled := (RecordCount > 0);
    btnModificarMat.Enabled := (RecordCount > 0);
  end;
end;

function TfrmTrabajos.DatosValidos: Boolean;
begin
  Result := False;

  if dmDatos.TRABIDCATEGORIA.IsNull then
  begin
    MsjError('Falta asignar un rubro al trabajo');
    Exit;
  end;

  Result := True;
end;

function TfrmTrabajos.Guardar: Boolean;
var
  Fec: TDateTime;
  IdProv: Integer;
  Costo: Currency;
begin
  Result := False;

  with dmDatos,TRAB do
  begin
    {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
     agregar para evitar problemas en las comparaciones futuras}
    Fec := DateOf(dtpFecFin.Date);

    if (gDECIIni <> TRABNRO_DECI.Value) and not DeciValida then Exit;
    if (gOrdenIni <> TRABNRO_ORDEN.Value) and not OrdenValido then Exit;

    {Verifico si la factura ya existe para es mismo proveedor, sin ser el mismo
     trabajo; si es así pide confirmación para seguir}
    if Existe(dmAux.TRAB,'IDPROVEEDOR','NRO_FACT',
       VarArrayOf([TRABIDPROVEEDOR.Value,TRABNRO_FACT.Value])) and
       (dmAux.TRABIDTRABAJO.Value <> gIdTrab) and not
       Confirmar('Esta factura ya existe para este provedor. ¿Desea confirmar?')
       then Exit;

    try
      IdProv := TRABIDPROVEEDOR.Value;
      Costo := TRABCOSTO.Value;
      TRABFECHA_INI.Value := DateOf(DateTimePicker1.Date);
      if chkFin.Checked then TRABFECHA_FIN.Value := Fec;
      TRABTIPO_TRAB.Text := 'D';
      Post;
      Refresh;
      TDIDDEPARTAMENTO.Value := gIdDepto;
      TD.Post;

{      if rgPago.ItemIndex = 1 then
        dmCheques.AgregarCheque(Fec,IdProv,Costo);}
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
                 'datos del trabajo esten completos.');
        if ADB.InTransaction then ADB.Rollback;
        Exit;
      end;
    end;
  end;

  GuardarValorRegistro(Name,'FECHAINI',DateToStr(DateTimePicker1.Date));
  GuardarValorRegistro(Name,'FECHAFIN',DateToStr(dtpFecFin.Date));
  GuardarValorRegistro(Name,'DEPTO',IntToStr(gIdDepto));

  Result := True;
end;

function TfrmTrabajos.DeciValida: Boolean;
begin
  if not Existe(dmDatos.DECI,'NRO_MANT',dmDatos.TRABNRO_DECI.Value) or
     (dmDatos.DECIIDEDIFICIO.Value < 0) then
  begin
    MsjError('Número de DECI inválido');
    Result := False;
  end
  else Result := True;
end;

function TfrmTrabajos.OrdenValido: Boolean;
begin
{  with qryExisteNro do
  begin
    Close;
    ParamByName('D').AsInteger := dmDatos.TRABNRO_DECI.Value;
    ParamByName('N').AsInteger := dmDatos.TRABNRO_ORDEN.Value;
    ParamByName('I').AsInteger := dmDatos.TRABIDTRABAJO.Value;
    Open;
    if RecordCount > 0 then
    begin
      MsjError('Número de orden inválido');
      Result := False;
    end
    else Result := True;
  end;  }
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmTrabajos.Entrada_A_Campo(Sender: TObject);
begin
  if Sender = ComboProv then
    dmDatos.PROV.IndexFieldNames := 'RAZON_SOCIAL'
  else if Sender = ComboRubro then
    dmDatos.CAT.IndexFieldNames := 'DESCRIP';

  EntradaACampo(self,Sender);
end;

procedure TfrmTrabajos.Salida_de_Campo(Sender: TObject);
begin
  if Sender = ComboProv then
    dmDatos.PROV.IndexFieldNames := ''
  else if Sender = ComboRubro then
    dmDatos.CAT.IndexFieldNames := '';

  SalidaDeCampo(self,Sender);
end;

procedure TfrmTrabajos.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmTrabajos.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCosto then
    if (Key = '.') or (Key = ',') then Key := DecimalSeparator;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmTrabajos.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  if not Guardar then Exit;

  if dmDatos.ADB.InTransaction then dmDatos.ADB.Commit;

  ModalResult := mrOk;
end;

procedure TfrmTrabajos.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;

  if Editando(dmDatos.TRAB) then dmDatos.TRAB.Cancel;
  if Editando(dmDatos.TD) then dmDatos.TD.Cancel;

  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;
  ModalResult := mrCancel;
end;

procedure TfrmTrabajos.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmTrabajos.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);

  dmDatos.TRAB.Close;
  dmDatos.TT.Close;
  dmDatos.MU.Close;
  qryTareas.Close;
  qryMU.Close;
end;

procedure TfrmTrabajos.btnBuscarDeptoClick(Sender: TObject);
var
  R: Boolean;
  Id, IdEdif: Integer;
  Desc: String;
begin
  with TfrmElecDepto.Create(nil) do
  begin
    R := getEnt(Id, IdEdif, Desc);
    Release;
  end;

  if not R then Exit;

  edtDepto.Text := Desc;;
  gIdDepto := Id;
end;

procedure TfrmTrabajos.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  if Modo = 0 then
  begin
    if not Guardar then Exit;
    Existe(dmDatos.TRAB,'IDTRABAJO',gIdTrab);
    dmDatos.TRAB.Edit;
    Existe(dmDatos.TD,'IDTRABAJO',gIdTrab);
    dmDatos.TD.Edit;
    Modo := 3;
  end;

  with TfrmElecEnt.Create(nil) do
  begin
    R := getId('TAREA',Id);
    Release;
  end;

  if not R then Exit;

  with dmDatos,TT do
  begin
    try
      Open;
      Append;
      TTIDTRABAJO.Value := gIdTrab;
      TTIDTAREA.Value := Id;
      Post;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar agregar una tarea. ' +
                 'Compruebe que no haya descripciones repetidas.');
        Exit;
      end;
    end;
  end;

  AbrirQryTrabajos;
end;

procedure TfrmTrabajos.btnEliminarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar la tarea elegida?') then Exit;

  with dmDatos,TT do
  begin
    Existe(TT,'IDTRABAJO','IDTAREA',VarArrayOf([gIdTrab,qryTareasIDTAREA.Value]));
    Delete;
  end;

  AbrirQryTrabajos;
end;

procedure TfrmTrabajos.btnBuscarProvClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  with TfrmElecProv.Create(nil) do
  begin
    R := getId(Id,2);
    Release;
  end;

  if not R then Exit;

  dmDatos.TRABIDPROVEEDOR.Value := Id;
  ComboProv.Refresh;
end;

procedure TfrmTrabajos.btnAgregarMatClick(Sender: TObject);
var
  R: Boolean;
  IdMat, IdUni: Integer;
  Cant: Real;
begin
  if Modo = 0 then
  begin
    if not Guardar then Exit;
    Existe(dmDatos.TRAB,'IDTRABAJO',gIdTrab);
    dmDatos.TRAB.Edit;
    Modo := 3;
  end;

  with TfrmIngMat.Create(nil) do
  begin
    R := getMaterial(0,IdMat,Cant,IdUni);
    Release;
  end;

  if not R then Exit;

  try
    with dmDatos,MU do
    begin
      Open;
      Append;
      MUIDTRABAJO.Value := gIdTrab;
      MUIDMATERIAL.Value := IdMat;
      MUCANTIDAD.Value := Cant;
      MUIDUNIDAD.Value := IdUni;
      Post;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar agregar el material. ' +
               'Compruebe que los datos esten completos.');
      Exit;
    end;
  end;

  AbrirQryMateriales;
end;

procedure TfrmTrabajos.btnEliminarMatClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar el material seleccionado?') then Exit;

  Existe(dmDatos.MU,'IDTRABAJO','IDMATERIAL',VarArrayOf([gIdTrab,qryMUIDMATERIAL.Value]));
  dmDatos.MU.Delete;

  AbrirQryMateriales;
end;

procedure TfrmTrabajos.btnModificarMatClick(Sender: TObject);
var
  R: Boolean;
  IdMat, IdUni: Integer;
  Cant: Real;
begin
  IdMat := qryMUIDMATERIAL.Value;
  Cant := qryMUCANTIDAD.Value;
  IdUni := qryMUIDUNIDAD.Value;

  with TfrmIngMat.Create(nil) do
  begin
    R := getMaterial(2,IdMat,Cant,IdUni);
    Release;
  end;

  if not R then Exit;

  try
    with dmDatos,MU do
    begin
      Existe(MU,'IDTRABAJO','IDMATERIAL',VarArrayOf([gIdTrab,qryMUIDMATERIAL.Value]));
      Edit;
      MUIDTRABAJO.Value := gIdTrab;
      MUIDMATERIAL.Value := IdMat;
      MUCANTIDAD.Value := Cant;
      MUIDUNIDAD.Value := IdUni;
      Post;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar el material. ' +
               'Compruebe que los datos esten completos.');
      Exit;
    end;
  end;

  AbrirQryMateriales;
end;

procedure TfrmTrabajos.chkFinClick(Sender: TObject);
begin
  lblFecFin.Enabled := chkFin.Checked;
  dtpFecFin.Enabled := chkFin.Checked;
  if not chkFin.Checked then dmDatos.TRABFECHA_FIN.Clear;
end;

procedure TfrmTrabajos.btnBuscarRubroClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getId('CATEGORIA',Id);
    Release;
  end;

  if not R then Exit;

  dmDatos.TRABIDCATEGORIA.Value := Id;
  ComboRubro.Refresh;
end;

end.
