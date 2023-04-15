program Project1;

uses
  Forms,
  Pasaje in 'Pasaje.pas' {Form1},
  Comunes in '..\..\..\All Projects\Comunes\Comunes.pas',
  MSJU in '..\..\..\All Projects\Comunes\MSJU.pas' {frmMSJ},
  Util in '..\..\..\All Projects\Comunes\Util.pas',
  MensajeError in '..\..\..\All Projects\Comunes\MensajeError.pas' {frmMsjError};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMSJ, frmMSJ);
  Application.CreateForm(TfrmMsjError, frmMsjError);
  Application.Run;
end.
