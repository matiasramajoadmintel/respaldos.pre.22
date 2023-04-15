unit ElecOcupacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, DB, DBTables,
  ComCtrls;

type
  TfrmElecOcupacion = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    pnlBotones: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query1FECHAINI: TDateTimeField;
    Query1FECHAFIN: TDateTimeField;
    Query1FECHARETIRO: TDateTimeField;
    Query1IDOCUPACION: TIntegerField;
    Query1OCUPANTE: TStringField;
    Query1LOCACION: TStringField;
    dtpInicio: TDateTimePicker;
    dtpFin: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    ComboFechas: TComboBox;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
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
    procedure grdDatosDblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    gTipoOrden, gOrden: String;
    gModo, gVer:Byte;
    procedure PrepararForm;
    procedure PrepararQuery(Orden:String; Ver: Integer);

  public
    procedure Mostrar(Modo: Byte);

  end;

var
  frmElecOcupacion: TfrmElecOcupacion;

implementation

uses Comunes, Tablas, IngOcupacion, Util, ElecOcupante;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmElecOcupacion.PrepararForm;
begin
        btnElegir.Visible:=(gModo=2) and (Query1.RecordCount<>0);
        btnEliminar.Enabled:=(Query1.RecordCount<>0);
        btnModificar.Enabled:=(Query1.RecordCount<>0);

        pnlBotones.Visible := (gModo <> 3);
end;

procedure TfrmElecOcupacion.PrepararQuery (Orden:String; Ver: Integer);
var
  Script,Filtro, FiltroFechas, FiltroVer, CampoFecha: String;

begin
        gVer := Ver;

        ShortDateFormat := 'mm/dd/yyyy';
        Script:='SELECT * FROM VW_OCUPACION';
        Filtro:='';

        if edtDesc.Text<>'' then
                Filtro:='(' +
                        'Apellido LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'Apellido LIKE ' + #39 + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'Nombre LIKE ' + #39 + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + '%' + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + UpperCase(edtDesc.Text) + '%' + #39 + ') OR (' +
                        'DescripcionEd LIKE ' + #39 + UpperCase(edtDesc.Text) + #39 + ')';

        if ComboFechas.Text <> '' then
        begin
          if ComboFechas.Text = 'Inicio' then
            CampoFecha := 'FechaIni '
          else if ComboFechas.Text = 'Fin' then
            CampoFecha := 'FechaFin '
          else if ComboFechas.Text = 'Retiro' then
            CampoFecha := 'FechaRetiro '
          else
          begin
            MsjError('Fecha de búsqueda inválida');
            ComboFechas.Text := '';
            Exit;
          end;

          FiltroFechas := CampoFecha + ' >= ' + #39 + DateToStr(dtpInicio.Date) + #39 +
                          ' AND ' + CampoFecha + ' <= ' + #39 + DateToStr(dtpFin.Date) + #39;

          if Filtro = '' then Filtro := FiltroFechas
          else Filtro := Filtro + ' AND ' + FiltroFechas;
        end;

        if Ver = 0 then //Actuales
          FiltroVer := ' FechaRetiro IS NULL'
        else if Ver = 1 then //Historicas
          FiltroVer := ' FechaRetiro IS NOT NULL'
        else              //Todas
          FiltroVer := '';


        if FiltroVer <> '' then
        begin
          if Filtro = '' then Filtro := FiltroVer
          else Filtro := Filtro + ' AND ' + FiltroVer;
        end;

        with Query1 do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                if Filtro <> '' then SQL.Add('WHERE ' + Filtro);
                SQL.Add('ORDER BY ' + Orden);
                Open;
        end;
        PrepararForm;
        ShortDateFormat := 'dd/mm/yyyy';
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

procedure TfrmElecOcupacion.Mostrar(Modo: Byte);
{gModo= 1:Mostrar 2:Elegir 3:Consultar}
begin
        gModo:=Modo;
        dtpInicio.Date := Date - 365;
        dtpFin.Date := Date;

        PrepararQuery (gOrden, 2);
        ShowModal;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmElecOcupacion.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='DescripcionEd ' + gTipoOrden;
end;

procedure TfrmElecOcupacion.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecOcupacion.btnAgregarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupacion:integer;
begin
        with TfrmIngOcupacion.Create(nil) do
        begin
                R:=Insertar(IdOcupacion);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden, gVer);
                Existe(Query1,'IdOcupacion',IdOcupacion);
        end;
end;

procedure TfrmElecOcupacion.btnEliminarClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngOcupacion.Create(nil) do
        begin
                R:=Eliminar(Query1IdOcupacion.Value);
                Release;
        end;
        if R then
                PrepararQuery (gOrden, gVer);
end;

procedure TfrmElecOcupacion.btnModificarClick(Sender: TObject);
var
        R:Boolean;
        IdOcupacion:integer;
begin
        IdOcupacion:=Query1IdOcupacion.Value;
        with TfrmIngOcupacion.Create(nil) do
        begin
                if gModo <> 3 then
                  R:=Actualizar(IdOcupacion)
                else
                  R:=Consultar(IdOcupacion);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gOrden, gVer);
                Existe(Query1,'IdOcupacion',IdOcupacion);
        end;
end;

procedure TfrmElecOcupacion.grdDatosTitleClick(Column: TColumn);
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
                if Column.FieldName='Ocupante' then
                        gOrden:='Apellido ' + gTipoOrden + ', Nombre ' + gTipoOrden
                else
                        gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden, gVer);
        end;
end;

procedure TfrmElecOcupacion.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecOcupacion.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden, gVer);
end;

procedure TfrmElecOcupacion.edtDescKeyPress(Sender: TObject;
  var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden, gVer);
end;

procedure TfrmElecOcupacion.grdDatosDblClick(Sender: TObject);
begin
  btnModificarClick(nil);
end;

procedure TfrmElecOcupacion.RadioGroup1Click(Sender: TObject);
begin
        PrepararQuery (gOrden, RadioGroup1.ItemIndex);
end;

procedure TfrmElecOcupacion.Button1Click(Sender: TObject);
begin
with TfrmElecOcupante.Create(nil) do
  begin
    Mostrar(0);                                                    
    Release;
  end;
end;

end.
