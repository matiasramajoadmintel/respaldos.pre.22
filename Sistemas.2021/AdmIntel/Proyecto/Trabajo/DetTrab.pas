unit DetTrab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables;

type
  TfrmDetTrab = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    grdDatos: TDBGrid;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    dsDatos: TDataSource;
    qryTareas: TQuery;
    qryTareasTAREA: TStringField;
    pnlTitulo: TPanel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario(const IdTrab: Integer);

  public
    procedure Mostrar(const IdTrab: Integer);

  end;

var
  frmDetTrab: TfrmDetTrab;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmDetTrab.Mostrar(const IdTrab: Integer);
begin
  PrepararFormulario(IdTrab);

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmDetTrab.PrepararFormulario(const IdTrab: Integer);
begin
  with qryTareas do
  begin
    Close;
    ParamByName('N').AsInteger := IdTrab;
    Open;
  end;

  Existe(dmDatos.TRAB,'IDTRABAJO',IdTrab);
  pnlTitulo.Caption := 'Trabajo Nº ' + dmDatos.TRABNRO_PEDIDO.Text;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmDetTrab.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmDetTrab.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmDetTrab.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmDetTrab.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmDetTrab.btnAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDetTrab.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDetTrab.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmDetTrab.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

end.
