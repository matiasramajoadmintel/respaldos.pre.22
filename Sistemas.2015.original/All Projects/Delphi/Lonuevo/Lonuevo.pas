unit Lonuevo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmLoNuevo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;

  private
    { Private declarations }

  public
    Procedure Mostrar;

  end;

const
  ARCHTXT = 'Novedades.txt';

var
  frmLoNuevo: TfrmLoNuevo;

implementation

uses Util;

{$R *.DFM}

Procedure TfrmLoNuevo.Mostrar;
begin
  Caption := Application.Title + ' - Novedades';
  if not FileExists(ExtractFilePath(Application.ExeName)+ARCHTXT) then
  begin
    MsjError('No se ha podido abrir el archivo de novedades.');
    Exit;
  end;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+ARCHTXT);
  ShowModal;
end;

end.
