unit IngGrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, DBTables;

type
  TfrmIngGrado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtDescripcion: TDBEdit;
    edtPorcentaje: TDBEdit;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    dsGrado: TDataSource;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Grado: TTable;
    GradoIDGRADO: TIntegerField;
    GradoDESCRIPCION: TStringField;
    GradoABREVIATURA: TStringField;
    GradoTIEMPO_MINIMO: TIntegerField;
    GradoCOD201: TFloatField;
    GradoCOD209: TFloatField;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);

  private
    teclas: Byte;

  public
    function Agregar(var IdGrado: Byte): Boolean;
    function Eliminar(const IdGrado: Byte): Boolean;
    function Modificar(const IdGrado: Byte): Boolean;

  end;

var
  frmIngGrado: TfrmIngGrado;

implementation

uses Comunes, Util;

{$R *.dfm}

function TfrmIngGrado.Agregar(var IdGrado: Byte): Boolean;
begin
  Grado.Open;
  Grado.Append;

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
  begin
    try
      Grado.Post;
      except on EConvertError do
      begin
        MsjError('Se produjo un error al intentar agregar el grado');
        Grado.Cancel;
        Exit;
      end;
    end;
    Grado.Refresh;
    Grado.Last;
    IdGrado := GradoIDGRADO.Value;
  end;
  Grado.Close;
end;

function TfrmIngGrado.Eliminar(const IdGrado: Byte): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el grado elegido') then Exit;

  if not Existe(Grado,'IDGRADO',IdGrado) then
  begin
    MsjError('No se encontró el registro');
    Exit;
  end;

  try
    Grado.Delete;
    except on EConvertError do
    begin
      MsjError('Se produjo un error al intentar eliminar el grado');
      Exit;
    end;
  end;
  Result := True;
  Grado.Close;
end;

function TfrmIngGrado.Modificar(const IdGrado: Byte): Boolean;
begin
  if not Existe(Grado,'IDGRADO',IdGrado) then
  begin
    MsjError('No se encontró el registro');
    Exit;
  end;
  Grado.Edit;

  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    try
      Grado.Post;
      except on EConvertError do
      begin
        MsjError('Se produjo un error al intentar modificar el grado');
        Grado.Cancel;
        Exit;
      end;
    end;
  Grado.Close;
end;

procedure TfrmIngGrado.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngGrado.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngGrado.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngGrado.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

end.
