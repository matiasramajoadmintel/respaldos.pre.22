unit ElecOcupante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, DBTables,
  IBCustomDataSet, IBTable, IBQuery;

type
  TfrmElecOcupante = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    pnlBotones: TPanel;
    grdDatos: TDBGrid;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    DataSource1: TDataSource;
    OcupCiv: TTable;
    OcupMil: TTable;
    OcupCivIDPERSONA: TIntegerField;
    OcupCivLEGAJO: TStringField;
    OcupMilIDPERSONA: TIntegerField;
    OcupMilMATRICULA: TStringField;
    ComboColumna: TComboBox;
    Label2: TLabel;
    Query1: TQuery;
    MNO_: TTable;
    MNO_IDPERSONA: TIntegerField;
    MNO_MATRICULA: TStringField;
    Query1IDOCUPANTE: TIntegerField;
    Query1OCUPANTE: TStringField;
    Query1TIPO: TStringField;
    Query1MATRICULA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure btnAgregarClick(Sender: TObject);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    gTipoOrden, gOrden: String;
    //Modo=0 ABM, Modo=1 Consulta
    gModo, gModoGet, Teclas: Byte;
    procedure CargarComboColumnas;
    procedure PrepararQuery (Orden:String);
    procedure EnableButtons;

  public
    procedure Mostrar(Modo: Byte);
    function GetId(var Ocupante:String; ModoGet:Byte): integer;

  end;

var
  frmElecOcupante: TfrmElecOcupante;

implementation

uses Comunes, Tablas, Util, Ocupante, PoolDatos;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecOcupante.CargarComboColumnas;
var
  i: Byte;
begin
  ComboColumna.Clear;
  for i := 0 to grdDatos.Columns.Count - 1 do
    if grdDatos.Columns[i].Field is TStringField then
      ComboColumna.Items.Add(grdDatos.Columns[i].Title.Caption);
      ComboColumna.ItemIndex:=1;
end;

procedure TfrmElecOcupante.EnableButtons;
begin
  btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
  btnEliminar.Enabled:=(Query1.RecordCount<>0);
  btnModificar.Enabled:=(Query1.RecordCount<>0);
end;

procedure TfrmElecOcupante.PrepararQuery (Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT * FROM VW_PERSONAS_2 ';
  Orden := 'ORDER BY ' + Orden;

  //Vac�a el filtro anterior
  Filtro:='';

  //Si se eligi� una columna de b�squeda y se escribio un texto a buscar, se
  //construye el filtro
  if (ComboColumna.Text <> '') and (edtDesc.Text <> '') then
  begin
    //Busca el nombre del campo correspondiente a la columna seleccionada
    i := 0;
    Campo := '';
    while (Campo = '') and (i < grdDatos.Columns.Count) do
    begin
      if grdDatos.Columns[i].Title.Caption = ComboColumna.Text then
        Campo := grdDatos.Columns[i].FieldName;
      i := i + 1;
    end;

    //Si no se encontr� un campo para la columna elegida, no se puede armar el
    //filtro
    if Campo = '' then
    begin
      MsjError('No se puede buscar por el campo seleccionado');
      Exit;
    end;

    //Construye el script del filtro
    Filtro := 'WHERE (' +
                Campo  + ' LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + '%' + #39 + ')';
          //    Campo  + ' LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + #39 + ') OR (' +
          //   Campo  + ' LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
          //   Campo  + ' LIKE ' + #39 + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
           //   Campo  + ' LIKE ' + #39 + UpperCase(edtDesc.Text) + #39 + ')';
  end;

  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Script);
    SQL.Add(Filtro);
    SQL.Add(Orden);
    Open;
  end;

  EnableButtons;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecOcupante.Mostrar(Modo: Byte);
begin
        gModo:=Modo;
        gModoGet:=1;
        CargarComboColumnas;
        PrepararQuery (gOrden);
        pnlBotones.Visible := (Modo <> 1);
        ShowModal;
end;

function TfrmElecOcupante.GetId(var Ocupante:String; ModoGet:Byte):integer;
begin
        gModo:=2;
        gModoGet:=ModoGet;
        CargarComboColumnas;
        PrepararQuery (gOrden);
        ShowModal;
        if ModalResult=mrOk then
        begin
                Ocupante:=Query1OCUPANTE.Value;
                Result:=Query1IDOCUPANTE.Value;
        end
        else
                Result:=0;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecOcupante.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla (Name+'.col',grdDatos);
  RecuperarEstadoVentana (Name,Self);
  gTipoOrden:='ASC';
  gOrden:='OCUPANTE ' + gTipoOrden;
end;

procedure TfrmElecOcupante.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecOcupante.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
  FieldName: String;
begin
  F := DataSource1.DataSet.FindField(Column.FieldName);
  FieldName := '';
  FieldName := F.FieldName;

  if FieldName <> '' then
  begin
    if gTipoOrden = 'ASC' then
      gTipoOrden := 'DESC'
    else
      gTipoOrden := 'ASC';

    gOrden := FieldName + ' ' + gTipoOrden;

    PrepararQuery(gOrden);
  end;
end;

procedure TfrmElecOcupante.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupante:integer;
begin
        with TfrmOcupante.Create(nil) do
        begin
                R:=Agregar(IdOcupante);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdOcupante',IdOcupante);
        end;
end;

procedure TfrmElecOcupante.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);

end;

procedure TfrmElecOcupante.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmOcupante.Create(nil) do
        begin
                R:=Eliminar(Query1IDOCUPANTE.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden);
end;

procedure TfrmElecOcupante.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupante:integer;
begin
        IdOcupante:=Query1IDOCUPANTE.Value;
        with TfrmOcupante.Create(nil) do
        begin
                if gModo = 0 then
                  R:=Modificar(IdOcupante, nil)
                else
                  R:=Consultar(IdOcupante);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdOcupante',IdOcupante);
        end;
end;

procedure TfrmElecOcupante.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecOcupante.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

procedure TfrmElecOcupante.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmElecOcupante.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmElecOcupante.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecOcupante.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;


end.
