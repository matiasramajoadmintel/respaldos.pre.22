unit ElecTipoDesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecTipoDesc = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    DataSource1: TDataSource;
    Query1: TQuery;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Query1IDTIPODESCUENTO: TIntegerField;
    Query1CODDESC: TIntegerField;
    Query1OPERACION: TStringField;
    Query1TIPOPAGO: TStringField;
    Query1DESCRIPCION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
  private
    gTipoOrden, gOrden: String;
    gModo:Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);
    { Private declarations }
  public
    procedure Mostrar;
    function GetId(var Descripcion:String): integer;
    { Public declarations }
  end;

var
  frmElecTipoDesc: TfrmElecTipoDesc;

implementation

uses Comunes, Tablas, IngTipoDesc;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecTipoDesc.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecTipoDesc.PrepararQuery (Orden:String);
var
        Script,Filtro: String;
begin
        Script:='SELECT * FROM TIPO_DESCUENTO';
        Filtro:='';
        if edtDesc.Text<>'' then
                if (AnsiPos('ñ',edtDesc.Text)=0) and (AnsiPos('Ñ',edtDesc.Text)=0) then
                        Filtro:='WHERE (' +
                                'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                                'CodDesc LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                                'CodDesc LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                                'CodDesc LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                                'CodDesc LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + edtDesc.Text + #39 + ')'
                else
                        Filtro:='WHERE (' +
                                'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                                'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                                'TipoPago LIKE ' + #39 + edtDesc.Text + #39 + ')';
        with Query1 do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                SQL.Add(Filtro);
                SQL.Add('ORDER BY ' + Orden);
                Open;
        end;
        PrepararForm;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecTipoDesc.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecTipoDesc.GetId(var Descripcion:String):integer;
begin
        gModo:=2;
        PrepararQuery (gOrden);
        ShowModal;
        if ModalResult=mrOk then
        begin
                Descripcion:=Query1Descripcion.Value;
                Result:=Query1IdTipoDescuento.Value;
        end
        else
                Result:=0;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecTipoDesc.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Descripcion ' + gTipoOrden;
end;

procedure TfrmElecTipoDesc.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecTipoDesc.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdTipoDescuento:integer;
begin
        with TfrmIngTipoDesc.Create(nil) do
        begin
                R:=Insertar(IdTipoDescuento);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdTipoDescuento',IdTipoDescuento);
        end;
end;

procedure TfrmElecTipoDesc.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngTipoDesc.Create(nil) do
        begin
                R:=Eliminar(Query1IdTipoDescuento.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecTipoDesc.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdTipoDescuento:integer;
begin
        IdTipoDescuento:=Query1IdTipoDescuento.Value;
        with TfrmIngTipoDesc.Create(nil) do
        begin
                R:=Actualizar(IdTipoDescuento);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdTipoDescuento',IdTipoDescuento);
        end;
end;

procedure TfrmElecTipoDesc.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
        F := Query1.FindField(Column.FieldName);
        if F.FieldKind = fkData then
        begin
                if gTipoOrden = 'ASC' then
                        gTipoOrden := 'DESC'
                else
                        gTipoOrden := 'ASC';
                gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden);
        end;
end;

procedure TfrmElecTipoDesc.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecTipoDesc.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecTipoDesc.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
 