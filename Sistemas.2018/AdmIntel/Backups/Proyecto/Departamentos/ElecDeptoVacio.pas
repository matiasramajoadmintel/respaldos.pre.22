unit ElecDeptoVacio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecDeptoVacio = class(TForm)
    dsEdi: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdEdi: TDBGrid;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grdDto: TDBGrid;
    dsDeptos: TDataSource;
    qrySoloDeptos: TQuery;
    qryEdificios: TQuery;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    qryEdificiosIDEDIFICIO: TIntegerField;
    qryEdificiosDESCRIPCION: TStringField;
    qrySoloDeptosIDDEPARTAMENTO: TIntegerField;
    qrySoloDeptosIDEDIFICIO: TIntegerField;
    qrySoloDeptosTIPO: TStringField;
    qrySoloDeptosDESCRIPLARGA: TStringField;
    qrySoloDeptosDESCRIPCORTA: TStringField;
    procedure grdEdiDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryEdificiosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    gModo: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer): Boolean;
    Function getEnt(var IdDepto, IdEdif:Integer;var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmElecDeptoVacio: TfrmElecDeptoVacio;

implementation

uses Util, Comunes, IngEdificio, IngDepto;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecDeptoVacio.getId(var Id: Integer): Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qrySoloDeptosIdDepartamento.Value;
     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Function TfrmElecDeptoVacio.getEnt(var IdDepto, IdEdif:Integer; var Desc:String):Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          IdDepto := qrySoloDeptosIdDepartamento.Value;
          IdEdif := qrySoloDeptosIDEDIFICIO.Value;
          Desc := qrySoloDeptosDESCRIPLARGA.Text;
     end;
     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Procedure TfrmElecDeptoVacio.Mostrar;
begin
     PrepararForm(1);

     ShowModal;

     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Procedure TfrmElecDeptoVacio.Consultar;
begin
     PrepararForm(0);

     ShowModal;

     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecDeptoVacio.PrepararQuery(const Modo: Byte);
begin
     with qryEdificios do
     begin
          Close;
          Open;
     end;
end;

Procedure TfrmElecDeptoVacio.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
     btnElegir.Visible := (Modo = 2);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecDeptoVacio.grdEdiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecDeptoVacio.btnCancelarClick(Sender: TObject);
begin
  qryEdificios.Close;
  qrySoloDeptos.Close;
end;

procedure TfrmElecDeptoVacio.qryEdificiosAfterScroll(DataSet: TDataSet);
begin
  with qrySoloDeptos do
  begin
    DisableControls;
    Close;
    ParamByName('N').AsInteger := qryEdificiosIdEdificio.Value;
    Open;
    btnElegir.Enabled := (RecordCount > 0);
    EnableControls;
  end;
end;

procedure TfrmElecDeptoVacio.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'1.col',grdEdi);
  RecuperarEstadoGrilla(Name+'2.col',grdDto);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecDeptoVacio.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'1.col',grdEdi);
  GuardarEstadoGrilla(Name+'2.col',grdDto);
  GuardarEstadoVentana(Name,Self);
end;

end.
