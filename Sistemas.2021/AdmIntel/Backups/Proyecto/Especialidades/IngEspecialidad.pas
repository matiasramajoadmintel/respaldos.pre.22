unit IngEspecialidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, IBDatabase;

type
  TfrmIngEspecialidad = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    edtDescripcion: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    Database: TDatabase;
    Table1: TTable;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure FormDestroy(Sender: TObject);
  private
    teclas: Byte;
    { Private declarations }
  public
    function Insertar(var IdEspecialidad:integer):Boolean;
    function Actualizar (IdEspecialidad:integer):Boolean;
    function Eliminar (IdEspecialidad:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngEspecialidad: TfrmIngEspecialidad;

implementation

uses Tablas, Comunes, Util;

{$R *.dfm}

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngEspecialidad.Insertar(var IdEspecialidad:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        ShowModal;
        Table1.Last;
        IdEspecialidad:=Table1.FieldByName('IdEspecialidad').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngEspecialidad.Actualizar (IdEspecialidad:integer):Boolean;
begin
        if not Existe(Table1,'IdEspecialidad',IdEspecialidad) then
                MsjError('No se encontró la Especialidad')
        else
        begin
                pnlTitulo.Caption:=Table1.FieldByName('Descripcion').AsString;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngEspecialidad.Eliminar(IdEspecialidad:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar la Especialidad elegida?') then
                try
                        Existe (Table1,'IdEspecialidad',IdEspecialidad);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar la Especialidad');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngEspecialidad.btnAceptarClick(Sender: TObject);
begin
        try
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar la especialidad');
        end;
end;

procedure TfrmIngEspecialidad.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblEspecialidad;
        DataSource1.DataSet:=dmTablas.tblEspecialidad;
        Database:=dmTablas.Database;
        Table1.Open;
end;

procedure TfrmIngEspecialidad.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngEspecialidad.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngEspecialidad.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngEspecialidad.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngEspecialidad.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngEspecialidad.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngEspecialidad.FormDestroy(Sender: TObject);
begin
  Table1.Close;
end;

end.
