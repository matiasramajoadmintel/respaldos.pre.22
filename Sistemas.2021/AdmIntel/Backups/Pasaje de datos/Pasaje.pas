unit Pasaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, IBCustomDataSet, IBTable, IBDatabase;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Database2: TDatabase;
    DeptosViejos: TTable;
    EdificioV: TTable;
    btnEdificios: TButton;
    btnPersonas: TButton;
    DBNUEVA: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Persona: TIBTable;
    Ocupante: TTable;
    OcupanteNombre: TStringField;
    PersonaIDPERSONA: TIntegerField;
    PersonaNRODOCUMENTO: TIntegerField;
    PersonaTIPODOCUMENTO: TIBStringField;
    PersonaNOMBRE: TIBStringField;
    PersonaAPELLIDO: TIBStringField;
    PersonaSEXO: TIBStringField;
    btnGrados: TButton;
    qryEspecialidad: TQuery;
    qryEspecialidadESPECIALIDAD: TStringField;
    btnEspecialidades: TButton;
    Especialidad: TIBTable;
    EspecialidadDESCRIPCION: TIBStringField;
    qryGrado: TQuery;
    qryGradoGRADO: TStringField;
    Grado: TIBTable;
    GradoDESCRIPCION: TIBStringField;
    GradoPORCENTAJE: TIBBCDField;
    EdificioN: TIBTable;
    EdificioVNombre: TStringField;
    EdificioVDireccion: TStringField;
    EdificioVAdmFiscal: TBooleanField;
    EdificioNDESCRIPCION: TIBStringField;
    EdificioNDIRECCION: TIBStringField;
    EdificioNADMFISCAL: TIBStringField;
    EdificioVNro: TAutoIncField;
    DeptosNuevos: TIBTable;
    DeptosViejosEdificio: TIntegerField;
    DeptosViejosDpto: TStringField;
    DeptosViejosOcupante: TStringField;
    DeptosViejosCoeficiente: TFloatField;
    DeptosNuevosIDEDIFICIO: TIntegerField;
    DeptosNuevosCOEFICIENTE: TFloatField;
    DeptosNuevosDESCRIPCION: TIBStringField;
    EdificioNIDEDIFICIO: TIntegerField;
    DeptosNuevosLLAVETERMICA: TIBStringField;
    DeptosNuevosDISYUNTOR: TIBStringField;
    OcupaNuevo: TIBTable;
    Ocupacion: TIBTable;
    OcupaNuevoIDOCUPANTE: TIntegerField;
    OcupaNuevoIDGRADO: TIntegerField;
    OcupaNuevoIDESPECIALIDAD: TIntegerField;
    OcupaNuevoANTGRADO: TIntegerField;
    OcupaNuevoDESTINO: TIBStringField;
    OcupaNuevoDESCAUTO: TIBStringField;
    OcupaNuevoRENTA: TFloatField;
    OcupacionIDOCUPACION: TIntegerField;
    OcupacionIDEDIFICIO: TIntegerField;
    OcupacionIDDEPARTAMENTO: TIntegerField;
    OcupacionIDOCUPANTE: TIntegerField;
    OcupacionFECHAINI: TDateTimeField;
    OcupacionFECHAFIN: TDateTimeField;
    OcupanteMr: TStringField;
    OcupanteGrado: TStringField;
    OcupanteEspecialidad: TStringField;
    OcupanteDestino: TStringField;
    OcupanteFechaIngreso: TDateField;
    OcupanteFechaCump: TDateField;
    OcupanteDescuentoautomatico: TBooleanField;
    GradoIDGRADO: TIntegerField;
    EspecialidadIDESPECIALIDAD: TIntegerField;
    DeptosNuevosIDDEPARTAMENTO: TIntegerField;
    OcupaNuevoMATRICULA: TIBStringField;
    DeptosViejosNro: TAutoIncField;
    DeptosNuevosTIPO: TIBStringField;
    procedure btnEdificiosClick(Sender: TObject);
    procedure btnPersonasClick(Sender: TObject);
    procedure btnEspecialidadesClick(Sender: TObject);
    procedure btnGradosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StrUtils, Comunes, Util;

{$R *.dfm}

procedure TForm1.btnEdificiosClick(Sender: TObject);
begin
  EdificioV.Open;
  EdificioN.Open;

  EdificioV.First;
  while not EdificioV.Eof do
  begin
    EdificioN.Append;
    EdificioNDESCRIPCION.Text := EdificioVNombre.Text;
    EdificioNDIRECCION.Text := EdificioVDireccion.Text;
    if EdificioVAdmFiscal.Value then EdificioNADMFISCAL.Text := 'SI'
    else EdificioNADMFISCAL.Text := 'NO';
    EdificioN.Post;

    EdificioV.Next;
  end;

  EdificioN.Close;
  EdificioV.Close;
end;

procedure TForm1.btnPersonasClick(Sender: TObject);
var
  Todo, Apellido, Nombre: String;
  i, IdPersona, IdDepartamento: Word;
begin
  Persona.Open;
  Ocupante.Open;
  DeptosViejos.Open;
  DeptosNuevos.Open;
  OcupaNuevo.Open;
  Ocupacion.Open;

  IdPersona := 0;
  IdDepartamento := 0;

  DeptosViejos.First;
  while not DeptosViejos.Eof do
  begin
    if Existe(Ocupante,'Mr',DeptosViejosOcupante.Text) then
    begin
      if not OcupanteNombre.IsNull then
      begin
        Todo := OcupanteNombre.Text;
        i := 1;
        Apellido := '';
        while Todo[i] = ' ' do i := i + 1;
        while (Todo[i] <> ' ') and (Todo[i] <> #0) do
        begin
          Apellido := Apellido + Todo[i];
          i := i + 1;
        end;
        Nombre := AnsiRightStr(Todo,Length(Todo)-i);
        if Nombre = '' then Nombre := '.';

        IdPersona := IdPersona + 1;
        Persona.Append;
        PersonaNRODOCUMENTO.Value := 0;
        PersonaTIPODOCUMENTO.Text := 'DNI';
        PersonaNOMBRE.Text := Nombre;
        PersonaAPELLIDO.Text := Apellido;
        PersonaSEXO.Text := 'MASCULINO';
        Persona.Post;

        Existe(Grado,'DESCRIPCION',OcupanteGrado.Text);
        Existe(Especialidad,'DESCRIPCION',OcupanteEspecialidad.Text);

        OcupaNuevo.Append;
        OcupaNuevoIDOCUPANTE.Value := IdPersona;
        OcupaNuevoMATRICULA.Text := OcupanteMr.Text;
        OcupaNuevoIDGRADO.Value := GradoIDGRADO.Value;
        OcupaNuevoIDESPECIALIDAD.Value := EspecialidadIDESPECIALIDAD.Value;
        OcupaNuevoANTGRADO.Value := 0;
        OcupaNuevoDESTINO.Text := OcupanteDestino.Text;
        if OcupanteDescuentoautomatico.Value then  OcupaNuevoDESCAUTO.Text := 'SI'
        else OcupaNuevoDESCAUTO.Text := 'NO';
        OcupaNuevoRENTA.Value := 0;
        OcupaNuevo.Post;

        if Existe(EdificioV,'Nro',DeptosViejosEdificio.Value) then
        begin
          if not Existe(EdificioN,'DESCRIPCION',EdificioVNombre.Text) then
          begin
            MsjError('No se encontró el edificio nuevo');
            Exit;
          end;

          IdDepartamento := IdDepartamento + 1;
          DeptosNuevos.Append;
          DeptosNuevosIDEDIFICIO.Value := EdificioNIDEDIFICIO.Value;
          DeptosNuevosCOEFICIENTE.Value := DeptosViejosCoeficiente.Value;
          DeptosNuevosDESCRIPCION.Text := DeptosViejosDpto.Text;
          DeptosNuevosLLAVETERMICA.Text := 'SI';
          DeptosNuevosDISYUNTOR.Text := 'SI';
          DeptosNuevosTIPO.Text := 'DEPTO';
          DeptosNuevos.Post;

          Ocupacion.Append;
          OcupacionIDEDIFICIO.Value := DeptosNuevosIDEDIFICIO.Value;
          OcupacionIDDEPARTAMENTO.Value := IdDepartamento;
          OcupacionIDOCUPANTE.Value := IdPersona;
          OcupacionFECHAINI.Value := OcupanteFechaIngreso.Value;
          OcupacionFECHAFIN.Value := OcupanteFechaCump.Value;
          Ocupacion.Post;
        end;
      end;
    end;

    DeptosViejos.Next;
  end;

  Ocupante.Close;
  Persona.Close;
  DeptosViejos.Close;
  DeptosNuevos.Close;
  OcupaNuevo.Close;
  Ocupacion.Close;
end;

procedure TForm1.btnEspecialidadesClick(Sender: TObject);
begin
  Especialidad.Open;
  qryEspecialidad.Open;

  qryEspecialidad.First;
  while not qryEspecialidad.Eof do
  begin
    if not qryEspecialidadESPECIALIDAD.IsNull then
    begin
      Especialidad.Append;
      EspecialidadDESCRIPCION.Text := qryEspecialidadESPECIALIDAD.Text;
      Especialidad.Post;
    end;

    qryEspecialidad.Next;
  end;

  qryEspecialidad.Close;
  Especialidad.Close;
end;

procedure TForm1.btnGradosClick(Sender: TObject);
begin
  Grado.Open;
  qryGrado.Open;

  qryGrado.First;
  while not qryGrado.Eof do
  begin
    if not qryGradoGRADO.IsNull then
    begin
      Grado.Append;
      GradoDESCRIPCION.Text := qryGradoGrado.Text;
      GradoPORCENTAJE.Value := 0;
      Grado.Post;
    end;

    qryGrado.Next;
  end;

  qryGrado.Close;
  Grado.Close;
end;

end.

