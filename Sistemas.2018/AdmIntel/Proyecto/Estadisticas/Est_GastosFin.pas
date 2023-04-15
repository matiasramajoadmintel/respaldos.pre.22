unit Est_GastosFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls, MXPIVSRC;

type
  TfrmEstGastosFin = class(TForm)
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    tsTabla: TTabSheet;
    TabSheet2: TTabSheet;
    DecisionGraph1: TDecisionGraph;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DecisionCube1: TDecisionCube;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Label4: TLabel;
    dtpIni: TDateTimePicker;
    Label5: TLabel;
    dtpFin: TDateTimePicker;
    DecisionGraph3: TDecisionGraph;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    DecisionGraph2: TDecisionGraph;
    Series4: TPieSeries;
    Series5: TPieSeries;
    Series6: TPieSeries;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboClick(Sender: TObject);

  private
    procedure PrepararFormulario(FechaInicio, FechaFin: TDateTime);
    procedure FiltrarQuery(FechaInicio, FechaFin: TDateTime);

  public
    procedure Mostrar(FechaInicio, FechaFin: TDateTime);

  end;

var
  frmEstGastosFin: TfrmEstGastosFin;

implementation

uses Comunes, PoolDatos, Util;

{$R *.dfm}

//****************************************************************************//
//                                      PUBLICOS
//****************************************************************************//

procedure TfrmEstGastosFin.Mostrar(FechaInicio, FechaFin: TDateTime);
begin
  PrepararFormulario(FechaInicio, FechaFin);

  ShowModal;

  DecisionQuery1.Close;
end;

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmEstGastosFin.PrepararFormulario(FechaInicio, FechaFin: TDateTime);
begin
  dtpIni.DateTime := FechaInicio;
  dtpFin.DateTime := FechaFin;
  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);

  DecisionGrid1.Dimensions[2].Subtotals := False;
  PageControl1.ActivePage := tsTabla;
end;

procedure TfrmEstGastosFin.FiltrarQuery(FechaInicio, FechaFin: TDateTime);
var
  Filtro: String;
begin
  Filtro := '';

  //Filtra por fechas
    if Filtro = '' then
      Filtro := 'FECHA >= ' + #39 + DateToStr(FechaInicio) + #39 +
                'AND FECHA <= ' + #39 + DateToStr(FechaFin) + #39
    else Filtro := Filtro + ' AND FECHA >= ' + #39 + DateToStr(FechaInicio) + #39 +
                   'AND FECHA <= ' + #39 + DateToStr(FechaFin) + #39;

  DecisionCube1.DataSet := nil;
  DecisionQuery1.Close;
  DecisionQuery1.Filtered := False;
  DecisionQuery1.Filter := Filtro;
  DecisionQuery1.Filtered := True;
  DecisionQuery1.Open;
  if DecisionQuery1.IsEmpty then
    MsjError('No se puede procesar por falta de datos.')
  else
    DecisionCube1.DataSet := DecisionQuery1;
end;

//****************************************************************************//
//                                      EVENTOS
//****************************************************************************//

procedure TfrmEstGastosFin.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEstGastosFin.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmEstGastosFin.ComboClick(Sender: TObject);
begin
  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);
end;


end.
