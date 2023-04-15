unit ElecPersonal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db, DBTables, ExtCtrls, Buttons, Variants;

type
  TfrmElecPersonal = class(TForm)
    qryPers: TQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    grdDatos: TDBGrid;
    Panel3: TPanel;
    edtDesc: TEdit;
    Label1: TLabel;
    btnBuscar: TBitBtn;
    Panel4: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel5: TPanel;
    btnCancelar: TBitBtn;
    btnElegir: TBitBtn;
    qryPersIDPERSONAL: TIntegerField;
    qryPersNOMBRE: TStringField;
    qryPersAPELLIDO: TStringField;
    qryPersMATRICULA: TStringField;
    qryPersIDGRADO: TIntegerField;
    qryPersDescrip: TStringField;
    procedure grdDatosDblClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure rgVerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure qryPersCalcFields(DataSet: TDataSet);

  private
    gModo, Teclas: Byte;
    gOrden, gTipoOrden: String;
    Procedure PrepararQuery(const Orden: String);
    Procedure PrepararForm(const Modo: Byte);

  public
    function getId(var Id: Integer;const Modo:Byte): Boolean;
    function get(var Id: Integer; var Desc: String): Boolean;
    Procedure Mostrar;
    Procedure Consultar;

  end;

var
  frmElecPersonal: TfrmElecPersonal;

implementation

uses Input, Util, Comunes, Personal, PoolDatos, PoolQuerys;

{$R *.DFM}


{***************************  PUBLICOS  ***************************************}

function TfrmElecPersonal.getId(var Id: Integer; const Modo: Byte): Boolean;
//0: Consulta, 1: Muestra, 2: Eleccion
begin
     Result := False;
     gModo := Modo;
     PrepararForm(Modo);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := qryPersIDPERSONAL.Value;
     end;

     qryPers.Close;
end;

function TfrmElecPersonal.get(var Id: Integer; var Desc: String): Boolean;
//0: Consulta, 1: Muestra, 2: Eleccion
begin
     Result := False;
     gModo := 2;
     PrepararForm(2);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := qryPersIDPERSONAL.Value;
       Desc := qryPersDescrip.Text;
     end;

     qryPers.Close;
end;

Procedure TfrmElecPersonal.Mostrar;
begin
     gModo := 1;
     PrepararForm(1);
//     btnNuevo.Enabled := True;

     ShowModal;
//     qryProv.Close;}
end;

Procedure TfrmElecPersonal.Consultar;
begin
{     PrepararForm;
     btnNuevo.Enabled := False;
     btnModificar.Enabled := False;
     btnEliminar.Enabled := False;

     ShowModal;
     qryProv.Close;}
end;

{***************************  PRIVADOS  ***************************************}

Procedure TfrmElecPersonal.PrepararQuery(const Orden: String);
var
   Script, Filtro: String;
begin
//     Script := 'SELECT * FROM PERSONAL';

     with qryPers do
     begin
          Close;
{          SQL.Clear;
          SQL.Add(Script);
          SQL.Add(Filtro);
          SQL.Add(' ORDER BY ' + Orden);}
          Open;
          btnAgregar.Enabled := (gModo<>0);
          btnEliminar.Enabled := (gModo<>0)and(RecordCount>0);
          btnModificar.Enabled := (gModo<>0)and(RecordCount>0);
          btnElegir.Visible := (gModo=2)and(RecordCount>0);
     end;
     grdDatos.Refresh;
end;

Procedure TfrmElecPersonal.PrepararForm(const Modo: Byte);
begin
  edtDesc.Text := '';
  gOrden := 'Descrip';
  gTipoOrden := 'ASC';
  rgVerClick(nil);
  grdDatos.Refresh;
end;

{***************************  EVENTOS *****************************************}

procedure TfrmElecPersonal.grdDatosDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmElecPersonal.btnBuscarClick(Sender: TObject);
begin
  PrepararQuery(gOrden);
end;

procedure TfrmElecPersonal.btnAgregarClick(Sender: TObject);
var
  R: Boolean;
  Id: Longword;
begin
  with TfrmPersonal.Create(nil) do
  begin
    R := Agregar(Id);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Id := dmQuerys.GetMaxIntValue('PERSONAL','IDPERSONAL');
    Existe(qryPers,'IDPERSONAL',Id);
  end;
end;

procedure TfrmElecPersonal.btnModificarClick(Sender: TObject);
var
  R: Boolean;
  Id: Longint;
begin
  Id := qryPersIDPERSONAL.Value;
  with TfrmPersonal.Create(nil) do
  begin
    R := Modificar(qryPersIDPERSONAL.Value);
    Release;
  end;

  if R then
  begin
    PrepararQuery(gOrden);
    Existe(qryPers,'IDPERSONAL',Id);
  end;
end;

procedure TfrmElecPersonal.btnEliminarClick(Sender: TObject);
begin
  if not Confirmar('¿Está seguro de eliminar el personal elegido?') then Exit;

  try
    Existe(dmDatos.PERS,'IDPERSONAL',qryPersIDPERSONAL.Value);
    dmDatos.PERS.Delete;
    except on EDatabaseError do
    begin
      MsjError('Ha ocurrido un error al intentar eliminar el personal. ' +
               'Compruebe que no haya sido utilizado.');
      Exit;
    end;
  end;

  PrepararQuery(gOrden);
end;

procedure TfrmElecPersonal.rgVerClick(Sender: TObject);
begin
  PrepararQuery(gOrden);
end;

procedure TfrmElecPersonal.FormCreate(Sender: TObject);
begin
  RecuperarEstadoGrilla(Name+'.col',grdDatos);
  RecuperarEstadoVentana(Name,Self);
end;

procedure TfrmElecPersonal.FormDestroy(Sender: TObject);
begin
  GuardarEstadoGrilla(Name+'.col',grdDatos);
  GuardarEstadoVentana(Name,Self);
end;

procedure TfrmElecPersonal.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmElecPersonal.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmElecPersonal.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmElecPersonal.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if Sender = edtDesc then btnBuscarClick(nil);

    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then ModalResult := mrCancel;
end;

procedure TfrmElecPersonal.qryPersCalcFields(DataSet: TDataSet);
begin
  qryPersDescrip.Text := qryPersAPELLIDO.Text + ', ' + qryPersNOMBRE.Text;
end;

end.
