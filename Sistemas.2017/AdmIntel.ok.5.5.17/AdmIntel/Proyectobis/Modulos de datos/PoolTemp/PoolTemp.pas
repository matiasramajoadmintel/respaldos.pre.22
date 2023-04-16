unit PoolTemp;

interface

uses
  SysUtils, Classes, DBTables, DB;

type
  TdmTemp = class(TDataModule)
    TMP: TTable;
    TMPFECHA: TDateTimeField;
    TMPDESCRIP: TStringField;
    TMPEdificio: TStringField;
    TMPIMPORTE: TFloatField;
    TMPTIPO_GASTO: TStringField;
    TMPIDGASTO: TIntegerField;
    TMPIDPROVEEDOR: TIntegerField;
    TMPTIPO_PAGO: TStringField;
    TMPIDEDIF: TIntegerField;
    TMPNRO_DECI: TIntegerField;
    qryServ: TQuery;
    qryServIDSERV_EDIF: TIntegerField;
    qryServCOSTO: TFloatField;
    qryServIDPROVEEDOR: TIntegerField;
    qryServDESCRIP: TStringField;
    qryServIDEDIFICIO: TIntegerField;
    qryServVACIOS: TStringField;
    qryServFECHA: TDateTimeField;
    qryServIDPAGO: TIntegerField;
    qryServNRO_DECI: TIntegerField;
    qryGasto: TQuery;
    qryTrab: TQuery;
    qryTrabIDPAGO: TIntegerField;
    qryTrabDESCRIP: TStringField;
    qryTrabIMPORTE: TFloatField;
    qryTrabFECHA: TDateTimeField;
    qryTrabIDEDIFICIO: TIntegerField;
    qryTrabTIPO_TRAB: TStringField;
    qryTrabNRO_DECI: TIntegerField;
    TMPNRO_CHEQUE: TStringField;
    TMPPROVEEDOR: TStringField;
    qryGastoIDGASTO_AD: TIntegerField;
    qryGastoFECHA: TDateTimeField;
    qryGastoCOSTO: TFloatField;
    qryGastoDESCRIP: TStringField;
    qryGastoIDPROVEEDOR: TIntegerField;
    qryGastoRAZON_SOCIAL: TStringField;
    qryGastoTIPO_PAGO: TStringField;
    qryGastoNRO_CHEQUE: TStringField;
    qryGastoIDPAGO: TIntegerField;
    qryGastoNRO_DECI: TIntegerField;
    qryServRAZON_SOCIAL: TStringField;
    qryServTIPO_PAGO: TStringField;
    qryServNRO_CHEQUE: TStringField;
    qryTrabRAZON_SOCIAL: TStringField;
    qryTrabTIPO_PAGO: TStringField;
    qryTrabNRO_CHEQUE: TStringField;
    qryGastoNRO_ORDEN: TIntegerField;
    qryServNRO_ORDEN: TIntegerField;
    qryTrabNRO_ORDEN: TIntegerField;
    TMPNRO_ORDEN: TIntegerField;

  private
    { Private declarations }

  public
    procedure CargarTemp(const Id: Longword);

  end;

var
  dmTemp: TdmTemp;

implementation

uses Util;

{$R *.dfm}

procedure TdmTemp.CargarTemp(const Id: Longword);
begin
  TMP.Open;
  TMP.EmptyTable;

  with qryTrab do
  begin
    if Id <> 0 then Filtrar(qryTrab,'IDPAGO='+IntToStr(Id))
    else qryTrab.Open;
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'T';
      TMPIDGASTO.Value := qryTrabIDPAGO.Value;
      if qryTrabTIPO_TRAB.Text = 'D' then
        TMPDESCRIP.Text := 'Trabajo en depto. ' + qryTrabDESCRIP.Text
      else TMPDESCRIP.Text := 'Trabajo en edificio ' + qryTrabDESCRIP.Text;
      TMPIMPORTE.Value := qryTrabIMPORTE.Value;
      TMPIDPROVEEDOR.Value := 0;
      TMPIDEDIF.Value := qryTrabIDEDIFICIO.Value;
      TMPFECHA.Value := qryTrabFECHA.Value;
      TMPNRO_DECI.Value := qryTrabNRO_DECI.Value;
      TMPNRO_ORDEN.Value := qryTrabNRO_ORDEN.Value;
      TMPTIPO_PAGO.Text := qryTrabTIPO_PAGO.Text;
      TMPPROVEEDOR.Text := qryTrabRAZON_SOCIAL.Text;
      TMPNRO_CHEQUE.Text := qryTrabNRO_CHEQUE.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  with qryGasto do
  begin
    if Id <> 0 then Filtrar(qryGasto,'IDPAGO='+IntToStr(Id))
    else qryGasto.Open;
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'G';
      TMPIDGASTO.Value := qryGastoIDPAGO.Value;
      TMPDESCRIP.Text := qryGastoDESCRIP.Text;
      TMPIMPORTE.Value := qryGastoCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryGastoIDPROVEEDOR.Value;
      TMPFECHA.Value := qryGastoFECHA.Value;
      TMPNRO_DECI.Value := qryGastoNRO_DECI.Value;
      TMPNRO_ORDEN.Value := qryGastoNRO_ORDEN.Value;
      TMPTIPO_PAGO.Text := qryGastoTIPO_PAGO.Text;
      TMPPROVEEDOR.Text := qryGastoRAZON_SOCIAL.Text;
      TMPNRO_CHEQUE.Text := qryGastoNRO_CHEQUE.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;

  with qryServ do
  begin
    if Id <> 0 then Filtrar(qryServ,'IDPAGO='+IntToStr(Id))
    else qryServ.Open;    
    First;
    while not Eof do
    begin
      TMP.Append;
      TMPTIPO_GASTO.Text := 'S';
      TMPIDGASTO.Value := qryServIDPAGO.Value;
      TMPDESCRIP.Text := qryServDESCRIP.Text;
      TMPIMPORTE.Value := qryServCOSTO.Value;
      TMPIDPROVEEDOR.Value := qryServIDPROVEEDOR.Value;
      TMPIDEDIF.Value := qryServIDEDIFICIO.Value;
      TMPFECHA.Value := qryServFECHA.Value;
      TMPNRO_DECI.Value := qryServNRO_DECI.Value;
      TMPNRO_ORDEN.Value := qryServNRO_ORDEN.Value;
      TMPTIPO_PAGO.Text := qryServTIPO_PAGO.Text;
      TMPPROVEEDOR.Text := qryServRAZON_SOCIAL.Text;
      TMPNRO_CHEQUE.Text := qryServNRO_CHEQUE.Text;
      TMP.Post;
      Next;
    end;
    TMP.Refresh;
  end;
end;

end.
