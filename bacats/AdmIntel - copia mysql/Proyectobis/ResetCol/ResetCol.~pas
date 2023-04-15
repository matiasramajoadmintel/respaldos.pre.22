unit ResetCol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmResetCol = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    btnAceptar: TBitBtn;
    ComboListado: TComboBox;
    Label1: TLabel;
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
    procedure PrepararFormulario;
    function DatosValidos: Boolean;

  public
    procedure Mostrar;

  end;

var
  frmResetCol: TfrmResetCol;

implementation

uses Comunes, Util;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

procedure TfrmResetCol.Mostrar;
begin
  PrepararFormulario;

  ShowModal;
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

procedure TfrmResetCol.PrepararFormulario;
begin
{}
end;

function TfrmResetCol.DatosValidos: Boolean;
begin
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmResetCol.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmResetCol.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmResetCol.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmResetCol.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmResetCol.btnAceptarClick(Sender: TObject);
var
  Path: String;
  R: Boolean;
begin
//  if not DatosValidos then Exit;

  path := ExtractFileDir(Application.ExeName);

  if ComboListado.Text = 'Detalle de tareas de mantenimiento realizadas' then
    R := DeleteFile(path+'\200.col')
  else if ComboListado.Text = 'Gastos administrativos' then
    R := DeleteFile(path+'\300.col')
  else if ComboListado.Text = 'Gastos financieros' then
    R := DeleteFile(path+'\301.col')
  else if ComboListado.Text = 'Gastos por servicios' then
    R := DeleteFile(path+'\302.col')
  else if ComboListado.Text = 'Pagos efectuados a proveedores' then
    R := DeleteFile(path+'\1000.col')
  else if ComboListado.Text = 'Trabajos de mantenimiento en departamentos' then
    R := DeleteFile(path+'\100.col')
  else if ComboListado.Text = 'Trabajos de mantenimiento en espacios comunes' then
    R := DeleteFile(path+'\101.col')
  else if ComboListado.Text = 'Resumen de tareas de mantenimiento por departameto' then
    R := DeleteFile(path+'\201.col')
  else if ComboListado.Text = 'Resumen general de tareas de mantenimiento' then
    R := DeleteFile(path+'\202.col');

  if R then MsjInfo('Las columnas han sido reestablecidas correctamente')
  else MsjError('No se encontró el archivo de columnas');

  if R then ModalResult := mrOk;
end;

procedure TfrmResetCol.btnCancelarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de cancelar la operación?') then Exit;
  ModalResult := mrCancel;
end;

procedure TfrmResetCol.FormCreate(Sender: TObject);
begin
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmResetCol.FormDestroy(Sender: TObject);
begin
  GuardarEstadoVentana(Name,Self);
end;

end.
