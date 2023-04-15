unit MemoIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TfrmMMIN = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    mmDB: TDBMemo;
    DSMMIN: TDataSource;
    btnGuardar: TBitBtn;
    btnCancelar: TBitBtn;
    PanelTitulo: TPanel;
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
        Procedure Asignar(Const T:TDataSet;var M:TMemoField);

  public
        Procedure EntradaDB(const T:TDataSet;var M:TMemoField;
                            const FormCaption, PanelCaption: String);
        Procedure VerDB(const T:TDataSet;var M:TMemoField;
                        const FormCaption, PanelCaption: String);
  end;

var
  frmMMIN: TfrmMMIN;

implementation

uses Comunes;

{$R *.DFM}


Procedure TfrmMMIN.VerDB(const T:TDataSet;var M:TMemoField;
                         const FormCaption, PanelCaption: String);
begin
     btnGuardar.Visible := False;
     Caption := FormCaption;
     PanelTitulo.Caption := PanelCaption;
     Asignar(T,M);

     ShowModal;
end;

Procedure TfrmMMIN.EntradaDB(const T:TDataSet;var M:TMemoField;
                             const FormCaption, PanelCaption: String);
begin
     btnGuardar.Visible := True;
     Caption := FormCaption;
     PanelTitulo.Caption := PanelCaption;
     Asignar(T,M);

     ShowModal;

     if ModalResult = MRCancel then mmDB.LoadMemo;
     mmDB.Update;
end;

//******************************************************************************
//                          METODOS PRIVADOS                                  \\
//******************************************************************************

Procedure TfrmMMIN.Asignar(Const T:TDataSet;var M:TMemoField);
begin
     DSMMIN.DataSet:=T;
     mmDB.DataField:=M.FieldName;
     mmDB.LoadMemo;
     mmDB.UpDate;

     mmDB.ReadOnly := not(btnGuardar.Visible);
end;

//******************************************************************************
//                          EVENTOS DE BOTONES                                \\
//******************************************************************************

procedure TfrmMMIN.btnGuardarClick(Sender: TObject);
begin
     ModalResult:=MROK;
end;

procedure TfrmMMIN.btnCancelarClick(Sender: TObject);
begin
     ModalResult:=MRCancel;
end;

procedure TfrmMMIN.FormCreate(Sender: TObject);
begin
     RecuperarEstadoVentana('TEXTO_READER',SELF);
end;


procedure TfrmMMIN.FormDestroy(Sender: TObject);
begin
     GuardarEstadoVentana('TEXTO_READER',SELF);
end;

end.
