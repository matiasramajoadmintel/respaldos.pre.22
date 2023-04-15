unit IngTipoArtefacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables;

type
  TfrmIngTipoArtefacto = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    edtDescripcion: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Database: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
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
    function Insertar (IdTipoArtefacto:integer):Boolean;
    function Actualizar (IdTipoArtefacto:integer):Boolean;
    function Eliminar (IdTipoArtefacto:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngTipoArtefacto: TfrmIngTipoArtefacto;

implementation

uses Tablas, Comunes, Util;

{$R *.dfm}

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngTipoArtefacto.Insertar(IdTipoArtefacto:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        ShowModal;
        IdTipoArtefacto:=Table1.FieldByName('IdTipoArtefacto').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngTipoArtefacto.Actualizar (IdTipoArtefacto:integer):Boolean;
begin
        if not Existe(Table1,'IdTipoArtefacto',IdTipoArtefacto) then
                MsjError('No se encontró el Tipo de Artefacto')
        else
        begin
                pnlTitulo.Caption:=Table1.FieldByName('Descripcion').AsString;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngTipoArtefacto.Eliminar(IdTipoArtefacto:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar el Tipo de Artefacto elegido?') then
                try
                        Existe (Table1,'IdTipoArtefacto',IdTipoArtefacto);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Tipo de Artefacto');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngTipoArtefacto.btnAceptarClick(Sender: TObject);
begin
        try
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Tipo de Artefacto');
        end;
end;

procedure TfrmIngTipoArtefacto.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblTipoArtefacto;
        DataSource1.DataSet:=dmTablas.tblTipoArtefacto;
        Database:=dmTablas.Database;
        Table1.Open;
end;

procedure TfrmIngTipoArtefacto.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngTipoArtefacto.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngTipoArtefacto.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngTipoArtefacto.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngTipoArtefacto.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngTipoArtefacto.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngTipoArtefacto.FormDestroy(Sender: TObject);
begin
        Table1.Close;
end;

end.
