unit IngOcupante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB, DBTables,
  IBCustomDataSet, IBTable, IngOcupante3, IngOcupante2, IngOcupante4, IngOcupante5;

type
  TfrmIngOcupante = class(TForm)
    pnlTitulo: TPanel;
    pnlDatos: TPanel;
    Panel2: TPanel;
    btnSiguiente: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    edtApellido: TDBEdit;
    Label2: TLabel;
    edtNombre: TDBEdit;
    Label3: TLabel;
    cmbTipoDoc: TDBComboBox;
    Label6: TLabel;
    edtNroDoc: TDBEdit;
    Label4: TLabel;
    edtTelefono: TDBEdit;
    Label7: TLabel;
    edtEMail: TDBEdit;
    DataSource1: TDataSource;
    grbTipoOcupante: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure Entrada_A_Campo(Sender: TObject);
    procedure Salida_de_Campo(Sender: TObject);
    procedure Teclitas(Sender:TObject; var Key:Word; Shift:TShiftState);
    procedure PressEnter(Sender: TObject; var Key: Char);
    procedure Limpiar_Edit(Sender:TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    gModo, teclas, gSiguiente: Byte;
    gForm3: TfrmIngOcupante3;
    gForm2: TfrmIngOcupante2;
    gForm4: TfrmIngOcupante4;
    gForm5: TfrmIngOcupante5;
    gTipoAnterior: String;
    procedure PrepararForm;
    procedure InsertarOcupanteMilitar;
    procedure InsertarOcupanteCivil;
    procedure InsertarOcupanteParticular;
    procedure InsertarMilitarNoOcupante;

  public
    function Insertar (var IdOcupante:integer):Boolean;
    function Actualizar (IdPersona:integer):Boolean;
    function Eliminar (IdPersona:integer):Boolean;
    function Consultar(IdPersona:integer):Boolean;

  end;

var
  frmIngOcupante: TfrmIngOcupante;

implementation

uses Tablas, Comunes, Util;

{$R *.dfm}

{************************************************************}
{         PRIVADOS                                           }
{************************************************************}

procedure TfrmIngOcupante.PrepararForm;
begin
  if gModo = 0 then  //Alta
  begin
    pnlTitulo.Caption := 'Datos Personales';
    dmTablas.tblPersonaTIPO.Text := 'OCUP_MIL';
  end
  else //Modificaci�n o consulta
  begin
    pnlTitulo.Caption := 'Datos Personales: ' +
                         dmTablas.tblPersonaAPELLIDO.Text + ', ' +
                         dmTablas.tblPersonaNOMBRE.Text;
    if dmTablas.tblPersonaTIPO.Text = 'OCUP_MIL' then
      Existe(dmTablas.tblOcupanteMilitar, 'IDPERSONA', dmTablas.tblPersonaIdPersona.Value)
    else if dmTablas.tblPersonaTIPO.Text = 'OCUP_CIV' then
      Existe(dmTablas.tblOcupanteCivil, 'IDPERSONA', dmTablas.tblPersonaIdPersona.Value)
    else if dmTablas.tblPersonaTIPO.Text = 'MIL_NO_OCUP' then
      Existe(dmTablas.tblMilitarNoOcupante, 'IDPERSONA', dmTablas.tblPersonaIdPersona.Value)
    else
      Existe(dmTablas.tblOcupanteParticular, 'IDPERSONA', dmTablas.tblPersonaIdPersona.Value);
    gTipoAnterior := dmTablas.tblPersonaTIPO.Text;
  end;

  grbTipoOcupante.Enabled := (gModo = 0);
  pnlDatos.Enabled := (gModo <> 3);
end;

procedure TfrmIngOcupante.InsertarOcupanteMilitar;
begin
  if gSiguiente = 0 then
    gForm2 := TfrmIngOcupante2.Create(nil);

  if (gModo=0) or (gTipoAnterior <> dmTablas.tblPersonaTIPO.Text) then
    case gForm2.Insertar of
      1:begin
          self.ModalResult:=mrOk;
          gSiguiente:=0;
        end;
      2:begin
          self.ModalResult:=mrCancel;
          gSiguiente:=0;
        end;
      3:gSiguiente:=1;
    end
  else if (gModo=1) then
    case gForm2.Actualizar(dmTablas.tblPersonaIDPERSONA.Value) of
      1:begin
          self.ModalResult:=mrOk;
          gSiguiente:=0;
        end;
      2:begin
          self.ModalResult:=mrCancel;
          gSiguiente:=0;
        end;
      3:gSiguiente:=1;
    end
  else
    case gForm2.Consultar(dmTablas.tblPersonaIDPERSONA.Value) of
      1:begin
          self.ModalResult:=mrOk;
          gSiguiente:=0;
        end;
      2:begin
          self.ModalResult:=mrCancel;
          gSiguiente:=0;
        end;
      3:gSiguiente:=1;
    end;

  if gSiguiente=0 then
    gForm2.Release;
end;

procedure TfrmIngOcupante.InsertarOcupanteCivil;
begin
        if gSiguiente=0 then
                gForm3:=TfrmIngOcupante3.Create(nil);

        if (gModo=0) or (gTipoAnterior <> dmTablas.tblPersonaTIPO.Text) then
                case gForm3.Insertar of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else  if (gModo = 1) then
                case gForm3.Actualizar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else
                case gForm3.Consultar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end;

        if gSiguiente=0 then
                gForm3.Release;
end;

procedure TfrmIngOcupante.InsertarOcupanteParticular;
begin
        if gSiguiente=0 then
                gForm5:=TfrmIngOcupante5.Create(nil);
        if gModo=0 then
                case gForm5.Insertar of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else if (gModo = 1) then
                case gForm5.Actualizar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else
                case gForm5.Consultar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end;

        if gSiguiente=0 then
                gForm5.Release;
end;

procedure TfrmIngOcupante.InsertarMilitarNoOcupante;
begin
        if gSiguiente=0 then
                gForm4:=TfrmIngOcupante4.Create(nil);

        if gModo=0 then
                case gForm4.Insertar of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else if gModo = 1 then
                case gForm4.Actualizar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end
        else
                case gForm4.Consultar(dmTablas.tblPersonaIDPERSONA.Value) of
                1:begin
                        self.ModalResult:=mrOk;
                        gSiguiente:=0;
                  end;
                2:begin
                        self.ModalResult:=mrCancel;
                        gSiguiente:=0;
                  end;
                3:gSiguiente:=1;
                end;

        if gSiguiente=0 then
                gForm4.Release;
end;

{************************************************************}
{         PUBLICOS                                           }
{************************************************************}

function TfrmIngOcupante.Insertar(var IdOcupante:integer):Boolean;
begin
        gModo:=0;
        if not dmTablas.Database.InTransaction then
          dmTablas.Database.StartTransaction;
        dmTablas.tblPersona.Append;
        PrepararForm;

        ShowModal;

        Result := (ModalResult=mrOk);
        if Result then
        begin
          dmTablas.tblPersona.Last;
          IdOcupante := dmTablas.tblPersonaIDPERSONA.Value;
        end;
end;

function TfrmIngOcupante.Actualizar (IdPersona:integer):Boolean;
begin
        if not Existe(dmTablas.tblPersona, 'IdPersona', IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo := 1;
                PrepararForm;
                ShowModal;
        end;
        Result := (ModalResult=mrOk);
end;

function TfrmIngOcupante.Consultar(IdPersona:integer):Boolean;
begin
        if not Existe(dmTablas.tblPersona, 'IdPersona', IdPersona) then
                MsjError('No se encontr� el Ocupante')
        else
        begin
                gModo := 3;
                PrepararForm;
                ShowModal;
        end;
        Result := (ModalResult=mrOk);
end;

function TfrmIngOcupante.Eliminar(IdPersona:integer):Boolean;
begin
        if Confirmar('�Est� seguro de eliminar el Ocupante elegido?') then
                try
                        Existe (dmTablas.tblPersona, 'IdPersona', IdPersona);
                        if not dmTablas.Database.InTransaction then
                                dmTablas.Database.StartTransaction;
                        dmTablas.tblPersona.Delete;
                        dmTablas.Database.Commit;
                        Result:=true;
                        except on EDatabaseError do
                        begin
                                MsjError ('Ha ocurrido un error al intentar eliminar el Ocupante');
                                Result:=false;
                        end;
                end
        else
                Result:=false;
end;

{************************************************************}
{         EVENTOS                                            }
{************************************************************}

procedure TfrmIngOcupante.FormCreate(Sender: TObject);
begin
  gSiguiente:=0;
  dmTablas.tblPersona.Open;
end;

procedure TfrmIngOcupante.Entrada_A_Campo(Sender: TObject);
begin
        EntradaACampo(self,Sender);
end;

procedure TfrmIngOcupante.Salida_de_Campo(Sender: TObject);
begin
        SalidaDeCampo(self,Sender);
end;

procedure TfrmIngOcupante.Teclitas(Sender: TObject; var Key: Word;Shift: TShiftState);
begin
        if Shift = [] then teclas:=0;
        if Shift = [ssShift] then  teclas:=1;
end;

procedure TfrmIngOcupante.PressEnter(Sender: TObject; var Key: Char);
begin
        if key = #13 then
        begin
                key:=chr(0);
                Perform(WM_NEXTDLGCTL,Teclas,0);
        end;
end;

procedure TfrmIngOcupante.Limpiar_Edit(Sender:TObject);
begin
        LimpiarEdit(Sender);
end;

procedure TfrmIngOcupante.btnCancelarClick(Sender: TObject);
begin
        if Editando(dmTablas.tblPersona) then
                dmTablas.tblPersona.Cancel;
        if dmTablas.Database.InTransaction then
                dmTablas.Database.Rollback;
end;

procedure TfrmIngOcupante.btnSiguienteClick(Sender: TObject);
begin
        if dmTablas.tblPersonaTIPO.Text = 'OCUP_MIL' then
        begin
                InsertarOcupanteMilitar;
                grbTipoOcupante.Enabled:=false;
        end
        else if dmTablas.tblPersonaTIPO.Text = 'OCUP_CIV' then
        begin
                InsertarOcupanteCivil;
                grbTipoOcupante.Enabled:=false;
        end
        else if dmTablas.tblPersonaTIPO.Text = 'OCUP_PART' then
        begin
                InsertarOcupanteParticular;
                grbTipoOcupante.Enabled:=false;
        end
        else
        begin
                InsertarMilitarNoOcupante;
                grbTipoOcupante.Enabled:=false;
        end;
end;

procedure TfrmIngOcupante.FormDestroy(Sender: TObject);
begin
  dmTablas.tblPersona.Close;
end;

end.
