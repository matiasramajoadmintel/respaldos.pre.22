unit IngGastoFi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DBCtrls, DB, Mask,
  DBTables, DateUtils;

type
  TfrmIngGastoFi = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    dtpFecha: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnBuscarServ: TSpeedButton;
    Label3: TLabel;
    GASTO: TTable;
    GASTOIDTIPO_GASTO_FI: TIntegerField;
    GASTOFECHA_PAGO: TDateTimeField;
    GASTOCOSTO: TFloatField;
    GASTONRO_HOJA: TIntegerField;
    GASTOIDGASTO_FI: TIntegerField;
    edtHoja: TDBEdit;
    DataSource1: TDataSource;
    GASTOTipoGasto: TStringField;
    ComboGasto: TDBLookupComboBox;
    edtCosto: TDBEdit;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBuscarServClick(Sender: TObject);
    procedure GASTONewRecord(DataSet: TDataSet);

  private
    Teclas: Byte;
    gId: Longword;
    procedure PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
    function DatosValidos: Boolean;
    function Guardar: Boolean;

  public
    function Agregar(var Id: Longword): Boolean;
    function Eliminar(const Id: Longword): Boolean;
    function Modificar(const Id: Longword): Boolean;

  end;

var
  frmIngGastoFi: TfrmIngGastoFi;

implementation

uses Comunes, Util, PoolDatos, ElecEnt, StoreProcs;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

{function TfrmIngGastoFi.Ingresar(var Fec: TDateTime; var IdServ: Integer;
                                 var Costo: Currency; var Hoja: Word): Boolean;
begin
  PrepararFormulario(Fec,IdServ,Costo,Hoja);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    Fec := dtpFecha.Date;
    GuardarValorRegistro(Name,'Fecha',DateToStr(Fec));

    Existe(dmDatos.TGASTOFI,'DESCRIP',ComboServicio.Text);
    IdServ := dmDatos.TGASTOFIIDTIPO_GASTO_FI.Value;
    GuardarValorRegistro(Name,'IdServ',IntToStr(IdServ));

    Costo := StrToCurr(edtCosto.Text);

    Hoja := UpDown1.Position;
  end;
end;}

{ACLARACION: FECHA_PAGO no representa la fecha de pago del gasto sino la fecha
 en la que se produce o se carga el gasto. La verdadera fecha de pago se encuentra
 en la tabla PAGOS}

function TfrmIngGastoFi.Agregar(var Id: Longword): Boolean;
begin
  PrepararFormulario(0,0);

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then Id := gId;
end;

function TfrmIngGastoFi.Eliminar(const Id: Longword): Boolean;
begin
  Result := False;

  if Confirmar('¿Esta seguro de eliminar el ìtem elegido?') then
  begin
    if not Existe(GASTO,'IDGASTO_FI',Id) then
    begin
      MsjError('No se puedo eliminar el gasto. No se encontró el registro.');
      Exit;
    end;
    try
      GASTO.Delete;
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

function TfrmIngGastoFi.Modificar(const Id: Longword): Boolean;
begin
  PrepararFormulario(2,Id);

  ShowModal;

  Result := (ModalResult = mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

{procedure TfrmIngGastoFi.PrepararFormulario(const Fec: TDateTime;
                                            const IdServ: Integer;
                                            const Costo: Currency;
                                            const Hoja: Word);
var
  F, S: String;
begin
  CargarListaCampo(ComboServicio,dmDatos.TGASTOFI,'DESCRIP');

  if IdServ = -1 then
  begin
    S := RecuperarValorRegistro(Name,'IdServ');
    if S = 'Sin nombre' then S := '1';
    Existe(dmDatos.TGASTOFI,'IDTIPO_GASTO_FI',S);
    F := RecuperarValorRegistro(Name,'Fecha');
    if F = 'Sin nombre' then F := DateToStr(Date);
    dtpFecha.Date := StrToDate(F);
  end
  else
  begin
    Existe(dmDatos.TGASTOFI,'IDTIPO_GASTO_FI',IdServ);
    dtpFecha.Date := Fec;
  end;

  ComboServicio.Text := dmDatos.TGASTOFIDESCRIP.Text;
  edtCosto.Text := CurrToStr(Costo);
  UpDown1.Position := Hoja;
end;}

procedure TfrmIngGastoFi.PrepararFormulario(const Modo: Byte; const IdGasto: Longword);
var
  F, S, P, H: String;
begin
  if Modo = 2 then //Modificación
  begin
    Caption := 'Modificar gasto financiero';
    Existe(GASTO,'IDGASTO_FI',IdGasto);
    GASTO.Edit;
  end
  else if Modo = 0 then //Alta
  begin
    Caption := 'Agregar gasto financiero';
    GASTO.Open;
    GASTO.Append;

    H := RecuperarValorRegistro(Name,'NroHoja');
    if H <> 'Sin nombre' then
      GASTONRO_HOJA.Value := StrToInt(H);

    F := RecuperarValorRegistro(Name,'Fecha');
    if F = 'Sin nombre' then F := DateToStr(Date);
    GASTOFECHA_PAGO.Value := StrToDate(F);
  end;

  ActiveControl := edtHoja;
  dtpFecha.Date := GASTOFECHA_PAGO.Value;
end;

function TfrmIngGastoFi.DatosValidos: Boolean;
begin
  Result := False;

  if (ComboGasto.Text = '') or (edtCosto.Text = '') then
  begin
    MsjError('Los datos deben estar completos');
    Exit;
  end;

  Result := True;
end;

function TfrmIngGastoFi.Guardar: Boolean;
begin
  Result := False;

  if Editando(GASTO) then
    try
      GASTOFECHA_PAGO.Value := DateOf(dtpFecha.Date);
      GASTO.Post;

      GuardarValorRegistro(Name,'Fecha',GASTOFECHA_PAGO.Text);
      GuardarValorRegistro(Name,'NroHoja', IntToStr(GASTONRO_HOJA.Value));
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

procedure TfrmIngGastoFi.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngGastoFi.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngGastoFi.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngGastoFi.PressEnter(Sender: TObject; var Key: Char);
begin
  if Sender = edtCosto then
  begin
    case key of
      '1','2','3','4','5','6','7','8','9','0',',','.',#8,#13,#27:begin end;
       else key:=#0;
    end;

    if (Key = ',') or (Key = '.') then key := DecimalSeparator;
  end;

  if Sender = edtHoja then
    case key of
      '1','2','3','4','5','6','7','8','9','0',#8,#13,#27:begin end;
       else key:=#0;
    end;

  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmIngGastoFi.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  if not Guardar then Exit;  
  ModalResult := mrOk;
end;

procedure TfrmIngGastoFi.btnCancelarClick(Sender: TObject);
begin
//  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmIngGastoFi.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmIngGastoFi.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmIngGastoFi.btnBuscarServClick(Sender: TObject);
var
  Id: Integer;
  Desc: String;
  R: Boolean;
begin
  with TfrmElecEnt.Create(nil) do
  begin
    R := getEnt('TIPO_GASTO_FI',Id,Desc);
    Release;
  end;

  GASTOIDTIPO_GASTO_FI.Value := Id;
  ComboGasto.Refresh;

  if not R then Exit;

//  ComboServicio.Text := Desc;
end;

procedure TfrmIngGastoFi.GASTONewRecord(DataSet: TDataSet);
begin
  gId := dmStoreProc.getId('IDGASTO_FI') + 1;
  GASTOIDGASTO_FI.Value := gId;
end;

end.
