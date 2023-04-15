unit TrabEdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Mask, DBCtrls, DateUtils;

type
  TfrmTrabEdi = class(TForm)
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
    btnConfigEC: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    lblFecFin: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnBuscarProv: TSpeedButton;
    DBEdit2: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    dtpFecFin: TDateTimePicker;
    edtCosto: TDBEdit;
    ComboProv: TDBLookupComboBox;
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
    Label7: TLabel;
    ComboEdi: TComboBox;
    ComboEC: TComboBox;
    TabSheet1: TTabSheet;
    btnAgregar: TSpeedButton;
    DBGrid1: TDBGrid;
    btnEliminar: TSpeedButton;
    ComboRubro: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    chkFin: TCheckBox;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Q: TQuery;
    qryExisteNro: TQuery;
    pnlBottom: TPanel;
    lblEstado: TLabel;
    Bevel1: TBevel;
    edtDECI: TDBEdit;
    edtOrden: TDBEdit;
    lblOrden: TLabel;
    lblDECI: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfigECClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnBuscarProvClick(Sender: TObject);
    procedure btnAgregarMatClick(Sender: TObject);
    procedure btnEliminarMatClick(Sender: TObject);
    procedure btnModificarMatClick(Sender: TObject);
    procedure ComboEdiClick(Sender: TObject);
    procedure ComboECClick(Sender: TObject);
    procedure chkFinClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdTrab, gIdEdif, gIdTEC, gDECIIni, gOrdenIni: Integer;
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
  frmTrabEdi: TfrmTrabEdi;

implementation

uses Comunes, Util, PoolDatos, ElecDepto, ElecEnt, StoreProcs, ElecProv,
  IngMat, PoolQuerys, PoolAux, ConfigEC;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmTrabEdi.Mostrar(const M: Byte; const IdTrab: Integer): Boolean;
begin
  Modo := M;
  PrepararFormulario(M,IdTrab);

  ShowModal;

  Result := (ModalResult = mrOk);
  qryTareas.Close;
  qryMU.Close;
end;

function TfrmTrabEdi.Eliminar(const Id: Longword): Boolean;
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
      BajaSQL('TRAB_EDIF','IDTRABAJO='+IntToStr(Id),Q);
      BajaSQL('TRABAJO','IDTRABAJO='+IntToStr(Id),Q);
      Result := True;
    end;
  end;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmTrabEdi.PrepararFormulario(const M: Byte; const IdTrab: Integer);
var
  F: String;
begin
  F := RecuperarValorRegistro(Name,'FECHAINI');
  if F = 'Sin nombre' then DateTimePicker1.Date := Date - 7
  else DateTimePicker1.Date := StrToDate(F);

  F := RecuperarValorRegistro(Name,'FECHAFIN');
  if F = 'Sin nombre' then dtpFecFin.Date := Date
  else dtpFecFin.Date := StrToDate(F);

  F := RecuperarValorRegistro(Name,'EDIF');

  CargarListaCampo(ComboEdi,dmDatos.qryEdificios,'Descripcion');

  with dmDatos,TRAB do
  begin
    if not ADB.Connected then ADB.Open;
    if not ADB.InTransaction then ADB.StartTransaction;
    if M = 0 then  //Alta
    begin
      TRAB.Open;
      TRAB.Append;
      TRABIMPUTACION.Text := '01';

      TE.Open;
      TE.Append;
      gIdTrab := dmStoreProc.getId('IDTRABAJO') + 1;
      TEIDTRABAJO.Value := gIdTrab;
      if F <> 'Sin nombre' then
      begin
        TEIDEDIFICIO.Value := StrToInt(F);
        gIdEdif := TEIDEDIFICIO.Value;
        Existe(qryEdificios,'IdEdificio',gIdEdif);
        ComboEdi.Text := qryEdificiosDESCRIPCION.Text;
        ComboEdiClick(nil);
      end
      else
      begin
        ComboEdi.Text := '';
        gIdEdif := -1;
      end;
      gIdTEC := -1;

      btnEliminarMat.Enabled := False;
      btnModificarMat.Enabled := False;
      btnEliminar.Enabled := False;

      lblEstado.Caption := '';
    end
    else
    begin
      Existe(TRAB,'IDTRABAJO',IdTrab);
      gIdTrab := IdTrab;
      DateTimePicker1.Date := TRABFECHA_INI.Value;
      if TRABFECHA_FIN.IsNull then dtpFecFin.Date := Date
      else dtpFecFin.Date := TRABFECHA_FIN.Value;
      AbrirQryTrabajos;
      AbrirQryMateriales;
      Existe(TE,'IDTRABAJO',TRABIDTRABAJO.Value);
      gIdEdif := TEIDEDIFICIO.Value;
      Existe(qryEdificios,'IdEdificio',TEIDEDIFICIO.Value);
      ComboEdi.Text := qryEdificiosDESCRIPCION.Text;
      ComboEdiClick(nil);
      gIdTEC := TEIDTIPO_ESPACIO.Value;
      Existe(dmDatos.TESP,'IDTIPO_ESPACIO',gIdTEC);
      ComboEC.Text := dmDatos.TESPDESCRIP.Text;

      if TRABPAGADO.Value  = 'Sí' then
      begin
        Existe(PAGO,'IDPAGO',TRABIDPAGO.Value);
        if PAGOTIPO_PAGO.Text = 'E' then
          lblEstado.Caption := 'Pagado en efectivo'
        else if PAGOTIPO_PAGO.Text = 'C' then
          lblEstado.Caption := 'Pagado con cheque Nº ' + PAGONRO_CHEQUE.Text
        else
          lblEstado.Caption := 'Pagado por CUTE';
      end
      else
      begin
        lblEstado.Caption := 'Pendiente de pago';
        tsDatos.Enabled := True;
      end;
      TRAB.Edit;
      TE.Edit;
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

procedure TfrmTrabEdi.AbrirQryTrabajos;
begin
  with qryTareas do
  begin
    Close;
    ParamByName('N').AsInteger := gIdTrab;
    Open;
    btnEliminar.Enabled := (RecordCount > 0);
  end;
end;

procedure TfrmTrabEdi.AbrirQryMateriales;
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

function TfrmTrabEdi.DatosValidos: Boolean;
begin
  Result := False;

  if dmDatos.TRABIDCATEGORIA.IsNull then
  begin
    MsjError('Falta asignar un rubro al trabajo');
    Exit;
  end;

  Result := True;
end;

function TfrmTrabEdi.Guardar: Boolean;
var
  Fec: TDateTime;
  IdProv: Integer;
  Costo: Currency;
begin
  Result := False;
  with dmDatos do
  begin
    if ComboEC.Text = '' then
    begin
      MsjError('Falta elegir el espacio común');
      Exit;
    end;

    {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
     agregar para evitar problemas en las comparaciones futuras}
    Fec := DateOf(dtpFecFin.Date);

    if (gDECIIni <> TRABNRO_DECI.Value) and not DeciValida then Exit;
    if (gOrdenIni <> TRABNRO_ORDEN.Value) and not OrdenValido then Exit;    

    {Verifico si la factura ya existe para es mismo proveedor, sin ser el mismo
     trabajo; si es así pide confirmación para seguir}
    if Existe(dmAux.TRAB,'IDPROVEEDOR','NRO_FACT',
       VarArrayOf([TRABIDPROVEEDOR.Value,TRABNRO_FACT.Text])) and
       (dmAux.TRABIDTRABAJO.Value <> gIdTrab) and not
       Confirmar('Esta factura ya existe para este provedor. ¿Desea confirmar?')
       then Exit;

    try
      IdProv := TRABIDPROVEEDOR.Value;
      Costo := TRABCOSTO.Value;
      TRABFECHA_INI.Value := DateOf(DateTimePicker1.Date);
      if chkFin.Checked then TRABFECHA_FIN.Value := dtpFecFin.Date;
      TRABTIPO_TRAB.Text := 'E';
      TRAB.Post;
      TRAB.Refresh;

      TEIDEDIFICIO.Value := gIdEdif;
      TEIDTIPO_ESPACIO.Value := gIdTEC;
      TE.Post;

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
  GuardarValorRegistro(Name,'EDIF',IntToStr(gIdEdif));

  Result := True;
end;

function TfrmTrabEdi.DeciValida: Boolean;
begin
  if not Existe(dmDatos.DECI,'NRO_MANT',dmDatos.TRABNRO_DECI.Value) or
     (dmDatos.DECIIDEDIFICIO.Value < 0) then
  begin
    MsjError('Número de DECI inválido');
    Result := False;
  end
  else Result := True;
end;

function TfrmTrabEdi.OrdenValido: Boolean;
begin
{  with qryExisteNro do
  begin
    Close;
    ParamByName('N').AsInteger := dmDatos.TRABNRO_ORDEN.Value;
    ParamByName('I').AsInteger := dmDatos.TRABIDTRABAJO.Value;
    Open;
    if RecordCount > 0 then
    begin
      MsjError('Número de orden inválido');
      Result := False;
    end
    else Result := True;
  end;}
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmTrabEdi.Entrada_A_Campo(Sender: TObject);
begin
  if Sender = ComboProv then
    dmDatos.PROV.IndexFieldNames := 'RAZON_SOCIAL'
  else if Sender = ComboRubro then
    dmDatos.CAT.IndexFieldNames := 'DESCRIP';

  EntradaACampo(self,Sender);
end;

procedure TfrmTrabEdi.Salida_de_Campo(Sender: TObject);
begin
  if Sender = ComboProv then
    dmDatos.PROV.IndexFieldNames := ''
  else if Sender = ComboRubro then
    dmDatos.CAT.IndexFieldNames := '';

  SalidaDeCampo(self,Sender);
end;

procedure TfrmTrabEdi.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmTrabEdi.PressEnter(Sender: TObject; var Key: Char);
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

procedure TfrmTrabEdi.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  if not Guardar then Exit;

  if dmDatos.ADB.InTransaction then dmDatos.ADB.Commit;

  ModalResult := mrOk;
end;

procedure TfrmTrabEdi.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;

  if Editando(dmDatos.TRAB) then dmDatos.TRAB.Cancel;
  if Editando(dmDatos.TE) then dmDatos.TE.Cancel;

  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;
  ModalResult := mrCancel;
end;

procedure TfrmTrabEdi.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmTrabEdi.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);

  dmDatos.TRAB.Close;
  dmDatos.TT.Close;
  dmDatos.MU.Close;
  qryTareas.Close;
  qryMU.Close;
end;

procedure TfrmTrabEdi.btnConfigECClick(Sender: TObject);
var
  Desc: String;
begin
  if gIdEdif <> -1 then
  begin
    Existe(dmDatos.EDIF,'IDEDIFICIO',gIdEdif);
    with TfrmConfigEC.Create(nil) do
    begin
      Configurar(gIdEdif,dmDatos.EDIFDESCRIPCION.Text);
      Release;
    end;

    ComboEdiClick(nil);
  end;
end;

procedure TfrmTrabEdi.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  if Modo = 0 then
  begin
    if not Guardar then Exit;
    Existe(dmDatos.TRAB,'IDTRABAJO',gIdTrab);
    dmDatos.TRAB.Edit;
    Existe(dmDatos.TE,'IDTRABAJO',gIdTrab);
    dmDatos.TE.Edit;
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

procedure TfrmTrabEdi.btnEliminarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar la tarea elegida?') then Exit;

  with dmDatos,TT do
  begin
    Existe(TT,'IDTRABAJO','IDTAREA',VarArrayOf([gIdTrab,qryTareasIDTAREA.Value]));
    Delete;
  end;

  AbrirQryTrabajos;
end;

procedure TfrmTrabEdi.btnBuscarProvClick(Sender: TObject);
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

procedure TfrmTrabEdi.btnAgregarMatClick(Sender: TObject);
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

procedure TfrmTrabEdi.btnEliminarMatClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar el material seleccionado?') then Exit;

  Existe(dmDatos.MU,'IDTRABAJO','IDMATERIAL',VarArrayOf([gIdTrab,qryMUIDMATERIAL.Value]));
  dmDatos.MU.Delete;

  AbrirQryMateriales;
end;

procedure TfrmTrabEdi.btnModificarMatClick(Sender: TObject);
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

procedure TfrmTrabEdi.ComboEdiClick(Sender: TObject);
begin
  if Existe(dmDatos.qryEdificios,'Descripcion',ComboEdi.Text) then
  begin
    gIdEdif := dmDatos.qryEdificiosIdEdificio.Value;

    with dmQuerys,qryEC do
    begin
      Close;
      ParamByName('N').AsInteger := gIdEdif;
      Open;
      CargarListaCampo(ComboEC,qryEC,'DESCRIP');
    end;
  end;
end;

procedure TfrmTrabEdi.ComboECClick(Sender: TObject);
begin
  Existe(dmDatos.TESP,'DESCRIP',ComboEC.Text);
  gIdTEC := dmDatos.TESPIDTIPO_ESPACIO.Value;
end;

procedure TfrmTrabEdi.chkFinClick(Sender: TObject);
begin
  lblFecFin.Enabled := chkFin.Checked;
  dtpFecFin.Enabled := chkFin.Checked;
  if not chkFin.Checked then dmDatos.TRABFECHA_FIN.Clear;
end;

procedure TfrmTrabEdi.SpeedButton1Click(Sender: TObject);
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
