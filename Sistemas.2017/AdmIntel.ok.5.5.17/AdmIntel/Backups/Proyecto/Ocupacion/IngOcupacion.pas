unit IngOcupacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, ComCtrls, DB,
  DBTables;

type
  TfrmIngOcupacion = class(TForm)
    pnlDatos: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edtDepto: TEdit;
    btnElegirDepto: TBitBtn;
    Label3: TLabel;
    edtOcupante: TEdit;
    btnElegirOcupante: TBitBtn;
    dtpFechaIni: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    dtpFechaFin: TDateTimePicker;
    Label6: TLabel;
    dtpFechaRetiro: TDateTimePicker;
    Database: TDatabase;
    Table1: TTable;
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
    procedure btnElegirEdificioClick(Sender: TObject);
    procedure btnElegirDeptoClick(Sender: TObject);
    procedure btnElegirOcupanteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    teclas, gModo: Byte;
    procedure PrepararForm;
    procedure InsertarFechas;

  public
    function Insertar(var IdOcupacion:integer):Boolean;
    function Actualizar (IdOcupacion:integer):Boolean;
    function Eliminar (IdOcupacion:integer):Boolean;
    function Consultar (IdOcupacion:integer):Boolean;

  end;

var
  frmIngOcupacion: TfrmIngOcupacion;

implementation

uses Tablas, Comunes, Util, ElecEdificio, ElecOcupante, ElecDeptoVacio;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngOcupacion.PrepararForm;
begin
        if Table1.FieldByName('IdEdificio').AsInteger<>0 then
        begin
                Existe (Table2,'IdEdificio',Table1.FieldByName('IdEdificio').AsInteger);
        end;
        if Table1.FieldByName('IdDepartamento').AsInteger<>0 then
        begin
                Existe (Table3,'IdDepartamento',Table1.FieldByName('IdDepartamento').AsInteger);
                edtDepto.Text := Table2.FieldByName('Descripcion').AsString +
                                 ' ' +Table3.FieldByName('Descripcion').AsString;
        end
        else
                edtDepto.Text:='';
        if Table1.FieldByName('IdOcupante').AsInteger<>0 then
        begin
                Existe (Table4,'IdPersona',Table1.FieldByName('IdOcupante').AsInteger);
                edtOcupante.Text:=Table4.FieldByName('Apellido').AsString + ', ' + Table4.FieldByName('Nombre').AsString;
        end
        else
                edtOcupante.Text:='';
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
        if Table1.FieldByName('FechaRetiro').AsDateTime<>0 then
                dtpFechaRetiro.Date:=Table1.FieldByName('FechaIni').AsDateTime
        else
        begin
                dtpFechaRetiro.Date:=Date;
                dtpFechaRetiro.Checked:=false;
        end;

        pnlDatos.Enabled := (gModo <> 3);
end;

procedure TfrmIngOcupacion.InsertarFechas;
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
        if dtpFechaRetiro.Checked then
                Table1.FieldByName('FechaRetiro').AsDateTime:=dtpFechaRetiro.Date
        else
                Table1.FieldByName('FechaRetiro').Clear;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngOcupacion.Insertar(var IdOcupacion:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        gModo := 0;
        Table1.Append;
        PrepararForm;
        ShowModal;
        Table1.Last;
        IdOcupacion:=Table1.FieldByName('IdOcupacion').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngOcupacion.Actualizar (IdOcupacion:integer):Boolean;
begin
        if not Existe(Table1,'IdOcupacion',IdOcupacion) then
                MsjError('No se encontró la Ocupación')
        else
        begin
                gModo := 2;
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngOcupacion.Consultar (IdOcupacion:integer):Boolean;
begin
        if not Existe(Table1,'IdOcupacion',IdOcupacion) then
                MsjError('No se encontró la Ocupación')
        else
        begin
                gModo := 3;
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngOcupacion.Eliminar(IdOcupacion:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar la Ocupacion elegida?') then
                try
                        Existe (Table1,'IdOcupacion',IdOcupacion);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar la Ocupacion');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngOcupacion.btnAceptarClick(Sender: TObject);
begin
        try
                InsertarFechas;
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar la Ocupacion');
        end;
end;

procedure TfrmIngOcupacion.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblOcupacion;
        Database:=dmTablas.Database;
        Table2:=dmTablas.tblEdificio;
        Table3:=dmTablas.tblDepartamento;
        Table4:=dmTablas.tblPersona;
        Table1.Open;
        Table2.Open;
        Table3.Open;
        Table4.Open;
end;

procedure TfrmIngOcupacion.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngOcupacion.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngOcupacion.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngOcupacion.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngOcupacion.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngOcupacion.btnElegirEdificioClick(Sender: TObject);
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
                end;
                Release;
        end;
end;

procedure TfrmIngOcupacion.btnElegirDeptoClick(Sender: TObject);
var
        IdDepto, IdEdif:integer;
        Descripcion:String;
        R: Boolean;
begin
  with TfrmElecDeptoVacio.Create(nil) do
  begin
    R := getEnt(IdDepto, IdEdif, Descripcion);
    Release;
  end;

                        if R then
                        begin
                                Table1.Edit;
                                Table1.FieldByName('IdDepartamento').AsInteger:=IdDepto;
                                Table1.FieldByName('IdEdificio').AsInteger:=IdEdif;
                                edtDepto.Text:=Descripcion;
                        end;

end;

procedure TfrmIngOcupacion.btnElegirOcupanteClick(Sender: TObject);
var
        IdOcupante:integer;
        Ocupante:String;
begin
        with TfrmElecOcupante.Create(nil) do
        begin
                IdOcupante:=GetId(Ocupante,1);
                if IdOcupante<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdOcupante').AsInteger:=IdOcupante;
                        edtOcupante.Text:=Ocupante;
                end;
                Release;
        end;
end;

procedure TfrmIngOcupacion.FormDestroy(Sender: TObject);
begin
        Table1.Close;
        Table2.Close;
        Table3.Close;
        Table4.Close;
end;

end.
