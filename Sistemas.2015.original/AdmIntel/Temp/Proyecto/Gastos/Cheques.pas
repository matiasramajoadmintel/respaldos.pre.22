unit Cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons;

type
  TfrmCheques = class(TForm)
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Panel3: TPanel;
    btnDetalle: TSpeedButton;
    Panel4: TPanel;
    btnCancelar: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    btnDevolucion: TSpeedButton;
    qryCheques: TQuery;
    qryChequesFECHA: TDateTimeField;
    qryChequesPROVEEDOR: TStringField;
    qryChequesIMPORTE: TFloatField;
    qryChequesNROCHEQUE: TStringField;
    qryChequesCOBRADO: TStringField;
    qryChequesIDPAGO: TIntegerField;
    procedure grdDatosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnDevolucionClick(Sender: TObject);
    procedure btnDetalleClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);

  private
    Teclas: Byte;
    gOrderField: String;
    Procedure PrepararForm;
    Procedure PrepararQuery(OrderField: String);

  public
    Procedure Mostrar;

  end;

var
  frmCheques: TfrmCheques;

implementation

uses Comunes, Util, PoolCheques, Pagos, DetPagos, PoolDatos;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

Procedure TfrmCheques.Mostrar;
begin
     PrepararForm;
     gOrderField := 'Fecha';
     PrepararQuery('Fecha');

     ShowModal;

     qryCheques.Close;
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmCheques.PrepararForm;
begin
  {}
end;

Procedure TfrmCheques.PrepararQuery(OrderField: String);
var
  Id: Longint;
begin
  qryCheques.DisableControls;
  Id := qryChequesIDPAGO.Value;
  qryCheques.SQL.Clear;
  qryCheques.SQL.Add('SELECT * FROM VW_CHEQUES_EMITIDOS');
  qryCheques.SQL.Add(' ORDER BY ' + OrderField);
  qryCheques.Open;
  Existe(qryCheques, 'IdPago', Id);
  qryCheques.EnableControls;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmCheques.grdDatosDblClick(Sender: TObject);
begin
  with dmDatos,PAGO do
  begin
    Existe(PAGO, 'IDPAGO', qryChequesIdPago.Value);
    if PAGOCOBRADO.Text <> 'D' then
    begin
      Edit;
      if PAGOCOBRADO.Text = 'Sí' then PAGOCOBRADO.Text := 'No'
      else PAGOCOBRADO.Text := 'Sí';
      Post;
    end;
  end;
  PrepararQuery(gOrderField);
end;

procedure TfrmCheques.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmCheques.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmCheques.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmCheques.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmCheques.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmCheques.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
//    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmCheques.btnDevolucionClick(Sender: TObject);
begin
    with TfrmPagos.Create(nil) do
    begin
      if DevolverChequeExt(qryChequesIDPAGO.Value) then PrepararQuery(gOrderField);
      Release;
    end;
end;

procedure TfrmCheques.btnDetalleClick(Sender: TObject);
begin
    with TfrmDetPagos.Create(nil) do
    begin
      Mostrar(qryChequesIDPAGO.Value, qryChequesProveedor.Text);
      Release;
    end;
end;

procedure TfrmCheques.grdDatosTitleClick(Column: TColumn);
begin
  gOrderField := Column.FieldName;
  PrepararQuery(gOrderField);
end;

end.
