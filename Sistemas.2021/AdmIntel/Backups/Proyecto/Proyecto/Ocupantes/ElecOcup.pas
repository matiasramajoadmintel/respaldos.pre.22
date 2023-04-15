unit ElecOcup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecOcup = class(TForm)
    dsEdi: TDataSource;
    Panel2: TPanel;
    qryOcup: TQuery;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    Panel1: TPanel;
    grdEdi: TDBGrid;
    qryOcupIDOCUPANTE: TIntegerField;
    qryOcupDescrip: TStringField;
    procedure grdEdiDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    gModo: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer): Boolean;
    Function getEnt(var Id:Integer;var Desc: String): Boolean;
    Procedure Mostrar(const T: String);
    Procedure Consultar(const T: String);

  end;

var
  frmElecOcup: TfrmElecOcup;

implementation

uses Input, Util, Comunes;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecOcup.getId(var Id: Integer): Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qryOcupIDOCUPANTE.Value;
     qryOcup.Close;
end;

Function TfrmElecOcup.getEnt(var Id:Integer; var Desc:String):Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          Id := qryOcupIDOCUPANTE.Value;
          Desc := qryOcupDescrip.Text;
     end;
     qryOcup.Close;
end;

Procedure TfrmElecOcup.Mostrar(const T: String);
begin
     PrepararForm(1);

     ShowModal;

     qryOcup.Close;
end;

Procedure TfrmElecOcup.Consultar(const T: String);
begin
{     Tabla := T;
     PrepararForm(0);
     btnNuevo.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;

     Query1.Close;}
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecOcup.PrepararQuery(const Modo: Byte);
begin
     with qryOcup do
     begin
          Close;
          Open;
     end;
end;

Procedure TfrmElecOcup.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecOcup.grdEdiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecOcup.btnCancelarClick(Sender: TObject);
begin
  qryOcup.Close;
end;

procedure TfrmElecOcup.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'1.col',grdEdi);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecOcup.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'1.col',grdEdi);
  GuardarEstadoVentana(Name,Self);
end;

end.
