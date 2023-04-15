unit Ingreso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants, DateUtils;

type
  TfrmIngreso = class(TForm)
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
    ING: TTable;
    INGIDINGRESO: TIntegerField;
    INGIDTIPO_INGRESO: TIntegerField;
    INGFECHA_PAGO: TDateTimeField;
    INGTIPO_PAGO: TStringField;
    INGNRO_CHEQUE: TStringField;
    INGNRO_RECIBO: TIntegerField;
    INGIMPORTE_MANT: TFloatField;
    INGIMPORTE_SERV: TFloatField;
    Query1: TQuery;
    Query1IDINGRESO: TIntegerField;
    Query1CONCEPTO: TStringField;
    Query1FECHA: TDateTimeField;
    Query1TIPO_PAGO: TStringField;
    Query1NRO_CHEQUE: TStringField;
    Query1NRO_RECIBO: TIntegerField;
    Query1IMPORTE_MANT: TFloatField;
    Query1SR: TStringField;
    Query1IMPORTE_SERV: TFloatField;
    Query1IDTIPO_INGRESO: TIntegerField;
    INGSR: TStringField;
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
    procedure INGNewRecord(DataSet: TDataSet);

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
  frmIngreso: TfrmIngreso;

implementation

uses Input, Util, Comunes, PoolDatos, IngIngreso, StoreProcs;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmIngreso.getId(const T: String;var Id: Integer): Boolean;
begin
{     Result := False;
     Tabla := T;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := RetornarClave;
     Query1.Close;}
end;

Function TfrmIngreso.getEnt(const T:String;var Id:Integer;var Desc:String):Boolean;
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

Procedure TfrmIngreso.Mostrar;
begin
     PrepararForm(1);
     btnAgregar.Enabled := True;

     ShowModal;

     Query1.Close;
end;

Procedure TfrmIngreso.Consultar(const T: String);
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

Procedure TfrmIngreso.PrepararQuery(const Modo: Byte);
var
   Script, Filtro: String;
begin
     Script := 'SELECT * FROM VW_INGRESOS';

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
          SQL.Add(' ORDER BY FECHA');
          Open;
          btnAgregar.Enabled := (Modo<>0);
          btnEliminar.Enabled := (Modo<>0)and(RecordCount>0);
          btnModificar.Enabled := (Modo<>0)and(RecordCount>0);
     end;
end;

Procedure TfrmIngreso.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmIngreso.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmIngreso.btnCancelarClick(Sender: TObject);
begin
  Query1.Close;
end;

procedure TfrmIngreso.btnNuevoClick(Sender: TObject);
var
   Fec: TDateTime;
   IdIng, NRecibo: Integer;
   ImpM, ImpS: Currency;
   R: Boolean;
   TPago: Char;
   NCheque, Sr: String;
begin
  Fec := Date;
  IdIng := -1;
  ImpM := 0;
  ImpS := 0;
  TPago := 'E';
  NCheque := '';
  Sr := '';
  NRecibo := -1;

  with TfrmIngIngreso.Create(nil) do
  begin
    R := Ingresar(Fec,IdIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);
    Release;
  end;

  if not R then Exit;

  {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
   agregar para evitar problemas en las comparaciones futuras}
  Fec := DateOf(Fec);

  try
    with  ING do
    begin
      Open;
      Append;
      INGFECHA_PAGO.Value := Fec;
      INGIDTIPO_INGRESO.Value := IdIng;
      INGIMPORTE_MANT.Value := ImpM;
      INGIMPORTE_SERV.Value := ImpS;
      INGTIPO_PAGO.Text := TPago;
      INGNRO_CHEQUE.Text := NCheque;
      INGNRO_RECIBO.Value := NRecibo;
      INGSR.Value := Sr;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos y que no hay números de recibo repetidos.');
      ING.Cancel;
    end;
  end;

  PrepararQuery(gModo);
end;

procedure TfrmIngreso.btnEliminarClick(Sender: TObject);
begin
     if not Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then Exit;

  try
    Existe(ING,'IDINGRESO',Query1IDINGRESO.Value);
    ING.Delete;
    except on EDatabaseError do
      MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
               'dato que desea eliminar no esté siendo uasado.');
  end;

  PrepararQuery(gModo);
end;

procedure TfrmIngreso.btnModificarClick(Sender: TObject);
var
   Fec: TDateTime;
   IdIng, NRecibo: Integer;
   ImpM, ImpS: Currency;
   R: Boolean;
   TPago: Char;
   NCheque, Sr: String;
begin
  Fec := Query1FECHA.Value;
  IdIng := Query1IDTIPO_INGRESO.Value;
  ImpM := Query1IMPORTE_MANT.Value;
  ImpS := Query1IMPORTE_SERV.Value;
  TPago := Query1TIPO_PAGO.Text[1];
  NCheque := Query1NRO_CHEQUE.Text;
  NRecibo := Query1NRO_RECIBO.Value;
  Sr := Query1SR.Text;

  with TfrmIngIngreso.Create(nil) do
  begin
    R := Ingresar(Fec,IdIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);
    Release;
  end;

  if not R then Exit;

  {Le saca la parte decimal a la fecha antes de hacer las comprocaciones y
   agregar para evitar problemas en las comparaciones futuras}
  Fec := DateOf(Fec);

  try
    with  ING do
    begin
      Existe(ING,'IDINGRESO',Query1IDINGRESO.Value);
      Edit;
      INGFECHA_PAGO.Value := Fec;
      INGIDTIPO_INGRESO.Value := IdIng;
      INGIMPORTE_MANT.Value := ImpM;
      INGIMPORTE_SERV.Value := ImpS;
      INGTIPO_PAGO.Text := TPago;
      INGNRO_CHEQUE.Text := NCheque;
      INGNRO_RECIBO.Value := NRecibo;
      INGSR.Value := Sr;
      Post;
      Refresh;
    end;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
               'datos están completos y que no hay números de recibo repetidos.');
      ING.Cancel;
    end;
  end;

  PrepararQuery(gModo);
end;

procedure TfrmIngreso.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngreso.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngreso.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gModo);
end;

procedure TfrmIngreso.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngreso.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngreso.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngreso.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngreso.INGNewRecord(DataSet: TDataSet);
begin
  INGIDINGRESO.Value := dmStoreProc.getId('IDINGRESO') + 1;
end;

end.
