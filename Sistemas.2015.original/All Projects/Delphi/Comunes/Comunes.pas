unit Comunes;

interface

uses Messages,Windows, Graphics,SysUtils,Extctrls,StdCtrls,Controls,
     Forms,Classes,Dialogs,Buttons,Menus,Registry,ComCtrls,Math,Consts,
     DbTables,DB,DBCtrls,DBGrids,ShellApi,QComCtrls,IBTable;

{//Constantes de procedimientos de comunes}
Const LimiteFiltroNro = 9999999; //el nro mayor que admite el proc de filtro nro entero
{//Constantes mensajes de error comunes}
      CAD_ERR_Guardar ='No se ha podido guardar los datos. Verifique los datos.';
{//Constantes de mensajes comunes}
      CAD_PREG_Cancela='¿Está segura de cancelar la edición de datos?';
      MSJERR1 = 'La busqueda del registro no es válida';

      MODE_INSERT = 0; //Alta
      MODE_DELETE = 1; //Baja
      MODE_UPDATE = 2; //Modificación
      MODE_SELECT = 3; //Consulta

var FI:TRegInifile;
    FC:TRegIniFile;


{Procedimientos de mensajes}
Procedure VerError(Const D:String);
Procedure VerMsj(Const D:String);
Function PreguntaSINO(Const D:String):Boolean;
Function EntradaEntero(Const Tit,Cad:String;Var N:longInt):Boolean;
Function EntradaCadena(Const Tit,Cad:String;Var res:String):Boolean;
Function EntradaNumero(Const Tit,Cad:String;Var N:Extended):Boolean;
Procedure MostrarMSJ(Const D:String);
Procedure OcultarMSJ;

{Procedimientos de controles de listas}
Procedure CargarListaCampo(Const C:TComboBox;Const T:TDataSet;Const F:String); overload;
Procedure InicializarLista(Const C:TStrings;Const T:TDataSet; Const F:String);

{Procedimientos de Interface}
Procedure EntradaACampo(F:TForm;O:TObject);
Procedure SalidaDeCampo(F:TForm;O:TObject);
Procedure OcultarPgns(Const T:TPageControl);
Procedure ActivarControles(Const T:TControl;Const R:Boolean);

{Procedimientos de verificacion}
Function EsEntero(S:String):Boolean;
Function EsFloat (S:String):Boolean;
Function DIADESEMANA(const Fecha:TDateTime;const Modo:byte):String;
Function ANIO(Const F:TDateTime):Integer;
Function NRODIA(Const F:TDateTime):integer;
Function MES(Const F:TDateTime):Integer;
Function NombreMES(Const M:word;const T:Byte):String;
Function BISIESTO(const Ano:Word):Boolean;
Function HayTexto2(Obj: TObject): Boolean;
Procedure CambioKey (var Key: char);

{Procedimeintos de Datos}
Procedure Abrir(Const T:TDataset);
Function Editando(Const T:TTable):Boolean; Overload;
Function Editando(Const T:TDataSource):Boolean; Overload
function Editando(Const T:TIBTable):Boolean; Overload;
Function SumaColumna(Const T:TDataSet; Const F:String):currency;
Function SumaColEntera(Const T:TDataSet; Const F:String):LongInt;
Function FiltroNroInt(const Campo,Valor:String;const Digitos:Integer):String;
Function ExisteNro(Const T:TTable;Const C:String; Const V:LongInt):Boolean;
Function Existe(Const T:TTable;Const C:String;Const V:Variant):Boolean; Overload;
Function Existe(Const T:TTable;Const C1, C2:String;Const V:Variant):Boolean;  Overload;
Function Existe(Const T:TTable;Const C1, C2, C3:String;Const V:Variant):Boolean;  Overload;
Function Existe(Const T:TTable;Const C1,C2,C3,C4:String;Const V:Variant):Boolean; Overload;
Function Existe(Const T:TIBTable;Const C1:String;Const V:Variant):Boolean; Overload;
Function Existe(Const T:TIBTable;Const C1,C2:String;Const V:Variant):Boolean; Overload;
Function Existe(Const T:TIBTable;Const C1,C2,C3:String;Const V:Variant):Boolean; Overload;
Function Existe(Const T:TIBTable;Const C1,C2,C3,C4:String;Const V:Variant):Boolean; Overload;
Function Existe(T: TDataSet; C: String; V: Variant): Boolean; Overload;
Function Existe(T: TDataSet; C1,C2: String; V: Variant): Boolean; Overload;
Function Existe(T: TDataSet; C1,C2,C3: String; V: Variant): Boolean; Overload;
Function BorrarTodosLosQue(Const T:TTable;Const Condicion:String):Integer;
Procedure LimpiarEdit(O:TObject);

{Funciones de almacenamiento de estado de componentes}
Procedure GuardarEstadoGrilla(Const ArchCol:String;var GRD:TDBGrid);
Procedure RecuperarEstadoGrilla(Const ArchCol:String;var GRD:TDBGrid);
Procedure SetUpPopUpGrilla(TMN:TMenuItem; TPP:TPopupMenu ;GRD: TDBGrid; PRO:TNotifyEvent);
Procedure ApagarTitulosGrid(const G:TDBGrid);
Procedure SetLineasGrillas(Const F:TForm; Const STT:Boolean);
Procedure EnableSegunTag(Sender :TControl;Const Tag:Integer;Const Value:Boolean);
Procedure EnableSegunTagMM(S:TControl;Const T1,T2:Integer;Const Value:Boolean);
Procedure FormatearDatos(G:TDBGrid);
Procedure LimpiarMenu(PP:TMenuItem);
Function ExisteColumna(S:String; DBG:TDBGrid):Boolean;
Procedure OffCol(Const GRD:TDBGrid;Const F:String);
Procedure OnCol(Const GRD:TDBGrid;Const F:TField);
Procedure ApagarColumnas(Const grd:TDBGrid);

{Funciones de operacion del registro de windows (memoria del sistema)}
Procedure RecuperarEstadoVentana(Const SubClave:String; Const F:TForm);
Procedure GuardarEstadoVentana(Const SubClave:String; Const F:TForm);
Function RecuperarValorRegistro(Const Clave,SubClave:String):String;
Function GuardarValorRegistro(Const Clave,SubClave,Valor:String):String;

{procedimientos de ejecución de procesos}
Procedure EjecutarBAT(Const Nom:String);
function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;

{PROCEDIMIENTOS DE CONTROLES DE LISTA}
Procedure AltaSQL(const Tabla, Campos, Valores: String; Qry: TQuery); overload;
Procedure ModifSQL(const Tabla, Asig, Cond: String; Qry: TQuery); overload;
Procedure BajaSQL(const Tabla, Cond: String; Qry: TQuery); overload;
Function DateToSQL(Fecha: TDateTime): String;
Procedure EmpezarTransaccion(Qry: TQuery);
Procedure HacerCommit(Qry: TQuery);
Procedure HacerRollback(Qry: TQuery);

implementation

uses MSJU;

//******************************************************************************
//                          PROCEDIMIENTOS DE MENSAJES                        \\
//******************************************************************************

Procedure VerError(Const D:String);
begin MessageDlg(D,mtError,[mbOk],0);
end;

Procedure VerMsj(Const D:String);
begin MessageDlg(D,mtInformation,[mbOk],0);
end;


Function PreguntaSINO(Const D:String):Boolean;
begin result := ( MessageDlg(D,mtConfirmation,[mbYes,mbNo],0) = IDYES ) ;
end;


Function EntradaEntero(Const Tit,Cad:String;Var N:longInt):Boolean;
Var S:String;
    B:Boolean;
begin B:=true;  Result:=false;  N:=-1;  S:='';
      While B do
      begin if not InputQuery(Tit,CAD,s) then B:=false
            else
            begin if S=''then begin N:=-1; Result:=true; exit; end;

                  if EsEntero(S) then
                  begin N:=StrToInt(S); Result:=true; B:=false; end
                  else VerError('Dato incorrecto');
            end;
      end;
end;

Function EntradaNumero(Const Tit,Cad:String;Var N:Extended):Boolean;
var S:String;
    Correcto:Boolean;
begin Result:=false;     Correcto:=false;
      S:=FloatToStr(N);
      while not Correcto do
      begin if not InputQuery(Tit,CAD,S) then Exit;
            try N:=StrToFloat(S);
                Correcto:=true;
                Result:=true;
                Except on EConvertError do
                begin VerError(' El nro ingresado no es correcto.');
                      Correcto:=false;
                end;
           end;
      end;
end;


Function EntradaCadena(Const Tit,Cad:String;Var res:String):Boolean;
begin
     Result:=InputQuery(Tit,CAD,Res);
end;

Procedure MostrarMSJ(Const D:String);
begin if frmMSJ = nil then frmMSJ:=TfrmMSJ.Create(nil);
      frmMSJ.Mostrar(D);
end;

Procedure OcultarMSJ;
begin if frmMSJ = nil then exit;
      frmMSJ.Ocultar;
      frmMSJ.Free;
      frmMSJ:=nil;
end;

{******************************************************************************}
{                            PROCEDIMIENTOS DE INTERFACE                       }
{******************************************************************************}

Procedure EntradaACampo(F:TForm;O:TObject);
begin
     with F do
     begin
          if O is TEdit then with TEdit(O) do
          begin Color:=clBlack;Font.Color:=clYellow;end;
          if O is TLabeledEdit then with TLabeledEdit(O) do
          begin Color:=clBlack;Font.Color:=clYellow;end;
          if O is TDBEdit then with TDBEdit(O) do
          begin Color:=clBlack;Font.Color:=clYellow;end;

          if O is TMemo then with TMemo(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;
          if O is TDBMemo then with TDBMemo(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;

          if O is TCheckBox then with TCheckBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;
          if O is TDBCheckBox then with TDBCheckBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;

          if O is TRadioButton then with TRadioButton(O) do
          begin Color:=clBlack; Font.Color:=clYellow;
                Font.Style:=[fsBold];
          end;

          if O is TListBox then with TListBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;
          if O is TDBListBox then with TDBListBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;

          if O is TComboBox then With TComboBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;
          if O is TDBComboBox then With TDBComboBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;

          if O is TDBLookUpListBox then with TDBLookUpListBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; end;
          if O is TDBLookUpComboBox then with TDBLookUpComboBox(O) do
          begin Color:=clBlack; Font.Color:=clYellow; //DropDown;
          end;

          {          if O is TDBGrid then with TDBGrid(O) do
          begin BorderStyle:=bsSingle; end;}

          if O is TPanel then with TPanel(O) do
          begin BevelOuter:= bvRaised; end;

          if O is TButton then with TButton(O) do
          begin Font.Style:=[fsBold]; Font.Color:=clBlack; end;

     end;
end;

Procedure SalidaDeCampo(F:TForm;O:TObject);
begin
     with F do
     begin
          if O is TEdit then with TEdit(O) do
          begin Color:=clBtnHighlight;Font.Color:=clWindowText;end;
          if O is TLabeledEdit then with TEdit(O) do
          begin Color:=clBtnHighlight;Font.Color:=clWindowText;end;
          if O is TDBEdit then with TDBEdit(O) do
          begin Color:=clBtnHighlight;Font.Color:=clWindowText;end;

          if O is TMemo then with TMemo(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;
          if O is TDBMemo then with TDBMemo(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;

          if O is TCheckBox then with TCheckBox(O) do
          begin Color:=clBtnFace; Font.Color:=clWindowText; end;
          if O is TDBCheckBox then with TDBCheckBox(O) do
          begin Color:=clBtnFace; Font.Color:=clWindowText; end;

          if O is TRadioButton then with TRadioButton(O) do
          begin Color:=clBtnFace; Font.Color:=clWindowText;
                Font.Style:=[];
          end;

          if O is TListBox then with TListBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;
          if O is TDBListBox then with TDBListBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;

          if O is TComboBox then With TComboBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;
          if O is TDBComboBox then With TDBComboBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;

          if O is TDBLookUpListBox then with TDBLookUpListBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; end;
          if O is TDBLookUpComboBox then with TDBLookUpComboBox(O) do
          begin Color:=clBtnHighlight; Font.Color:=clWindowText; //CloseUp(true);
          end;

{          if O is TDBGrid then with TDBGrid(O) do
          begin BorderStyle:=bsNone; end;}

          if O is TPanel then with TPanel(O) do
          begin BevelOuter:= bvLowered; end;

          if O is TButton then With TButton(O) do
          begin Font.Style:=[]; Font.Color:=clWindowText; end;

     end;
end;

Procedure OcultarPgns(Const T:TPageControl);
var i:integer;
begin for i:=0 to T.PageCount -1 do
      T.Pages[i].TabVisible:= false;
end;

Procedure ActivarControles(Const T:TControl;Const R:Boolean);
var i:integer;
begin for i:=0 to T.ComponentCount-1 do
      begin if TwinControl(T.Components[i]).Parent = T then
            begin if(T.Components[i]is TLabel)then TLabel(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TDBEdit)then TDBEdit(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TDBGrid)then TDBGrid(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TRadioButton)then TRadioButton(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TDBText)then TDBText(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TPanel)then TPanel(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TDBNavigator)then TDBNavigator(T.Components[i]).Enabled:=R else
                  if(T.Components[i]is TButton)then TButton(T.Components[i]).Enabled:=R;
            end;
      end;

end;



{*****************************************************************************}
{                   PROCEDIMIENTOS PARA ENTRADA DE DATOS                      }
{*****************************************************************************}

Function EsEntero(S:String):Boolean;
var N:LongInt;
begin
     N:=0;
     Result:=false;
     if S <> '' then
     try  N:=StrToInt(S);
          Result:=true;
        Except on EConvertError do
        begin MessageDLG('Debe ingresar un nro entero.',mtInformation,[mbOk],0);
              s:=intToStr(N);
        end;
     end;
end;

Function EsFloat(S:String):Boolean;
var N:Extended;
begin
     N:=0;
     Result:=false;
     if S <> '' then
     try  N:=StrToFloat(S);
          Result:=true;
        Except on EConvertError do
        begin MessageDLG('Debe ingresar un nro entero.',mtInformation,[mbOk],0);
              s:=FloatToStr(N);
        end;
     end;
end;

Function DIADESEMANA(const Fecha:TDateTime;const Modo:byte):String;
Var S:String;
begin
     case dayOfWeek(Fecha) of
          1: S:='Domingo';
          2: S:='Lunes';
          3: S:='Martes';
          4: S:='Miércoles';
          5: S:='Jueves';
          6: S:='Viernes';
          7: S:='Sábado';
     end;
     case Modo of
          1: Result:=S[1];
          2: Result:=(S[1]+S[2]+S[3]);
          3: Result:=S;
          4: Result:=(S[1]+S[2]);
          else Result:='';
     end;
end;

Function ANIO(Const F:TDateTime):Integer;
var A,M,D:Word;
begin  DecodeDate(F,A,M,D);    Result:=A;  end;

Function MES(Const F:TDateTime):Integer;
var A,M,D:Word;
begin DecodeDate(F,A,M,D);    Result:=M;  end;

Function NombreMES(Const M:word;const T:Byte):String;
var S:String;
begin
     case M of
          1:S:='Enero';       2:S:='Febrero';      3:S:='Marzo';
          4:S:='Abril';       5:S:='Mayo';         6:S:='Junio';
          7:S:='Julio';       8:S:='Agosto';       9:S:='Septiembre';
         10:S:='Octubre';    11:S:='Noviembre';   12:S:='Diciembre'
          else S:='Err';
     end;
     case t of
          0:Result:=S;
          1:Result:=S[1];
          2:Result:=S[1]+S[2];
          3:Result:=S[1]+S[2]+S[3];
     end;

end;

Function NRODIA(Const F:TDateTime):integer;
var A,M,D:Word;
begin DecodeDate(F,A,M,D);    Result:=D;  end;


Function BISIESTO(const Ano:Word):Boolean;
Var T:TDateTime;
    A,M,D:Word;
begin
     T:=strToDate('28/2/'+intToStr(Ano));
     T:=T+1;
     DecodeDate(T,A,M,D);
     if M = 2 then Result:=true
     else Result:=false;
end;

Function HayTexto2(Obj: TObject): Boolean;
begin
  Result := False;
  if Obj is TEdit then Result := TEdit(Obj).Text <> '';
  if Obj is TDBEdit then Result := TDBEdit(Obj).Text <> '';
  if Obj is TDBComboBox then Result := TDBComboBox(Obj).Text <> '';
  if OBJ is TDBMemo then Result := TDBMemo(Obj).Text <> '';
end;

Procedure CambioKey (var Key: char);
begin
        if ((Key = '.')or (Key = ',')) then
                Key:= DecimalSeparator;
end;

{******************************************************************************}
{                         PROCEDIMIENTOS PARA TABLAS                           }
{******************************************************************************}

Procedure Abrir(Const T:TDataset);
begin with T do
      try if not active then Open;
      except On EDBEngineError do
             VerError('Ha ocurrido un error al intentar abrir la tabla');
      end;
end;


{Te dice si una tabla está en modo edicion}
function Editando(Const T:TTable):Boolean;
begin
      result:= (T.State = dsEdit) OR (T.State = dsInsert);
end;

{Te dice si una tabla está en modo edicion}
function Editando(Const T:TDataSource):Boolean;
begin
      result:= (T.State = dsEdit) OR (T.State = dsInsert);
end;

{Te dice si una tabla está en modo edicion}
function Editando(Const T:TIBTable):Boolean;
begin
      result:= (T.State = dsEdit) OR (T.State = dsInsert);
end;

{Suma una columna de una tabla}
Function SumaColumna(Const T:TDataSet; Const F:String):Currency;
var retu : Currency;
begin
     retu:=0;
     with T do
     begin if not active then open;
           first;
           while not eof do
           begin retu:=retu+FieldByName(F).asFloat;
                 next;
           end;
     end;
     result:=retu;
end;

Function SumaColEntera(Const T:TDataSet; Const F:String):LongInt;
var Retu:LongInt;
begin
     retu:=0;
     with T do
     begin  if not active then open;
           first;
           while not eof do
           begin retu:=retu+FieldByName(F).value;
                 next;
           end;
     end;
     result:=retu;
end;

Function FiltroNroInt(const Campo,Valor:String;const Digitos:Integer):String;
var i:integer;
    d,v,vi,vf:LongInt;
    S:String;
begin S:='';v:=strToInt(Valor);d:=Trunc(Power(10,Digitos));i:=0;Vf:=V;
      while vf < d do
      begin if i=0 then S:='('+Campo+'='+Valor+')'
            else
            begin vi:=v * ( Trunc(Power(10,i)) );
                  vf:=vi+ ( Trunc(Power(10,i)) - 1);
                  S:=S+' OR (('+Campo+'>='+intToStr(vi)+')AND('+Campo+'<='+
                            intToStr(vf)+'))';
            end;
            inc(i);
      end;
      Result:=S;
end;


Function ExisteNro(Const T:TTable;Const C:String; Const V:LongInt):Boolean;
begin with T do
      begin if not Active then open;
            filtered:=false;             indexName:='';
            MasterSource:=nil;           first;
            try
               setKey;
               FieldByName(C).AsInteger:=V;
               Result:=GotoKey;
            Except On EDBEngineError do
               begin VerError(MSJERR1);
                     Result:=false;
               end;
            end;
      end;
end;

Function Existe(Const T:TTable;Const C:String;Const V:Variant):Boolean;
begin {if not T.Active then T.Open;
      T.First;
      Result:=T.Locate(C,V,[]);}
      with T do
      begin
           if not Active then Open;
           IndexFieldNames := C;
           SetKey;
           FieldByName(C).AsString := V;
           Result := GotoKey;
      end;
end;

Function Existe(Const T:TTable;Const C1, C2:String;Const V:Variant):Boolean;
begin {if not T.Active then T.Open;
      T.First;
      Result:=T.Locate(C,V,[]);}
      with T do
      begin
           if not Active then Open;
           IndexFieldNames := C1+';'+C2;
           SetKey;
           FieldByName(C1).AsString := V[0];
           FieldByName(C2).AsString := V[1];
           Result := GotoKey;
      end;
end;

Function Existe(Const T:TTable;Const C1, C2, C3:String;Const V:Variant):Boolean;  Overload;
begin
      with T do
      begin
           if not Active then Open;
           IndexFieldNames := C1+';'+C2+';'+C3;
           SetKey;
           FieldByName(C1).AsString := V[0];
           FieldByName(C2).AsString := V[1];
           FieldByName(C3).AsString := V[2];
           Result := GotoKey;
      end;
end;

Function Existe(Const T:TTable;Const C1,C2,C3,C4:String;Const V:Variant):Boolean;
begin with T do
      begin
           if not Active then Open;
           IndexFieldNames := C1+';'+C2+';'+C3+';'+C4;
           SetKey;
           FieldByName(C1).AsString := V[0];
           FieldByName(C2).AsString := V[1];
           FieldByName(C3).AsString := V[2];
           FieldByName(C4).AsString := V[3];
           Result := GotoKey;
      end;
end;

Function Existe(T: TDataSet; C: String; V: Variant): Boolean;
begin
     if not T.Active then T.Open;
        T.First;
        Result:=T.Locate(C,V,[]);
end;

Function Existe(T: TDataSet; C1,C2: String; V: Variant): Boolean;
var
        s:string;
begin
     if not T.Active then T.Open;
        s:= C1+';'+C2;
        T.First;
        Result:=T.Locate(s,V,[]);
end;

Function Existe(T: TDataSet; C1,C2,C3: String; V: Variant): Boolean;
var
        s:string;
begin
     if not T.Active then T.Open;
        s:= C1+';'+C2+';'+C3;
        T.First;
        Result:=T.Locate(s,V,[]);
end;

Function Existe(Const T:TIBTable;Const C1,C2,C3,C4:String;Const V:Variant):Boolean;
var
        s:string;
begin with T do
      begin
           if not Active then Open;
           s:= C1+';'+C2+';'+C3+';'+C4;
           Result := Locate(s,V,[]);
      end;
end;

Function Existe(Const T:TIBTable;Const C1,C2,C3:String;Const V:Variant):Boolean;
var
        s:string;
begin with T do
      begin
           if not Active then Open;
           s:= C1+';'+C2+';'+C3;
           Result := Locate(s,V,[]);
      end;
end;

Function Existe(Const T:TIBTable;Const C1,C2:String;Const V:Variant):Boolean;
var
        s:string;
begin with T do
      begin
           if not Active then Open;
           s:= C1+';'+C2;
           Result := Locate(s,V,[]);
      end;
end;

Function Existe(Const T:TIBTable;Const C1:String;Const V:Variant):Boolean;
var
        s:string;
begin with T do
      begin
           if not Active then Open;
           s:= C1;
           Result := Locate(s,V,[]);
      end;
end;
//Funcion que permite borrar los registro de una tabla que cumplan
//una determinada condicion
Function BorrarTodosLosQue(Const T:TTable;Const Condicion:String):Integer;
var N:integer;
begin N:=0;
      with T do
      begin if not active then Open;
            if condicion <> '' then
            begin Filter:=Condicion; Filtered:=true; end;
            first;
            while not eof do
            begin delete;
                  Inc(N);
            end;
      end;
      Result := N;
end;

Procedure LimpiarEdit(O:TObject);
begin
        if O is TDBEdit then
                with TDBEdit(O) do
                        if Editando(DataSource) and not HayTexto2(O) then
                                Field.Clear;
        if O is TDBMemo then
                with TDBMemo(O) do
                        if Editando(DataSource) and not HayTexto2(O) then
                                Field.Clear;
        if O is TDBComboBox then
                with TDBComboBox(O) do
                        if Editando(Datasource) and not HayTexto2(O) then
                                Field.Clear;
end;

{Function GuardarEstadoTabla(Const T:Table):TEstadoTabla;
begin
      if Raiz = nil then
end;}

//******************************************************************************
//               PROCEDIMIENTOS DE ALMACENAMIENTO DE ESTADOS                  \\
//******************************************************************************

//Recibe nombre del archivo de inicializacion y un objeto del cual se almacenara
//su width y su heigth
//Guardará los datos en una seccion con el nombre del objeto y los datos a
//guardar tendran como nombres ANCHO y ALTO y seran de tipo entero

Procedure RecuperarEstadoGrilla(Const ArchCol:String;var GRD:TDBGrid);
begin
     if FileExists(ExtractFilePath(Application.ExeName)+ArchCol) then
     try
      GRD.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+ArchCol);
      except
        on EComponentError do
          MessageDLG('Error en archivo de inicializacion de columnas',mtError,[mbOk],0);
        on EStreamError do
          MessageDLG('Error en archivo de inicializacion de columnas',mtError,[mbOk],0);
     end;
end;

Procedure GuardarEstadoGrilla(Const ArchCol:String;var GRD:TDBGrid);
begin
     GRD.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+ArchCol);
end;

Procedure SetUpPopUpGrilla(TMN:TMenuItem; TPP:TPopupMenu ;GRD :TDBGrid; PRO:TNotifyEvent);
var i:integer;
    NI:TMenuItem;
begin
     for i:=0 to GRD.Columns.Count - 1 do
     begin NI:=TMenuItem.Create(TPP);
           NI.Caption:=GRD.Columns[i].Title.Caption;
           if GRD.Columns[i].Width <> 0 then NI.Checked:=true;
           NI.OnClick:=PRO;
           TMN.Insert(i,NI);
     end;
end;

Procedure ApagarTitulosGrid(const G:TDBGrid);
var i:Integer;
begin
     with G do
         for i:=0 to Columns.Count -1 do
             Columns[i].Title.Font.Style:=[];
end;

Procedure SetLineasGrillas(Const F:TForm; Const STT:Boolean);
var i:integer;
begin for i:=0 to F.ComponentCount -1 do
       if (F.Components[i] is TDBGrid) then
          if STT then
           TDBGrid(F.Components[i]).Options:= TDBGrid(F.Components[i]).Options +
                                              [dgRowLines,dgColLines]
          else
           TDBGrid(F.Components[i]).Options:= TDBGrid(F.Components[i]).Options -
                                              [dgRowLines,dgColLines]
end;


Procedure EnableSegunTag(Sender :TControl;Const Tag:Integer;Const Value:Boolean);
var i:Integer;
begin for i := 0 to TWinControl(Sender).ControlCount -1 do
      begin if TWincontrol(Sender).Controls[i].Tag = Tag then
               TWinControl(Sender).Controls[i].Enabled:=Value;
      end;
end;

Procedure EnableSegunTagMM(S:TControl;Const T1,T2:Integer;Const Value:Boolean);
var i:Integer;
begin for i := 0 to TWinControl(S).ControlCount -1 do
      begin if (TWincontrol(S).Controls[i].Tag >= T1) AND
               (TWincontrol(S).Controls[i].Tag >= T2) then
               TWinControl(S).Controls[i].Enabled:=Value;
      end;
end;

Procedure FormatearDatos(G:TDBGrid);
var i:Integer;
begin for i:= 0 to G.Columns.Count-1 do
      begin case G.Columns[i].Field.DataType of
            ftBoolean: begin TBooleanField(G.Columns[i].Field).DisplayValues:='X; ';
                             G.Columns[i].Field.Alignment:=taCenter;
                       end;
            ftInteger,
            ftAutoInc: begin TNumericField(G.Columns[i].Field).DisplayFormat:='00000';
                             G.Columns[i].Field.Alignment:=taCenter;
                       end;
            ftDateTime:begin TDateTimeField(G.Columns[i].Field).DisplayFormat:='dd/mm/yyyy';
                             G.Columns[i].Field.Alignment:=taCenter;
                       end;
            end;
      end;
end;

Procedure LimpiarMenu(PP:TMenuItem);
var i:Integer;
begin for i:=(PP.Count)-1 downto 0 do
          PP.Delete(i);
end;

Function ExisteColumna(S:String; DBG:TDBGrid):Boolean;
var i:Integer;
begin Result:=false;
      for i:=0 to DBG.Columns.Count - 1 do
          if DBG.Columns[i].Title.Caption=S then
          begin Result:= true; break; end;
end;

//Destruye la columna del campo F
Procedure OffCol(Const GRD:TDBGrid;Const F:String);
var i:integer;
begin With GRD do
      for i:=0 to Columns.Count -1 do
          if (Columns[i].Title.Caption = F) then
          begin Columns[i].Destroy;
                break;
          end;
end;

//Agrega la columna del campo F
Procedure OnCol(Const GRD:TDBGrid;Const F:TField);
var C:TColumn;
begin with GRD do
      begin C:=Columns.Add;
            C.Field:=F;
            C.Index:=0;
      end;
end;

//Apaga los titulos de las columnas del grilla
Procedure ApagarColumnas(Const grd:TDBGrid);
var i:integer;
begin with grd do
      for i:=0 to Columns.Count - 1 do
      begin Columns[i].Title.Font.Style:=[];
            Columns[i].Title.Font.Color:=clWindowText;
      end;
end;

//******************************************************************************
//     FUNCIONES DE MANEJO DEL REGISTRO (MEMORIA DEL SISTEMA)                 \\
//******************************************************************************

Procedure GuardarEstadoVentana(Const SubClave:String; Const F:TForm);
begin
     if FC = nil then FC:=TRegIniFile.Create(Application.Title);

     if (F.BorderStyle = bsSizeable) then
     begin FC.WriteInteger(SubClave,'ANCHO',F.Width);
           FC.WriteInteger(SubClave,'ALTO',F.Height);
           FC.WriteInteger(SubClave,'ESTADO',Ord(F.WindowState));
     end;
     FC.WriteInteger(Subclave,'TOPEIZQ',F.Left);
     FC.WriteInteger(Subclave,'TOPEARR',F.Top);
     FC.CloseKey;
     FC.Free;
     FC:=Nil;
end;


Procedure RecuperarEstadoVentana(Const SubClave:String; Const F:TForm);
var N:Longint;
begin
     if FC = nil then FC:=TRegIniFile.Create(Application.Title);

     if (F.BorderStyle = bsSizeable) then
     begin N:=FC.ReadInteger(SubClave,'ANCHO',-1);
           if N<>-1 then F.Width:=N;
           N:=FC.ReadInteger(SubClave,'ALTO',-1);
           if N<>-1 then F.Height:=N;
           FC.ReadInteger(SubClave,'ESTADO',0);
           Case N of
           0: F.WindowState:=wsNormal;
           1: F.WindowState:=wsMinimized;
           2: F.WindowState:=wsMaximized;
           end;
     end;
     N:= FC.ReadInteger(Subclave,'TOPEIZQ',50);
     if N<>-1 then F.Left:=N;
     N:=FC.ReadInteger(Subclave,'TOPEARR',50);
     if N<>-1 then F.Top:=N;
     FC.CloseKey;
     FC.Free;
     FC:=nil;
end;

Function RecuperarValorRegistro(Const Clave,SubClave:String):String;
begin
     if FC = nil then FC:=TRegIniFile.Create(Application.Title);
     Result := FC.ReadString(Clave,SubClave,'Sin nombre');
     FC.CloseKey;
     FC.Free;
     FC:=nil;
end;

Function GuardarValorRegistro(Const Clave,SubClave,Valor:String):String;
begin
      if FC = nil then FC:=TRegIniFile.Create(Application.Title);
      FC.WriteString(Clave,SubClave,Valor);
      FC.CloseKey;
      FC.Free;
      FC:=nil;
end;

//******************************************************************************
//                        PROCEDIMIENTOS ESPECIALES                           \\
//******************************************************************************

Procedure EjecutarBAT(Const Nom:String);
begin
     if FileExists(ExtractFileDir(Application.ExeName)+'\'+Nom) then
        ExecuteFile(Nom,'',ExtractFileDir(Application.ExeName),SW_SHOW)
     else VerError('El archivo especificado: '+#13+
                   ExtractFileDir(Application.ExeName)+'\'+Nom+
                   '  no existe.');
end;

function ExecuteFile(const FileName, Params, DefaultDir: string; ShowCmd: Integer): THandle;
var zFileName,zCommand, zParams, zDir: array[0..79] of Char;
begin Result := ShellExecute(Application.MainForm.Handle,
 			     StrPCopy(zCommand, 'Open'),
                             StrPCopy(zFileName, FileName),
                             StrPCopy(zParams, Params),
                             StrPCopy(zDir, DefaultDir),
                             ShowCmd);
end;




//******************************************************************************
//                  PROCEDIMIENTOS DE CONTROLES DE LISTA                      \\
//******************************************************************************

Procedure CargarListaCampo(Const C:TComboBox;Const T:TDataSet;Const F:String);
begin with T do
      begin C.Clear;
            if not active then open;           first;
            while not eof do
            begin C.Items.Add(FieldByName(F).asString);
                  next;
            end;
      end;
end;

Procedure InicializarLista(Const C:TStrings;Const T:TDataSet; Const F:String);
begin with T do
      begin Abrir(T);
            first;
            while not eof do
            begin C.Add(FieldByName(F).asString);
                  next;
            end;
      end;
end;

//******************************************************************************
//                  PROCEDIMIENTOS DE SQL                                     \\
//******************************************************************************

Procedure AltaSQL(const Tabla, Campos, Valores: String; Qry: TQuery);
var
   Texto: String;
begin
     Texto := 'INSERT INTO '+Tabla+' ('+Campos+') VALUES ('+Valores+')';
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Texto);
          Prepare;
          ExecSQL;
          Close;
     end;
end;

Procedure ModifSQL(const Tabla, Asig, Cond: String; Qry: TQuery);
var
   Texto: String;
begin
     if Cond <> '' then Texto := 'UPDATE '+Tabla+' SET '+Asig+' WHERE '+Cond
     else Texto := 'UPDATE '+Tabla+' SET '+Asig;
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Texto);
          Prepare;
          ExecSQL;
          Close;
     end;
end;

Procedure BajaSQL(const Tabla, Cond: String; Qry: TQuery);
var
   Texto: String;
begin
     if Cond <> '' then Texto := 'DELETE FROM '+Tabla+' WHERE '+Cond
     else Texto := 'DELETE FROM '+Tabla;
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add(Texto);
          Prepare;
          ExecSQL;
          Close;
     end;
end;

Function DateToSQL(Fecha: TDateTime): String;
var
   A,M,D: Word;
begin
     DecodeDate(Fecha,A,M,D);
     Result := IntToStr(M)+'/'+IntToStr(D)+'/'+IntToStr(A);
end;

Procedure EmpezarTransaccion(Qry: TQuery);
begin
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add('BEGIN TRANSACTION');
          Prepare;
          ExecSQL;
          Close;
     end;
end;

Procedure HacerCommit(Qry: TQuery);
begin
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add('COMMIT TRANSACTION');
          Prepare;
          ExecSQL;
          Close;
     end;
end;

Procedure HacerRollback(Qry: TQuery);
begin
     with Qry do
     begin
          Close;
          SQL.Clear;
          SQL.Add('ROLLBACK TRANSACTION');
          Prepare;
          ExecSQL;
          Close;
     end;
end;

end.























