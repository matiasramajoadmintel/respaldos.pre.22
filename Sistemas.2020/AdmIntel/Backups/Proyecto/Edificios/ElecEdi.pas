unit ElecEdi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecEdi = class(TForm)
    dsEdi: TDataSource;
    Panel2: TPanel;
    qryEdificios: TQuery;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    Panel1: TPanel;
    grdEdi: TDBGrid;
    qryEdificiosIdEdificio: TIntegerField;
    qryEdificiosDescrip: TStringField;
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
  frmElecEdi: TfrmElecEdi;

implementation

uses Input, Util, Comunes;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecEdi.getId(var Id: Integer): Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qryEdificiosIdEdificio.Value;
     qryEdificios.Close;
end;

Function TfrmElecEdi.getEnt(var Id:Integer; var Desc:String):Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          Id := qryEdificiosIdEdificio.Value;
          Desc := qryEdificiosDescrip.Text;
     end;
     qryEdificios.Close;
end;

Procedure TfrmElecEdi.Mostrar(const T: String);
begin
     PrepararForm(1);

     ShowModal;

     qryEdificios.Close;
end;

Procedure TfrmElecEdi.Consultar(const T: String);
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

Procedure TfrmElecEdi.PrepararQuery(const Modo: Byte);
begin
     with qryEdificios do
     begin
          Close;
          Open;
     end;
end;

Procedure TfrmElecEdi.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecEdi.grdEdiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecEdi.btnCancelarClick(Sender: TObject);
begin
  qryEdificios.Close;
end;

procedure TfrmElecEdi.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'1.col',grdEdi);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecEdi.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'1.col',grdEdi);
  GuardarEstadoVentana(Name,Self);
end;

end.
