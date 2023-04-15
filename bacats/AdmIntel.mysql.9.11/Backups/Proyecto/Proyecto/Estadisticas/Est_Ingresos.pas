unit Est_Ingresos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, MXGRAPH, DB,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, Buttons,
  ComCtrls, MXPIVSRC;

type
  TfrmEstIngresos = class(TForm)
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
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);

  private
    procedure PrepararFormulario;

  public
    procedure Mostrar;

  end;

var
  frmEstIngresos: TfrmEstIngresos;

implementation

uses Comunes, PoolDatos, Util;

{$R *.dfm}

//****************************************************************************//
//                                      PUBLICOS
//****************************************************************************//

procedure TfrmEstIngresos.Mostrar;
begin
  DecisionQuery1.Open;
  PrepararFormulario;

  ShowModal;

  DecisionQuery1.Close;
end;

//****************************************************************************//
//                                      PRIVADOS
//****************************************************************************//

procedure TfrmEstIngresos.PrepararFormulario;
begin
//  CargarListaCampo(ComboBox1,dmDatos.CAT,'Descrip');

  PageControl1.ActivePage := tsTabla;
end;

//****************************************************************************//
//                                      EVENTOS
//****************************************************************************//

procedure TfrmEstIngresos.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmEstIngresos.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmEstIngresos.ComboBox1Click(Sender: TObject);
begin
{  with DecisionQuery1 do
  begin
    Filtered := False;
    Filter := 'RUBRO=' + #39 + ComboBox1.Text + #39;
    Filtered := True;
    if IsEmpty then MsjError('rr')
    else
    begin
      Close;
      Open;
    end;
  end;}
end;

end.
