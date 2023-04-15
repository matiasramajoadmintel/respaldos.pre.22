unit Est_Servicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls;

type
  TfrmEstServicios = class(TForm)
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DecisionGraph1: TDecisionGraph;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    DecisionGrid1: TDecisionGrid;
    Query1: TQuery;
    Query1FECHA_PAGO: TDateTimeField;
    Query1RAZON_SOCIAL: TStringField;
    Query1SUM: TFloatField;
  private
    { Private declarations }

  public
    procedure Mostrar;

  end;

var
  frmEstServicios: TfrmEstServicios;

implementation

{$R *.dfm}

procedure TfrmEstServicios.Mostrar;
begin
  Query1.Open;

  ShowModal;

  Query1.Close;
end;

end.
