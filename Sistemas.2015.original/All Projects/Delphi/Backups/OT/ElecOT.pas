unit ElecOT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids;

type
  TfrmElecOT = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Qry: TQuery;
    dsQry: TDataSource;
    QryNroOT: TIntegerField;
    QrySubNroOT: TIntegerField;
    QryIdOT: TIntegerField;
    QryIdEquipo: TIntegerField;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    btnElegir: TBitBtn;
    QryEquipo: TStringField;
    QryIdTipoOT: TIntegerField;
    QryPorcentaje: TIntegerField;
    QryIdSubFamilia: TIntegerField;
    QryIdEjemp: TIntegerField;
    QryCodEjemp: TStringField;
    QryFechaEmi: TDateTimeField;
    QryEstado: TStringField;
    QryTipoOT: TStringField;
    QryEstado2: TStringField;
    QryTipoMant: TStringField;
    QryTipoMant2: TStringField;
    QryOT: TStringField;
    Table1: TTable;
    procedure QryCalcFields(DataSet: TDataSet);

  private
    { Private declarations }

  public
    Function Elegir(var xTipo: Byte; var xOT: Integer): Boolean;

  end;

var
  frmElecOT: TfrmElecOT;

implementation

uses Querys, StoreProcs;

{$R *.DFM}

Function TfrmElecOT.Elegir(var xTipo: Byte; var xOT: Integer): Boolean;
begin
     Result := False;
     xTipo := 0;
     xOT := -1;
     Qry.Close;
     Qry.Open;
     btnElegir.Enabled := (Qry.RecordCount>0);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          xTipo := QryIdTipoOT.Value;
          xOT := QryIdOT.Value;
     end;
end;

procedure TfrmElecOT.QryCalcFields(DataSet: TDataSet);
begin
//     QryEquipo.Text := dmQuerys.NombreSubFamilia(QryIdSubFamilia.Value);

     if QryEstado.Text[1] = 'A' then QryEstado2.Text := 'F'
     else QryEstado2.Text := QryEstado.Text;

     if (QryIdTipoOT.Value = 2) or (QryIdTipoOT.Value = 3) then
       QryTipoMant2.Text := 'COR'
     else QryTipoMant2.Text := QryTipoMant.Text;

     QryOT.Text := QryNroOT.Text + '/' + QrySubNroOT.Text;
end;

end.
