program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Util in '..\..\..\All Projects\Comunes\Util.pas',
  Comunes in '..\..\..\All Projects\Comunes\Comunes.pas',
  MSJU in '..\..\..\All Projects\Comunes\MSJU.pas' {frmMSJ},
  PoolDescuentos in 'PoolDescuentos.pas' {dmDescuentos: TDataModule},
  MensajeError in '..\..\..\All Projects\Comunes\MensajeError.pas' {frmMsjError},
  Unit2 in 'Unit2.pas' {Form2},
  IngMes in '..\..\..\All Projects\Input\IngMes.pas' {frmIngMes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmMSJ, frmMSJ);
  Application.CreateForm(TdmDescuentos, dmDescuentos);
  Application.CreateForm(TfrmMsjError, frmMsjError);
  Application.CreateForm(TfrmIngMes, frmIngMes);
  Application.Run;
end.
