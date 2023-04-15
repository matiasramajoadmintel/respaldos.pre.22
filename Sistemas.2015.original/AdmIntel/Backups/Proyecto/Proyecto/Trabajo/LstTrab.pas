unit LstTrab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables;

type
  TfrmLstTrab = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    grdDatos: TDBGrid;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    dsDatos: TDataSource;
    qryTrab: TQuery;
    qryTrabIDTRABAJO: TIntegerField;
    qryTrabNRO_PEDIDO: TIntegerField;
    qryTrabIDDEPTO: TIntegerField;
    qryTrabFECHA_INI: TDateTimeField;
    qryTrabFECHA_FIN: TDateTimeField;
    qryTrabRAZON_SOCIAL: TStringField;
    qryTrabCOSTO: TFloatField;
    qryTrabDepto: TStringField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosDblClick(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario;

  public
    procedure Mostrar;

  end;

var
  frmLstTrab: TfrmLstTrab;

implementation

uses Comunes, Util, PoolAlcaldia, DetTrab;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmLstTrab.Mostrar;
begin
  PrepararFormulario;

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmLstTrab.PrepararFormulario;
begin
  qryTrab.Open;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmLstTrab.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmLstTrab.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmLstTrab.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmLstTrab.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmLstTrab.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmLstTrab.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLstTrab.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmLstTrab.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmLstTrab.grdDatosDblClick(Sender: TObject);
begin
  with TfrmDetTrab.Create(nil) do
  begin
    Mostrar(qryTrabIDTRABAJO.Value);
    Release;
  end;
end;

end.
