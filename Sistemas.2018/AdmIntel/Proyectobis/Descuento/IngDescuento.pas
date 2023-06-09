unit IngDescuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, DB, DBTables,
  ComCtrls;

type
  TfrmIngDescuento = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    LMes: TLabel;
    LAnio: TLabel;
    Label3: TLabel;
    cmbMes: TDBComboBox;
    dsDESC: TDataSource;
    DESC: TTable;
    PERS: TTable;
    TDESC: TTable;
    UpDown1: TUpDown;
    edtAnio: TEdit;
    DESCIDDESCUENTO: TIntegerField;
    DESCIDOCUPANTE: TIntegerField;
    DESCIDTIPODESCUENTO: TIntegerField;
    DESCMES: TStringField;
    DESCANIO: TIntegerField;
    DESCMONTO: TFloatField;
    DESCNRO_FACT: TIntegerField;
    PERSIDPERSONA: TIntegerField;
    PERSNOMBRE: TStringField;
    PERSAPELLIDO: TStringField;
    PERSOcupante: TStringField;
    DESCOcupante: TStringField;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    TDESCIDTIPODESCUENTO: TIntegerField;
    TDESCDESCRIPCION: TStringField;
    DESCTipoDescuento: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    btnBuscarServ: TSpeedButton;
    SpeedButton1: TSpeedButton;
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
    procedure PERSCalcFields(DataSet: TDataSet);

  private
    teclas: Byte;
    procedure PrepararForm(Modo: Byte);
    procedure InsertarFechas;

  public
    function Agregar(var IdDescuento:Longword):Boolean;
    function Actualizar (IdDescuento:integer):Boolean;
    function Eliminar (IdDescuento:integer):Boolean;

  end;

var
  frmIngDescuento: TfrmIngDescuento;

implementation

uses Tablas, Comunes, Util, ElecTipoDesc, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngDescuento.PrepararForm(Modo: Byte);
begin
  if Modo = 0 then
    UpDown1.Position := CurrentYear;
end;

procedure TfrmIngDescuento.InsertarFechas;
begin
{        if not Editando (Table1) then
                Table1.Edit;
        if edtAnio.Text<>'' then
                try
                        Table1.FieldByName('Anio').AsInteger:=StrToInt(edtAnio.Text);
                        except on EConvertError do
                                DatabaseError('',nil);
                end
        else
                Table1.FieldByName('Anio').Clear;}
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngDescuento.Agregar(var IdDescuento: Longword):Boolean;
begin
  DESC.Open;
  DESC.Append;
  PrepararForm(0);

  ShowModal;

  DESC.Last;
  IdDescuento := DESCIDDESCUENTO.Value;

  Result:=(ModalResult=mrOk);
end;

function TfrmIngDescuento.Actualizar (IdDescuento:integer):Boolean;
begin
{        if not Existe(Table1,'IdDescuento',IdDescuento) then
                MsjError('No se encontr� el Descuento')
        else
        begin
                PrepararForm;
                Table1.Edit;
                if not Database.InTransaction then
                        Database.StartTransaction;
                ShowModal;
        end;
        Result:=(ModalResult=mrOk);}
end;

function TfrmIngDescuento.Eliminar(IdDescuento:integer):Boolean;
begin
{        if Confirmar('�Est� seguro de eliminar el Descuento elegido?') then
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
                Result:=false;}
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngDescuento.btnAceptarClick(Sender: TObject);
begin
  try
    if Editando(DESC) then
    begin
      DESCANIO.Value := UpDown1.Position;
      DESC.Post;
    end;

    ModalResult:=mrOk;
    except on EDatabaseError do
      MsjError('Ha ocurrido un error al intentar guardar el Descuento');
  end;
end;

procedure TfrmIngDescuento.FormCreate(Sender: TObject);
begin
{        Table1:=dmTablas.tblDescuento;
        Datasource1.DataSet:=dmTablas.tblDescuento;
        Database:=dmTablas.Database;
        Table3:=dmTablas.tblTipoDescuento;
        Table2:=dmTablas.tblPersona;
        Table1.Open;
        Table2.Open;
        Table3.Open;}
end;

procedure TfrmIngDescuento.btnCancelarClick(Sender: TObject);
begin
{        if Editando(Table1) then
                Table1.Cancel;
        if Database.InTransaction then
                Database.Rollback;}
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
{        with TfrmElecOcupante.Create(nil) do
        begin
                IdOcupante:=GetId(Ocupante,1);
                if IdOcupante<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdOcupante').AsInteger:=IdOcupante;
                        edtOcupante.Text:=Ocupante;
                end;
                Release;
        end;}
end;

procedure TfrmIngDescuento.btnElegirTipoDescClick(Sender: TObject);
var
        IdTipoDescuento:integer;
        Descripcion:String;
begin
{        with TfrmElecTipoDesc.Create(nil) do
        begin
                IdTipoDescuento:=GetId(Descripcion);
                if IdTipoDescuento<>0 then
                begin
                        Table1.Edit;
                        Table1.FieldByName('IdTipoDescuento').AsInteger:=IdTipoDescuento;
                        edtTipoDesc.Text:=Descripcion;
                end;
                Release;
        end;}
end;

procedure TfrmIngDescuento.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
        if UpDown1.Associate=nil then
                UpDown1.Associate:=edtAnio;
end;

procedure TfrmIngDescuento.PERSCalcFields(DataSet: TDataSet);
begin
  PERSOcupante.Text := PERSAPELLIDO.Text + ', ' + PERSNOMBRE.Text;
end;

end.
