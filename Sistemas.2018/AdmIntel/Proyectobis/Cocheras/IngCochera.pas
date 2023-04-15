Unit IngCochera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables;

type
  TfrmIngCochera = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edtCoeficiente: TDBEdit;
    edtDescripcion: TDBEdit;
    btnElegirEdificio: TBitBtn;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edtEdificio: TEdit;
    edtOcupante: TEdit;
    btnElegirOcupante: TBitBtn;
    Database: TDatabase;
    DataSource1: TDataSource;
    Table1: TTable;
    Table2: TTable;
    Table3: TTable;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirEdificioClick(Sender: TObject);
    procedure btnElegirOcupanteClick(Sender: TObject);
  private
    teclas: Byte;
    procedure PrepararForm;
    { Private declarations }
  public
    function Insertar:Boolean;
    function Actualizar (IdEdificio:integer; IdCochera:integer):Boolean;
    function Eliminar (IdEdificio:integer; IdCochera:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngCochera: TfrmIngCochera;

implementation

uses Tablas, Comunes, Util, ElecEdificio, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngCochera.PrepararForm;
begin
        if Table1.FieldByName('IdEdificio').AsInteger<>0 then
        begin
                Existe (Table2,'IdEdificio',Table1.FieldByName('IdEdificio').AsInteger);
                edtEdificio.Text:=Table2.FieldByName('Descripcion').AsString;
        end
        else
                edtEdificio.Text:='';
        if Table1.FieldByName('IdOcupante').AsInteger<>0 then
        begin
                Existe (Table3,'IdPersona',Table1.FieldByName('IdOcupante').AsInteger);
                edtOcupante.Text:=Table3.FieldByName('Apellido').AsString + ', ' + Table3.FieldByName('Nombre').AsString;
        end
        else
                edtOcupante.Text:='';
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngCochera.Insertar:Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        PrepararForm;
        ShowModal;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngCochera.Actualizar (IdEdificio:integer; IdCochera:integer):Boolean;
var
        V:Variant;
begin
        V:=VarArrayCreate([0,1],varInteger);
        V[0]:=IdEdificio;
        V[1]:=IdCochera;
        if not Existe(Table1,'IdEdificio','IdCochera',V) then
                MsjError('No se encontró la Cochera')
        else
        begin
                PrepararForm;
                pnlTitulo.Caption:=Table1.FieldByName('Descripcion').AsString;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngCochera.Eliminar(IdEdificio:integer; IdCochera:integer):Boolean;
var
        V:Variant;
begin
        V:=VarArrayCreate([0,1],varInteger);
        V[0]:=IdEdificio;
        V[1]:=IdCochera;
        if Confirmar('¿Está seguro de eliminar la Cochera elegida?') then
                try
                        Existe(Table1,'IdEdificio','IdCochera',V);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar la Cochera');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngCochera.btnAceptarClick(Sender: TObject);
begin
        try
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar la Cochera');
        end;
end;

procedure TfrmIngCochera.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblCochera;
        DataSource1.DataSet:=dmTablas.tblCochera;
        Database:=dmTablas.Database;
        Table2:=dmTablas.tblEdificio;
        Table3:=dmTablas.tblPersona;
end;

procedure TfrmIngCochera.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngCochera.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngCochera.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngCochera.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngCochera.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngCochera.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngCochera.btnElegirEdificioClick(Sender: TObject);
var
        IdEdificio:integer;
        Descripcion:String;
begin
        with TfrmElecEdificio.Create(nil) do
        begin
                IdEdificio:=GetId(Descripcion);
                if IdEdificio<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdEdificio').AsInteger:=IdEdificio;
                        edtEdificio.Text:=Descripcion;
                end;
                Release;
        end;
end;

procedure TfrmIngCochera.btnElegirOcupanteClick(Sender: TObject);
var
        IdOcupante:integer;
        Ocupante:String;
begin
        with TfrmElecOcupante.Create(nil) do
        begin
                IdOcupante:=GetId(Ocupante);
                if IdOcupante<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdOcupante').AsInteger:=IdOcupante;
                        edtOcupante.Text:=Ocupante;
                end;
                Release;
        end;
end;

end.
 