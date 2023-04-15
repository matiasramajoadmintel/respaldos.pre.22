program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Util in '..\..\All Projects\Delphi\Comunes\Util.pas',
  MSJU in '..\..\All Projects\Delphi\Comunes\MSJU.pas' {frmMSJ},
  MensajeError in '..\..\All Projects\Delphi\Comunes\MensajeError.pas' {frmMsjError};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMSJ, frmMSJ);
  Application.CreateForm(TfrmMsjError, frmMsjError);
  Application.Run;
end.
