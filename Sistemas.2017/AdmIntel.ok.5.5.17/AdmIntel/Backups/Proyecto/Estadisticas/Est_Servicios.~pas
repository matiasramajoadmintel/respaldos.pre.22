unit Est_Servicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls, MXPIVSRC;

type
  TfrmEstServicios = class(TForm)
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    PageControl1: TPageControl;
    tsTabla: TTabSheet;
    TabSheet2: TTabSheet;
    DecisionGraph1: TDecisionGraph;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DecisionGraph2: TDecisionGraph;
    DecisionGraph3: TDecisionGraph;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    btnCerrar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    dtpFin: TDateTimePicker;
    dtpIni: TDateTimePicker;
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
  frmEstServicios: TfrmEstServicios;

implementation

uses Comunes, Util;

{$R *.dfm}

//****************************************************************************//
//                                      PUBLICOS
//****************************************************************************//

procedure TfrmEstServicios.Mostrar(FechaInicio, FechaFin: TDateTime);
begin
  PrepararFormulario(FechaInicio, FechaFin);

  ShowModal;

  DecisionQuery1.Close;
end;

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmEstServicios.PrepararFormulario(FechaInicio, FechaFin: TDateTime);
begin
  dtpIni.DateTime := FechaInicio;
  dtpFin.DateTime := FechaFin;
  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);

  PageControl1.ActivePage := tsTabla;
end;

procedure TfrmEstServicios.FiltrarQuery(FechaInicio, FechaFin: TDateTime);
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

procedure TfrmEstServicios.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEstServicios.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmEstServicios.ComboClick(Sender: TObject);
begin
  FiltrarQuery(dtpIni.DateTime, dtpFin.DateTime);
end;

end.
