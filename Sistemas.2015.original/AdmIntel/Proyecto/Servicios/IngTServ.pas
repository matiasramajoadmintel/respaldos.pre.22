unit IngTServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask, DB,
  DBTables, DateUtils;

type
  TfrmIngTServ = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    SERV: TTable;
    DataSource1: TDataSource;
    SERVIDSERVICIO: TIntegerField;
    SERVDESCRIP: TStringField;
    SERVPRORRATEO: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SERVNewRecord(DataSet: TDataSet);

  private
    Teclas: Byte;
    gIdServ: Longword;
    procedure PrepararFormulario(const Modo: Byte; const Id: word);
    function DatosValidos: Boolean;
    function Guardar: Boolean;

  public
    function Agregar(var Id: Word): Boolean;
    function Eliminar(const Id: Word): Boolean;
    function Modificar(const Id: Word): Boolean;

  end;

var
  frmIngTServ: TfrmIngTServ;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, ElecProv, StoreProcs;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmIngTServ.Agregar(var Id: Word): Boolean;
begin
  PrepararFormulario(0,0);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then Id := gIdServ;
end;

function TfrmIngTServ.Eliminar(const Id: Word): Boolean;
begin
  Result := False;

  if Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then
  begin
    if not Existe(SERV,'IDSERVICIO',Id) then
    begin
      MsjError('No se puedo eliminar el gasto porque no se encontró el registro.');
      Exit;
    end;
    try
      SERV.Delete;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar eliminar. Compruebe que el '+
                 'dato que desea eliminar no esté siendo usado.');
        Exit;
      end;
    end;
    Result := True;
  end;
end;

function TfrmIngTServ.Modificar(const Id: Word): Boolean;
begin
  PrepararFormulario(2,Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}


procedure TfrmIngTServ.PrepararFormulario(const Modo: Byte; const Id: word);
var
  F, S, E, P: String;
begin
  if Modo = 2 then //Modificación
  begin
    Caption := 'Modificar servicio';
    Existe(SERV,'IDSERVICIO',Id);
    SERV.Edit;
  end
  else if Modo = 0 then //Alta
  begin
    Caption := 'Agregar servicio';
    SERV.Open;
    SERV.Append;

    SERVPRORRATEO.Value := 2;
  end;
end;

function TfrmIngTServ.DatosValidos: Boolean;
begin
  Result := True;
end;

function TfrmIngTServ.Guardar: Boolean;
begin
  Result := False;

  if Editando(SERV) then
    try
      SERV.Post;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
                 'datos están completos.');
        Exit;
      end;
    end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngTServ.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngTServ.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngTServ.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngTServ.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngTServ.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  if not Guardar then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngTServ.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngTServ.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngTServ.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngTServ.SERVNewRecord(DataSet: TDataSet);
begin
  gIdServ := dmStoreProc.getId('IDSERVICIO') + 1;
  SERVIDSERVICIO.Value := gIdServ;
end;

end.
