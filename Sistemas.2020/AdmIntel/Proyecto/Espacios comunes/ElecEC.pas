unit ElecEC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecEC = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Query1Descrip: TStringField;
    qryUpdate: TQuery;
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

  private
    Tabla, Titulo: String;
    gModo, Teclas: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);
    function RetornarClave:Integer;

  public
    function getId(const T: String;var Id: Integer): Boolean;
    Function getEnt(const T: String;var Id: Integer;var Desc: String): Boolean;
    Procedure Mostrar(const T: String);
    Procedure Consultar(const T: String);

  end;

var
  frmElecEC: TfrmElecEC;

implementation

uses Input, Util, Comunes, PoolDatos, StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecEC.getId(const T: String;var Id: Integer): Boolean;
begin
     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;
end;

Function TfrmElecEC.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
begin
     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := RetornarClave;
       Desc := Query1Descrip.Text;
     end;
     Query1.Close;
end;

Procedure TfrmElecEC.Mostrar(const T: String);
begin
     Tabla := T;
     PrepararForm(1);
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmElecEC.Consultar(const T: String);
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

Procedure TfrmElecEC.PrepararQuery(const Modo: Byte);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM '+ Tabla;

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + UpperCase(edtDesc.Text) + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + UpperCase(edtDesc.Text) + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + UpperCase(edtDesc.Text) + #39 + ')';

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

Procedure TfrmElecEC.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);

     if Tabla = 'MATERIAL' then Titulo := 'Materiales'
     else if Tabla = 'TAREA' then Titulo := 'Tareas'
     else if Tabla = 'TIPO_ESPACIO' then Titulo := 'Tipos de espacios comunes'
     else if Tabla = 'CATEGORIA' then Titulo := 'Tipos de tareas'
     else if Tabla = 'SERVICIO' then Titulo := 'Tipos de servicio';

     Caption := 'Listado de ' + Titulo;
     grdDatos.Columns[0].Title.Caption := Titulo;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecEC.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecEC.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmElecEC.btnNuevoClick(Sender: TObject);
var
   Consulta, T: String;
begin
     T := '';
     if not IngresarTexto(T,Titulo) then Exit;

     Consulta := 'INSERT INTO '+ Tabla +' (Descrip) VALUES ('+#39+T+#39+')';

  try
    with  qryUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Consulta);
      Prepare;
      ExecSQL;
    end;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos est�n completos y que no hay descripciones repetidas.');
  end;

     Query1.Close;
     Existe(Query1,'Descrip',T);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmElecEC.btnEliminarClick(Sender: TObject);
var
   Consulta: String;
begin
     if not Confirmar('�Esta seguro de eliminar el �tem elegido?') then Exit;

     Consulta := 'DELETE FROM '+ Tabla +' WHERE Descrip=' +
                 #39+Query1Descrip.Text+#39;

  try
    with  qryUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Consulta);
      Prepare;
      ExecSQL;
    end;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no est� siendo uasado.');
  end;

     Query1.Close;
     Query1.Open;
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmElecEC.btnModificarClick(Sender: TObject);
var
   Consulta, T: String;
begin
     T := Query1Descrip.Text;
     if not IngresarTexto(T,Titulo) then Exit;

     Consulta := 'UPDATE ' + Tabla + ' SET Descrip =' + #39 + T + #39 +
                 ' WHERE Descrip =' + #39 + Query1Descrip.Text + #39;

  try
    with  qryUpdate do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Consulta);
      Prepare;
      ExecSQL;
    end;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos est�n completos y que no hay descripciones repetidas.');
  end;

     Query1.Close;
     Existe(Query1,'Descrip',T);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
end;

function TfrmElecEC.RetornarClave:Integer;
begin
  Result := -1;

  with dmStoreProc.spGetId do
  begin
    Close;
    ParamByName('TABLA').AsString := Tabla;
    ParamByName('TEXTO').AsString := Query1Descrip.Text;

    Prepare;
    ExecProc;
    Result := ParamByName('ID').AsInteger;
  end;
end;

procedure TfrmElecEC.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecEC.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmElecEC.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

procedure TfrmElecEC.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmElecEC.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmElecEC.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecEC.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

end.
