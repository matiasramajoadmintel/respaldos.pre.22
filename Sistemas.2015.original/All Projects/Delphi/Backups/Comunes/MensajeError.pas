unit MensajeError;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TfrmMsjError = class(TForm)
    imgOtra: TImage;
    btnAceptar: TBitBtn;
    Memo1: TMemo;
    imgError: TImage;
    imgInfo: TImage;
    btnCancelar: TBitBtn;
    btnYes: TBitBtn;
    btnNo: TBitBtn;
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    procedure PrepararForm (texto:string; modo:string);
    procedure UbicarObjetos (modo:string; cuenta:integer; cuenta2:integer);
    { Private declarations }
  public
    procedure Mostrar (texto:string; modo:string; var resBool:Boolean; var resInt:integer);
    { Public declarations }
  end;

var
  frmMsjError: TfrmMsjError;

implementation

{$R *.dfm}

procedure TfrmMsjError.Mostrar(texto:string; modo:string; var resBool:Boolean; var resInt:integer);
begin
        Memo1.Text:=texto;
        Memo1.Color:=Color;
        PrepararForm(texto,modo);
        ShowModal;
        if (modo='Confirmar') then
                resBool:=(ModalResult=mrYes)
        else
                resBool:=(ModalResult=mrOk);
        resInt:=ModalResult;
end;

procedure TfrmMsjError.UbicarObjetos(modo:string; cuenta:integer; cuenta2:integer);
var
        cuenta3:integer;
begin
        cuenta3:=Memo1.Top+Memo1.Height+15;
        if (modo='Error') then
        begin
                imgError.Visible:=true;
                imgError.Top:=16+(cuenta2 div 4);
                imgOtra.Visible:=false;
                imgInfo.Visible:=false;
                Caption:='Error';
                btnAceptar.Visible:=true;
                btnAceptar.Left:=128+(cuenta div 2);
                btnAceptar.Top:=cuenta3;
                btnCancelar.Visible:=false;
                btnYes.Visible:=false;
                btnNo.Visible:=false;
        end;
        if (modo='Info') then
        begin
                imgError.Visible:=false;
                imgOtra.Visible:=false;
                imgInfo.Visible:=true;
                imgInfo.Top:=16+(cuenta2 div 4);
                Caption:='Información';
                btnAceptar.Visible:=true;
                btnAceptar.Left:=128+(cuenta div 2);
                btnAceptar.Top:=cuenta3;
                btnCancelar.Visible:=false;
                btnYes.Visible:=false;
                btnNo.Visible:=false;
        end;
        if (modo='OkCancel') then
        begin
                imgError.Visible:=false;
                imgOtra.Visible:=true;
                imgOtra.Top:=16+(cuenta2 div 4);
                imgInfo.Visible:=false;
                Caption:='Información';
                btnAceptar.Visible:=true;
                btnAceptar.Left:=72+(cuenta div 2);
                btnAceptar.Top:=cuenta3;
                btnCancelar.Visible:=true;
                btnCancelar.Left:=192+(cuenta div 2);
                btnCancelar.Top:=cuenta3;
                btnYes.Visible:=false;
                btnNo.Visible:=false;
        end;
        if (modo='YesNoCancel') then
        begin
                imgError.Visible:=false;
                imgOtra.Visible:=true;
                imgOtra.Top:=16+(cuenta2 div 4);
                imgInfo.Visible:=false;
                Caption:='Confirmar';
                btnAceptar.Visible:=false;
                btnCancelar.Visible:=true;
                btnCancelar.Left:=232+(cuenta div 2);
                btnCancelar.Top:=cuenta3;
                btnYes.Visible:=true;
                btnYes.Left:=40+(cuenta div 2);
                btnYes.Top:=cuenta3;
                btnNo.Visible:=true;
                btnNo.Left:=136+(cuenta div 2);
                btnNo.Top:=cuenta3;
        end;
        if (modo='Confirmar') then
        begin
                imgError.Visible:=false;
                imgOtra.Visible:=true;
                imgOtra.Top:=16+(cuenta div 4);
                imgInfo.Visible:=false;
                Caption:='Confirmar';
                btnAceptar.Visible:=false;
                btnCancelar.Visible:=false;
                btnYes.Visible:=true;
                btnYes.Left:=72+(cuenta div 2);
                btnYes.Top:=cuenta3;
                btnNo.Visible:=true;
                btnNo.Left:=192+(cuenta div 2);
                btnNo.Top:=cuenta3;
        end;
end;

procedure TfrmMsjError.PrepararForm(texto:string; modo:string);
var
        L:integer;
begin
        L:=Length(texto)-52;
        if (L>=0) then
        begin
                Memo1.Height:=81+(24*((L div 25)+1));
                Memo1.Width:=193+(16*((L div 25)+1));
                Height:=181+(24*((L div 25)+1));
                Width:=347+(16*((L div 25)+1));
                UbicarObjetos (modo,(16*((L div 25)+1)),(24*((L div 19)+1)));
        end
        else
        begin
                Memo1.Height:=81;
                Memo1.Width:=193;
                Height:=181;
                Width:=347;
                UbicarObjetos (modo,0,0);
        end;
end;

procedure TfrmMsjError.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
        HideCaret( (Sender as TMemo).handle );
end;

procedure TfrmMsjError.Memo1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        HideCaret( (Sender as TMemo).handle );
end;

end.

