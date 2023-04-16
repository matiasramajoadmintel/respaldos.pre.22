unit Est_Mantenimiento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls, MXPIVSRC;

type
  TfrmEstMantenimiento = class(TForm)
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
    DecisionGraph2: TDecisionGraph;
    DecisionGraph3: TDecisionGraph;
    DecisionCube1: TDecisionCube;
    Series4: TBarSeries;
    Series3: TBarSeries;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Panel3: TPanel;
    dtpIni: TDateTimePicker;
    dtpFin: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboClick(Sender: TObject);

  private
    procedure PrepararFormulario;
    procedure FiltrarQuery;

  public
    procedure Mostrar;

  end;

var
  frmEstMantenimiento: TfrmEstMantenimiento;

implementation

uses Comunes, PoolDatos, Util;

{$R *.dfm}

//****************************************************************************//
//                                      PUBLICOS
//****************************************************************************//

procedure TfrmEstMantenimiento.Mostrar;
begin
  DecisionQuery1.Open;
  PrepararFormulario;

  ShowModal;

  DecisionQuery1.Close;
end;

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmEstMantenimiento.PrepararFormulario;
begin
  dtpIni.DateTime := Date - 90;
  dtpFin.DateTime := Date;

  FiltrarQuery;

  PageControl1.ActivePage := tsTabla;
end;

procedure TfrmEstMantenimiento.FiltrarQuery;
var
  Filtro: String;
begin
  Filtro := '';

  //Filtra por fechas
    if Filtro = '' then
      Filtro := 'FECHA>=' + #39 + DateToStr(dtpIni.DateTime) + #39 +
                'AND FECHA<=' + #39 + DateToStr(dtpFin.DateTime) + #39
    else Filtro := Filtro + ' AND FECHA>=' + #39 + DateToStr(dtpIni.DateTime) + #39 +
                   'AND FECHA<=' + #39 + DateToStr(dtpFin.DateTime) + #39;

  with DecisionQuery1 do
  begin
    Filtered := False;
    Filter := Filtro;
    Filtered := True;
    if IsEmpty then MsjError('No se puede procesar por falta de datos.')
    else
    begin
      Close;
      Open;
    end;
  end;
end;

//****************************************************************************//
//                                      EVENTOS
//****************************************************************************//

procedure TfrmEstMantenimiento.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEstMantenimiento.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmEstMantenimiento.ComboClick(Sender: TObject);
begin
  FiltrarQuery;
end;

end.
