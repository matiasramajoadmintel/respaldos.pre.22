unit Proveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Mask, DBCtrls, DB, Grids,
  DBGrids;

type
  TfrmProv = class(TForm)
    pnlTitulo: TPanel;
    Panel2: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    dsPROV: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtRazon: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    Teclas, Modo: Byte;
    gIdProv: Real;
    function PrepararFormulario(const M: Byte; const IdProv: Real): Boolean;

  public
    function Actualizar(const M: Byte; const IdProv: Real): Boolean;

  end;

var
  frmProv: TfrmProv;

implementation

uses Comunes, Util, PoolDatos;

{$R *.dfm}

{*******************************************************************************
                                PROCEDIMIENTOS PUBLICOS
*******************************************************************************}

function TfrmProv.Actualizar(const M: Byte; const IdProv: Real): Boolean;
begin
  Modo := M;
  PrepararFormulario(M,IdProv);

  ShowModal;

  Result := (ModalResult=mrOk);
end;

{*******************************************************************************
                                PROCEDIMIENTOS PRIVADOS
*******************************************************************************}

function TfrmProv.PrepararFormulario(const M: Byte; const IdProv: Real): Boolean;
begin
  Result := False;
  with dmDatos,PROV do
  begin
       if not ADB.InTransaction then ADB.StartTransaction;
       Open;
{Alta} if M = 0 then Append
{Modif}else
       begin
         if not Existe(PROV,'IdProveedor',IdProv) then
         begin
           MsjError('No se encontró el proveedor');
           Exit;
         end;
         gIdProv := IdProv;
         Edit;
         pnlTitulo.Caption := PROVRazon_Social.Text;
       end;
  end;
  ActiveControl := edtRazon;
  Result := True;
end;

{*******************************************************************************
                                     EVENTOS
*******************************************************************************}

procedure TfrmProv.Entrada_A_Campo(Sender: TObject);
begin
  EntradaACampo(self,Sender);
end;

procedure TfrmProv.Salida_de_Campo(Sender: TObject);
begin
  SalidaDeCampo(self,Sender);
end;

procedure TfrmProv.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
  if Shift = [] then teclas:=0;
  if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmProv.PressEnter(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=chr(0);
    Perform(WM_NEXTDLGCTL,Teclas,0);
  end;

  if Key = #27 then btnCancelarClick(nil);
end;

procedure TfrmProv.btnAceptarClick(Sender: TObject);
begin
  if Editando(dmDatos.PROV) then
  begin
    try
      dmDatos.PROV.Post;
      except on EDatabaseError do
      begin
        MsjError('Ha ocurrido un error al intentar guardar el proveedor.');
        if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;
        Exit;
      end;
    end;
    if dmDatos.ADB.InTransaction then dmDatos.ADB.Commit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmProv.btnCancelarClick(Sender: TObject);
begin
  if Editando(dmDatos.PROV) then dmDatos.PROV.Cancel;
  if dmDatos.ADB.InTransaction then dmDatos.ADB.Rollback;

  ModalResult := mrCancel;
end;

procedure TfrmProv.FormCreate(Sender: TObject);
begin
  {}
end;

procedure TfrmProv.FormDestroy(Sender: TObject);
begin
  {}
end;

end.
