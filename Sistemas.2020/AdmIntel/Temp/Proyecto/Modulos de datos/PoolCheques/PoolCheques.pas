unit PoolCheques;

interface

uses
  SysUtils, Classes, DB, DBTables, DateUtils;

type
  TdmCheques = class(TDataModule)
    CHDEV: TTable;
    CHDEVNRO_CHEQUE: TStringField;
    CHDEVFECHA_DEV: TDateTimeField;
    CHDEVTIPO: TStringField;

  private
    { Private declarations }

  public
    function DevolverChequeExt(const NroCheque: String): Boolean;

  end;

var
  dmCheques: TdmCheques;

implementation



uses Comunes, PoolDatos, Util;

{$R *.dfm}

function TdmCheques.DevolverChequeExt(const NroCheque: String): Boolean;
begin
  Result := False;
  try
    CHDEV.Open;
    CHDEV.Append;
    CHDEVNRO_CHEQUE.Text := NroCheque;
    CHDEVFECHA_DEV.Value := DateOf(Date);
    CHDEVTIPO.Text := 'E';
    CHDEV.Post;
    except on EDatabaseError do
    begin
      MsjError('Se produjo un error al intentar registrar la devolución del cheque');
      Exit;
    end;
  end;
  Result := True;
  MsjInfo('Se ha registrado la devolución sin problemas');
end;

end.
