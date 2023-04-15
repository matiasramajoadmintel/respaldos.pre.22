unit Obra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables, DBCtrls,
  Mask;

type
  TfrmObra = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    Table: TTable;
    TableIdObra: TSmallintField;
    TableIdTipoObra: TSmallintField;
    TableIdCliente: TSmallintField;
    TableNombre: TStringField;
    TableDescripcion: TStringField;
    TablePresupuesto: TFloatField;
    TableHonorarios: TFloatField;
    TableSuperficie: TFloatField;
    TableCantidadAmbientes: TSmallintField;
    TableCantidadBanos: TSmallintField;
    TableFechaInicio: TDateTimeField;
    TableFechaFin: TDateTimeField;
    TableEstado: TStringField;
    TableTiempoEstimado: TSmallintField;
    TablePorcentaje: TIntegerField;
    TIPO: TTable;
    CLI: TTable;
    TIPOIdTipoObra: TSmallintField;
    TIPODescrip: TStringField;
    CLIIdCliente: TSmallintField;
    CLIRazonSocial: TStringField;
    TableTipoObra: TStringField;
    TableCliente: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    edtNombre: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    lblFin: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFin: TDateTimePicker;
    TrackBar1: TTrackBar;
    btnBuscarTipoObra: TSpeedButton;
    btnBuscarCliente: TSpeedButton;
    ComboEstado: TDBComboBox;
    TableMoneda: TStringField;
    DBComboBox2: TDBComboBox;
    Label15: TLabel;
    edtPorcentaje: TDBEdit;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TableFraccion: TStringField;
    TableParcela: TStringField;
    TableUnidadFuncional: TStringField;
    TableNroCuentaMuni: TStringField;
    TableNroPartidaMuni: TStringField;
    TableNroObra: TStringField;
    Label20: TLabel;
    edtNumero: TDBEdit;
    Label21: TLabel;
    DBEdit8: TDBEdit;
    Label22: TLabel;
    DBEdit9: TDBEdit;
    Label23: TLabel;
    DBEdit10: TDBEdit;
    Label24: TLabel;
    DBEdit12: TDBEdit;
    Label25: TLabel;
    DBEdit13: TDBEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ComboEstadoClick(Sender: TObject);
    procedure btnBuscarTipoObraClick(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(M: Byte; Id: Word);
    function DatosValidos: Boolean;

  public
    function Agregar: Boolean;
    function Eliminar(Id: Word): Boolean;
    function Modificar(Id: Word): Boolean;

  end;

var
  frmObra: TfrmObra;

implementation

uses Comunes, Util, MessagesDataSets, ElecEnt, ElecCliente;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmObra.Agregar: Boolean;
begin
  Modo := 0;
  PrepararFormulario(0, 0);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

function TfrmObra.Eliminar(Id: Word): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el ítem elegido?') then Exit;

  try
    Existe(Table, 'IdObra', Id);
    Table.Delete;
    Table.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error al intentar eliminar. ' +
                 'Compruebe que el ítem que desea borrar no haya sido utilizado.');
      Exit;
    end;
  end;

  Result := True;
end;

function TfrmObra.Modificar(Id: Word): Boolean;
begin
  Modo := 2;
  PrepararFormulario(2, Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmObra.PrepararFormulario(M: Byte; Id: Word);
begin
  if M = 0 then //Alta
  begin
    dtpInicio.Date := Date;
    dtpFin.Date := Date + 365;
    Table.Open;
    Table.Append;
  end
  else //Modificación
  begin
    Existe(Table, 'IdObra', Id);
    pnlTitulo.Caption := Table.FieldByName('Nombre').AsString;
    dtpInicio.Date := Table.FieldByName('FechaInicio').AsDateTime;
    if Table.FieldByName('FechaFin').IsNull then
      dtpFin.Date := Date + 365
    else
      dtpFin.Date := Table.FieldByName('FechaFin').AsDateTime;
    Table.Edit;
    Salida_de_Campo(edtPorcentaje);
  end;
  ComboEstadoClick(nil);
  TrackBar1Change(nil);
  ActiveControl := edtNumero;
end;

function TfrmObra.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmObra.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmObra.Salida_de_Campo(Sender: TObject);
begin
  if Sender = edtPorcentaje then
    TrackBar1.Position := Table.FieldByName('Porcentaje').AsInteger;

  if Sender = edtNombre then
    pnlTitulo.Caption := edtNombre.Text;

  SalidaDeCampo(self,Sender);
end;

procedure TfrmObra.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmObra.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmObra.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;

  try
    Table.FieldByName('FechaInicio').AsDateTime := dtpInicio.Date;
    if Table.FieldByName('Estado').AsString = 'TERMINADA' then
      Table.FieldByName('FechaFin').AsDateTime := dtpFin.Date
    else
      Table.FieldByName('FechaFin').Clear;
    Table.Post;
    Table.Close;
    except on E: EDBEngineError do
    begin
      if not dmMessages.ShowMessage(E.Errors[1].NativeError) then
        MsjError('Se produjo un error interno de la base de datos.');
      Table.Cancel;
      Exit;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TfrmObra.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmObra.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmObra.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmObra.TrackBar1Change(Sender: TObject);
begin
  Table.FieldByName('Porcentaje').AsInteger := TrackBar1.Position;
end;

procedure TfrmObra.ComboEstadoClick(Sender: TObject);
begin
  lblFin.Enabled := (ComboEstado.ItemIndex = 2);
  dtpFin.Enabled := (ComboEstado.ItemIndex = 2);
end;

procedure TfrmObra.btnBuscarTipoObraClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getId('TipoObra', Id);
    Release;
  end;

  if R then Table.FieldByName('IdTipoObra').AsInteger := Id;
end;

procedure TfrmObra.btnBuscarClienteClick(Sender: TObject);
var
  R: Boolean;
  Id: Word;
begin
  with TfrmElecCliente.Create(nil) do
  begin
    R := getId(Id);
    Release;
  end;

  if R then Table.FieldByName('IdCliente').AsInteger := Id;
end;

end.
