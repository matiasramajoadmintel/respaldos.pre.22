unit IngIngreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBTables;

type
  TfrmIngIngreso = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    dtpFecha: TDateTimePicker;
    ComboServicio: TComboBox;
    edtImpMant: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnBuscarServ: TSpeedButton;
    rgPago: TRadioGroup;
    edtNroCheque: TEdit;
    lblNrocheque: TLabel;
    edtNroRecibo: TEdit;
    Label3: TLabel;
    edtSr: TEdit;
    Label5: TLabel;
    edtImpServ: TEdit;
    Label6: TLabel;
    btnBuscarSr: TSpeedButton;
    ING: TTable;
    INGIDINGRESO: TIntegerField;
    INGIDTIPO_INGRESO: TIntegerField;
    INGFECHA_PAGO: TDateTimeField;
    INGTIPO_PAGO: TStringField;
    INGNRO_CHEQUE: TStringField;
    INGNRO_RECIBO: TIntegerField;
    INGIMPORTE_MANT: TFloatField;
    INGIMPORTE_SERV: TFloatField;
    INGSR: TStringField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarServClick(Sender: TObject);
    procedure rgPagoClick(Sender: TObject);
    procedure btnBuscarSrClick(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario(const Fec: TDateTime; const IdTipoIng: Integer;
                                 const ImpM, ImpS: Currency; const TPago: Char;
                                 const NCheque, Sr: String;
                                 const NRecibo: Integer);
    function DatosValidos: Boolean;
    function Guardar(const Fec: TDateTime; const IdTipoIng: Integer;
                     const ImpM, ImpS: Currency; const TPago: Char;
                     const NCheque, Sr: String;
                     const NRecibo: Integer): Boolean;

  public
    function Ingresar(var Fec: TDateTime; var IdTipoIng: Integer;
                      var ImpM, ImpS: Currency; var TPago: Char;
                      var NCheque, Sr: String;
                      var NRecibo: Integer): Boolean;
    function Agregar: Boolean;
    function Modificar(IdIngreso: Longint): Boolean;
    function Eliminar(IdIngreso: Longint): Boolean;

  end;

var
  frmIngIngreso: TfrmIngIngreso;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, ElecOcupante;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmIngIngreso.Ingresar(var Fec: TDateTime; var IdTipoIng: Integer;
                                 var ImpM, ImpS: Currency; var TPago: Char;
                                 var NCheque, Sr: String;
                                 var NRecibo: Integer): Boolean;
begin
  PrepararFormulario(Fec,IdTipoIng,ImpM, ImpS,TPago,NCheque,Sr,NRecibo);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    Fec := dtpFecha.Date;
    Existe(dmDatos.TING,'DESCRIP',ComboServicio.Text);
    IdTipoIng := dmDatos.TINGIDTIPO_INGRESO.Value;
    ImpM := StrToCurr(edtImpMant.Text);
    ImpS := StrToCurr(edtImpServ.Text);
    if rgPago.ItemIndex = 0 then TPago := 'E'
    else TPago := 'C';
    NCheque := edtNroCheque.Text;
    NRecibo := StrToInt(edtNroRecibo.Text);
    Sr := edtSr.Text;
  end;
end;

function TfrmIngIngreso.Agregar: Boolean;
var
   Fec: TDateTime;
   IdIng, NRecibo: Integer;
   ImpM, ImpS: Currency;
   R: Boolean;
   TPago: Char;
   NCheque, Sr: String;
begin
  Fec := Date;
  IdIng := -1;
  ImpM := 0;
  ImpS := 0;
  TPago := 'E';
  NCheque := '';
  Sr := '';
  NRecibo := 0;

  Result := Ingresar(Fec,IdIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);

  if Result then
  begin
    ING.Open;
    ING.Append;
    Result := Guardar(Fec,IdIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);
  end;
end;

function TfrmIngIngreso.Modificar(IdIngreso: Longint): Boolean;
var
   Fec: TDateTime;
   IdTipoIng, NRecibo: Integer;
   ImpM, ImpS: Currency;
   R: Boolean;
   TPago: Char;
   NCheque, Sr: String;
begin
  Existe(ING, 'IDINGRESO', IdIngreso);

  Fec := INGFECHA_PAGO.Value;
  IdTipoIng := INGIDTIPO_INGRESO.Value;
  ImpM := INGIMPORTE_MANT.Value;
  ImpS := INGIMPORTE_SERV.Value;
  TPago := INGTIPO_PAGO.Text[1];
  NCheque := INGNRO_CHEQUE.Text;
  Sr := INGSR.Text;
  NRecibo := INGNRO_RECIBO.Value;

  Result := Ingresar(Fec,IdTipoIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);

  if Result then
  begin
    ING.Edit;
    Result := Guardar(Fec,IdTipoIng,ImpM,ImpS,TPago,NCheque,Sr,NRecibo);
  end;
end;

function TfrmIngIngreso.Eliminar(IdIngreso: Longint): Boolean;
begin
  Existe(ING, 'IDINGRESO', IdIngreso);

  Result := False;
  if Confirmar('¿Está seguro de eliminar el ítem elegido?') then
    try
      ING.Delete;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar eliminar el ítem.');
        Exit;
      end;
    end;

  Result := True;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmIngIngreso.PrepararFormulario(const Fec: TDateTime;
                                            const IdTipoIng: Integer;
                                            const ImpM, ImpS: Currency;
                                            const TPago: Char;
                                            const NCheque, Sr: String;
                                            const NRecibo: Integer);
begin
  CargarListaCampo(ComboServicio,dmDatos.TING,'DESCRIP');

  dtpFecha.Date := Fec;
  if IdTipoIng = -1 then ComboServicio.Text := ''
  else
  begin
    Existe(dmDatos.TING,'IDTIPO_INGRESO',IdTipoIng);
    ComboServicio.Text := dmDatos.TINGDESCRIP.Text;
  end;
  edtImpMant.Text := CurrToStr(ImpM);
  edtImpServ.Text := CurrToStr(ImpS);
  if TPago = 'C' then rgPago.ItemIndex := 1
  else rgPago.ItemIndex := 0;
  rgPagoClick(nil);
  edtNroCheque.Text := NCheque;
  edtNroRecibo.Text := IntToStr(NRecibo);
  edtSr.Text := Sr;

  ActiveControl := dtpFecha;
end;

function TfrmIngIngreso.DatosValidos: Boolean;
begin
  Result := False;

  if (ComboServicio.Text = '') or (edtImpMant.Text = '') or
     (edtImpServ.Text = '') or ((rgPago.ItemIndex = 1) and
     (edtNroCheque.Text = '')) then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

function TfrmIngIngreso.Guardar(const Fec: TDateTime;
                                const IdTipoIng: Integer;
                                const ImpM, ImpS: Currency;
                                const TPago: Char;
                                const NCheque, Sr: String;
                                const NRecibo: Integer): Boolean;
begin
  Result := True;
  try
      with  ING do
      begin
        INGFECHA_PAGO.Value := Fec;
        INGIDTIPO_INGRESO.Value := IdTipoIng;
        INGIMPORTE_MANT.Value := ImpM;
        INGIMPORTE_SERV.Value := ImpS;
        INGTIPO_PAGO.Text := TPago;
        INGNRO_CHEQUE.Text := NCheque;
        INGNRO_RECIBO.Value := NRecibo;
        INGSR.Value := Sr;
        Post;
        Refresh;
      end;
      except on EDatabaseError do
      begin
        MsjError('Se produjo un error al intentar actualizar. Compruebe que los '+
                 'datos están completos y que no hay números de recibo repetidos.');
        ING.Cancel;
        Result := False;
      end;
    end;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmIngIngreso.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngIngreso.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngIngreso.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngIngreso.PressEnter(Sender: TObject; var Key: Char);
begin
  if (Sender = edtImpMant) or (Sender = edtImpServ) or (Sender = edtNroRecibo) then
  begin
    case key of
      '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
       else key:=#0;
    end;

    if (Key = ',') or (Key = '.') then key := DecimalSeparator;
  end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngIngreso.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmIngIngreso.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngIngreso.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngIngreso.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngIngreso.btnBuscarServClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('TIPO_INGRESO',Id,Desc);
    Release;
  end;

  if not R then Exit;

  dmDatos.TING.Refresh;
  CargarListaCampo(ComboServicio,dmDatos.TING,'DESCRIP');
  ComboServicio.Text := Desc;
end;

procedure TfrmIngIngreso.rgPagoClick(Sender: TObject);
begin
  lblNrocheque.Enabled := (rgPago.ItemIndex = 1);
  edtNroCheque.Enabled := (rgPago.ItemIndex = 1);
  edtNroCheque.Text := '';
end;

procedure TfrmIngIngreso.btnBuscarSrClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
begin
  with TfrmElecOcupante.Create(nil) do
  begin
    Id := GetId(Desc, 0);
    Release;
  end;

  if Id <> 0 then edtSr.Text := Desc;
end;

end.
