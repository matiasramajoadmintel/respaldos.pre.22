unit IngTipoDesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables;

type
  TfrmIngTipoDesc = class(TForm)
    pnlTitulo: TPanel;
    Panel1: TPanel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtCodDescuento: TDBEdit;
    cmbOperacion: TDBComboBox;
    edtDescripcion: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Database: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    cmbTipoPago: TDBComboBox;
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
    function Insertar (var IdTipoDescuento:integer):Boolean;
    function Actualizar (IdTipoDescuento:integer):Boolean;
    function Eliminar (IdTipoDescuento:integer):Boolean;
    { Public declarations }
  end;

var
  frmIngTipoDesc: TfrmIngTipoDesc;

implementation

uses Tablas, Comunes, Util;

{$R *.dfm}

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngTipoDesc.Insertar(var IdTipoDescuento:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        Table1.Append;
        ShowModal;
        Table1.Last;
        IdTipoDescuento:=Table1.FieldByName('IdTipoDescuento').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngTipoDesc.Actualizar (IdTipoDescuento:integer):Boolean;
begin
        if not Existe(Table1,'IdTipoDescuento',IdTipoDescuento) then
                MsjError('No se encontró el Tipo de Descuento')
        else
        begin
                pnlTitulo.Caption:=Table1.FieldByName('Descripcion').AsString;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngTipoDesc.Eliminar(IdTipoDescuento:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar el Tipo de Descuento elegido?') then
                try
                        Existe (Table1,'IdTipoDescuento',IdTipoDescuento);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Tipo de Descuento');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngTipoDesc.btnAceptarClick(Sender: TObject);
begin
        try
                Limpiar_Edit(cmbTipoPago);
                if Editando(Table1) then
                        Table1.Post;
                if Database.InTransaction then
                        Database.Commit;
                ModalResult:=mrOk;
                except on EDatabaseError do
                        MsjError('Ha ocurrido un error al intentar guardar el Tipo de Descuento');
        end;
end;

procedure TfrmIngTipoDesc.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblTipoDescuento;
        DataSource1.DataSet:=dmTablas.tblTipoDescuento;
        Database:=dmTablas.Database;
        Table1.Open;
end;

procedure TfrmIngTipoDesc.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngTipoDesc.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngTipoDesc.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngTipoDesc.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngTipoDesc.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngTipoDesc.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngTipoDesc.FormDestroy(Sender: TObject);
begin
        Table1.Close;
end;

end.
