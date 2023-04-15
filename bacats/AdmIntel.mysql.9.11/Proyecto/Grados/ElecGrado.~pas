unit ElecGrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DB, ComObj,
  IBCustomDataSet, IBQuery, DBTables, ZDataset, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable,Principal, ZConnection;

type
  TfrmElecGrado = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    edtDesc: TEdit;
    btnBuscar: TBitBtn;
    Panel4: TPanel;
    btnAgregar: TSpeedButton;
    btnEliminar: TSpeedButton;
    btnModificar: TSpeedButton;
    Panel2: TPanel;
    Panel5: TPanel;
    btnCerrar: TBitBtn;
    btnElegir: TBitBtn;
    Panel1: TPanel;
    grdDatos: TDBGrid;
    dsGrado: TDataSource;
    qryGrados: TQuery;
    qryGradosIDGRADO: TIntegerField;
    qryGradosDESCRIPCION: TStringField;
    qryGradosABREVIATURA: TStringField;
    qryGradosTIEMPO_MINIMO: TIntegerField;
    qryGradosCOD201: TFloatField;
    qryGradosCOD209: TFloatField;
    qryGradosORDEN: TIntegerField;
    btnRespaldar: TSpeedButton;
    btnConsultar: TSpeedButton;
    tbl1: TTable;
    tbl2: TTable;
    bm1: TBatchMove;
    qryCheques: TQuery;
    qryChequesFECHA: TDateTimeField;
    qryChequesPROVEEDOR: TStringField;
    qryChequesIMPORTE: TFloatField;
    qryChequesNROCHEQUE: TStringField;
    qryChequesCOBRADO: TStringField;
    qryChequesIDPAGO: TIntegerField;
    ZConnection1: TZConnection;
    ztbl1: TZTable;
    ZqryGrados: TZQuery;
    ztbl1idgrado: TIntegerField;
    ztbl1descripcion: TStringField;
    ztbl1abreviatura: TStringField;
    ztbl1tiempo_minimo: TIntegerField;
    ztbl1cod201: TFloatField;
    ztbl1cod209: TFloatField;
    ztbl1orden: TIntegerField;
    ZqryGradosidgrado: TIntegerField;
    ZqryGradosdescripcion: TStringField;
    ZqryGradosabreviatura: TStringField;
    ZqryGradostiempo_minimo: TIntegerField;
    ZqryGradoscod201: TFloatField;
    ZqryGradoscod209: TFloatField;
    ZqryGradosorden: TIntegerField;
    ZQuery1: TZQuery;
    procedure btnAgregarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure grdDatosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grdDatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDescKeyPress(Sender: TObject; var Key: Char);
    procedure btnRespaldarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);

  private
    gModo: Byte;
    gOrden, gTipoOrden: String;
    Procedure PrepararForm(const Modo: Byte);
    procedure PrepararQuery (Orden: String);

  public
    procedure Mostrar;
    function GetId(var Id: Byte): Boolean;
    function GetEnt(var Id: Byte; var Descrip: String): Boolean;

  end;

var
  frmElecGrado: TfrmElecGrado;
  today: TDateTime;
  hoy: String;
  fecha: Integer;
  fecha2: Integer;

implementation

uses IngGrado, Comunes, RespaldoGrados, DateUtils;

{$R *.dfm}

procedure TfrmElecGrado.Mostrar;
{gModo= 1:Mostrar 2:Elegir}
begin
        gModo:=1;
        PrepararQuery (gOrden);
        ShowModal;
end;

function TfrmElecGrado.GetId(var Id: Byte): Boolean;
begin
     Result := False;
     gModo:=2;
     PrepararQuery (gOrden);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then Id := ZqryGradosidgrado.Value;  //qryGradosIDGRADO.Value;

end;

function TfrmElecGrado.GetEnt(var Id: Byte; var Descrip: String): Boolean;
begin
     Result := False;
     gModo:=2;
     PrepararQuery (gOrden);

     ShowModal;

     Result := (ModalResult=mrOk);
     if Result then
     begin
       Id := ZqryGradosIDGRADO.Value;
       Descrip := ZqryGradosDESCRIPCION.Text;
     end;

end;

Procedure TfrmElecGrado.PrepararForm(const Modo: Byte);
begin
     btnAgregar.Enabled := (Modo<>0);
     btnEliminar.Enabled := (Modo<>0)and(ZqryGrados.RecordCount>0);
     btnModificar.Enabled := (Modo<>0)and(ZqryGrados.RecordCount>0);
     btnElegir.Visible := (Modo=2)and(ZqryGrados.RecordCount>0);
end;

procedure TfrmElecGrado.PrepararQuery(Orden:String);
var
        Script,Filtro: String;
begin
        Script:='SELECT * FROM GRADO';
        Filtro:='';
        if edtDesc.Text<>'' then
                Filtro:='WHERE (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Descripcion LIKE ' + #39 + edtDesc.Text + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + '%' + edtDesc.Text + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + '%' + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + edtDesc.Text + '%' + #39 + ') OR (' +
                        'Abreviatura LIKE ' + #39 + edtDesc.Text + #39 + ')';
        with ZqryGrados do
        begin
                Close;
                SQL.Clear;
                SQL.Add(Script);
                SQL.Add(Filtro);
                SQL.Add('ORDER BY ' + Orden);
                Open;
        end;
        PrepararForm (gModo);
end;

procedure TfrmElecGrado.btnAgregarClick(Sender: TObject);
var
  IdGrado: Byte;
  R: Boolean;
begin
  with TfrmIngGrado.Create(nil) do
  begin
    R := Agregar(IdGrado);
    Release;
  end;

  if R then
  begin
   PrepararQuery (gOrden);
   Existe(ZqryGrados,'IDGRADO',IdGrado);
  end;
end;

procedure TfrmElecGrado.btnEliminarClick(Sender: TObject);
var
  R: Boolean;
begin
  with TfrmIngGrado.Create(nil) do
  begin
    R := Eliminar(ZqryGradosIDGRADO.Value);
    Release;
  end;

  if R then
        PrepararQuery (gOrden);
end;

procedure TfrmElecGrado.btnModificarClick(Sender: TObject);
var
  IdGrado: Byte;
  R: Boolean;
begin
  IdGrado := ZqryGradosIDGRADO.Value;

  with TfrmIngGrado.Create(nil) do
  begin
    R := Modificar(IdGrado);
    Release;
  end;

  if R then
  begin
   PrepararQuery (gOrden);
   Existe(ZqryGrados,'IDGRADO',IdGrado);
  end;
end;

procedure TfrmElecGrado.grdDatosTitleClick(Column: TColumn);
var
  F: TField;
begin
        F := ZqryGrados.FindField(Column.FieldName);
        if F.FieldKind = fkData then
        begin
                if gTipoOrden = 'ASC' then
                        gTipoOrden := 'DESC'
                else
                        gTipoOrden := 'ASC';
                gOrden := Column.FieldName + ' ' + gTipoOrden;
                PrepararQuery(gOrden);
        end;
end;

procedure TfrmElecGrado.FormCreate(Sender: TObject);
begin
        RecuperarEstadoGrilla (Name+'.col',grdDatos);
        RecuperarEstadoVentana (Name,Self);
        gTipoOrden:='ASC';
        gOrden:='Orden ' + gTipoOrden;
end;

procedure TfrmElecGrado.FormDestroy(Sender: TObject);
begin
        GuardarEstadoGrilla(Name+'.col',grdDatos);
        GuardarEstadoVentana (Name, Self);
end;

procedure TfrmElecGrado.grdDatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        if Key=13 then
                btnModificarClick(Sender);
        if Key=46 then
                btnEliminarClick(Sender);
        if Key=65 then
                btnAgregarClick(Sender);
end;

procedure TfrmElecGrado.btnBuscarClick(Sender: TObject);
begin
        PrepararQuery (gOrden);
end;

procedure TfrmElecGrado.edtDescKeyPress(Sender: TObject; var Key: Char);
begin
        if key = #13 then
                PrepararQuery (gOrden);
end;

{procedure TfrmElecGrado.btnRespaldarClick(Sender: TObject);
begin
  bm1.Execute;
  today:= Date;
  hoy:= DateToStr(today);
  ShowMessage(hoy);
  qryCheques.SQL.Clear;
  qryCheques.SQL.Add ('UPDATE RESPALDO_GRADO set IDGRADO= 10102107  WHERE IDGRADO > 3' );
  qryCheques.ExecSQL;

end; }



procedure TfrmElecGrado.btnRespaldarClick(Sender: TObject);

var
  Excel, Libro : Variant;
  i:integer;

begin
//    today:= Now;
//    hoy:= DateToStr(today);
    // Crea una aplicacion Excel.
    Excel := CreateOleObject ('Excel.Application');
    // La muestra (vas a ver un Excel como si lo hubieras ejecutado)
    Excel.Visible := True;
    // Agrega un libro.
    Excel.WorkBooks.Add (-4167);
    // Le asigna un nombre al libro
    Excel.WorkBooks[1].WorkSheets[1].Name := 'Reporte';
    // Hace un puntero al libro del Excel.
    Libro := Excel.WorkBooks[1].WorkSheets['Reporte'];

    //Query.SQL.Add (‘Consulta’);
    ZqryGrados.Open;
    ZqryGrados.First;
    i:=1;
    while not ZqryGrados.EOF do
    begin
    // encabezado
      Libro.Cells [1,1] := 'GRADOS MILITARES';
    Libro.Cells [1,1].Font.Bold:=True;
    Libro.Cells [1,1].Font.Size:=13;
    Libro.Cells [2,1] := 'ARMADA ARGENTINA - ALCALDIA BNMDP';
    Libro.Cells [2,1].Font.Bold:=True;
    Libro.Cells [4,1]:= 'FECHA: '+DateToStr(Date);
    Libro.Cells [4,1].Font.Bold:=True;


    // aqui le ponemos nombre a los campos
    Libro.Cells [7,1] := 'IDGRADO';
    Libro.Cells [7,1].Font.Bold:=True;
    Libro.Cells [7,2] := 'DESCRIPCION';
    Libro.Cells [7,2].Font.Bold:=True;
    Libro.Cells [7,3] := 'ABREVIATURA';
    Libro.Cells [7,3].Font.Bold:=True;
    Libro.Cells [7,4] := 'TIEMPO MINIMO';
    Libro.Cells [7,4].Font.Bold:=True;
    Libro.Cells [7,5] := 'CODIGO 201';
    Libro.Cells [7,5].Font.Bold:=True;
    Libro.Cells [7,6] := 'CODIGO 209';
    Libro.Cells [7,6].Font.Bold:=True;

    i:=i+1;
    Libro.Cells [i+6,1] := ZqryGrados.FieldByName ('ORDEN').AsString;
    Libro.Cells [i+6,2] := ZqryGrados.FieldByName ('DESCRIPCION').AsString;
    Libro.Cells [i+6,3] := ZqryGrados.FieldByName ('ABREVIATURA').AsString;
    Libro.Cells [i+6,4] := ZqryGrados.FieldByName ('TIEMPO_MINIMO').AsString;
    Libro.Cells [i+6,5] := ZqryGrados.FieldByName ('COD201').AsFloat;
    Libro.Cells [i+6,6] := ZqryGrados.FieldByName ('COD209').AsFloat;

    ZqryGrados.Next;
    end;
end;



procedure TfrmElecGrado.btnConsultarClick(Sender: TObject);
begin
  if Form2=nil then Form2:=TForm2.Create(nil);
  begin
    Form2.ShowModal;
    Form2.Free;
    Form2:=nil;
  end;

{ with TForm2.Create(nil) do
  begin
    Mostrar;
    Release;
  end;}
end;

end.
