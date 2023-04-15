unit ElecTarea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecTarea = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Query1Descrip: TStringField;
    qryUpdate: TQuery;
    Panel3: TPanel;
    btnNuevo: TButton;
    btnEliminar: TButton;
    btnModificar: TButton;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    Panel4: TPanel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    Tabla, Titulo: String;
    gModo: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);
    function RetornarClave:Integer;

  public
    function getId(const T: String;var Id: Integer): Boolean;
    Function getEnt(const T: String;var Id: Real;var Desc: String): Boolean;
    Procedure Mostrar(const T: String);
    Procedure Consultar(const T: String);

  end;

var
  frmElecTarea: TfrmElecTarea;

implementation

uses Input, Util, Comunes, PoolDatos, StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecTarea.getId(const T: String;var Id: Integer): Boolean;
begin
     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;
end;

Function TfrmElecTarea.getEnt(const T:String;var Id:Real;var Desc:String):Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          Id := RetornarClave;
          Desc := Query1Descrip.Text;
     end;
     Query1.Close;}
end;

Procedure TfrmElecTarea.Mostrar(const T: String);
begin
     Tabla := T;
     PrepararForm(1);
     btnNuevo.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmElecTarea.Consultar(const T: String);
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

Procedure TfrmElecTarea.PrepararQuery(const Modo: Byte);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM '+ Tabla;

     Filtro := '';
     if Edit1.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + Edit1.Text + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + Edit1.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + Edit1.Text + ' %' + #39 + ')';

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY Descrip');
          Open;
          btnNuevo.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
          btnElegir.Visible := (Modo=2)and(RecordCount>0);
     end;
end;

Procedure TfrmElecTarea.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);

     if Tabla = 'MATERIAL' then Titulo := 'Materiales'
     else if Tabla = 'TAREA' then Titulo := 'Tareas';
     Caption := 'Listado de ' + Titulo;
     DBGrid1.Columns[0].Title.Caption := Titulo;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecTarea.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecTarea.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmElecTarea.btnNuevoClick(Sender: TObject);
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
               'datos están completos y que no hay descripciones repetidas.');
  end;

     Query1.Close;
     Existe(Query1,'Descrip',T);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmElecTarea.btnEliminarClick(Sender: TObject);
var
   Consulta: String;
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

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
               'dato que desea eliminar no esté siendo uasado.');
  end;

     Query1.Close;
     Query1.Open;
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmElecTarea.btnModificarClick(Sender: TObject);
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
               'datos están completos y que no hay descripciones repetidas.');
  end;

     Query1.Close;
     Existe(Query1,'Descrip',T);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
end;

function TfrmElecTarea.RetornarClave:Integer;
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

procedure TfrmElecTarea.BitBtn1Click(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

end.
