program Prj_ExcelExport_XE;

uses
  Forms,
  MainExcelExport in 'MainExcelExport.pas' {FormExcelExport};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'scExcelExport';
  Application.CreateForm(TFormExcelExport, FormExcelExport);
  Application.Run;
end.
