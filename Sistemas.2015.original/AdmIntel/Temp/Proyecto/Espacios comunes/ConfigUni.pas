unit ConfigUni;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables, DBCtrls,
  Menus, Variants;

type
  TfrmConfigUni = class(TForm)
    PanelTitulo: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnCerrar: TBitBtn;
    dsAtrib: TDataSource;
    Panel4: TPanel;
    AgregarButton: TBitBtn;
    QuitarButton: TBitBtn;
    Panel5: TPanel;
    lblArriba: TLabel;
    Atrib: TTable;
    AtribIdAtributo: TFloatField;
    dsAtribNom: TDataSource;
    AtribDescrip: TStringField;
    Panel6: TPanel;
    btnNuevoAtrib: TBitBtn;
    qryUpdate: TQuery;
    AtribTipoAtrib: TStringField;
    qryCantNum: TQuery;
    qryCantNumValor: TIntegerField;
    qryCantAlfa: TQuery;
    qryCantAlfaValor: TIntegerField;
    qryAtribNom: TQuery;
    qryAtribNomIdNomenclatura: TFloatField;
    qryAtribNomIdAtributo: TFloatField;
    qryAtribNomDescrip: TStringField;
    qryAtribNomTipoAtrib: TStringField;
    AtribNom: TTable;
    AtribNomIdAtributo: TFloatField;
    AtribNomIdNomenclatura: TFloatField;
    AtribNomDescAtrib: TStringField;
    AtribNomTipo: TStringField;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AgregarButtonClick(Sender: TObject);
    procedure QuitarButtonClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnNuevoAtribClick(Sender: TObject);

  private
    gIdNom: real;
    procedure PrepararFrom(const IdNom: Real; const DescNom: String);

  public
    procedure ConfigNomen(const IdNom:Real; const DescNom:String);

  end;

var
  frmConfigUni: TfrmConfigUni;

implementation

{$R *.DFM}

uses Util, Comunes, ElecEnt, IngAtrib, StoreProcs;

{***************************  PUBLICOS  ***************************************}

procedure TfrmConfigUni.ConfigNomen(const IdNom:Real; const DescNom:String);
begin
     gIdNom := IdNom;
     PrepararFrom(IdNom,DescNom);

     ShowModal;
end;

{***************************  PRIVADOS  ***************************************}

procedure TfrmConfigUni.PrepararFrom(const IdNom: Real; const DescNom: String);
begin
  PanelTitulo.Caption := DescNom;
  Atrib.Open;
  AtribNom.Open;
  with qryAtribNom do
  begin
    Close;
    ParamByName('N').AsFloat := IdNom;
    Open;
    QuitarButton.Enabled := not(RecordCount=0);
  end;
end;

{***************************  EVENTOS  ****************************************}

procedure TfrmConfigUni.FormClose(Sender: TObject;var Action: TCloseAction);
begin
     Release;
end;

procedure TfrmConfigUni.AgregarButtonClick(Sender: TObject);
var
  IdAtrib: Real;
begin
     if Atrib.RecordCount = 0 then
     begin MsjError('No hay elementos disponibles.'); Exit; end;

     IdAtrib := AtribIdAtributo.Value;
     if not Existe(AtribNom,'IdAtributo','IdNomenclatura',
                   VarArrayOf([IdAtrib,gIdNom])) then
     begin
          AtribNom.Append;
          AtribNomIdAtributo.Value := IdAtrib;
          AtribNomIdNomenclatura.Value := gIdNom;
          AtribNom.Post;

          if AtribTipoAtrib.Text[1] = 'A' then
            with dmStoreProc,spActualizarParamAlfa do
            begin
              Close;
              ParamByName('@IdNomenclatura').asFloat := gIdNom;
              ParamByName('@IdAtributo').asFloat := IdAtrib;
              ExecProc;
            end
          else
            with dmStoreProc,spActualizarParamNum do
            begin
              Close;
              ParamByName('@IdNomenclatura').asFloat := gIdNom;
              ParamByName('@IdAtributo').asFloat := IdAtrib;
              ExecProc;
            end;
     end
     else
     begin
       MsjError('No puede repetirse para una misma nomenclatura el atributo');
       Exit;
     end;

     AtribNom.Refresh;
     with qryAtribNom do
     begin
       Close;
       ParamByName('N').AsFloat := gIdNom;
       Existe(qryAtribNom,'IdAtributo',IdAtrib);
       QuitarButton.Enabled := not(RecordCount=0);
     end;
end;

procedure TfrmConfigUni.QuitarButtonClick(Sender: TObject);
var
  Cond: String;
begin
  with qryCantNum do
  begin
    Close;
    ParamByName('N').AsFloat := qryAtribNomIdNomenclatura.Value;
    ParamByName('A').AsFloat := qryAtribNomIdAtributo.Value;
    Open;
  end;
  with qryCantAlfa do
  begin
    Close;
    ParamByName('N').AsFloat := qryAtribNomIdNomenclatura.Value;
    ParamByName('A').AsFloat := qryAtribNomIdAtributo.Value;
    Open;
  end;

  if (qryCantNumValor.Value > 0) or (qryCantAlfaValor.Value > 0) then
  begin
    MsjError('No se puede eliminar este atributo pues ya está siendo utilizado');
    Exit;
  end;

  if Confirmar('¿Está seguro de quitar el atributo elegido?') then
  begin
    Cond := 'IdNomenclatura='+qryAtribNomIdNomenclatura.Text+' AND IdAtributo='+
            qryAtribNomIdAtributo.Text;

    if qryAtribNomTipoAtrib.Text[1] = 'A' then
      BajaSQL('ParametroAlfa',Cond,qryUpdate)
    else
      BajaSQL('ParametroNum',Cond,qryUpdate);

    BajaSQL('AtribNom',Cond,qryUpdate);
  end;

  with qryAtribNom do
  begin
    Close;
    ParamByName('N').AsFloat := gIdNom;
    Open;
    QuitarButton.Enabled := not(RecordCount=0);
   end;
end;

procedure TfrmConfigUni.btnCerrarClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConfigUni.btnNuevoAtribClick(Sender: TObject);
var
  Consulta,A: String;
  T: Char;
  R: Boolean;
begin
  A := '';
  with TfrmIngAtrib.Create(nil) do
  begin
    R := ObtenerTexto(A,T);
    Release;
  end;

  if not R then Exit;

  Consulta := 'INSERT INTO dbo.Atributo (Descrip,TipoAtrib) '+
              'VALUES ('+#39+A+#39+','+#39+T+#39+')';
  with  qryUpdate do
  begin
    Close;
    SQL.Clear;
    SQL.Add(Consulta);
    Prepare;
    ExecSQL;
  end;

  Atrib.Close;
  Existe(Atrib,'Descrip',A);
end;

end.
