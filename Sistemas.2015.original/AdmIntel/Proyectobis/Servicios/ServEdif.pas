unit ServEdif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants, DateUtils;

type
  TfrmServEdif = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    pnlBotones: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Query1IDEDIFICIO: TIntegerField;
    Query1COSTO: TFloatField;
    Query1DESCRIP: TStringField;
    Query1Edificio: TStringField;
    SERVEDIF: TTable;
    SERVEDIFIDSERVICIO: TIntegerField;
    SERVEDIFIDEDIFICIO: TIntegerField;
    SERVEDIFFECHA_PAGO: TDateTimeField;
    SERVEDIFCOSTO: TFloatField;
    Query1IDSERVICIO: TIntegerField;
    Query1TIPO_PAGO: TStringField;
    Query1NRO_CHEQUE: TStringField;
    SERVEDIFIDPROVEEDOR: TIntegerField;
    Query1IDPROVEEDOR: TIntegerField;
    Query1RAZON_SOCIAL: TStringField;
    SERVEDIFIDSERV_EDIF: TIntegerField;
    Query1PAGADO: TStringField;
    Query1IDSERV_EDIF: TIntegerField;
    Query1VACIOS: TStringField;
    SERVEDIFVACIOS: TStringField;
    Query1FECHA: TDateTimeField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure SERVEDIFNewRecord(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure grdDatosTitleClick(Column: TColumn);

  private
    gModo, Teclas: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    gOrden, gTipoOrden: String;
    gVacios: Boolean;
    gIdServEdif: Longword;
    Procedure PrepararQuery(const Modo: Byte; const Orden: String;
                            const Vacios: Boolean);
    Procedure PrepararForm(const Modo: Byte; const Vacios: Boolean);

  public
    Procedure Mostrar(const Vacios: Boolean);
    Procedure Consultar(const Vacios: Boolean);

  end;

var
  frmServEdif: TfrmServEdif;

implementation

uses Input, Util, Comunes, PoolDatos, PoolAlcaldia, IngServ, PoolCheques,
  StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

Procedure TfrmServEdif.Mostrar(const Vacios: Boolean);
begin
{ACLARACION: FECHA_PAGO no representa la fecha de pago del gasto sino la fecha
 en la que se produce o se carga el gasto. La verdadera fecha de pago se encuentra
 en la tabla PAGOS}

     PrepararForm(1,Vacios);
     PrepararQuery(1,'FECHA_PAGO',Vacios);
     pnlBotones.Visible := True;
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmServEdif.Consultar(const Vacios: Boolean);
begin
     PrepararForm(0,Vacios);
     PrepararQuery(0,'FECHA_PAGO',Vacios);
     pnlBotones.Visible := False;

     ShowModal;

     Query1.Close;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmServEdif.PrepararQuery(const Modo: Byte; const Orden: String;
                                     const Vacios: Boolean);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM VW_SERV_EDIF';

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + #39 + ')';

     if Vacios then
     begin
       if Filtro = '' then Filtro := ' WHERE (VACIOS = ' + #39 + 'Sí' + #39 + ')'
       else Filtro := Filtro + ' AND (VACIOS = ' + #39 + 'Sí' + #39 + ')';
     end
     else
     begin
       if Filtro = '' then Filtro := ' WHERE (VACIOS = ' + #39 + 'No' + #39 + ')'
       else Filtro := Filtro + ' AND (VACIOS = ' + #39 + 'No' + #39 + ')';
     end;

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY ' + Orden);
          Existe(Query1,'IDSERV_EDIF',gIdServEdif);
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
//          First;
     end;
end;

Procedure TfrmServEdif.PrepararForm(const Modo: Byte; const Vacios: Boolean);
begin
     gModo := Modo;
     gOrden := 'FECHA_PAGO';
     gTipoOrden := 'DESC';
     gVacios := Vacios;
     if Vacios then Caption := 'Servicios en deptos. vacios'
     else Caption := 'Servicios en deptos. ocupados';
end;

{***************************  EVENTOS *****************************************}

procedure TfrmServEdif.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmServEdif.btnNuevoClick(Sender: TObject);
var
   Fec: TDateTime;
   IdServ, IdEdif,IdProv: Integer;
   Costo: Currency;
   R: Boolean;
begin
  Fec := Date;
  IdServ := -1;
  IdEdif := -1;
  Costo := 0;
  IdProv := -1;

  with TfrmIngServ.Create(nil) do
  begin
//    R := Ingresar(Fec,IdServ,IdEdif,Costo,IdProv);
    Release;
  end;

  if not R then Exit;

  {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
   agregar para evitar problemas en las comparaciones futuras}
  Fec := DateOf(Fec);

  try
    with  SERVEDIF do
    begin
      Open;
      Append;
      SERVEDIFFECHA_PAGO.Value := Fec;
      SERVEDIFIDSERVICIO.Value := IdServ;
      SERVEDIFIDEDIFICIO.Value := IdEdif;
      SERVEDIFCOSTO.Value := Costo;
      SERVEDIFIDPROVEEDOR.Value := IdProv;
      if gVacios then SERVEDIFVACIOS.Text := 'Sí'
      else SERVEDIFVACIOS.Text := 'No';
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos.');
      SERVEDIF.Cancel;
    end;
  end;

  PrepararQuery(gModo,gOrden,gVacios);
end;

procedure TfrmServEdif.btnEliminarClick(Sender: TObject);
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

  try
    Existe(SERVEDIF,'IDSERV_EDIF',Query1IDSERV_EDIF.Value);
    SERVEDIF.Delete;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no esté siendo usado.');
  end;

  PrepararQuery(gModo,gOrden,gVacios);
end;

procedure TfrmServEdif.btnModificarClick(Sender: TObject);
var
   Fec: TDateTime;
   IdServ, IdEdif, IdProv: Integer;
   Costo: Currency;
   R: Boolean;
begin
  Fec := Query1FECHA.Value;
  IdServ := Query1IDSERVICIO.Value;
  IdEdif := Query1IDEDIFICIO.Value;
  Costo := Query1COSTO.Value;
  IdProv := Query1IDPROVEEDOR.Value;

  with TfrmIngServ.Create(nil) do
  begin
//    R := Ingresar(Fec,IdServ,IdEdif,Costo,IdProv);
    Release;
  end;

  if not R then Exit;

  {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
   agregar para evitar problemas en las comparaciones futuras}
  Fec := DateOf(Fec);

  try
    with  SERVEDIF do
    begin
      Existe(SERVEDIF,'IDSERV_EDIF',Query1IDSERV_EDIF.Value);
      Edit;
      SERVEDIFFECHA_PAGO.Value := Fec;
      SERVEDIFIDSERVICIO.Value := IdServ;
      SERVEDIFIDEDIFICIO.Value := IdEdif;
      SERVEDIFCOSTO.Value := Costo;
      SERVEDIFIDPROVEEDOR.Value := IdProv;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos.');
      SERVEDIF.Cancel;
    end;
  end;

  gIdServEdif := Query1IDSERV_EDIF.Value;
  PrepararQuery(gModo,gOrden,gVacios);
end;

procedure TfrmServEdif.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmServEdif.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmServEdif.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo,gOrden,gVacios);
end;

procedure TfrmServEdif.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmServEdif.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmServEdif.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmServEdif.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmServEdif.SERVEDIFNewRecord(DataSet: TDataSet);
begin
  gIdServEdif := dmStoreProc.getId('IDSERV_EDIF') + 1;
  SERVEDIFIDSERV_EDIF.Value := gIdServEdif;
end;

procedure TfrmServEdif.Query1AfterScroll(DataSet: TDataSet);
begin
  btnModificar.Enabled := (Query1PAGADO.Text = 'No');
  btnEliminar.Enabled := (Query1PAGADO.Text = 'No');
end;

procedure TfrmServEdif.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
  F := Query1.FindField(Column.FieldName);
  if F.FieldKind = fkData then
  begin
    if gTipoOrden = 'ASC' then gTipoOrden := 'DESC'
    else gTipoOrden := 'ASC';
    gOrden := Column.FieldName + ' ' + gTipoOrden;
    PrepararQuery(gModo,gOrden,gVacios);
  end;
end;

end.
