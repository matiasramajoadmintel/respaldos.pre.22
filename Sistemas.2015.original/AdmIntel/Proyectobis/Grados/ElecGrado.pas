unit ElecGrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, DBTables;

type
  TfrmElecGrado = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel4: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    dsGrado: TDataSource;
    qryGrados: TQuery;
    qryGradosIDGRADO: TIntegerField;
    qryGradosDESCRIPCION: TStringField;
    qryGradosABREVIATURA: TStringField;
    qryGradosTIEMPO_MINIMO: TIntegerField;
    qryGradosCOD201: TFloatField;
    qryGradosCOD209: TFloatField;
    qryGradosORDEN: TIntegerField;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);

  private
    gModo: Byte;
    gOrden, gTipoOrden: String;
    Procedure PrepararForm(const Modo: Byte);
    procedure PrepararQuery (Orden: String);

  public
    procedure Mostrar;
    function GetId(var Id: Byte): Boolean;
    function GetEnt(var Id: Byte; var Descrip: String): Boolean;

  end;

var
  frmElecGrado: TfrmElecGrado;

implementation

uses IngGrado, Comunes;

{$R *.dfm}

procedure TfrmElecGrado.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecGrado.GetId(var Id: Byte): Boolean;
begin
     Result := False;
     gModo:=2;
     PrepararQuery (gOrden);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qryGradosIDGRADO.Value;
     
end;

function TfrmElecGrado.GetEnt(var Id: Byte; var Descrip: String): Boolean;
begin
     Result := False;
     gModo:=2;
     PrepararQuery (gOrden);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := qryGradosIDGRADO.Value;
       Descrip := qryGradosDESCRIPCION.Text;
     end;

end;

Procedure TfrmElecGrado.PrepararForm(const Modo: Byte);
begin
     btnAgregar.Enabled := (Modo<>0);
     btnEliminar.Enabled := (Modo<>0)and(qryGrados.RecordCount>0);
     btnModificar.Enabled := (Modo<>0)and(qryGrados.RecordCount>0);
     btnElegir.Visible := (Modo=2)and(qryGrados.RecordCount>0);
end;

procedure TfrmElecGrado.PrepararQuery(Orden:String);
var
        Script,Filtro: String;
begin
        Script:='SELECT * FROM GRADO';
        Filtro:='';
        if edtDesc.Text<>'' then
                Filtro:='WHERE (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + edtDesc.Text + #39 + ')';
        with qryGrados do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                SQL.Add(Filtro);
                SQL.Add('ORDER BY ' + Orden);
                Open;
        end;
        PrepararForm (gModo);
end;

procedure TfrmElecGrado.btnAgregarClick(Sender: TObject);
var
  IdGrado: Byte;
  R: Boolean;
begin
  with TfrmIngGrado.Create(nil) do
  begin
    R := Agregar(IdGrado);
    Release;
  end;

  if R then
  begin
   PrepararQuery (gOrden);
   Existe(qryGrados,'IDGRADO',IdGrado);
  end;
end;

procedure TfrmElecGrado.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngGrado.Create(nil) do
  begin
    R := Eliminar(qryGradosIDGRADO.Value);
    Release;
  end;

  if R then
        PrepararQuery (gOrden);
end;

procedure TfrmElecGrado.btnModificarClick(Sender: TObject);
var
  IdGrado: Byte;
  R: Boolean;
begin
  IdGrado := qryGradosIDGRADO.Value;

  with TfrmIngGrado.Create(nil) do
  begin
    R := Modificar(IdGrado);
    Release;
  end;

  if R then
  begin
   PrepararQuery (gOrden);
   Existe(qryGrados,'IDGRADO',IdGrado);
  end;
end;

procedure TfrmElecGrado.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
        F := qryGrados.FindField(Column.FieldName);
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

procedure TfrmElecGrado.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Orden ' + gTipoOrden;
end;

procedure TfrmElecGrado.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecGrado.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecGrado.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecGrado.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

end.
