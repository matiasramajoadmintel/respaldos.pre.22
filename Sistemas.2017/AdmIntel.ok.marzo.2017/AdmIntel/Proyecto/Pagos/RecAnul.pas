unit RecAnul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, DateUtils;

type
  TfrmRecAnul = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Panel3: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    Query1NRO_RECIBO: TIntegerField;
    Query1FECHA: TDateTimeField;
    RA: TTable;
    RAIDRECIBO_ANULADO: TIntegerField;
    RANRO_RECIBO: TIntegerField;
    RAFECHA: TDateTimeField;
    procedure grdDatosDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure RANewRecord(DataSet: TDataSet);

  private
    gModo, Teclas: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(const T: String;var Id: Integer): Boolean;
    Function getEnt(const T: String;var Id: Integer;var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar(const T: String);

  end;

var
  frmRecAnul: TfrmRecAnul;

implementation

uses Comunes, Util, Input, StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmRecAnul.getId(const T: String;var Id: Integer): Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;}
end;

Function TfrmRecAnul.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
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

Procedure TfrmRecAnul.Mostrar;
begin
     PrepararForm(1);
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmRecAnul.Consultar(const T: String);
begin
{     Tabla := T;
     PrepararForm(0);
     btnNuevo.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;

     Query1.Close;}
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmRecAnul.PrepararQuery(const Modo: Byte);
var
   Script: String;
begin
     Script := 'SELECT * FROM RECIBO_ANULADO';

     with Query1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(' ORDER BY NRO_RECIBO');
          Open;
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnElegir.Visible := (Modo=2)and(RecordCount>0);
     end;
end;

Procedure TfrmRecAnul.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmRecAnul.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmRecAnul.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmRecAnul.btnNuevoClick(Sender: TObject);
var
   N: Integer;
begin
     if not IngresarEntero(N,'Nº de Recibo') then Exit;

  try
    RA.Open;
    RA.Append;
    RANRO_RECIBO.Value := N;
    RAFECHA.Value := DateOf(Date);
    RA.Post;
    RA.Refresh;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos y que no hay nuemos de recibo repetidos.');
  end;

     Query1.Close;
     Existe(Query1,'NRO_RECIBO',N);
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmRecAnul.btnEliminarClick(Sender: TObject);
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

  try
    Existe(RA,'NRO_RECIBO',Query1NRO_RECIBO.Value);
    RA.Delete;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no esté siendo uasado.');
  end;

     Query1.Close;
     Query1.Open;
     btnEliminar.Enabled := (Query1.RecordCount>0);
     btnElegir.Visible := (gModo=2)and(Query1.RecordCount>0);
end;

procedure TfrmRecAnul.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmRecAnul.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmRecAnul.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

procedure TfrmRecAnul.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmRecAnul.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmRecAnul.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmRecAnul.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmRecAnul.RANewRecord(DataSet: TDataSet);
begin
  RAIDRECIBO_ANULADO.Value := dmStoreProc.getId('IDRECIBO_ANULADO') + 1;
end;

end.
