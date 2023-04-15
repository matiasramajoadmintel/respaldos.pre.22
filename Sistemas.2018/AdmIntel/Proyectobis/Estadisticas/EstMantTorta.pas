unit EstMantTorta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, Series, TeeProcs, Chart, MXGRAPH,
  ExtCtrls;

type
  TfrmEstMantTorta = class(TForm)
    Panel1: TPanel;
    DecisionGraph2: TDecisionGraph;
    Series1: TPieSeries;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TPieSeries;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstMantTorta: TfrmEstMantTorta;

implementation

{$R *.dfm}

end.
