unit DetPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables;

type
  TfrmDetPagos = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    grdDatos: TDBGrid;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    dsDatos: TDataSource;
    pnlTitulo: TPanel;
    qryDetPagos: TQuery;
    qryDetPagosIDPAGO: TIntegerField;
    qryDetPagosFECHA: TDateTimeField;
    qryDetPagosDESCRIP: TStringField;
    qryDetPagosIMPORTE: TFloatField;
    qryDetPagosNRO_DECI: TIntegerField;
    qryDetPagosNRO_ORDEN: TIntegerField;
    qryDetPagosNRO_FACT: TIntegerField;
    TRAB: TTable;
    TRABEDIF: TTable;
    TRABDTO: TTable;
    TRABIDTRABAJO: TIntegerField;
    TRABNRO_ORDEN: TIntegerField;
    TRABNRO_DECI: TIntegerField;
    TRABEDIFIDTRABAJO: TIntegerField;
    TRABEDIFIDEDIFICIO: TIntegerField;
    TRABEDIFIDTIPO_ESPACIO: TIntegerField;
    TRABDTOIDTRABAJO: TIntegerField;
    TRABDTOIDDEPARTAMENTO: TIntegerField;
    TRABTIPO_TRAB: TStringField;
    TESP: TTable;
    TESPIDTIPO_ESPACIO: TIntegerField;
    TESPDESCRIP: TStringField;
    TRABEDIFEdificio: TStringField;
    TRABEDIFEspacio: TStringField;
    qryDetPagosLugar: TStringField;
    TRABDTODepto: TStringField;
    Panel4: TPanel;
    StaticText1: TStaticText;
    qryDetPagosTIPO: TStringField;
    qryDetPagosID: TIntegerField;
    SERVEDIF: TTable;
    SERVEDIFIDEDIFICIO: TIntegerField;
    SERVEDIFDescEdif: TStringField;
    SERVEDIFIDSERV_EDIF: TIntegerField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qryDetPagosCalcFields(DataSet: TDataSet);

  private
    Teclas: Byte;
    procedure PrepararFormulario(const Id: Integer; const DescProv: String);

  public
    procedure Mostrar(const Id: Integer; const DescProv: String);

  end;

var
  frmDetPagos: TfrmDetPagos;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmDetPagos.Mostrar(const Id: Integer; const DescProv: String);
begin
  PrepararFormulario(Id,DescProv);

  ShowModal;

  qryDetPagos.Close;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmDetPagos.PrepararFormulario(const Id: Integer; const DescProv: String);
begin
  qryDetPagos.ParamByName('N').AsInteger := Id;
  qryDetPagos.Open;

  pnlTitulo.Caption := 'Proveedor: ' + DescProv;
  StaticText1.Caption := 'Importe total: ' + CurrToStrF(SumaColumna(qryDetPagos,'Importe'), ffCurrency, 2)
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmDetPagos.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmDetPagos.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmDetPagos.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmDetPagos.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmDetPagos.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDetPagos.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDetPagos.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmDetPagos.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmDetPagos.qryDetPagosCalcFields(DataSet: TDataSet);
begin
  if qryDetPagosTIPO.Text = 'T' then
  begin
    if Existe(TRAB,'IDTRABAJO',qryDetPagosID.Value) then
    begin
      if TRABTIPO_TRAB.Text = 'E' then
      begin
        Existe(TRABEDIF,'IDTRABAJO',TRABIDTRABAJO.Value);
        qryDetPagosLugar.Text := TRABEDIFEdificio.Text + ' - ' + TRABEDIFEspacio.Text;
      end
      else
      begin
        Existe(TRABDTO,'IDTRABAJO',TRABIDTRABAJO.Value);
        qryDetPagosLugar.Text := TRABDTODepto.Text;
      end;
    end;
  end
  else if qryDetPagosTIPO.Text = 'S' then
  begin
    if Existe(SERVEDIF, 'IDSERV_EDIF', qryDetPagosID.Value) then
      qryDetPagosLugar.Text := SERVEDIFDescEdif.Text;
  end;
end;

end.
