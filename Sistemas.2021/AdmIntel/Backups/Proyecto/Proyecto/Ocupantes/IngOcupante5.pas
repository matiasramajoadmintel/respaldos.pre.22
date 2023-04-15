unit IngOcupante5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables;

type
  TfrmIngOcupante5 = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    edtParentezco: TDBEdit;
    edtGarante: TEdit;
    btnElegirGarante: TBitBtn;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAnterior: TBitBtn;
    Table4: TTable;
    Database: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    edtCostoAlq: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirGaranteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    gModo, teclas: Byte;
    procedure PrepararForm;
    { Private declarations }
  public
    function Insertar:integer;
    function Actualizar (IdPersona:integer) :integer;
    { Public declarations }
  end;

var
  frmIngOcupante5: TfrmIngOcupante5;

implementation

uses Util, Comunes, Tablas, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngOcupante5.PrepararForm;
var
        Estado: TDataSetState;
begin
        if Table2.FieldByName('IdGarante').AsInteger<>0 then
        begin
                Existe (Table4,'IdPersona',Table2.FieldByName('IdGarante').AsInteger);
                edtGarante.Text:=Table4.FieldByName('Apellido').AsString + ', ' + Table4.FieldByName('Nombre').AsString;
        end
        else
                edtGarante.Text:='';
        if gModo=0 then
                pnlTitulo.Caption:='Ocupante Particular'
        else
                pnlTitulo.Caption:='Ocupante Particular: ' + Table1.FieldByName('Apellido').AsString + ', ' + Table1.FieldByName('Nombre').AsString;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngOcupante5.Insertar:integer;
begin
        gModo:=0;
        if not Database.InTransaction then
                Database.StartTransaction;
        if not Editando(Table2) then
                Table2.Append;
        PrepararForm;
        ShowModal;
        case ModalResult of
                mrOk: Result:=1;
                mrCancel: Result:=2;
        else
                Result:=3;
        end;
end;

function TfrmIngOcupante5.Actualizar (IdPersona:integer):integer;
begin
        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontró el Ocupante')
        else
        begin
                gModo:=1;
                Table2.Edit;
                PrepararForm;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        case ModalResult of
        mrOk: Result:=1;
        mrCancel: Result:=2;
        else
                Result:=3;
        end;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngOcupante5.btnAceptarClick(Sender: TObject);
begin
        try
                if Editando(Table1) then
                begin
                        Table1.Post;
                        if gModo=0 then
                        begin
                                Table1.Last;
                                Table2.FieldByName('IDPERSONA').AsInteger:=Table1.FieldByName('IdPersona').AsInteger;
                        end;
                        if Editando(Table2) then Table2.Post;
                end
                else
                        if Editando (Table2) then Table2.Post;

                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Ocupante');
        end;
end;

procedure TfrmIngOcupante5.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblPersona;
        Table2:=dmTablas.tblOcupanteParticular;
        Table4:=dmTablas.tblPersona2;
        DataSource1.DataSet:=dmTablas.tblOcupanteParticular;
        Database:=dmTablas.Database;
        Table1.Open;
        Table2.Open;;
        Table4.Open;
end;

procedure TfrmIngOcupante5.btnCancelarClick(Sender: TObject);
begin
        if (Editando(Table2)) or (Editando(Table1)) then
        begin
                Table1.Cancel;
                Table2.Cancel;
        end;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngOcupante5.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngOcupante5.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngOcupante5.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngOcupante5.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCostoAlq then
    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;

  if key = #13 then
  begin
    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;

procedure TfrmIngOcupante5.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmIngOcupante5.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngOcupante5.btnElegirGaranteClick(Sender: TObject);
var
        IdOcupante:integer;
        Ocupante:String;
begin
        with TfrmElecOcupante.Create(nil) do
        begin
                IdOcupante:=GetId(Ocupante,2);
                if IdOcupante<>0 then
                begin
                        Table2.Edit;
                        Table2.FieldByName('IdGarante').AsInteger:=IdOcupante;
                        edtGarante.Text:=Ocupante;
                end;
                Release;
        end;
end;

procedure TfrmIngOcupante5.FormDestroy(Sender: TObject);
begin
        if modalResult= mrCancel then
        begin
                Table1.Close;
                Table2.Close;;
                Table4.Close;
        end;
end;

end.
 