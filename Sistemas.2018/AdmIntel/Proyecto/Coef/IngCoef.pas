unit IngCoef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables;

type
  TfrmIngCoef = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    edtCantAmb: TDBEdit;
    cmbTipo: TDBComboBox;
    edtPorcentaje: TDBEdit;
    cmbPersonal: TDBComboBox;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    Table1: TTable;
    Database: TDatabase;
    lbl1: TLabel;
    dbedtPorcentaje: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
  private
    teclas: Byte;   
    { Private declarations }
  public
    function Insertar:Boolean;
    function Actualizar (Tipo:string; Personal:string; CantAmb:integer):Boolean;
    function Eliminar (Tipo:string; Personal:string; CantAmb:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngCoef: TfrmIngCoef;

implementation

uses Tablas, Comunes, Util;

{$R *.dfm}

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngCoef.Insertar:Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        ShowModal;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngCoef.Actualizar (Tipo:string; Personal:string; CantAmb:integer):Boolean;
var
        V:Variant;
begin
        V:=VarArrayCreate([0,2],varVariant);
        V[0]:=Tipo;
        V[1]:=Personal;
        V[2]:=CantAmb;
        if not Existe(Table1,'Tipo','Personal','Cant_Amb',V) then
                MsjError('No se encontró el Coeficiente de Alquiler')
        else
        begin
                if not Database.InTransaction then
                        Database.StartTransaction;
                Table1.Edit;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngCoef.Eliminar(Tipo:string; Personal:string; CantAmb:integer):Boolean;
var
        V:Variant;
begin
        V:=VarArrayCreate([0,2],varVariant);
        V[0]:=Tipo;
        V[1]:=Personal;
        V[2]:=CantAmb;
        if Confirmar('¿Está seguro de eliminar el Coeficiente de Alquiler elegido?') then
                try
                        Existe(Table1,'Tipo','Personal','Cant_Amb',V);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Coeficiente de Alquiler');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngCoef.btnAceptarClick(Sender: TObject);
begin
        try
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Coeficiente de Alquiler');
        end;
end;

procedure TfrmIngCoef.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblCoef;
        DataSource1.DataSet:=dmTablas.tblCoef;
        Database:=dmTablas.Database;
        Table1.Open;
end;

procedure TfrmIngCoef.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngCoef.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngCoef.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngCoef.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngCoef.PressEnter(Sender: TObject; var Key: Char);
begin
  if (Sender = edtPorcentaje) and ((Key = ',') or (Key = '.')) then
    Key := DecimalSeparator; 
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;
end;

end.
