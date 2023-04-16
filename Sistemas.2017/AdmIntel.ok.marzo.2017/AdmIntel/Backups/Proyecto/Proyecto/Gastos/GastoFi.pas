unit GastoFi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants, DateUtils;

type
  TfrmGastoFi = class(TForm)
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
    Query1FECHA_PAGO: TDateTimeField;
    Query1COSTO: TFloatField;
    Query1DESCRIP: TStringField;
    Query1IDTIPO_GASTO_FI: TIntegerField;
    GASTOIDTIPO_GASTO_FI: TIntegerField;
    GASTOFECHA_PAGO: TDateTimeField;
    GASTOCOSTO: TFloatField;
    Query1NRO_HOJA: TIntegerField;
    GASTONRO_HOJA: TIntegerField;
    Query1IDGASTO_FI: TIntegerField;
    GASTOIDGASTO_FI: TIntegerField;
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
    procedure grdDatosTitleClick(Column: TColumn);
    procedure GASTONewRecord(DataSet: TDataSet);

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
  frmGastoFi: TfrmGastoFi;

implementation

uses Input, Util, Comunes, PoolDatos, PoolAlcaldia, IngGastoFi, StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmGastoFi.getId(const T: String;var Id: Integer): Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;}
end;

Function TfrmGastoFi.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
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

Procedure TfrmGastoFi.Mostrar;
begin
     PrepararForm(1);
     pnlBotones.Visible := True;
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmGastoFi.Consultar;
begin
     PrepararForm(0);
     pnlBotones.Visible := False;

     ShowModal;

     Query1.Close;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmGastoFi.PrepararQuery(const Modo: Byte; const Orden: String);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM VW_GASTO_FI';

     Filtro := '';
     if edtDesc.Text <> ''  then
       Filtro := 'WHERE (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + '% ' + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + ' %' + #39 + ') OR (' +
                 'Descrip LIKE ' + #39 + edtDesc.Text + #39 + ')';

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
     end;
end;

Procedure TfrmGastoFi.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     gOrden := 'FECHA_PAGO';
     gTipoOrden := 'DESC';     
     PrepararQuery(Modo,'FECHA_PAGO');
end;

{***************************  EVENTOS *****************************************}

procedure TfrmGastoFi.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmGastoFi.btnNuevoClick(Sender: TObject);
var
   Fec: TDateTime;
   IdServ: Integer;
   Costo: Currency;
   Hoja: Word;
   R: Boolean;
begin
  Fec := Date;
  IdServ := -1;
  Costo := 0;
  Hoja := 0;

  with TfrmIngGastoFi.Create(nil) do
  begin
//    R := Ingresar(Fec,IdServ,Costo,Hoja);
    Release;
  end;

  if not R then Exit;

  try
    with  GASTO do
    begin
      Open;
      Append;
      GASTOFECHA_PAGO.Value := DateOf(Fec);
      GASTOIDTIPO_GASTO_FI.Value := IdServ;
      GASTOCOSTO.Value := Costo;
      GASTONRO_HOJA.Value := Hoja;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos y que no hay descripciones repetidas.');
  end;

  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoFi.btnEliminarClick(Sender: TObject);
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

  try
    Existe(GASTO,'IDGASTO_FI',Query1IDGASTO_FI.Value);
    GASTO.Delete;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no esté siendo uasado.');
  end;

  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoFi.btnModificarClick(Sender: TObject);
var
   Fec: TDateTime;
   IdServ: Integer;
   Costo: Currency;
   Hoja: Word;
   R: Boolean;
   TPago: Char;
   NCheque: String;
begin
  Fec := Query1FECHA_PAGO.Value;
  IdServ := Query1IDTIPO_GASTO_FI.Value;
  Costo := Query1COSTO.Value;
  Hoja := Query1NRO_HOJA.Value;

  with TfrmIngGastoFi.Create(nil) do
  begin
//    R := Ingresar(Fec,IdServ,Costo,Hoja);
    Release;
  end;

  if not R then Exit;

  try
    with  GASTO do
    begin
      Existe(GASTO,'IDGASTO_FI',Query1IDGASTO_FI.Value);
      Edit;
      GASTOFECHA_PAGO.Value := DateOf(Fec);
      GASTOIDTIPO_GASTO_FI.Value := IdServ;
      GASTOCOSTO.Value := Costo;
      GASTONRO_HOJA.Value := Hoja;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos y que no hay descripciones repetidas.');
  end;

  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoFi.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmGastoFi.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmGastoFi.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoFi.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmGastoFi.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmGastoFi.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmGastoFi.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmGastoFi.grdDatosTitleClick(Column: TColumn);
begin
  if gTipoOrden = 'ASC' then gTipoOrden := 'DESC'
  else gTipoOrden := 'ASC';
  gOrden := Column.FieldName + ' ' + gTipoOrden;
  PrepararQuery(gModo,gOrden);
end;

procedure TfrmGastoFi.GASTONewRecord(DataSet: TDataSet);
begin
  GASTOIDGASTO_FI.Value := dmStoreProc.getId('IDGASTO_FI') + 1;
end;

end.
