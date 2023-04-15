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
    Panel4: TPanel;
    grdDatos: TDBGrid;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    DataSource1: TDataSource;
    Query1: TQuery;
    OcupCiv: TTable;
    OcupMil: TTable;
    OcupCivIDPERSONA: TIntegerField;
    OcupCivLEGAJO: TStringField;
    OcupMilIDPERSONA: TIntegerField;
    OcupMilMATRICULA: TStringField;
    ComboColumna: TComboBox;
    Label2: TLabel;
    Query1IDPERSONA: TIntegerField;
    Query1NOMBRE: TStringField;
    Query1TIPO: TStringField;
    Query1TipoPers: TStringField;
    Query1MR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Query1CalcFields(DataSet: TDataSet);
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
    gModo, gModoGet, Teclas: Byte;
    procedure PrepararForm;
    procedure PrepararQuery (Orden:String);

  public
    procedure Mostrar;
    function GetId(var Ocupante:String; ModoGet:Byte): integer;

  end;

var
  frmElecOcupante: TfrmElecOcupante;

implementation

uses Comunes, Tablas, Util, IngOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecOcupante.PrepararForm;
var
  i: Byte;
begin
  btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
  btnEliminar.Enabled:=(Query1.RecordCount<>0);
  btnModificar.Enabled:=(Query1.RecordCount<>0);
  ComboColumna.Clear;
    for i := 0 to grdDatos.Columns.Count - 1 do
      ComboColumna.Items.Add(grdDatos.Columns[i].Title.Caption);
end;

procedure TfrmElecOcupante.PrepararQuery (Orden:String);
var
  Script, Filtro, Campo: String;
  i: Byte;
begin
  //Establece el script de la consulta sin filtrar
  Script:='SELECT * FROM VW_OCUPANTES ';
  Orden := 'ORDER BY ' + Orden;

  //Vacía el filtro anterior
  Filtro:='';

  //Si se eligió una columna de búsqueda y se escribio un texto a buscar, se
  //construye el filtro
  if (ComboColumna.Text <> '') and (edtDesc.Text <> '') then
  begin
    //Busca el nombre del campo correspondiente a la columna seleccionada
    i := 0;
    Campo := '';
    while (Campo = '') and (i < grdDatos.Columns.Count) do
    begin
      if grdDatos.Columns[i].DisplayName = ComboColumna.Text then
        Campo := grdDatos.Columns[i].FieldName;
      i := i + 1;
    end;

    //Si no se encontró un campo para la columna elegida, no se puede armar el
    //filtro
    if Campo = '' then
    begin
      MsjError('No se puede buscar por el campo seleccionado');
      Exit;
    end;

    //Construye el script del filtro
    Filtro := 'WHERE (' +
              Campo  + ' LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
              Campo  + ' LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
              Campo  + ' LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
              Campo  + ' LIKE ' + #39 + edtDesc.Text + #39 + ')';
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
  PrepararForm;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecOcupante.Mostrar;
begin
        gModo:=1;
        gModoGet:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecOcupante.GetId(var Ocupante:String; ModoGet:Byte):integer;
begin
        gModo:=2;
        gModoGet:=ModoGet;
        PrepararQuery (gOrden);
        ShowModal;
        if ModalResult=mrOk then
        begin
                Ocupante:=Query1NOMBRE.Value;
                Result:=Query1IdPersona.Value;
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
  gOrden:='Nombre ' + gTipoOrden;
end;

procedure TfrmElecOcupante.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecOcupante.Query1CalcFields(DataSet: TDataSet);
begin
  if Query1TIPO.Text = 'OCUP_CIV' then
  begin
    Query1TipoPers.Text := 'Agente civil';
    Existe(OcupCiv, 'IDPERSONA', Query1IDPERSONA.Value);
    Query1MR.Text := OcupCivLEGAJO.Text;
  end
  else if Query1TIPO.Text = 'OCUP_MIL' then
  begin
    Query1TipoPers.Text := 'Personal militar';
    Existe(OcupMil, 'IDPERSONA', Query1IDPERSONA.Value);
    Query1MR.Text := OcupMilMATRICULA.Text;
  end
  else
    Query1TipoPers.Text := 'Particular';
end;

procedure TfrmElecOcupante.grdDatosTitleClick(Column: TColumn);
begin
        if gTipoOrden = 'ASC' then
                gTipoOrden := 'DESC'
        else
                gTipoOrden := 'ASC';
        if (Column.FieldName = 'Ocupante') then
                gOrden:='Apellido '+ gTipoOrden + ', Nombre ' + gTipoOrden
        else
                gOrden:='Tipo '+ gTipoOrden;
        PrepararQuery(gOrden);
end;

procedure TfrmElecOcupante.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupante:integer;
begin
        with TfrmIngOcupante.Create(nil) do
        begin
                R:=Insertar(IdOcupante);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdPersona',IdOcupante);
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
        with TfrmIngOcupante.Create(nil) do
        begin
                R:=Eliminar(Query1IdPersona.Value);
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
        IdOcupante:=Query1IdPersona.Value;
        with TfrmIngOcupante.Create(nil) do
        begin
                R:=Actualizar(IdOcupante);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden);
                Existe(Query1,'IdPersona',IdOcupante);
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
    key := chr(0);
    Perform(WM_NEXTDLGCTL, Teclas, 0);
  end;
end;

end.
