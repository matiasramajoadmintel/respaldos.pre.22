unit EstMantBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, TeeProcs, Chart, MXGRAPH,
  ExtCtrls;

type
  TfrmEstMantBarras = class(TForm)
    Panel1: TPanel;
    DecisionGraph2: TDecisionGraph;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstMantBarras: TfrmEstMantBarras;

implementation

uses Est_Mantenimiento;

{$R *.dfm}

end.
