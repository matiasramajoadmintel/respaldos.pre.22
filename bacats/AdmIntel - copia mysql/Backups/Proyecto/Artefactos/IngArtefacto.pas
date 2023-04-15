unit IngArtefacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, ComCtrls, DB,
  DBTables;

type
  TfrmIngArtefacto = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edtNroSerie: TDBEdit;
    edtModelo: TDBEdit;
    edtMarca: TDBEdit;
    btnElegirEdificio: TBitBtn;
    edtEdificio: TEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label10: TLabel;
    edtDepto: TEdit;
    btnElegirDepto: TBitBtn;
    Label11: TLabel;
    edtTipoArtefacto: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    dtpFechaIni: TDateTimePicker;
    Label2: TLabel;
    dtpFechaFin: TDateTimePicker;
    Database: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    Table3: TTable;
    Table4: TTable;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirEdificioClick(Sender: TObject);
    procedure btnElegirDeptoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    teclas: Byte;
    procedure PrepararForm;
    procedure InsertarFechas;
    { Private declarations }
  public
    function Insertar:Boolean;
    function Actualizar (IdArtefacto:integer):Boolean;
    function Eliminar (IdArtefacto:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngArtefacto: TfrmIngArtefacto;

implementation

uses Tablas, Comunes, Util, ElecEdificio, ElecDepto, ElecTipoArtefacto;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngArtefacto.PrepararForm;
begin
        if Table1.FieldByName('IdEdificio').AsInteger<>0 then
        begin
                Existe (Table2,'IdEdificio',Table1.FieldByName('IdEdificio').AsInteger);
                edtEdificio.Text:=Table2.FieldByName('Descripcion').AsString;
        end
        else
                edtEdificio.Text:='';
        if Table1.FieldByName('IdDepartamento').AsInteger<>0 then
        begin
                Existe (Table3,'IdDepartamento',Table1.FieldByName('IdDepartamento').AsInteger);
                edtDepto.Text:=Table3.FieldByName('Descripcion').AsString;
        end
        else
                edtDepto.Text:='';
        if Table1.FieldByName('IdTipoArtefacto').AsInteger<>0 then
        begin
                Existe (Table4,'IdTipoArtefacto',Table1.FieldByName('IdTipoArtefacto').AsInteger);
                edtTipoArtefacto.Text:=Table4.FieldByName('Descripcion').AsString;
        end
        else
                edtTipoArtefacto.Text:='';
        if Table1.FieldByName('FechaIni').AsDateTime<>0 then
                dtpFechaIni.Date:=Table1.FieldByName('FechaIni').AsDateTime
        else
        begin
                dtpFechaIni.Date:=Date;
                dtpFechaIni.Checked:=false;
        end;
        if Table1.FieldByName('FechaFin').AsDateTime<>0 then
                dtpFechaFin.Date:=Table1.FieldByName('FechaFin').AsDateTime
        else
        begin
                dtpFechaFin.Date:=Date;
                dtpFechaFin.Checked:=false;
        end;
end;

procedure TfrmIngArtefacto.InsertarFechas;
begin
        if not Editando (Table1) then
                Table1.Edit;
        if dtpFechaIni.Checked then
                Table1.FieldByName('FechaIni').AsDateTime:=dtpFechaIni.Date
        else
                Table1.FieldByName('FechaIni').Clear;
        if dtpFechaFin.Checked then
                Table1.FieldByName('FechaFin').AsDateTime:=dtpFechaFin.Date
        else
                Table1.FieldByName('FechaFin').Clear;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngArtefacto.Insertar:Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        PrepararForm;
        ShowModal;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngArtefacto.Actualizar (IdArtefacto:integer):Boolean;
begin
        if not Existe(Table1,'IdArtefacto',IdArtefacto) then
                MsjError('No se encontró el Artefacto')
        else
        begin
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngArtefacto.Eliminar(IdArtefacto:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar el Artefacto elegido?') then
                try
                        Existe (Table1,'IdArtefacto',IdArtefacto);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Artefacto');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngArtefacto.btnAceptarClick(Sender: TObject);
begin
        try
                InsertarFechas;
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Artefacto');
        end;
end;

procedure TfrmIngArtefacto.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblArtefacto;
        DataSource1.DataSet:=dmTablas.tblArtefacto;
        Database:=dmTablas.Database;
        Table2:=dmTablas.tblEdificio;
        Table3:=dmTablas.tblDepartamento;
        Table4:=dmTablas.tblTipoArtefacto;
end;

procedure TfrmIngArtefacto.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngArtefacto.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngArtefacto.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngArtefacto.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngArtefacto.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngArtefacto.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngArtefacto.btnElegirEdificioClick(Sender: TObject);
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

procedure TfrmIngArtefacto.btnElegirDeptoClick(Sender: TObject);
var
        IdDepto:integer;
        Descripcion:String;
begin
        if Table1.FieldByName('IdEdificio').AsInteger<>0 then
                with TfrmElecDepto.Create(nil) do
                begin
                        IdDepto:=GetId(Table1.FieldByName('IdEdificio').AsInteger,Descripcion);
                        if IdDepto<>0 then
                        begin
                                Table1.Edit;
                                Table1.FieldByName('IdDepartamento').AsInteger:=IdDepto;
                                edtDepto.Text:=Descripcion;
                        end;
                        Release;
                end
        else
                MsjError('Primero debe seleccionar un Edificio');
end;

procedure TfrmIngArtefacto.BitBtn1Click(Sender: TObject);
var
        IdTipoArtefacto:integer;
        Descripcion:String;
begin
        with TfrmElecTipoArtefacto.Create(nil) do
        begin
                IdTipoArtefacto:=GetId(Descripcion);
                if IdTipoArtefacto<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdTipoArtefacto').AsInteger:=IdTipoArtefacto;
                        edtTipoArtefacto.Text:=Descripcion;
                end;
                Release;
        end;
end;

end.
 