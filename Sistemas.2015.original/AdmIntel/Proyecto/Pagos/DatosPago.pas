unit DatosPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, Mask, DB, DateUtils;

type
  TfrmDatosPago = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    dsPago: TDataSource;
    dtpFechaPago: TDateTimePicker;
    DBEdit1: TDBEdit;
    rgTipoPago: TDBRadioGroup;
    edtCheque: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblCheque: TLabel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgTipoPagoClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(const IdPago: Integer; const M: Byte);
    function DatosValidos: Boolean;

  public
    procedure Modificar(const IdPago: Integer);

  end;

var
  frmDatosPago: TfrmDatosPago;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmDatosPago.Modificar(const IdPago: Integer);
begin
  Modo := 2;
  PrepararFormulario(IdPago,2);

  ShowModal;

  dmDatos.PAGO.Close;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmDatosPago.PrepararFormulario(const IdPago: Integer; const M: Byte);
begin
  with dmDatos do
  begin
    Existe(PAGO,'IDPAGO',IdPago);
    pnlTitulo.Caption := PAGOProveedor.Text;
    dtpFechaPago.Date := PAGOFECHA_PAGO.Value;
    PAGO.Edit;
  end;

  rgTipoPagoClick(nil);
  ActiveControl := dtpFechaPago;
end;

function TfrmDatosPago.DatosValidos: Boolean;
begin
  Result := False;

  if (rgTipoPago.ItemIndex = 1) and (edtCheque.Text = '') then
  begin
    MsjError('Falta el número de cheque');
    Exit;
  end;

  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmDatosPago.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmDatosPago.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmDatosPago.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmDatosPago.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmDatosPago.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  if Editando(dmDatos.PAGO) then
  begin
    dmDatos.PAGOFECHA_PAGO.Value := DateOf(dtpFechaPago.Date);
    dmDatos.PAGO.Post;
  end;
  ModalResult := mrOk;
end;

procedure TfrmDatosPago.btnCancelarClick(Sender: TObject);
begin
  if Editando(dmDatos.PAGO) then dmDatos.PAGO.Cancel;
  ModalResult := mrCancel;
end;

procedure TfrmDatosPago.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmDatosPago.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmDatosPago.rgTipoPagoClick(Sender: TObject);
begin
  lblCheque.Enabled := (rgTipoPago.ItemIndex = 1);
  edtCheque.Enabled := (rgTipoPago.ItemIndex = 1);
end;

end.
