unit IngPersonal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, DateUtils, DB, DBTables;

type
  TfrmIngPersonal = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblIng: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    PERS: TTable;
    PERSIDPERSONAL: TIntegerField;
    PERSNOMBRE: TStringField;
    PERSAPELLIDO: TStringField;
    PERSDescrip: TStringField;
    cmbPersonal: TComboBox;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure PERSCalcFields(DataSet: TDataSet);

  private
    Teclas:byte;

  public
    Function ObtenerDatos(var Id: Longword):Boolean;

  end;

var
  frmIngPersonal: TfrmIngPersonal;

implementation

uses Comunes, Util;

{$R *.DFM}

Function TfrmIngPersonal.ObtenerDatos(var Id: Longword):Boolean;
var
  Field: TField;
begin
  //CargarListaCampo(cmbPersonal, PERS, 'Descrip');
  PERS.Open;
  PERS.First;
  while not PERS.Eof do
  begin
    cmbPersonal.Items.AddObject(PERSDescrip.Text, PERSIDPERSONAL);
    PERS.Next;
  end;

  ActiveControl:=cmbPersonal;

  ShowModal;

  Result := (ModalResult = MROK);
  if Result then
  begin
    Id := PERSIDPERSONAL.Value;
  end;
end;

//******************************************************************************
//                         PROCEDIMIENTOS DE TECLADO                          \\
//******************************************************************************

procedure TfrmIngPersonal.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmIngPersonal.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmIngPersonal.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngPersonal.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmIngPersonal.BitBtn1Click(Sender: TObject);
begin
  if (cmbPersonal.Text = '') then
  begin
    MsjError('Faltan datos');
    Exit;
  end
  else ModalResult := mrOk;
end;

procedure TfrmIngPersonal.PERSCalcFields(DataSet: TDataSet);
begin
  PERSDescrip.Text := PERSAPELLIDO.Text + ', ' + PERSNOMBRE.Text;
end;

end.
