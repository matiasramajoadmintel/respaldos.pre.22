unit ElecMed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants;

type
  TfrmElecMed = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Query1Descrip: TStringField;
    qryUpdate: TQuery;
    Panel3: TPanel;
    Query1Abrev: TStringField;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    procedure grdDatosDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Modo: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery;
    Procedure PrepararForm;
    function RetornarClave:Integer;

  public
    function getId(var Id: Integer; var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmElecMed: TfrmElecMed;

implementation

uses Util, Comunes, IngMed, PoolDatos;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecMed.getId(var Id: Integer; var Desc: String): Boolean;
begin
     Result := False;
     Modo := 2;
     PrepararForm;

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := RetornarClave;
       Desc := Query1Abrev.Text;
     end;
end;

Procedure TfrmElecMed.Mostrar;
begin
     Modo := 1;
     PrepararForm;
     btnAgregar.Enabled := True;

     ShowModal;
end;

Procedure TfrmElecMed.Consultar;
begin
     PrepararForm;
     btnAgregar.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecMed.PrepararQuery;
begin
     with Query1 do
     begin
          Open;
          btnEliminar.Enabled := (RecordCount>0);
          btnModificar.Enabled := (RecordCount>0);
          btnElegir.Visible := (RecordCount>0) and (Modo = 2);
     end;
end;

Procedure TfrmElecMed.PrepararForm;
begin
  PrepararQuery;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecMed.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecMed.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmElecMed.btnNuevoClick(Sender: TObject);
var
   Consulta, T1,T2: String;
   R: Boolean;
begin
     T1 := '';
     T2 := '';
     with TfrmIngMed.Create(nil) do
     begin
       R := ObtenerTexto(T1,T2,'Unidades de medida');
       Release;
     end;

     if not R then Exit;

     Consulta := 'INSERT INTO Unidad (Descrip,Abrev) '+
                 'VALUES ('+#39+T1+#39+','+#39+T2+#39+')';
     with  qryUpdate do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Consulta);
          Prepare;
          ExecSQL;
     end;

     Query1.Close;
     Existe(Query1,'Descrip;Abrev',VarArrayOf([T1,T2]));
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (Query1.RecordCount>0) and (Modo = 2);
end;

procedure TfrmElecMed.btnEliminarClick(Sender: TObject);
var
   Consulta: String;
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

     Consulta := 'DELETE FROM Unidad WHERE Descrip=' +
                 #39+Query1Descrip.Text+#39;

     with  qryUpdate do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Consulta);
          Prepare;
          ExecSQL;
     end;

     Query1.Close;
     Query1.Open;
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (Query1.RecordCount>0) and (Modo = 2);
end;

procedure TfrmElecMed.btnModificarClick(Sender: TObject);
var
   Consulta, T1, T2: String;
   R: Boolean;
begin
     T1 := Query1Descrip.Text;
     T2 := Query1Abrev.Text;
     with TfrmIngMed.Create(nil) do
     begin
       R := ObtenerTexto(T1,T2,'Unidades de medida');
       Release;
     end;

     if not R then Exit;


     Consulta := 'UPDATE Unidad SET Descrip =' + #39 + T1 + #39 +
                 ', Abrev =' + #39 + T2 + #39 +
                 ' WHERE Descrip =' + #39 + Query1Descrip.Text + #39;

     with  qryUpdate do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Consulta);
          Prepare;
          ExecSQL;
     end;

     Query1.Close;
     Existe(Query1,'Descrip',T1);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnModificar.Enabled := (Query1.RecordCount>0);
end;

function TfrmElecMed.RetornarClave:Integer;
begin
{}
end;

procedure TfrmElecMed.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecMed.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

end.
