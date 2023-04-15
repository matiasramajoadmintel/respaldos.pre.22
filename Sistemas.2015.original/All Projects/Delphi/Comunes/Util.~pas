unit Util;

interface

uses Forms, StdCtrls, Graphics, SysUtils, Dialogs, DbTables, DB, DBCtrls,
     DBGrids, extctrls, Messages, Windows, Classes, Controls, ComCtrls,
     ShellAPI, Grids;

{Procedimientos de cuadros de mensajes}
     Procedure MsjError(const Mensaje: PChar); overload;
     Procedure MsjError(const Mensaje: String); overload;
     Procedure MsjInfo(const Mensaje: PChar);
     Function Confirmar(const Mensaje: PChar): Boolean;
     Function MsjOKCancel(const Mensaje: PChar): Boolean;
     Function MsjYesNoCancel(const Mensaje: PChar): Integer;

{Procedimientos de fechas}
     Function MesComoWord(const Mes: String): word;
     Function MesComoStr(const Mes: word): String;
     Function FechaComoInt(const Dia, Mes, Anio: Word): Real;
     Function MesComoDias(const Mes: Word): Integer;
     Function Edad(const FN: TDateTime): Smallint;
     Function Bisiesto(const Ano: Word): Boolean;
     Function Dias(const Mes, Ano: Word): Word;

{Procedimientos para ejecutar archivos BAT}
     Procedure CorrerBAT(Const Nom:String);
     Function ExecuteFile(const FileName,Params,DefaultDir:string;ShowCmd:Integer):THandle;

{Procedimientos para el ingreso de códigos}
     Function HayTexto(Obj: TObject): Boolean;
     Function HayEntero(T: String): Boolean;
     Procedure DesconectarControles(const T: TControl);

{Procedimientos para el manejo de tablas}
     Procedure ConectarTablas(const Ind,MF:String;const DS:TDataSource;const T:TTable);
     Procedure DesconectarTablas(const T: TTable);
     Procedure Refrescar(DataSet: TDataSet);
     Procedure Filtrar(DataSet: TDataSet; const Filtro: String);
     Function UltimoInt(DataSet: TTable; const Campo: String): Integer;
     Function PrimerInt(DataSet: TDataSet; const Campo: String): Integer;

{Procedimientos para el manejo de cedenas de caracteres}
     Function CprLCad(const Cad: String; const L: Word): String;
     Function CompletarIzq(Cad:String; const C:Char; const N:Integer):String;

{Procedimientos para el manejo de grillas de strings}
     Function GrdVacio(Grd: TStringGrid):Boolean;
     Procedure VaciarGrd(Grd: TStringGrid);

     Function FilaVacia(Grd: TStringGrid; const Fila: Integer):Boolean;
     Procedure BorrarFila(Grd: TStringGrid; const Fila: Integer);
     Procedure EliminarFila(Grd: TStringGrid; const Fila: Integer);

     Function ColVacia(Grd: TStringGrid; const Col: Integer):Boolean;
     Procedure BorrarCol(Grd: TStringGrid; const Col: Integer);
     Procedure EliminarCol(Grd: TStringGrid; const Col: Integer);

{Procedimientos para el manejo de grillas de datos}
     Procedure ApagarTitulos(const Grd: TDBGrid);
     Procedure ColorearTitulo(Grd: TDBGrid; const Tit: String; Col: TColor);

{Procedimientos para controlar ToolButtons}
     Procedure LevantarBotones(TB: TToolBar);

     function TruncarReal(const R: Real): Real;

implementation

uses MensajeError;

//******************************************************************************
//                         Procedimientos de cuadros de mensajes
//******************************************************************************

Function Confirmar(const Mensaje: PChar): Boolean;
var
        Msj:TfrmMsjError;
        resInt:integer;
begin
        Result:=false;
        Msj:=TfrmMsjError.Create(Nil);
        try
                Msj.Mostrar(Mensaje,'Confirmar',Result,resInt);
        finally
                Msj.Free;
        end;
end;

Procedure MsjError(const Mensaje: PChar);
var
        Msj:TfrmMsjError;
        resBool:Boolean;
        resInt:integer;
begin
        Msj:=TfrmMsjError.Create(Nil);
        try
                Msj.Mostrar(Mensaje,'Error',resBool,resInt);
        finally
                Msj.Free;
        end;
end;

Procedure MsjError(const Mensaje: String);
begin
  MsjError(PChar(Mensaje));
end;

Procedure MsjInfo(const Mensaje: PChar);
var
        Msj:TfrmMsjError;
        resBool:Boolean;
        resInt:integer;
begin
        Msj:=TfrmMsjError.Create(Nil);
        try
                Msj.Mostrar(Mensaje,'Info',resBool,resInt);
        finally
                Msj.Free;
        end;
end;

Function MsjOKCancel(const Mensaje: PChar): Boolean;
var
        Msj:TfrmMsjError;
        resInt:integer;
begin
        Result:=false;
        Msj:=TfrmMsjError.Create(Nil);
        try
                Msj.Mostrar(Mensaje,'OkCancel',Result,resInt);
        finally
                Msj.Free;
        end;
end;

Function MsjYesNoCancel(const Mensaje: PChar): Integer;
var
        Msj:TfrmMsjError;
        resBool:Boolean;
begin
        Result:=2;
        Msj:=TfrmMsjError.Create(Nil);
        try
                Msj.Mostrar(Mensaje,'YesNoCancel',resBool,Result);
        finally
                Msj.Free;
        end;
end;

//******************************************************************************
//                            Procedimientos de fechas
//******************************************************************************

Function MesComoWord(const Mes: String): word;
begin
  Result:=0;
  if Mes = 'Enero' then Result := 1;
  if Mes = 'Febrero' then Result := 2;
  if Mes = 'Marzo' then Result := 3;
  if Mes = 'Abril' then Result := 4;
  if Mes = 'Mayo' then Result := 5;
  if Mes = 'Junio' then Result := 6;
  if Mes = 'Julio' then Result := 7;
  if Mes = 'Agosto' then Result := 8;
  if (Mes='Septiembre') or (Mes='Setiembre') then Result := 9;
  if Mes = 'Octubre' then Result := 10;
  if Mes = 'Noviembre' then Result := 11;
  if Mes = 'Diciembre' then Result := 12;
end;

Function MesComoStr(const Mes: word): String;
begin
  Case Mes of
    1: Result := 'Enero';
    2: Result := 'Febrero';
    3: Result := 'Marzo';
    4: Result := 'Abril';
    5: Result := 'Mayo';
    6: Result := 'Junio';
    7: Result := 'Julio';
    8: Result := 'Agosto';
    9: Result := 'Septiembre';
    10: Result := 'Octubre';
    11: Result := 'Noviembre';
    12: Result := 'Diciembre';
    else begin MsjError('Número de mes incorrecto.'); Result := ''; end;
  end;
end;

Function FechaComoInt(const Dia, Mes, Anio: Word): Real;
var
  T: Real;
begin
  //Calcula la cantidad de dias transcurridos desde 30/12/1899
  //hasta 30/12/Anio.
  T := (Anio-1899-1)*365+(Anio-1899-1)/4;
  //Suma la cantidad de dias transcurridos en el corriente año.
  T := T + MesComoDias(Mes-1) + Dia + 1;
  Result := Int(T);
end;

Function MesComoDias(const Mes: Word): Integer;
begin
  Result := -1;
  if Mes = 1 then Result := 31;
  if Mes = 2 then Result := 59;
  if Mes = 3 then Result := 90;
  if Mes = 4 then Result := 120;
  if Mes = 5 then Result := 151;
  if Mes = 6 then Result := 181;
  if Mes = 7 then Result := 212;
  if Mes = 8 then Result := 243;
  if Mes = 9 then Result := 273;
  if Mes = 10 then Result := 304;
  if Mes = 11 then Result := 334;
  if Mes = 12 then Result := 365;
end;

Function Edad(const FN: TDateTime): Smallint;
var
  AN, AA, MN, MA, DN, DA: word;
begin
  DecodeDate(FN,AN,MN,DN);
  DecodeDate(Now,AA,MA,DA);
  if MN < MA then Result := AA - AN
  else if MN > MA then Result := AA - AN - 1
       else if DN <= DA then Result := AA - AN
            else Result := AA - AN - 1;
end;

Function Bisiesto(const Ano: Word): Boolean;
var
  T:TDateTime;
  A,M,D:Word;
begin
  T:=strToDate('28/2/'+intToStr(Ano));
  T:=T+1;
  DecodeDate(T,A,M,D);
  Result := (M = 2);
end;

Function Dias(const Mes, Ano: Word): Word;
begin
  if Mes = 2 then
  begin
    if Bisiesto(Ano) then Result := 29
    else Result := 28;
    Exit;
  end;
  case Mes of
    1,3,5,7,8,10,12: Result := 31;
    4,6,9,11: Result := 30;
    else Result := 0;
  end;
end;
//******************************************************************************
//                  Procedimientos para ejecutar archivos BAT
//******************************************************************************

Procedure CorrerBAT(Const Nom:String);
begin
  if FileExists('C:\Sistema\'+Nom) then
    ExecuteFile(Nom,'','C:\Sistema',HIDE_WINDOW)
  else MsjError('El archivo especificado no existe.');
end;

Function ExecuteFile(const FileName,Params,DefaultDir:string;ShowCmd:Integer):THandle;
var
  zFileName,zCommand, zParams, zDir: array[0..79] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle,StrPCopy(zCommand,'Open'),
                         StrPCopy(zFileName,FileName),StrPCopy(zParams,Params),
                         StrPCopy(zDir,DefaultDir),ShowCmd);
end;

//******************************************************************************
//               Procedimientos para el ingreso de códigos de productos
//******************************************************************************

Function HayTexto(Obj: TObject): Boolean;
begin
  Result := False;
  if Obj is TEdit then Result := TEdit(Obj).Text <> '';
  if Obj is TDBEdit then Result := TDBEdit(Obj).Text <> '';

  if not Result then MsjError('Debe especificar un código');
end;

Function HayEntero(T: String): Boolean;
var
  N:LongInt;
begin
  N:=0;
  Result:=false;
  if T <> '' then
  try  N:=StrToInt(T);
       Result:=true;
    Except on EConvertError do
    begin
      MsjError('Debe ingresar un número entero.');
      T:=intToStr(N);
    end;
  end;
end;

Procedure DesconectarControles(const T: TControl);
var
  i:integer;
begin
  for i:=0 to T.ComponentCount-1 do
  begin
    if TwinControl(T.Components[i]).Parent = T then
    begin
      if (T.Components[i] is TDBEdit) then
        TDBEdit(T.Components[i]).DataField := '';
      if (T.Components[i] is TDBText) then
        TDBText(T.Components[i]).DataField := '';
      if (T.Components[i] is TDBMemo) then
        TDBMemo(T.Components[i]).DataField := '';
      if (T.Components[i] is TDBComboBox) then
        TDBComboBox(T.Components[i]).DataField := '';
    end;
  end;
end;

{******************************************************************************
                 Procedimientos para el manejo de tablas
*******************************************************************************}

Procedure ConectarTablas(const Ind,MF:String;const DS:TDataSource;const T:TTable);
begin
   with T do
   begin
      IndexName := Ind;
      MasterSource := DS;
      MasterFields := MF;
   end;
end;

Procedure DesconectarTablas(const T:TTable);
begin
  with T do
  begin
    IndexName := '';
    MasterSource := nil;
    MasterFields := '';
  end;
end;

Procedure Refrescar(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

Procedure Filtrar(DataSet: TDataSet; const Filtro: String);
begin
   with DataSet do
   begin
      if not Active then Open;
      Filter := Filtro;
      if Filter <> '' then Filtered := true;
   end;
end;

Function UltimoInt(DataSet: TTable; const Campo: String): Integer;
begin
  with DataSet do
  begin
    Close;
    IndexFieldNames := Campo;
    Open;
    Last;
    Result := FieldByName(Campo).AsInteger;
  end;
end;

Function PrimerInt(DataSet: TDataSet; const Campo: String): Integer;
begin
  with DataSet do
  begin
    if not Active then Open;
    First;
    Result := FieldByName(Campo).AsInteger;
  end;
end;

{******************************************************************************
                 Procedimientos para el manejo de cadenas de caracteres
*******************************************************************************}

Function CprLCad(const Cad: String; const L: Word): String;
var
  i: Integer;
  R: String;
begin
  if StrLen(PChar(Cad)) <= L then R := Cad
  else
    for i:=0 to L-1 do
    R := Concat(R,Cad[i]);
  Result := R;
end;

Function CompletarIzq(Cad:String; const C:Char; const N:Integer):String;
begin
  if N<=0 then Exit;
  if Length(Cad)>=N then
  begin
    Result:=Cad;
    Exit;
  end;
  while Length(Cad)<N do
    Cad:=C+Cad;
  Result:=Cad;
end;

{******************************************************************************
              Procedimientos para el manejo de grillas de strings
*******************************************************************************}

Function GrdVacio(Grd: TStringGrid):Boolean;
{Para evitar que verifique en la fila 0 donde están los títulos la variable i
del for empieza en 1}
var
  i: Integer;
begin
  Result := False;
  for i:=1 to Grd.RowCount-1 do
    if not FilaVacia(Grd,i) then Exit;
  Result := True;
end;

Procedure VaciarGrd(Grd: TStringGrid);
var
  i, j: Integer;
begin
  for j:=0 to Grd.RowCount-1 do
    for i:=0 to Grd.ColCount-1 do
      Grd.Cells[i,j] := '';
end;

Function FilaVacia(Grd: TStringGrid; const Fila: Integer):Boolean;
var
  i: Integer;
begin
  Result := False;
  with Grd do
    for i:=0 to ColCount-1 do
      if Cells[i,Fila]<>'' then Exit;
  Result := True;
end;

Procedure BorrarFila(Grd: TStringGrid; const Fila: Integer);
var
  i: Integer;
begin
  with Grd do
    for i:=0 to ColCount-1 do
      Cells[i,Fila]:='';
end;

Procedure EliminarFila(Grd: TStringGrid; const Fila: Integer);
var
  i: Integer;
begin
  BorrarFila(Grd,Fila);
  if not GrdVacio(Grd) then
    for i:=Fila to Grd.RowCount-2 do
      Grd.Rows[i] := Grd.Rows[i+1];
end;

Function ColVacia(Grd: TStringGrid; const Col: Integer):Boolean;
begin
  Result := False;
end;

Procedure BorrarCol(Grd: TStringGrid; const Col: Integer);
begin
  {}
end;

Procedure EliminarCol(Grd: TStringGrid; const Col: Integer);
begin
  {}
end;

{*******************************************************************************
           Procedimientos para el manejo de grillas de datos
*******************************************************************************}

Procedure ApagarTitulos(const Grd: TDBGrid);
var i:Integer;
begin
  with Grd do
    for i:=0 to Columns.Count -1 do
    begin
      Columns[i].Title.Font.Style:=[];
      Columns[i].Title.Font.Color := clWindowText;
    end;
end;

Procedure ColorearTitulo(Grd: TDBGrid; const Tit: String; Col: TColor);
var
  i: Integer;
begin
  with Grd do
    for i:=0 to Columns.Count-1 do
    begin
      if Columns[i].Title.Caption = Tit then
      begin
        Columns[i].Title.Font.Color := Col;
        Columns[i].Title.Font.Style := [fsBold];
      end
      else
      begin
        Columns[i].Title.Font.Color := clWindowText;
        Columns[i].Title.Font.Style := [];
      end;
    end;
end;

{*******************************************************************************
                  Procedimientos para controlar ToolButtons
*******************************************************************************}

Procedure LevantarBotones(TB: TToolBar);
var
  i: Integer;
begin
  for i:=0 to TB.ButtonCount-1 do
    TB.Buttons[i].Down := False;
end;

function TruncarReal(const R: Real): Real;
begin
  Result := Trunc(R*100)/100;
end;

end.
