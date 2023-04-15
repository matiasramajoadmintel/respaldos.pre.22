unit ElecTServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecTServ = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Query1IDSERVICIO: TIntegerField;
    Query1DESCRIP: TStringField;
    Query1PRORRATEO: TIntegerField;
    Query1FormaProrrateo: TStringField;
    grdDatos: TDBGrid;
    procedure grdDatosDblClick(Sender: TObject);
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
    procedure Query1CalcFields(DataSet: TDataSet);

  private
    gModo, Teclas: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer): Boolean;
    Function getEnt(var Id: Integer;var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmElecTServ: TfrmElecTServ;

implementation

uses Util, Comunes, StoreProcs, IngTServ;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecTServ.getId(var Id: Integer): Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := Query1IDSERVICIO.Value;
     Query1.Close;
end;

Function TfrmElecTServ.getEnt(var Id:Integer;var Desc:String):Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := Query1IDSERVICIO.Value;
       Desc := Query1Descrip.Text;
     end;
     Query1.Close;
end;

Procedure TfrmElecTServ.Mostrar;
begin
     PrepararForm(1);
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmElecTServ.Consultar;
begin
{     Tabla := T;
     PrepararForm(0);
     btnNuevo.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;

     Query1.Close;}
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecTServ.PrepararQuery(const Modo: Byte);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM SERVICIO';

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + #39 + ')';

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY Descrip');
          Open;
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
          btnElegir.Visible := (Modo=2)and(RecordCount>0);
     end;
end;

Procedure TfrmElecTServ.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecTServ.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecTServ.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmElecTServ.btnNuevoClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmIngTServ.Create(nil) do
  begin
    R := Agregar(Id);
    Release;
  end;

  if R then
  begin
     Query1.Close;
     Existe(Query1,'IDSERVICIO',Id);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
  end;
end;

procedure TfrmElecTServ.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngTServ.Create(nil) do
  begin
    R := Eliminar(Query1IDSERVICIO.Value);
    Release;
  end;

  if R then
  begin
     Query1.Close;
     Query1.Open;
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
  end;
end;

procedure TfrmElecTServ.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  Id := Query1IDSERVICIO.Value;
  with TfrmIngTServ.Create(nil) do
  begin
    R := Modificar(Id);
    Release;
  end;

  if R then
  begin
     Query1.Close;
     Existe(Query1,'IDSERVICIO',Id);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
  end;
end;

procedure TfrmElecTServ.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecTServ.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmElecTServ.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

procedure TfrmElecTServ.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmElecTServ.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmElecTServ.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecTServ.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmElecTServ.Query1CalcFields(DataSet: TDataSet);
begin
  case Query1PRORRATEO.Value of
    1: Query1FormaProrrateo.Text := 'Todos los ocupantes';
    2: Query1FormaProrrateo.Text := 'Viviendas ocupados según sup.';
    3: Query1FormaProrrateo.Text := 'Todos las viviendas según sup.';
    4: Query1FormaProrrateo.Text := 'Pagado por Alcadía';
    5: Query1FormaProrrateo.Text := 'Pagado por el ocupante';
  end;
end;

end.
