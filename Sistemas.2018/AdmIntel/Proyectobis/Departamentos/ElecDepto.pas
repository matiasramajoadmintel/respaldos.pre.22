unit ElecDepto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmElecDepto = class(TForm)
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
    qrySoloDeptosIDEDIFICIO: TIntegerField;
    qrySoloDeptosIDDEPARTAMENTO: TIntegerField;
    qrySoloDeptosDESCRIPCION: TStringField;
    Panel5: TPanel;
    btnAgregarEdif: TSpeedButton;
    btnEliminarEdif: TSpeedButton;
    btnModificarEdif: TSpeedButton;
    btnAgregarDepto: TSpeedButton;
    btnEliminarDepto: TSpeedButton;
    btnModificarDepto: TSpeedButton;
    qrySoloDeptosCOEFICIENTE: TFloatField;
    procedure grdEdiDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure qryEdificiosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAgregarEdifClick(Sender: TObject);
    procedure btnEliminarEdifClick(Sender: TObject);
    procedure btnModificarEdifClick(Sender: TObject);
    procedure btnAgregarDeptoClick(Sender: TObject);
    procedure btnEliminarDeptoClick(Sender: TObject);
    procedure btnModificarDeptoClick(Sender: TObject);

  private
    gModo: Byte; //0: Consulta, 1: Muestra, 2: Eleccion
    Procedure PrepararQuery(const Modo: Byte);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer): Boolean;
    Function getEnt(var IdDepto, IdEdif:Integer;var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar(const T: String);

  end;

var
  frmElecDepto: TfrmElecDepto;

implementation

uses Util, Comunes, IngEdificio, IngDepto;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecDepto.getId(var Id: Integer): Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := qrySoloDeptosIdDepartamento.Value;
     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Function TfrmElecDepto.getEnt(var IdDepto, IdEdif:Integer; var Desc:String):Boolean;
begin
     Result := False;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
          IdDepto := qrySoloDeptosIdDepartamento.Value;
          IdEdif := qrySoloDeptosIDEDIFICIO.Value;
          Desc := qryEdificiosDESCRIPCION.Text + ' ' + qrySoloDeptosDESCRIPCION.Text;
     end;
     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Procedure TfrmElecDepto.Mostrar;
begin
     PrepararForm(1);

     ShowModal;

     qryEdificios.Close;
     qrySoloDeptos.Close;
end;

Procedure TfrmElecDepto.Consultar(const T: String);
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

Procedure TfrmElecDepto.PrepararQuery(const Modo: Byte);
begin
     with qryEdificios do
     begin
          Close;
          Open;
     end;
end;

Procedure TfrmElecDepto.PrepararForm(const Modo: Byte);
begin
     gModo := Modo;
     PrepararQuery(Modo);
     btnElegir.Visible := (Modo = 2);
     btnEliminarEdif.Enabled := (qryEdificios.RecordCount > 0);
     btnModificarEdif.Enabled := (qryEdificios.RecordCount > 0);
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecDepto.grdEdiDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecDepto.btnCancelarClick(Sender: TObject);
begin
  qryEdificios.Close;
  qrySoloDeptos.Close;
end;

procedure TfrmElecDepto.qryEdificiosAfterScroll(DataSet: TDataSet);
begin
  with qrySoloDeptos do
  begin
    DisableControls;
    Close;
    ParamByName('N').AsInteger := qryEdificiosIdEdificio.Value;
    Open;
    btnEliminarDepto.Enabled := (RecordCount > 0);
    btnModificarDepto.Enabled := (RecordCount > 0);
    btnElegir.Enabled := (RecordCount > 0);
    EnableControls;
  end;
end;

procedure TfrmElecDepto.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'1.col',grdEdi);
  RecuperarEstadoGrilla(Name+'2.col',grdDto);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecDepto.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'1.col',grdEdi);
  GuardarEstadoGrilla(Name+'2.col',grdDto);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmElecDepto.btnAgregarEdifClick(Sender: TObject);
var
        R:Boolean;
        IdEdificio:integer;
begin
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Insertar(IdEdificio);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gModo);
                Existe(qryEdificios,'IdEdificio',IdEdificio);
        end;
end;

procedure TfrmElecDepto.btnEliminarEdifClick(Sender: TObject);
var
        R:Boolean;
begin
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Eliminar(qryEdificiosIDEDIFICIO.Value);
                Release;
        end;
        if R then
                PrepararQuery (gModo);
end;

procedure TfrmElecDepto.btnModificarEdifClick(Sender: TObject);
var
        R:Boolean;
        IdEdificio:integer;
begin
        IdEdificio:=qryEdificiosIDEDIFICIO.Value;
        with TfrmIngEdificio.Create(nil) do
        begin
                R:=Actualizar(IdEdificio);
                Release;
        end;
        if R then
        begin
                PrepararQuery (gModo);
                Existe(qryEdificios,'IdEdificio',IdEdificio);
        end;
end;

procedure TfrmElecDepto.btnAgregarDeptoClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  with TfrmIngDepto.Create(nil) do
  begin
    R := Insertar(qryEdificiosIDEDIFICIO.Value, Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery (gModo);
    Existe(qrySoloDeptos,'IDDEPARTAMENTO',Id);
  end;
end;

procedure TfrmElecDepto.btnEliminarDeptoClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngDepto.Create(nil) do
  begin
    R := Eliminar(qrySoloDeptosIDDEPARTAMENTO.Value);
    Release;
  end;

  if R then
    PrepararQuery(gModo);
end;

procedure TfrmElecDepto.btnModificarDeptoClick(Sender: TObject);
var
  R: Boolean;
  Id: Integer;
begin
  Id := qrySoloDeptosIDDEPARTAMENTO.Value;
  with TfrmIngDepto.Create(nil) do
  begin
    R := Actualizar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gModo);
    Existe(qrySoloDeptos,'IdDepartamento',Id);
  end;
end;

end.
