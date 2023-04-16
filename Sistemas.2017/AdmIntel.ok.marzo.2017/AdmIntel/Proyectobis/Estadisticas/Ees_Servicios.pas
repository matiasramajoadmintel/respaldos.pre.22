unit Ees_Servicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons;

type
  TfrmEstServicios = class(TForm)
    DecisionCube1: TDecisionCube;
    DecisionGrid1: TDecisionGrid;
    DecisionSource1: TDecisionSource;
    DecisionQuery1: TDecisionQuery;
    DecisionGraph1: TDecisionGraph;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
  private
    { Private declarations }

  public
    procedure Mostrar;

  end;

var
  frmEstServicios: TfrmEstServicios;

implementation

uses PoolQuerys;


{$R *.dfm}

procedure TfrmEstServicios.Mostrar;
begin
  ShowModal;
end;

end.
