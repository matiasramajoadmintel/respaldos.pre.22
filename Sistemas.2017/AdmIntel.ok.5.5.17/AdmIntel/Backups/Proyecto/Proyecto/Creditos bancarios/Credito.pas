unit Credito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants, DateUtils;

type
  TfrmCredito = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Panel3: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    CB: TTable;
    CBFECHA_PAGO: TDateTimeField;
    CBCOSTO: TFloatField;
    Query1: TQuery;
    Query1FECHA_PAGO: TDateTimeField;
    Query1COSTO: TFloatField;
    Query1IDCREDITO_BANCARIO: TIntegerField;
    CBIDCREDITO_BANCARIO: TIntegerField;
    Query1DESCRIP: TStringField;
    CBDESCRIP: TStringField;
    procedure grdDatosDblClick(Sender: TObject);
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
  frmCredito: TfrmCredito;

implementation

uses Input, Util, Comunes, PoolDatos, IngCredito;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmCredito.getId(const T: String;var Id: Integer): Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;}
end;

Function TfrmCredito.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
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

Procedure TfrmCredito.Mostrar;
begin
     PrepararForm(1);
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmCredito.Consultar(const T: String);
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

Procedure TfrmCredito.PrepararQuery(const Modo: Byte);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM VW_CREDITOS_BANCARIOS';

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
          SQL.Add(' ORDER BY FECHA_PAGO');
          Open;
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
     end;
end;

Procedure TfrmCredito.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmCredito.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmCredito.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmCredito.btnNuevoClick(Sender: TObject);
var
   Fec: TDateTime;
   Desc: String;
   Costo: Currency;
   R: Boolean;
begin
  Fec := Date;
  Desc := '';
  Costo := 0;

  with TfrmIngCredito.Create(nil) do
  begin
    R := Ingresar(Fec,Desc,Costo);
    Release;
  end;

  if not R then Exit;

  try
    with  CB do
    begin
      Open;
      Append;
      CBFECHA_PAGO.Value := DateOf(Fec);
      CBDESCRIP.Text := Desc;
      CBCOSTO.Value := Costo;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos.');
      CB.Cancel;
    end;
  end;

  PrepararQuery(gModo);
end;

procedure TfrmCredito.btnEliminarClick(Sender: TObject);
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

  try
    Existe(CB,'IDCREDITO_BANCARIO',Query1IDCREDITO_BANCARIO.Value);
    CB.Delete;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no esté siendo uasado.');
  end;

  PrepararQuery(gModo);
end;

procedure TfrmCredito.btnModificarClick(Sender: TObject);
var
   Fec: TDateTime;
   Costo: Currency;
   R: Boolean;
   Desc: String;
begin
  Fec := Query1FECHA_PAGO.Value;
  Desc := Query1DESCRIP.Text;
  Costo := Query1COSTO.Value;

  with TfrmIngCredito.Create(nil) do
  begin
    R := Ingresar(Fec,Desc,Costo);
    Release;
  end;

  if not R then Exit;

  try
    with  CB do
    begin
      Existe(CB,'IDCREDITO_BANCARIO',Query1IDCREDITO_BANCARIO.Value);
      Edit;
      CBFECHA_PAGO.Value := DateOf(Fec);
      CBDESCRIP.Text := Desc;
      CBCOSTO.Value := Costo;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos.');
      CB.Cancel;
    end;
  end;

  PrepararQuery(gModo);
end;

procedure TfrmCredito.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmCredito.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmCredito.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

procedure TfrmCredito.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmCredito.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmCredito.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmCredito.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

end.
