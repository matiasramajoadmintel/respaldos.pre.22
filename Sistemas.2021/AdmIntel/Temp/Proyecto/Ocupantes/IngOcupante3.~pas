unit IngOcupante3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables;

type
  TfrmIngOcupante3 = class(TForm)
    pnlTitulo: TPanel;
    pnlDatos: TPanel;
    Label9: TLabel;
    Label4: TLabel;
    edtCategoria: TDBEdit;
    edtLegajo: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAnterior: TBitBtn;
    Label10: TLabel;
    Database: TDatabase;
    Table1: TTable;
    Table2: TTable;
    DataSource1: TDataSource;
    edtSueldo: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure FormDestroy(Sender: TObject);
  private
    gModo, teclas: Byte;
    procedure PrepararForm;

  public
    function Insertar:integer;
    function Actualizar (IdPersona:integer) :integer;
    function Consultar (IdPersona:integer):integer;

  end;

var
  frmIngOcupante3: TfrmIngOcupante3;

implementation

uses Util, Comunes, Tablas;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngOcupante3.PrepararForm;
begin
        if gModo=0 then
                pnlTitulo.Caption:='Ocupante Civil'
        else
                pnlTitulo.Caption:='Ocupante Civil: ' + Table1.FieldByName('Apellido').AsString + ', ' + Table1.FieldByName('Nombre').AsString;

        pnlDatos.Enabled := (gModo <> 3);        
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngOcupante3.Insertar:integer;
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

function TfrmIngOcupante3.Actualizar (IdPersona:integer):integer;
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

function TfrmIngOcupante3.Consultar (IdPersona:integer):integer;
begin
        if not Existe(Table2,'IDPERSONA',IdPersona) then
                MsjError('No se encontró el Ocupante')
        else
        begin
                gModo:=3;
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

procedure TfrmIngOcupante3.btnAceptarClick(Sender: TObject);
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

procedure TfrmIngOcupante3.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblPersona;
        Table2:=dmTablas.tblOcupanteCivil;
        DataSource1.DataSet:=dmTablas.tblOcupanteCivil;
        Database:=dmTablas.Database;
        Table1.Open;
        Table2.Open;;
end;

procedure TfrmIngOcupante3.btnCancelarClick(Sender: TObject);
begin
        if (Editando(Table2)) or (Editando(Table1)) then
        begin
                Table1.Cancel;
                Table2.Cancel;
        end;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngOcupante3.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngOcupante3.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngOcupante3.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngOcupante3.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtSueldo then
    if (Key = ',') or (Key = '.') then Key := DecimalSeparator;

  if key = #13 then
  begin
    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;

procedure TfrmIngOcupante3.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmIngOcupante3.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngOcupante3.FormDestroy(Sender: TObject);
begin
        if modalResult= mrCancel then
        begin
                Table1.Close;
                Table2.Close;
        end;
end;

end.
 