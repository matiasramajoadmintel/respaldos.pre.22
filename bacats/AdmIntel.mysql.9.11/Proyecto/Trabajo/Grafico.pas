unit Grafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, DbChart;

type
  TfrmGrafico = class(TForm)
    Panel2: TPanel;
    DBChart1: TDBChart;
    Series1: TPieSeries;
    Panel1: TPanel;
    btnAceptar: TBitBtn;
    Series2: TPieSeries;
    Series3: TLineSeries;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas: Byte;
    procedure PrepararFormulario(const Titulo: String; const Tipo: Byte);
    function DatosValidos: Boolean;

  public
    procedure Mostrar(const Titulo: String; const Tipo: Byte);

  end;

var
  frmGrafico: TfrmGrafico;

implementation

uses Comunes, Util, PoolQuerys;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmGrafico.Mostrar(const Titulo: String; const Tipo: Byte);
begin
  PrepararFormulario(Titulo, Tipo);

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmGrafico.PrepararFormulario(const Titulo: String; const Tipo: Byte);
var
  i: Integer;
begin
  for i := 0 to DBChart1.SeriesList.Count - 1 do
    DBChart1.SeriesList[i].Active := False;
  DBChart1.SeriesList[Tipo].Active := True;
  DBChart1.Title.Text[0] := Titulo;
end;

function TfrmGrafico.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmGrafico.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmGrafico.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmGrafico.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmGrafico.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnAceptarClick(nil);
end;

procedure TfrmGrafico.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure TfrmGrafico.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmGrafico.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

end.
