unit EstMantLineas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, TeeProcs, Chart, MXGRAPH,
  ExtCtrls;

type
  TfrmEstMantLineas = class(TForm)
    Panel1: TPanel;
    DecisionGraph2: TDecisionGraph;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstMantLineas: TfrmEstMantLineas;

implementation

uses Est_Mantenimiento;

{$R *.dfm}

end.
