unit FormGral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  DBTables;

type
  Tfrm = class(TForm)
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel3: TPanel;
    CronoCobro: TTable;
    CronoCobroIdCronoCobro: TSmallintField;
    CronoCobroIdObra: TSmallintField;
    CronoCobroIdMotivo: TSmallintField;
    CronoCobroFecha: TDateTimeField;
    CronoCobroMonto: TFloatField;
    Obra: TTable;
    ObraIdObra: TSmallintField;
    ObraNombre: TStringField;
    CronoCobroObra: TStringField;
    CronoCobroMotivo: TStringField;
    DBGrid1: TDBGrid;
    cmbObra: TComboBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    rgTipoMonto: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    dtpPrimerCobro: TDateTimePicker;
    Label4: TLabel;
    btnProcesar: TButton;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmbObraClick(Sender: TObject);

  private
    Teclas, Modo: Byte;
    procedure PrepararFormulario(const M: Byte);
    function DatosValidos: Boolean;

  public
    procedure Mostrar(const M: Byte);

  end;

var
  frm: Tfrm;

implementation

uses Comunes, Util;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure Tfrm.Mostrar(const M: Byte);
begin
  Modo := M;
  PrepararFormulario(M);

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure Tfrm.PrepararFormulario(const M: Byte);
begin
{}
end;

function Tfrm.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure Tfrm.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure Tfrm.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure Tfrm.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure Tfrm.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure Tfrm.btnAceptarClick(Sender: TObject);
begin
  if not DatosValidos then Exit;
  ModalResult := mrOk;
end;

procedure Tfrm.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('�Est� seguro de cancelar la operaci�n?') then Exit;
  ModalResult := mrCancel;
end;

procedure Tfrm.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure Tfrm.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

procedure Tfrm.cmbObraClick(Sender: TObject);
begin
{}
end;

end.
