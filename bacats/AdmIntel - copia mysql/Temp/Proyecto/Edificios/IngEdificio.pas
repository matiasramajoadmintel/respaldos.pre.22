unit IngEdificio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, ComCtrls;

type
  TfrmIngEdificio = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Database: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    Table3: TTable;
    StoredProc1: TStoredProc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDescripcion: TDBEdit;
    edtOcupJefe: TEdit;
    btnElegirOcupJefe: TBitBtn;
    edtDireccion: TDBEdit;
    edtJefeMilitar: TEdit;
    btnElegirJefeMilitar: TBitBtn;
    edtEconomo: TEdit;
    btnElegirEconomo: TBitBtn;
    cmbAdmFiscal: TDBComboBox;
    memObservaciones: TDBMemo;
    DBEdit1: TDBEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure PressEnterFloat(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnElegirOcupJefeClick(Sender: TObject);
    procedure btnElegirJefeMilitarClick(Sender: TObject);
    procedure btnElegirEconomoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);

  private
    teclas: Byte;
    EsAlta: Boolean;
    procedure PrepararForm;
    function getId(NombreGen: String): Integer;
    function Guardar: Boolean;

  public
    function Insertar (var IdEdificio:integer):Boolean;
    function Actualizar (IdEdificio:integer):Boolean;
    function Eliminar (IdEdificio:integer):Boolean;

  end;

var
  frmIngEdificio: TfrmIngEdificio;

implementation

uses Tablas, Comunes, Util, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngEdificio.PrepararForm;
begin
        if Table1.FieldByName('IdOcupanteJefe').AsInteger<>0 then
        begin
                Existe (Table3,'IdPersona',Table1.FieldByName('IdOcupanteJefe').AsInteger);
                edtOcupJefe.Text:=Table3.FieldByName('Apellido').AsString + ', ' + Table3.FieldByName('Nombre').AsString;
        end
        else
                edtOcupJefe.Text:='';
        if Table1.FieldByName('JefeMilitar').AsInteger<>0 then
        begin
                Existe (Table3,'IdPersona',Table1.FieldByName('JefeMilitar').AsInteger);
                edtJefeMilitar.Text:=Table3.FieldByName('Apellido').AsString + ', ' + Table3.FieldByName('Nombre').AsString;
        end
        else
                edtJefeMilitar.Text:='';
        if Table1.FieldByName('Economo').AsInteger<>0 then
        begin
                {Existe (Table3,'IdPersona',Table1.FieldByName('JefeMilitar').AsInteger);}
                {edtJefeMilitar.Text:=Table3.FieldByName('Apellido').AsString + ', ' + Table3.FieldByName('Nombre').AsString;}
                edtEconomo.Text:='Ya veremos';
        end
        else
                edtEconomo.Text:='';

        ActiveControl := edtDescripcion;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngEdificio.Insertar(var IdEdificio:integer):Boolean;
begin
        if not Database.InTransaction then
                Database.StartTransaction;
        EsAlta := True;
        Table1.Append;
        PrepararForm;
        ShowModal;
        Table1.Last;
        IdEdificio:=Table1.FieldByName('IdEdificio').AsInteger;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngEdificio.Actualizar (IdEdificio:integer):Boolean;
begin
        if not Existe(Table1,'IdEdificio',IdEdificio) then
                MsjError('No se encontró el Edificio')
        else
        begin
                PrepararForm;
                Table1.Edit;
                pnlTitulo.Caption:=Table1.FieldByName('Descripcion').AsString;
                if not Database.InTransaction then
                        Database.StartTransaction;
                EsAlta := False;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);
end;

function TfrmIngEdificio.Eliminar(IdEdificio:integer):Boolean;
begin
        if Confirmar('¿Está seguro de eliminar el Edificio elegido?') then
                try
                        Existe (Table1,'IdEdificio',IdEdificio);
                        if not Database.InTransaction then
                                Database.StartTransaction;
                        Table1.Delete;
                        if Database.InTransaction then
                                Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Edificio');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

function TfrmIngEdificio.Guardar: Boolean;
begin
        Result := False;
        try
                Limpiar_Edit(cmbAdmFiscal);
                if Editando(Table1) then Table1.Post;
                except on EDatabaseError do
                begin
                        MsjError('Ha ocurrido un error al intentar guardar el Edificio');
                        Exit;
                end;
        end;
        Result := True;
end;


{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngEdificio.btnAceptarClick(Sender: TObject);
begin
  if Guardar then
  begin
    if Database.InTransaction then Database.Commit;
    ModalResult := mrOk;
  end;
end;

procedure TfrmIngEdificio.FormCreate(Sender: TObject);
begin
        Table1:=dmTablas.tblEdificio;
        DataSource1.DataSet:=dmTablas.tblEdificio;
        Database:=dmTablas.Database;
        Table3:=dmTablas.tblPersona;
        Table1.Open;
        Table3.Open;
end;

procedure TfrmIngEdificio.btnCancelarClick(Sender: TObject);
begin
        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;
end;

procedure TfrmIngEdificio.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngEdificio.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngEdificio.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngEdificio.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngEdificio.PressEnterFloat(Sender: TObject; var Key: Char);
begin
        CambioKey(Key);
        PressEnter(Sender,Key);
end;

procedure TfrmIngEdificio.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngEdificio.btnElegirOcupJefeClick(Sender: TObject);
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
                        Table1.FieldByName('IdOcupanteJefe').AsInteger:=IdOcupante;
                        edtOcupJefe.Text:=Ocupante;
                end;
                Release;
        end;
end;

procedure TfrmIngEdificio.btnElegirJefeMilitarClick(Sender: TObject);
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
                        Table1.FieldByName('JefeMilitar').AsInteger:=IdOcupante;
                        edtJefeMilitar.Text:=Ocupante;
                end;
                Release;
        end;
end;

procedure TfrmIngEdificio.btnElegirEconomoClick(Sender: TObject);
begin
        edtEconomo.Text:='Ya veremos';
end;

procedure TfrmIngEdificio.FormDestroy(Sender: TObject);
begin
        Table1.Close;
        Table3.Close;
end;

function TfrmIngEdificio.getId(NombreGen: String): Integer;
begin
  with StoredProc1 do
  begin
    Close;
    ParamByName('NOMBRE_GEN').AsString := NombreGen;
    Prepare;
    ExecProc;
    Result := ParamByName('GENID').AsInteger;
  end;
end;

procedure TfrmIngEdificio.TabSheet2Show(Sender: TObject);
begin
  if EsAlta then
  begin
    if not Guardar then Exit;
    Table1.Edit;
    EsAlta := False;
  end;
end;

end.
