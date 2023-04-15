unit MSJU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmMSJ = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
  private
    { Private declarations }
  public
        Procedure Mostrar(Const T:String);
        Procedure Ocultar;
  end;

var
  frmMSJ: TfrmMSJ;

implementation

{$R *.DFM}

Procedure TfrmMSJ.Mostrar(Const T:String);
begin Screen.Cursor:=crHourglass;
      Label1.Caption := T;
      Show;
end;
Procedure TfrmMSJ.Ocultar;
begin Screen.Cursor:=crDefault;
      Hide;
end;


end.















