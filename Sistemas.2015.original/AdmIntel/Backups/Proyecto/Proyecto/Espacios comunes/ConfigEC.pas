unit ConfigEC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables, DBCtrls,
  Menus, Variants;

type
  TfrmConfigEC = class(TForm)
    PanelTitulo: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnCancelar: TBitBtn;
    dsTESP: TDataSource;
    Panel4: TPanel;
    AgregarButton: TBitBtn;
    QuitarButton: TBitBtn;
    Panel5: TPanel;
    lblArriba: TLabel;
    TESP: TTable;
    dsEC: TDataSource;
    Panel6: TPanel;
    qryUpdate: TQuery;
    qryEC: TQuery;
    EC: TTable;
    Label1: TLabel;
    TESPIDTIPO_ESPACIO: TIntegerField;
    TESPDESCRIP: TStringField;
    ECIDEDIFICIO: TIntegerField;
    ECIDTIPO_ESPACIO: TIntegerField;
    qryECIDEDIFICIO: TIntegerField;
    qryECIDTIPO_ESPACIO: TIntegerField;
    qryECDESCRIP: TStringField;
    btnAceptar: TBitBtn;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgregarButtonClick(Sender: TObject);
    procedure QuitarButtonClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);

  private
    gIdEdificio: Integer;
    procedure PrepararFrom(const IdEC: Integer; const DescEC: String);

  public
    procedure Configurar(const IdEC: Integer; const DescEC:String);

  end;

var
  frmConfigEC: TfrmConfigEC;

implementation

{$R *.DFM}

uses Util, Comunes, ElecEnt, PoolDatos, Input;

{***************************  PUBLICOS  ***************************************}

procedure TfrmConfigEC.Configurar(const IdEC: Integer; const DescEC:String);
begin
     gIdEdificio := IdEC;
     PrepararFrom(IdEC,DescEC);

     ShowModal;
end;

{***************************  PRIVADOS  ***************************************}

procedure TfrmConfigEC.PrepararFrom(const IdEC: Integer; const DescEC: String);
begin
  PanelTitulo.Caption := DescEC;

  if not dmDatos.ADB.InTransaction then dmDatos.ADB.StartTransaction;

  TESP.Open;
  EC.Open;
  with qryEC do
  begin
    Close;
    ParamByName('N').AsFloat := IdEC;
    Open;
    QuitarButton.Enabled := not(RecordCount=0);
  end;
end;

{***************************  EVENTOS  ****************************************}

procedure TfrmConfigEC.FormClose(Sender: TObject;var Action: TCloseAction);
begin
     Release;
end;

procedure TfrmConfigEC.AgregarButtonClick(Sender: TObject);
var
  IdTESP: Integer;
begin
     if TESP.RecordCount = 0 then
     begin MsjError('No hay elementos disponibles.'); Exit; end;

     IdTESP := TESPIDTIPO_ESPACIO.Value;
     if not Existe(EC,'IDTIPO_ESPACIO','IDEDIFICIO',
                   VarArrayOf([IdTESP,gIdEdificio])) then
     begin
          EC.Append;
          ECIDTIPO_ESPACIO.Value := IdTESP;
          ECIDEDIFICIO.Value := gIdEdificio;
          EC.Post;
     end
     else
     begin
       MsjError('No puede repetirse, para un mismo edificio, el tipo de espacio común');
       Exit;
     end;

     EC.Refresh;
     with qryEC do
     begin
       Close;
       ParamByName('N').AsFloat := gIdEdificio;
       Open;
       QuitarButton.Enabled := not(RecordCount=0);
     end;
end;

procedure TfrmConfigEC.QuitarButtonClick(Sender: TObject);
var
  Cond: String;
begin
  if Confirmar('¿Está seguro de quitar el tipo de espacio común elegido?') then
    BajaSQL('ESPACIO_COMUN','IDEDIFICIO = ' + IntToStr(gIdEdificio) +
            ' AND IDTIPO_ESPACIO = ' + qryECIDTIPO_ESPACIO.Text, qryUpdate);

  with qryEC do
  begin
    Close;
    ParamByName('N').AsFloat := gIdEdificio;
    Open;
    QuitarButton.Enabled := not(RecordCount=0);
  end;
  EC.Refresh;
end;

procedure TfrmConfigEC.btnCancelarClick(Sender: TObject);
begin
  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;
end;

procedure TfrmConfigEC.btnAceptarClick(Sender: TObject);
begin
  if dmDatos.ADB.InTransaction then dmDatos.ADB.Commit;
end;

procedure TfrmConfigEC.btnAgregarClick(Sender: TObject);
var
  Desc: String;
begin
  if IngresarTexto(Desc,'Tipo de espacio común') then
  begin
    try
      TESP.Append;
      TESPDESCRIP.Text := Desc;
      TESP.Post;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar agregar el nuevo ítem. ' +
                 'Verifique que no haya descripciones repetidas');
        Exit;
      end;
    end;
    TESP.Refresh;
  end;
end;

procedure TfrmConfigEC.btnEliminarClick(Sender: TObject);
begin
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
  begin
    try
      TESP.Delete;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar eliminar el ítem. ' +
                 'Verifique que no esté siendo usado en algún edificio.');
        Exit;
      end;
    end;
    TESP.Refresh;
  end;
end;

end.
