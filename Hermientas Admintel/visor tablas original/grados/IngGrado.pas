unit IngGrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBTable, DBTables, ZAbstractRODataset, ZAbstractDataset, Principal, ZAbstractTable,
  ZDataset, Zconnection  ;

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
    Label6: TLabel;
    DBEdit4: TDBEdit;
    GradoIDGRADO: TIntegerField;
    GradoDESCRIPCION: TStringField;
    GradoABREVIATURA: TStringField;
    GradoTIEMPO_MINIMO: TIntegerField;
    GradoCOD201: TFloatField;
    GradoCOD209: TFloatField;
    GradoORDEN: TIntegerField;
    ztblGrado: TZTable;
    ztblGradoidgrado: TIntegerField;
    ztblGradodescripcion: TStringField;
    ztblGradoabreviatura: TStringField;
    ztblGradotiempo_minimo: TIntegerField;
    ztblGradocod201: TFloatField;
    ztblGradocod209: TFloatField;
    ztblGradoorden: TIntegerField;
    ZQuery1: TZQuery;
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
  ShowModal;
  ztblGrado.Open;
  ztblGrado.Last;
  ZQuery1.SQL.Clear;
 // ZQuery1.SQL.Add('INSERT INTO grado ("idgrado", "descripcion", "abreviatura", "tiempo_minimo", "cod201", "cod209", "orden") VALUES ("NULL", "''", "''", "NULL", "NULL", "NULL", "NULL")');

  ZQuery1.SQL.Add('INSERT INTO grado VALUES (null , "'+edtDescripcion.EditText+'" , "'+edtPorcentaje.Text+'" , "'+DBEdit1.Text+'" , "'+DBEdit2.Text+'" , "'+DBEdit3.Text+'" , "'+DBEdit4.Text+'")');
//  ZQuery1.Open;
  Zquery1.ExecSQL;
 // Zquery1.ApplyUpdates;
 // Zquery1.CommitUpdates;
  ZQuery1.Close;

//  ztblGrado.Append;

  ShowMessage(ZQuery1.SQL.Text);



  Result := (ModalResult = mrOk);
  if Result then
  begin
    try
      ztblGrado.Open;
      ztblGrado.Edit;
      ztblGrado.Post;
      except on EConvertError do
      begin
        MsjError('Se produjo un error al intentar agregar el grado');
        ztblGrado.Cancel;
        Exit;
      end;
    end;
    ztblGrado.Refresh;
    ztblGrado.Last;
    IdGrado := ztblGradoidgrado.Value;
    ShowMessage('MATIAS');
  end;
  ztblGrado.Close;
end;

function TfrmIngGrado.Eliminar(const IdGrado: Byte): Boolean;
begin
  Result := False;

  if not Confirmar('¿Está seguro de eliminar el grado elegido') then Exit;

//if not ExisteRegistro('Grado','IDGRADO',IdGrado) then
  if not Existe(ztblGrado,'IDGRADO',IdGrado) then
  begin
    MsjError('No se encontró el registro');
    Exit;
  end;

  try
    ztblGrado.Delete;
    except on EConvertError do
    begin
      MsjError('Se produjo un error al intentar eliminar el grado');
      Exit;
    end;
  end;
  Result := True;
  ztblGrado.Close;
end;

function TfrmIngGrado.Modificar(const IdGrado: Byte): Boolean;
begin
  if not Existe(ztblGrado,'IDGRADO',IdGrado) then
  begin
    MsjError('No se encontró el registro');
    Exit;
  end;

  ztblGrado.Edit;
  ShowModal;

  Result := (ModalResult = mrOk);
  if Result then
    try
      ztblGrado.Post;
      except on EConvertError do
      begin
        MsjError('Se produjo un error al intentar modificar el grado');
        ztblGrado.Cancel;
        Exit;
      end;
    end;
  ztblGrado.Close;
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
