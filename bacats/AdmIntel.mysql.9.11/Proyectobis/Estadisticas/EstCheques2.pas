unit EstCheques2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls, MXPIVSRC;

type
  TfrmEstCheques2 = class(TForm)
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    DecisionCube1: TDecisionCube;
    dtpFin: TDateTimePicker;
    dtpIni: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DecisionPivot1: TDecisionPivot;
    Label4: TLabel;
    Label5: TLabel;
    cmbTipoGrafico: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DecisionGrid1: TDecisionGrid;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    procedure PrepararFormulario(FechaInicio, FechaFin: TDateTime);
    procedure FiltrarQuery(FechaInicio, FechaFin: TDateTime);

  public
    procedure Mostrar(FechaInicio, FechaFin: TDateTime);

  end;

var
  frmEstCheques2: TfrmEstCheques2;

implementation

uses Comunes, PoolDatos, Util, EstMantTorta, EstMantBarras, EstMantLineas;

{$R *.dfm}

//****************************************************************************//
//                                      PUBLICOS
//****************************************************************************//

procedure TfrmEstCheques2.Mostrar(FechaInicio, FechaFin: TDateTime);
begin
  PrepararFormulario(FechaInicio, FechaFin);

  ShowModal;

  DecisionQuery1.Close;
end;

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmEstCheques2.PrepararFormulario(FechaInicio, FechaFin: TDateTime);
begin
  dtpIni.DateTime := FechaInicio;
  dtpFin.DateTime := FechaFin;

  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);
end;

procedure TfrmEstCheques2.FiltrarQuery(FechaInicio, FechaFin: TDateTime);
var
  Filtro: String;
begin
  Filtro := '';

  //Filtra por fechas
{    if Filtro = '' then
      Filtro := 'FECHA>=' + #39 + DateToStr(FechaInicio) + #39 +
                'AND FECHA<=' + #39 + DateToStr(FechaFin) + #39
    else Filtro := Filtro + ' AND FECHA>=' + #39 + DateToStr(FechaInicio) + #39 +
                   'AND FECHA<=' + #39 + DateToStr(FechaFin) + #39;}

  DecisionCube1.DataSet := nil;
  DecisionQuery1.Close;
  //DecisionQuery1.Filtered := False;
  //DecisionQuery1.Filter := Filtro;
  //DecisionQuery1.Filtered := True;
  DecisionQuery1.Open;
  if DecisionQuery1.IsEmpty then
    MsjError('No se puede procesar por falta de datos.')
  else
    DecisionCube1.DataSet := DecisionQuery1;
end;

//****************************************************************************//
//                                      EVENTOS
//****************************************************************************//

procedure TfrmEstCheques2.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEstCheques2.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmEstCheques2.ComboClick(Sender: TObject);
begin
  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);
end;

procedure TfrmEstCheques2.BitBtn2Click(Sender: TObject);
var
  form: TForm;
begin
{  if cmbTipoGrafico.Text = 'Barras' then
    form := TfrmEstMantBarras.Create(nil)
  else if cmbTipoGrafico.Text = 'Lineas' then
    form := TfrmEstMantLineas.Create(nil)
  else
    form := TfrmEstMantTorta.Create(nil);

  form.ShowModal;}
end;

end.
