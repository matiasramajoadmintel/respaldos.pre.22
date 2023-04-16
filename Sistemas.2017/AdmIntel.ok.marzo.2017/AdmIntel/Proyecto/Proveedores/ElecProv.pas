unit ElecProv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants;

type
  TfrmElecProv = class(TForm)
    qryProv: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Panel3: TPanel;
    edtDesc: TEdit;
    Label1: TLabel;
    btnBuscar: TBitBtn;
    Panel4: TPanel;
    qryProvIDPROVEEDOR: TIntegerField;
    qryProvRAZON_SOCIAL: TStringField;
    qryProvNOMBRE_FANTASIA: TStringField;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel5: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    procedure grdDatosDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure rgVerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure grdDatosTitleClick(Column: TColumn);

  private
    gModo, Teclas: Byte;
    gOrden, gTipoOrden: String;
    Procedure PrepararQuery(const Orden: String);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer;const Modo:Byte): Boolean;
    function get(var Id: Integer; var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmElecProv: TfrmElecProv;

implementation

uses Input, Util, Comunes, Proveedor, PoolDatos, PoolQuerys;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecProv.getId(var Id: Integer; const Modo: Byte): Boolean;
//0: Consulta, 1: Muestra, 2: Eleccion
begin
     Result := False;
     gModo := Modo;
     PrepararForm(Modo);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qryProvIdProveedor.Value;

     qryProv.Close;
end;

function TfrmElecProv.get(var Id: Integer; var Desc: String): Boolean;
//0: Consulta, 1: Muestra, 2: Eleccion
begin
     Result := False;
     gModo := 2;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := qryProvIdProveedor.Value;
       Desc := qryProvRAZON_SOCIAL.Text;
     end;

     qryProv.Close;
end;

Procedure TfrmElecProv.Mostrar;
begin
{     PrepararForm;
     btnNuevo.Enabled := True;

     ShowModal;
     qryProv.Close;}
end;

Procedure TfrmElecProv.Consultar;
begin
{     PrepararForm;
     btnNuevo.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;
     qryProv.Close;}
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecProv.PrepararQuery(const Orden: String);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM PROVEEDOR';

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + '%' + Uppercase(edtDesc.Text) + '%' + #39 + ') OR (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + '%' + Lowercase(edtDesc.Text) + '%' + #39 + ') OR (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 //'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                 //'NOMBRE_FANTASIA LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                 //'NOMBRE_FANTASIA LIKE ' + #39 + '%' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 //'NOMBRE_FANTASIA LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                 'NOMBRE_FANTASIA LIKE ' + #39 + '%' + Uppercase(edtDesc.Text) + '%' +  #39 + ')';
// aca tenemos que agregar domicilio para hacerlo bien!!!
//seria algo asi
//'DOMICILIO LIKE ' + #39 + '%' + Uppercase(edtDesc.Text) + '%' +  #39 + ')';


     with qryProv do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY ' + Orden);
          Open;
          btnAgregar.Enabled := (gModo<>0);
          btnEliminar.Enabled := (gModo<>0)and(RecordCount>0);
          btnModificar.Enabled := (gModo<>0)and(RecordCount>0);
          btnElegir.Visible := (gModo=2)and(RecordCount>0);
     end;
     grdDatos.Refresh;
end;

Procedure TfrmElecProv.PrepararForm(const Modo: Byte);
begin
  edtDesc.Text := '';
  gOrden := 'RAZON_SOCIAL';
  gTipoOrden := 'ASC';  
  rgVerClick(nil);
  grdDatos.Refresh;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecProv.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecProv.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gOrden);
end;

procedure TfrmElecProv.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Longint;
begin
  with TfrmProv.Create(nil) do
  begin
    R := Actualizar(0,-1);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Id := dmQuerys.GetMaxIntValue('PROVEEDOR','IDPROVEEDOR');
    Existe(qryProv,'IDPROVEEDOR',Id);
  end;
end;

procedure TfrmElecProv.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Longint;
begin
  Id := qryProvIDPROVEEDOR.Value;
  with TfrmProv.Create(nil) do
  begin
    R := Actualizar(2,qryProvIdProveedor.Value);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(qryProv,'IDPROVEEDOR',Id);
  end;
end;

procedure TfrmElecProv.btnEliminarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar el proveedor elegido?') then Exit;

  try
    Existe(dmDatos.PROV,'IDPROVEEDOR',qryProvIDPROVEEDOR.Value);
    dmDatos.PROV.Delete;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el proveedor. ' +
               'Compruebe que no haya sido utilizado.');
      Exit;
    end;
  end;

  PrepararQuery(gOrden);
end;

procedure TfrmElecProv.rgVerClick(Sender: TObject);
begin
  PrepararQuery(gOrden);
end;

procedure TfrmElecProv.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecProv.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmElecProv.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmElecProv.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmElecProv.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecProv.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmElecProv.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
  F := qryProv.FindField(Column.FieldName);
  if F.FieldKind = fkData then
  begin
    if gTipoOrden = 'ASC' then gTipoOrden := 'DESC'
    else gTipoOrden := 'ASC';
    gOrden := Column.FieldName + ' ' + gTipoOrden;
    PrepararQuery(gOrden);
  end;
end;

end.
