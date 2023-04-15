unit CaminoCritico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmCaminoCritico = class(TForm)
    BitBtn1: TBitBtn;
    IngresarA: TButton;
    IngresarB: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure IngresarAClick(Sender: TObject);
    procedure IngresarBClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Mostrar(IdObra: Integer);
  end;

var
  frmCaminoCritico: TfrmCaminoCritico;

implementation

uses Comunes, Input;

{$R *.dfm}

procedure TfrmCaminoCritico.Mostrar(IdObra: Integer);
begin


  ShowModal;
end;

procedure TfrmCaminoCritico.BitBtn1Click(Sender: TObject);
begin
  {}
end;

procedure TfrmCaminoCritico.IngresarAClick(Sender: TObject);
begin
{}
end;

procedure TfrmCaminoCritico.IngresarBClick(Sender: TObject);
begin
{}
end;

end.
