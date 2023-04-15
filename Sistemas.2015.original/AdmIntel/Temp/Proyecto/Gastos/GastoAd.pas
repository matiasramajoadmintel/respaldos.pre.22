unit GastoAd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants, DateUtils;

type
  TfrmGastoAd = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    pnlBotones: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    GASTO: TTable;
    GASTOFECHA_PAGO: TDateTimeField;
    GASTOCOSTO: TFloatField;
    GASTOIDTIPO_GASTO_AD: TIntegerField;
    GASTOIDPROVEEDOR: TIntegerField;
    Query1COSTO: TFloatField;
    Query1DESCRIP: TStringField;
    Query1IDTIPO_GASTO_AD: TIntegerField;
    Query1TIPO_PAGO: TStringField;
    Query1NRO_CHEQUE: TStringField;
    Query1IDPROVEEDOR: TIntegerField;
    Query1RAZON_SOCIAL: TStringField;
    GASTOPAGADO: TStringField;
    GASTOIDGASTO_AD: TIntegerField;
    Query1PAGADO: TStringField;
    Query1IDGASTO_AD: TIntegerField;
    Query1FECHA: TDateTimeField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure GASTONewRecord(DataSet: TDataSet);
    procedure Query1AfterScroll(DataSet: TDataSet);
    procedure grdDatosTitleClick(Column: TColumn);

  private
    gModo, Teclas: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    gOrden, gTipoOrden: String;
    Procedure PrepararQuery(const Modo: Byte; const Orden: String);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(const T: String;var Id: Integer): Boolean;
    Function getEnt(const T: String;var Id: Integer;var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmGastoAd: TfrmGastoAd;

implementation

uses Input, Util, Comunes, PoolDatos, IngGastoAd, PoolCheques,
  StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmGastoAd.getId(const T: String;var Id: Integer): Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;}
end;

Function TfrmGastoAd.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := RetornarClave;
       Desc := Query1Descrip.Text;
     end;
     Query1.Close;}
end;

Procedure TfrmGastoAd.Mostrar;
begin
     PrepararForm(1);
     pnlBotones.Visible := True;
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmGastoAd.Consultar;
begin
     PrepararForm(0);
     pnlBotones.Visible := False;

     ShowModal;

     Query1.Close;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmGastoAd.PrepararQuery(const Modo: Byte; const Orden: String);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM VW_GASTO_AD';

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'RAZON_SOCIAL LIKE ' + #39 + edtDesc.Text + #39 + ')';

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY ' + Orden);
          Open;
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
          First;
     end;
end;

Procedure TfrmGastoAd.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     gOrden := 'FECHA_PAGO';
     gTipoOrden := 'DESC';
     PrepararQuery(Modo,'FECHA_PAGO');
end;

{***************************  EVENTOS *****************************************}

procedure TfrmGastoAd.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmGastoAd.btnNuevoClick(Sender: TObject);
var
   R: Boolean;
begin
  with TfrmIngGastoAd.Create(nil) do
  begin
//    R := Agregar;
    Release;
  end;

  if R then PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoAd.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngGastoAd.Create(nil) do
  begin
    R := Eliminar(Query1IDGASTO_AD.Value);
    Release;
  end;

  if R then PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoAd.btnModificarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngGastoAd.Create(nil) do
  begin
    R := Modificar(Query1IDGASTO_AD.Value);
    Release;
  end;

  if R then PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoAd.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmGastoAd.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmGastoAd.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoAd.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmGastoAd.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmGastoAd.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmGastoAd.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmGastoAd.GASTONewRecord(DataSet: TDataSet);
begin
  GASTOIDGASTO_AD.Value := dmStoreProc.getId('IDGASTO_AD') + 1;
end;

procedure TfrmGastoAd.Query1AfterScroll(DataSet: TDataSet);
begin
  btnModificar.Enabled := (Query1PAGADO.Text = 'No');
  btnEliminar.Enabled := (Query1PAGADO.Text = 'No');
end;

procedure TfrmGastoAd.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then gTipoOrden := 'DESC'
  else gTipoOrden := 'ASC';
  gOrden := Column.FieldName + ' ' + gTipoOrden;
  PrepararQuery(gModo,gOrden);
end;

end.
