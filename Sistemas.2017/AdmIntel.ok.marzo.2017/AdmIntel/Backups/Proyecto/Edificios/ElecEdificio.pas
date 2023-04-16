unit ElecEdificio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, DBTables;

type
  TfrmElecEdificio = class(TForm)
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
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query1IDEDIFICIO: TIntegerField;
    Query1IDOCUPANTEJEFE: TIntegerField;
    Query1DIRECCION: TStringField;
    Query1ADMFISCAL: TStringField;
    Query1OBSERVACIONES: TStringField;
    Query1DESCRIPCION: TStringField;
    Query1JEFEMILITAR: TIntegerField;
    Query1ECONOMO: TIntegerField;
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
    gModo, gPersonal:Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);
    { Private declarations }
  public
    procedure Mostrar;
    function GetId(var Descripcion:String): integer; overload;
    function GetId(Personal: Byte): Integer; overload;
    { Public declarations }
  end;

var
  frmElecEdificio: TfrmElecEdificio;

implementation

uses Comunes, Tablas, IngEdificio;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecEdificio.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecEdificio.PrepararQuery (Orden:String);
var
  Script, Filtro, FiltroDesc, FiltroJerarquia: String;
begin
        Script:='SELECT * FROM EDIFICIO ';
        Filtro:='';
        FiltroDesc := '';
        FiltroJerarquia := '';
        if edtDesc.Text<>'' then
                FiltroDesc:='(' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                        'Direccion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Direccion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Direccion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Direccion LIKE ' + #39 + edtDesc.Text + #39 + ')';

        if gPersonal <> 0 then
          FiltroJerarquia := 'EDIFICIO.IDEDIFICIO = EDIFICIO_TIPO_PERSONAL.IDEDIFICIO ' +
                             'AND EDIFICIO_TIPO_PERSONAL.ID_TIPO_PERSONAL = ' + IntToStr(gPersonal);

        if FiltroDesc <> '' then
          Filtro := 'WHERE ' + FiltroDesc;

        if FiltroJerarquia <> '' then
        begin
          if Filtro = '' then
            Filtro := 'WHERE ' + FiltroJerarquia
          else
            Filtro := Filtro + ' AND ' + FiltroJerarquia;
          Script := Script + ', EDIFICIO_TIPO_PERSONAL'; 
        end;

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

procedure TfrmElecEdificio.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecEdificio.GetId(var Descripcion:String):integer;
begin
        gModo:=2;
        PrepararQuery (gOrden);
        ShowModal;
        if ModalResult=mrOk then
        begin
                Descripcion:=Query1Descripcion.Value;
                Result:=Query1IdEdificio.Value;
        end
        else
                Result:=0;
end;

function TfrmElecEdificio.GetId(Personal: Byte): Integer;
begin
  gPersonal := Personal;
  gModo := 2;
  PrepararQuery(gOrden);
  ShowModal;
  if ModalResult = mrOk then
    Result := Query1IDEDIFICIO.Value
  else
    Result := 0;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecEdificio.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Descripcion ' + gTipoOrden;
        gPersonal:= 0;
end;

procedure TfrmElecEdificio.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecEdificio.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdEdificio:integer;
begin
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Insertar(IdEdificio);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdEdificio',IdEdificio);
        end;
end;

procedure TfrmElecEdificio.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Eliminar(Query1IdEdificio.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecEdificio.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdEdificio:integer;
begin
        IdEdificio:=Query1IdEdificio.Value;
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Actualizar(IdEdificio);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdEdificio',IdEdificio);
        end;
end;

procedure TfrmElecEdificio.grdDatosTitleClick(Column: TColumn);
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

procedure TfrmElecEdificio.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecEdificio.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecEdificio.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
