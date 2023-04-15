unit IngDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DB, DBTables,
  ComCtrls;

type
  TfrmIngDescuento = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtOcupante: TEdit;
    edtTipoDesc: TEdit;
    btnElegirTipoDesc: TBitBtn;
    btnElegirOcupante: TBitBtn;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    LMes: TLabel;
    LAnio: TLabel;
    Label3: TLabel;
    cmbMes: TDBComboBox;
    DataSource1: TDataSource;
    Table1: TTable;
    Database: TDatabase;
    Table2: TTable;
    Table3: TTable;
    UpDown1: TUpDown;
    edtAnio: TEdit;
    edtMonto: TEdit;
    Query2: TQuery;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirOcupanteClick(Sender: TObject);
    procedure btnElegirTipoDescClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure FormDestroy(Sender: TObject);
  private
    teclas: Byte;
    procedure PrepararForm;
    procedure InsertarFechas;
    { Private declarations }
  public
    function Insertar (var IdDescuento:integer):Boolean;
    function Actualizar (IdDescuento:integer):Boolean;
    function Eliminar (IdDescuento:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngDescuento: TfrmIngDescuento;

implementation

uses Tablas, Comunes, Util, ElecTipoDesc, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngDescuento.PrepararForm;
begin
        if Table1.FieldByName('IdTipoDescuento').AsInteger<>0 then
        begin
                Existe (Table3,'IdTipoDescuento',Table1.FieldByName('IdTipoDescuento').AsInteger);
                edtTipoDesc.Text:=Table3.FieldByName('Descripcion').AsString;
        end
        else
                edtTipoDesc.Text:='';
        if Table1.FieldByName('IdOcupante').AsInteger<>0 then
        begin
                Existe (Table2,'IdPersona',Table1.FieldByName('IdOcupante').AsInteger);
                edtOcupante.Text:=Table2.FieldByName('Apellido').AsString + ', ' + Table2.FieldByName('Nombre').AsString;
        end
        else
                edtOcupante.Text:='';
        if edtMonto.Text='' then
                edtMonto.Text:=Table1.FieldByName('Monto').AsString;
        if Table1.FieldByName('Anio').AsInteger<>0 then
                edtAnio.Text:=Table1.FieldByName('Anio').AsString
        else
                edtAnio.Text:='';
end;

procedure TfrmIngDescuento.InsertarFechas;
begin
        if not Editando (Table1) then
                Table1.Edit;
        if edtAnio.Text<>'' then
                try
                        Table1.FieldByName('Anio').AsInteger:=StrToInt(edtAnio.Text);
                        except on EConvertError do
                                DatabaseError('',nil);
                end
        else
                Table1.FieldByName('Anio').Clear;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngDescuento.Insertar(var IdDescuento:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        PrepararForm;
        ShowModal;
        Table1.Last;
        IdDescuento:=Table1.FieldByName('IdDescuento').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngDescuento.Actualizar (IdDescuento:integer):Boolean;
begin
        if not Existe(Table1,'IdDescuento',IdDescuento) then
                MsjError('No se encontró el Descuento')
        else
        begin
                PrepararForm;
                Table1.Edit;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngDescuento.Eliminar(IdDescuento:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar el Descuento elegido?') then
                try
                        Existe (Table1,'IdDescuento',IdDescuento);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Descuento');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngDescuento.btnAceptarClick(Sender: TObject);
begin
        try
                InsertarFechas;
                Limpiar_Edit(cmbMes);
                if Editando(Table1) then
                begin
                        Table1.Post;
                        Table1.Last;
                        Query2.ParamByName('monto').AsFloat:=StrToFloat(edtMonto.Text);
                        Query2.ParamByName('IdDescuento').AsInteger:=Table1.FieldByName('IdDescuento').AsInteger;
                        Query2.ExecSQL;
                end;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Descuento');
        end;
end;

procedure TfrmIngDescuento.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblDescuento;
        Datasource1.DataSet:=dmTablas.tblDescuento;
        Database:=dmTablas.Database;
        Table3:=dmTablas.tblTipoDescuento;
        Table2:=dmTablas.tblPersona;
        Table1.Open;
        Table2.Open;
        Table3.Open;
end;

procedure TfrmIngDescuento.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngDescuento.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngDescuento.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngDescuento.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngDescuento.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngDescuento.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmIngDescuento.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngDescuento.btnElegirOcupanteClick(Sender: TObject);
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

procedure TfrmIngDescuento.btnElegirTipoDescClick(Sender: TObject);
var
        IdTipoDescuento:integer;
        Descripcion:String;
begin
        with TfrmElecTipoDesc.Create(nil) do
        begin
                IdTipoDescuento:=GetId(Descripcion);
                if IdTipoDescuento<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdTipoDescuento').AsInteger:=IdTipoDescuento;
                        edtTipoDesc.Text:=Descripcion;
                end;
                Release;
        end;
end;

procedure TfrmIngDescuento.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
        if UpDown1.Associate=nil then
                UpDown1.Associate:=edtAnio;
end;

procedure TfrmIngDescuento.FormDestroy(Sender: TObject);
begin
        Table1.Close;
        Table2.Close;
        Table3.Close;
end;

end.
