{*********************************************************}
{                                                         }
{                 Zeos Database Objects                   }
{          Abstract Read/Only Dataset component           }
{                                                         }
{    Copyright (c) 1999-2004 Zeos Development Group       }
{            Written by Sergey Seroukhov                  }
{                                                         }
{*********************************************************}

{*********************************************************}
{ License Agreement:                                      }
{                                                         }
{ This library is free software; you can redistribute     }
{ it and/or modify it under the terms of the GNU Lesser   }
{ General Public License as published by the Free         }
{ Software Foundation; either version 2.1 of the License, }
{ or (at your option) any later version.                  }
{                                                         }
{ This library is distributed in the hope that it will be }
{ useful, but WITHOUT ANY WARRANTY; without even the      }
{ implied warranty of MERCHANTABILITY or FITNESS FOR      }
{ A PARTICULAR PURPOSE.  See the GNU Lesser General       }
{ Public License for more details.                        }
{                                                         }
{ You should have received a copy of the GNU Lesser       }
{ General Public License along with this library; if not, }
{ write to the Free Software Foundation, Inc.,            }
{ 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA }
{                                                         }
{ The project web site is located on:                     }
{   http://www.sourceforge.net/projects/zeoslib.          }
{   http://www.zeoslib.sourceforge.net                    }
{                                                         }
{                                 Zeos Development Group. }
{*********************************************************}

unit ZAbstractRODataset;

interface

{$I ZComponent.inc}

uses
{$IFNDEF LINUX}
  Windows,
{$ENDIF}
{$IFDEF VER125BELOW}
  DBCommon,
{$ENDIF}
{$IFNDEF VER130BELOW}
  Variants,
{$ENDIF}
  SysUtils, DB, Classes, ZSysUtils, ZConnection, ZDbcIntfs, ZSqlStrings,
  ZDbcCache, ZDbcCachedResultSet, ZCompatibility, ZExpression;

type

  {** Record update type. }
  TZUpdateRecordType = TZRowUpdateType;

  {** Set of known record update types. }
  TZUpdateRecordTypes = set of TZUpdateRecordType;

  {** Options for dataset. }
  TZDatasetOption = (doOemTranslate, doCalcDefaults, doAlwaysDetailResync);

  {** Set of dataset options. }
  TZDatasetOptions = set of TZDatasetOption;

  // Forward declarations.
  TZAbstractRODataset = class;

  {** Dataset Linker class. }
  TZDataLink = class(TDataLink)
  private
    FDataset: TZAbstractRODataset;
  protected
    procedure ActiveChanged; override;
    procedure RecordChanged(Field: TField); override;
  public
    constructor Create(ADataset: TZAbstractRODataset);
  end;

  {** Abstract dataset component optimized for read/only access. }
  TZAbstractRODataset = class(TDataSet)
  private
{$IFDEF VER130BELOW}
    FUniDirectional: Boolean;
{$ENDIF}
    FCurrentRow: Integer;
    FRowAccessor: TZRowAccessor;
    FOldRowBuffer: PZRowBuffer;
    FNewRowBuffer: PZRowBuffer;
    FCurrentRows: TZSortedList;
    FFetchCount: Integer;
    FFieldsLookupTable: TIntegerDynArray;

    FFilterEnabled: Boolean;
    FFilterExpression: IZExpression;
    FFilterStack: TZExecutionStack;
    FFilterFieldRefs: TObjectDynArray;
    FInitFilterFields: Boolean;

    FRequestLive: Boolean;
    FSQL: TZSQLStrings;
    FParamCheck: Boolean;
    FParams: TParams;
    FShowRecordTypes: TZUpdateRecordTypes;
    FOptions: TZDatasetOptions;

    FProperties: TStrings;
    FConnection: TZConnection;
    FStatement: IZPreparedStatement;
    FResultSet: IZResultSet;

    FRefreshInProgress: Boolean;

    FDataLink: TDataLink;
    FMasterLink: TMasterDataLink;
    FIndexFieldNames: string;
    FIndexFields: TList;

    FSortedFields: string;
    FSortedFieldRefs: TObjectDynArray;
    FSortedFieldIndices: TIntegerDynArray;
    FSortedFieldDirs: TBooleanDynArray;
    FSortedOnlyDataFields: Boolean;
    FSortRowBuffer1: PZRowBuffer;
    FSortRowBuffer2: PZRowBuffer;
  private
    function GetReadOnly: Boolean;
    procedure SetReadOnly(Value: Boolean);
    function GetSQL: TStrings;
    procedure SetSQL(Value: TStrings);
    function GetParamCheck: Boolean;
    procedure SetParamCheck(Value: Boolean);
    procedure SetParams(Value: TParams);
    procedure SetShowRecordTypes(Value: TZUpdateRecordTypes);
    procedure SetConnection(Value: TZConnection);
    procedure SetDataSource(Value: TDataSource);
    function GetMasterFields: string;
    procedure SetMasterFields(Value: string);
    function GetMasterDataSource: TDataSource;
    procedure SetMasterDataSource(Value: TDataSource);
    function GetIndexFieldNames: string;
    procedure SetIndexFieldNames(Value: string);
    procedure SetOptions(Value: TZDatasetOptions);
    procedure SetSortedFields(Value: string);
    procedure SetProperties(const Value: TStrings);

    procedure UpdateSQLStrings(Sender: TObject);
    procedure ReadParamData(Reader: TReader);
    procedure WriteParamData(Writer: TWriter);

  protected
    procedure CheckConnected;
    procedure CheckBiDirectional;
    procedure CheckSQLQuery;
    procedure RaiseReadOnlyError;

    function FetchOneRow: Boolean;
    function FetchRows(RowCount: Integer): Boolean;
    function FilterRow(RowNo: Integer): Boolean;
    procedure RereadRows;
    procedure SetStatementParams(Statement: IZPreparedStatement;
      ParamNames: TStringDynArray; Params: TParams;
      DataLink: TDataLink); virtual;
    procedure MasterChanged(Sender: TObject);
    procedure MasterDisabled(Sender: TObject);
    procedure DoOnNewRecord; override;

    function GetDataSource: TDataSource; override;

  protected
    { Internal protected properties. }
    property RowAccessor: TZRowAccessor read FRowAccessor write FRowAccessor;
    property CurrentRow: Integer read FCurrentRow write FCurrentRow;
    property OldRowBuffer: PZRowBuffer read FOldRowBuffer write FOldRowBuffer;
    property NewRowBuffer: PZRowBuffer read FNewRowBuffer write FNewRowBuffer;
    property CurrentRows: TZSortedList read FCurrentRows write FCurrentRows;
    property FetchCount: Integer read FFetchCount write FFetchCount;
    property FieldsLookupTable: TIntegerDynArray read FFieldsLookupTable
      write FFieldsLookupTable;

    property FilterEnabled: Boolean read FFilterEnabled write FFilterEnabled;
    property FilterExpression: IZExpression read FFilterExpression
      write FFilterExpression;
    property FilterStack: TZExecutionStack read FFilterStack write FFilterStack;
    property FilterFieldRefs: TObjectDynArray read FFilterFieldRefs
      write FFilterFieldRefs;
    property InitFilterFields: Boolean read FInitFilterFields
      write FInitFilterFields;

    property Statement: IZPreparedStatement read FStatement write FStatement;
    property ResultSet: IZResultSet read FResultSet write FResultSet;

    property DataLink: TDataLink read FDataLink;
    property MasterLink: TMasterDataLink read FMasterLink;
    property IndexFields: TList read FIndexFields;

    { External protected properties. }
    property RequestLive: Boolean read FRequestLive write FRequestLive;
    property SQL: TStrings read GetSQL write SetSQL;
    property ParamCheck: Boolean read GetParamCheck write SetParamCheck;
    property Params: TParams read FParams write SetParams;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly;
    property ShowRecordTypes: TZUpdateRecordTypes read FShowRecordTypes
      write SetShowRecordTypes;
{$IFDEF VER130BELOW}
    property IsUniDirectional: Boolean read FUniDirectional
      write FUnidirectional;
{$ENDIF}
    property Properties: TStrings read FProperties write SetProperties;
    property Options: TZDatasetOptions read FOptions write SetOptions;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property MasterFields: string read GetMasterFields
      write SetMasterFields;
    property MasterSource: TDataSource read GetMasterDataSource
      write SetMasterDataSource;
    property IndexFieldNames: string read GetIndexFieldNames
      write SetIndexFieldNames;

  protected
    { Abstracts methods }
    procedure InternalAddRecord(Buffer: Pointer; Append: Boolean); override;
    procedure InternalDelete; override;
    procedure InternalPost; override;

{$IFNDEF VER125BELOW}
    procedure SetFieldData(Field: TField; Buffer: Pointer;
      NativeFormat: Boolean); override;
{$ENDIF}
    procedure SetFieldData(Field: TField; Buffer: Pointer); override;
    procedure DefineProperties(Filer: TFiler); override;

    function GetRecord(Buffer: PChar; GetMode: TGetMode; DoCheck: Boolean):
      TGetResult; override;
    function GetRecordSize: Word; override;
    function GetActiveBuffer(var RowBuffer: PZRowBuffer): Boolean;
    function AllocRecordBuffer: PChar; override;
    procedure FreeRecordBuffer(var Buffer: PChar); override;
    procedure CloseBlob(Field: TField); override;
    function CreateStatement(SQL: string; Properties: TStrings):
      IZPreparedStatement; virtual;
    function CreateResultSet(SQL: string; MaxRows: Integer):
      IZResultSet; virtual;

    procedure InternalInitFieldDefs; override;
    procedure InternalOpen; override;
    procedure InternalClose; override;
    procedure InternalFirst; override;
    procedure InternalLast; override;
    procedure InternalInitRecord(Buffer: PChar); override;
    procedure InternalGotoBookmark(Bookmark: Pointer); override;
    procedure InternalRefresh; override;
    procedure InternalHandleException; override;
    procedure InternalSetToRecord(Buffer: PChar); override;

    procedure GetBookmarkData(Buffer: PChar; Data: Pointer); override;
    function GetBookmarkFlag(Buffer: PChar): TBookmarkFlag; override;
    procedure SetBookmarkFlag(Buffer: PChar; Value: TBookmarkFlag); override;
    procedure SetBookmarkData(Buffer: PChar; Data: Pointer); override;

    function InternalLocate(KeyFields: string; KeyValues: Variant;
      Options: TLocateOptions): LongInt;
    function FindRecord(Restart, GoForward: Boolean): Boolean; override;
    procedure SetFiltered(Value: Boolean); override;
    procedure SetFilterText(const Value: string); override;

    procedure InternalSort;
    function ClearSort(Item1, Item2: Pointer): Integer;
    function HighLevelSort(Item1, Item2: Pointer): Integer;
    function LowLevelSort(Item1, Item2: Pointer): Integer;

    function GetCanModify: Boolean; override;
    function GetRecNo: Integer; override;
    function GetRecordCount: Integer; override;
    procedure MoveRecNo(Value: Integer);
    procedure SetRecNo(Value: Integer); override;
    function IsCursorOpen: Boolean; override;

    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

    procedure RefreshParams;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ExecSQL; virtual;
    function RowsAffected: LongInt;
    function ParamByName(const Value: string): TParam;

    function Locate(const KeyFields: string; const KeyValues: Variant;
      Options: TLocateOptions): Boolean; override;
    function Lookup(const KeyFields: string; const KeyValues: Variant;
      const ResultFields: string): Variant; override;
    function IsSequenced: Boolean; override;

    function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer;
      override;
    function BookmarkValid(Bookmark: TBookmark): Boolean; override;

    function GetFieldData(Field: TField; Buffer: Pointer): Boolean; override;
{$IFNDEF VER125BELOW}
    function GetFieldData(Field: TField; Buffer: Pointer;
      NativeFormat: Boolean): Boolean; override;
{$ENDIF}
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
      override;
    function UpdateStatus: TUpdateStatus; override;
    function Translate(Src, Dest: PChar; ToOem: Boolean): Integer; override;

  public
    property Active;
    property FieldDefs stored False;
    property DbcStatement: IZPreparedStatement read FStatement;
    property DbcResultSet: IZResultSet read FResultSet;

  published
    property Connection: TZConnection read FConnection write SetConnection;
    property SortedFields: string read FSortedFields write SetSortedFields;

    property AutoCalcFields;
    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
{$IFNDEF VER125BELOW}
    property BeforeRefresh;
    property AfterRefresh;
{$ENDIF}
    property BeforeScroll;
    property AfterScroll;
    property OnCalcFields;
    property OnFilterRecord;
    property Filter;
    property Filtered;
  end;

implementation

uses Math, ZVariant, ZMessages, ZDatasetUtils, ZStreamBlob, ZGenericSqlToken;

{ TZDataLink }

{**
  Creates this dataset link object.
  @param ADataset an owner linked dataset component.
}
constructor TZDataLink.Create(ADataset: TZAbstractRODataset);
begin
  inherited Create;
  FDataset := ADataset;
end;

{**
  Processes changes in state of linked dataset.
}
procedure TZDataLink.ActiveChanged;
begin
  if FDataset.Active then
    FDataset.RefreshParams;
end;

{**
  Processes changes in fields of the linked dataset.
  @param Field a field which was changed.
}
procedure TZDataLink.RecordChanged(Field: TField);
begin
  if (Field = nil) and FDataset.Active then
    FDataset.RefreshParams;
end;

{ TZAbstractRODataset }

{**
  Constructs this object and assignes the mail properties.
  @param AOwner a component owner.
}
constructor TZAbstractRODataset.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FSQL := TZSQLStrings.Create(CommonTokenizer);
  TZSQLStrings(FSQL).MultiStatements := False;
  FSQL.OnChange := UpdateSQLStrings;
  FParamCheck := True;
  FParams := TParams.Create(Self);
  FCurrentRows := TZSortedList.Create;
  BookmarkSize := SizeOf(Integer);
  FShowRecordTypes := [utModified, utInserted, utUnmodified];
  FRequestLive := False;
  FOptions := [doCalcDefaults];

  FFilterEnabled := False;
  FProperties := TStringList.Create;
  FFilterExpression := TZExpression.Create;
  FFilterExpression.Tokenizer := CommonTokenizer;
  FFilterStack := TZExecutionStack.Create;

  FDataLink := TZDataLink.Create(Self);
  FMasterLink := TMasterDataLink.Create(Self);
  FMasterLink.OnMasterChange := MasterChanged;
  FMasterLink.OnMasterDisable := MasterDisabled;
  FIndexFields := TList.Create;
end;

{**
  Destroys this object and cleanups the memory.
}
destructor TZAbstractRODataset.Destroy;
begin
  if Connection <> nil then
  begin
    try
      SetConnection(nil);
    except
    end;
  end;

  FSQL.Free;
  FParams.Free;
  FCurrentRows.Free;
  FProperties.Free;
  FFilterStack.Free;

  FDataLink.Free;
  FMasterLink.Free;
  FIndexFields.Free;

  inherited Destroy;
end;

{**
  Sets database connection object.
  @param Value a database connection object.
}
procedure TZAbstractRODataset.SetConnection(Value: TZConnection);
begin
  if FConnection <> Value then
  begin
    if Active then Close;
    Statement := nil;
    if FConnection <> nil then
      FConnection.UnregisterDataSet(Self);
    FConnection := Value;
    if FConnection <> nil then
      FConnection.RegisterDataSet(Self);
  end;
end;

{**
  Gets the SQL query.
  @return the SQL query strings.
}
function TZAbstractRODataset.GetSQL: TStrings;
begin
  Result := FSQL;
end;

{**
  Sets a new SQL query.
  @param Value a new SQL query.
}
procedure TZAbstractRODataset.SetSQL(Value: TStrings);
begin
  FSQL.Assign(Value);
end;

{**
  Gets a parameters check value.
  @return a parameters check value.
}
function TZAbstractRODataset.GetParamCheck: Boolean;
begin
  Result := FSQL.ParamCheck;
end;

{**
  Sets a new parameters check value.
  @param Value a parameters check value.
}
procedure TZAbstractRODataset.SetParamCheck(Value: Boolean);
begin
  FSQL.ParamCheck := Value;
  UpdateSQLStrings(Self);
end;

{**
  Sets a new set of parameters.
  @param Value a set of parameters.
}
procedure TZAbstractRODataset.SetParams(Value: TParams);
begin
  FParams.AssignValues(Value);
end;

{**
  Defines a persistent dataset properties.
  @param Filer a persistent manager object.
}
procedure TZAbstractRODataset.DefineProperties(Filer: TFiler);

  function WriteData: Boolean;
  begin
    if Filer.Ancestor <> nil then
      Result := not FParams.IsEqual(TZAbstractRODataset(Filer.Ancestor).FParams)
    else Result := FParams.Count > 0;
  end;

begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('ParamData', ReadParamData, WriteParamData, WriteData);
end;

{**
  Reads parameter data from persistent storage.
  @param Reader an input data stream.
}
procedure TZAbstractRODataset.ReadParamData(Reader: TReader);
begin
  Reader.ReadValue;
  Reader.ReadCollection(FParams);
end;

{**
  Writes parameter data from persistent storage.
  @param Writer an output data stream.
}
procedure TZAbstractRODataset.WriteParamData(Writer: TWriter);
begin
  Writer.WriteCollection(Params);
end;

{**
  Gets a SQL parameter by its name.
  @param Value a parameter name.
  @return a found parameter object.
}
function TZAbstractRODataset.ParamByName(const Value: string): TParam;
begin
  Result := FParams.ParamByName(Value);
end;

{**
  Updates parameters from SQL statement.
  @param Sender an event sender object.
}
procedure TZAbstractRODataset.UpdateSQLStrings(Sender: TObject);
var
  I: Integer;
  OldParams: TParams;
begin
  FieldDefs.Clear;
  if Active then
    Close
  else Statement := nil;

  OldParams := TParams.Create;
  OldParams.Assign(FParams);
  FParams.Clear;

  try
    for I := 0 to FSQL.ParamCount - 1 do
      FParams.CreateParam(ftUnknown, FSQL.ParamNames[I], ptUnknown);
    FParams.AssignValues(OldParams);
  finally
    OldParams.Free;
  end;
end;

{**
  Gets the ReadOnly property.
  @return <code>True</code> if the opened result set read only.
}
function TZAbstractRODataset.GetReadOnly: Boolean;
begin
  Result := not RequestLive;
end;

{**
  Sets a new ReadOnly property.
  @param Value <code>True</code> to set result set read-only.
}
procedure TZAbstractRODataset.SetReadOnly(Value: Boolean);
begin
  RequestLive := not Value;
end;

{**
  Sets a new visible updated records types.
  @param Value a new visible UpdateRecordTypes value.
}
procedure TZAbstractRODataset.SetShowRecordTypes(Value: TZUpdateRecordTypes);
begin
  FShowRecordTypes := Value;
  RereadRows;
end;

{**
  Checks is the database connection assignes and tries to connect.
}
procedure TZAbstractRODataset.CheckConnected;
begin
  if Connection = nil then
    DatabaseError(SConnectionIsNotAssigned);
  Connection.Connect;
end;

{**
  Checks is the database has bidirectional access.
}
procedure TZAbstractRODataset.CheckBiDirectional;
begin
  if IsUniDirectional then
    DatabaseError(SOperationIsNotAllowed1);
end;

{**
  Checks the correct SQL query.
}
procedure TZAbstractRODataset.CheckSQLQuery;
begin
  if FSQL.StatementCount < 1 then
    DatabaseError(SQueryIsEmpty);
  if FSQL.StatementCount > 1 then
    DatabaseError(SCanNotExecuteMoreQueries);
end;

{**
  Raises an error 'Operation is not allowed in read-only dataset.
}
procedure TZAbstractRODataset.RaiseReadOnlyError;
begin
  DatabaseError(SOperationIsNotAllowed2);
end;

{**
  Fetches specified number of records.
  @param RowCount a specified number of rows to be fetched.
  @return <code>True</code> if all required rows were fetched.
}
function TZAbstractRODataset.FetchRows(RowCount: Integer): Boolean;
begin
  Connection.ShowSQLHourGlass;
  try
    if RowCount = 0 then
    begin
      while FetchOneRow do;
      Result := True;
    end
    else
    begin
      while (CurrentRows.Count < RowCount) do
      begin
        if not FetchOneRow then
          Break;
      end;
      Result := CurrentRows.Count >= RowCount;
    end;
  finally
    Connection.HideSQLHourGlass;
  end;
end;

{**
  Fetches one row from the result set.
  @return <code>True</code> if record was successfully fetched.
}
function TZAbstractRODataset.FetchOneRow: Boolean;
begin
  repeat
    if (FetchCount = 0) or (ResultSet.GetRow = FetchCount)
      or ResultSet.MoveAbsolute(FetchCount) then
      Result := ResultSet.Next
    else Result := False;
    if Result then
    begin
      Inc(FFetchCount);
      if FilterRow(ResultSet.GetRow) then
        CurrentRows.Add(Pointer(ResultSet.GetRow))
      else Continue;
    end;
  until True;
end;

{**
  Checks the specified row with the all filters.
  @param RowNo a number of the row.
  @return <code>True</code> if the row sutisfy to all filters.
}
function TZAbstractRODataset.FilterRow(RowNo: Integer): Boolean;
var
  I: Integer;
  SavedRow: Integer;
  SavedRows: TZSortedList;
  SavedState: TDatasetState;
begin
  Result := True;

  { Locates the result set to the specified row. }
  if ResultSet.GetRow <> RowNo then
  begin
    if not ResultSet.MoveAbsolute(RowNo) then
      Result := False;
  end;
  if not Result then Exit;

  { Checks record by ShowRecordType }
  if ResultSet.RowUpdated then
    Result := utModified in ShowRecordTypes
  else if ResultSet.RowInserted then
    Result := utInserted in ShowRecordTypes
  else if ResultSet.RowDeleted then
    Result := utDeleted in ShowRecordTypes
  else Result := utUnmodified in ShowRecordTypes;
  if not Result then Exit;

  { Check master-detail links }
  if MasterLink.Active then
  begin
    for I := 0 to MasterLink.Fields.Count - 1 do
    begin
      if I < IndexFields.Count then
      begin
        Result := CompareKeyFields(TField(IndexFields[I]), ResultSet,
          TField(MasterLink.Fields[I]));
      end;

      if not Result then
        Break;
    end;
  end;
  if not Result then Exit;

  { Checks record by OnFilterRecord event }
  if FilterEnabled and Assigned(OnFilterRecord) then
  begin
    SavedState  := State;
    SavedRow := CurrentRow;
    SavedRows := CurrentRows;
    CurrentRows := TZSortedList.Create;
    try
      CurrentRows.Add(Pointer(RowNo));
      CurrentRow := 1;
      SetState(dsNewValue);
      OnFilterRecord(Self, Result);
    finally
      CurrentRow := SavedRow;
      CurrentRows.Free;
      CurrentRows := SavedRows;
      SetState(SavedState);
    end;
  end;
  if not Result then Exit;

  { Check the record by filter expression. }
  if FilterEnabled and (FilterExpression.Expression <> '') then
  begin
    if not InitFilterFields then
    begin
      FilterFieldRefs := DefineFilterFields(Self, FilterExpression);
      InitFilterFields := True;
    end;
    CopyDataFieldsToVars(FilterFieldRefs, ResultSet,
      FilterExpression.DefaultVariables);
    Result := FilterExpression.VariantManager.GetAsBoolean(
      FilterExpression.Evaluate4(FilterExpression.DefaultVariables,
      FilterExpression.DefaultFunctions, FilterStack));
  end;
  if not Result then Exit;
end;

{**
  Rereads all rows and applies a filter.
}
procedure TZAbstractRODataset.RereadRows;
var
  I, RowNo: Integer;
begin
  if not (State in [dsInactive]) and not IsUniDirectional then
  begin
    if (CurrentRow <= CurrentRows.Count) and (CurrentRows.Count > 0) then
      RowNo := Integer(CurrentRows[CurrentRow - 1])
    else RowNo := -1;
    CurrentRows.Clear;

    for I := 1 to FetchCount do
    begin
      if FilterRow(I) then
        CurrentRows.Add(Pointer(I));
    end;

    CurrentRow := CurrentRows.IndexOf(Pointer(RowNo)) + 1;
    CurrentRow := Min(Max(1, CurrentRow), CurrentRows.Count);

    if FSortedFields <> '' then
      InternalSort
    else Resync([]);
  end;
end;

{**
  Fill prepared statement with parameters.
  @param Statement a prepared SQL statement.
  @param ParamNames an array of parameter names.
  @param Params a collection of SQL parameters.
  @param DataLink a datalink to get parameters.
}
procedure TZAbstractRODataset.SetStatementParams(Statement: IZPreparedStatement;
  ParamNames: TStringDynArray; Params: TParams; DataLink: TDataLink);
var
  I: Integer;
  TempParam, Param: TParam;
  Stream: TStream;
  Dataset: TDataset;
  Field: TField;
begin
  if DataLink.Active then
    Dataset := DataLink.DataSet
  else Dataset := nil;

  TempParam := TParam.Create(nil);

  try
    for I := Low(ParamNames) to High(ParamNames) do
    begin
      if Assigned(Dataset) then
        Field := Dataset.FindField(ParamNames[I])
      else Field := nil;

      if Assigned(Field) then
      begin
        TempParam.AssignField(Field);
        Param := TempParam;
      end
      else
      begin
        Param := Params.FindParam(ParamNames[I]);
        if not Assigned(Param) or (Param.ParamType in [ptOutput, ptResult]) then
          Continue;
      end;

      if Param.IsNull then
        Statement.SetNull(I + 1, ConvertDatasetToDbcType(Param.DataType))
      else begin
        case Param.DataType of
          ftBoolean:
            Statement.SetBoolean(I + 1, Param.AsBoolean);
          ftSmallInt:
            Statement.SetShort(I + 1, Param.AsSmallInt);
          ftInteger, ftAutoInc:
            Statement.SetInt(I + 1, Param.AsInteger);
          ftFloat:
            Statement.SetDouble(I + 1, Param.AsFloat);
          ftLargeInt:
            Statement.SetLong(I + 1, StrToInt64(Param.AsString));
          ftCurrency:
            Statement.SetBigDecimal(I + 1, Param.AsCurrency);
          ftString:
            Statement.SetString(I + 1, Param.AsString);
          ftBytes:
            Statement.SetString(I + 1, Param.AsString);
          ftDate:
            Statement.SetDate(I + 1, Param.AsDate);
          ftTime:
            Statement.SetTime(I + 1, Param.AsTime);
          ftDateTime:
            Statement.SetTimestamp(I + 1, Param.AsDateTime);
          ftMemo:
            begin
              Stream := TStringStream.Create(Param.AsMemo);
              try
                Statement.SetAsciiStream(I + 1, Stream);
              finally
                Stream.Free;
              end;
            end;
          ftBlob, ftGraphic:
            begin
              Stream := TStringStream.Create(Param.AsBlob);
              try
                Statement.SetBinaryStream(I + 1, Stream);
              finally
                Stream.Free;
              end;
            end;
        end;
      end;
    end;
  finally
    TempParam.Free;
  end;
end;

{**
  Locates a specified record in dataset.
  @param Buffer a record buffer to put the contents of the row.
  @param GetMode a location mode.
  @param DoCheck flag to perform checking.
  @return a location result.
}
function TZAbstractRODataset.GetRecord(Buffer: PChar; GetMode: TGetMode;
  DoCheck: Boolean): TGetResult;
var
  RowNo: Integer;
begin
  Result := grOK;
  case GetMode of
    gmNext:
      begin
        if FetchRows(CurrentRow + 1) then
          CurrentRow := CurrentRow + 1
        else Result := grEOF;
      end;
    gmPrior:
      begin
        CheckBiDirectional;
        if (CurrentRow > 1) and (CurrentRows.Count > 0) then
          CurrentRow := CurrentRow - 1
        else Result := grBOF;
      end;
    gmCurrent:
      begin
        if CurrentRow < CurrentRows.Count then
          CheckBiDirectional;

        if CurrentRow = 0 then
        begin
          if CurrentRows.Count = 0 then
            FetchRows(1);
          CurrentRow := Min(CurrentRows.Count, 1);
        end
        else if not FetchRows(CurrentRow) then
          CurrentRow := Max(1, Min(CurrentRows.Count, CurrentRow));

        if CurrentRows.Count = 0 then
          Result := grError;
      end;
  end;

  if Result = grOK then
  begin
    RowNo := Integer(CurrentRows[CurrentRow - 1]);
    if ResultSet.GetRow <> RowNo then
      ResultSet.MoveAbsolute(RowNo);
    RowAccessor.RowBuffer := PZRowBuffer(Buffer);
    RowAccessor.RowBuffer^.Index := RowNo;
    FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
    FRowAccessor.RowBuffer^.BookmarkFlag := Ord(bfCurrent);
    GetCalcFields(Buffer);
  end;

  if (Result = grError) and DoCheck then
    DatabaseError(SNoMoreRecords);
end;

{**
  Gets the current record buffer depended on the current dataset state.
  @param RowBuffer a reference to the result row buffer.
  @return <code>True</code> if the buffer was defined.
}
function TZAbstractRODataset.GetActiveBuffer(var RowBuffer: PZRowBuffer):
  Boolean;
var
  RowNo: Integer;
  CachedResultSet: IZCachedResultSet;
begin
  RowBuffer := nil;
  case State of
    dsBrowse:
      if not IsEmpty then
        RowBuffer := PZRowBuffer(ActiveBuffer);
    dsEdit, dsInsert:
      RowBuffer := PZRowBuffer(ActiveBuffer);
    dsCalcFields:
      RowBuffer := PZRowBuffer(CalcBuffer);
    dsOldValue, dsNewValue, dsCurValue:
      begin
        RowNo := Integer(CurrentRows[CurrentRow - 1]);
        if RowNo <> ResultSet.GetRow then
          CheckBiDirectional;

        if State = dsOldValue then
          RowBuffer := OldRowBuffer
        else RowBuffer := NewRowBuffer;

        if RowBuffer.Index <> RowNo then
        begin
          RowAccessor.RowBuffer := RowBuffer;
          RowAccessor.Clear;
          if (ResultSet.GetRow = RowNo) or ResultSet.MoveAbsolute(RowNo) then
          begin
            if (State = dsOldValue) and (ResultSet.
              QueryInterface(IZCachedResultSet, CachedResultSet) = 0) then
              CachedResultSet.MoveToInitialRow;
            FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
            RowBuffer.Index := RowNo;
            ResultSet.MoveToCurrentRow;
          end else
            RowBuffer := nil;
        end;
      end;
  end;
  Result := RowBuffer <> nil;
end;

{$IFNDEF VER125BELOW}
function TZAbstractRODataset.GetFieldData(Field: TField; Buffer: Pointer;
  NativeFormat: Boolean): Boolean;
begin
  if Field.DataType = ftWideString then
    NativeFormat := True;
  Result := inherited GetFieldData(Field, Buffer, NativeFormat);
end;
{$ENDIF}

{**
  Retrieves the column value and stores it into the field buffer.
  @param Field an field object to be retrieved.
  @param Buffer a field value buffer.
  @return <code>True</code> if non-null value was retrieved.
}
function TZAbstractRODataset.GetFieldData(Field: TField;
  Buffer: Pointer): Boolean;
var
  ColumnIndex: Integer;
  RowBuffer: PZRowBuffer;
begin
  if GetActiveBuffer(RowBuffer) then
  begin
    ColumnIndex := DefineFieldIndex(FieldsLookupTable, Field);
    RowAccessor.RowBuffer := RowBuffer;
    if Buffer <> nil then
    begin
      case Field.DataType of
        { Processes DateTime fields. }
        ftDate, ftTime, ftDateTime:
          begin
            if Field.DataType <> ftTime then
            begin
              DateTimeToNative(Field.DataType,
                RowAccessor.GetTimestamp(ColumnIndex, Result), Buffer);
              Result := not Result;
            end
            else
            begin
              DateTimeToNative(Field.DataType,
                RowAccessor.GetTime(ColumnIndex, Result), Buffer);
              Result := not Result;
            end;
          end;
        { Processes binary array fields. }
        ftBytes:
          begin
            PVariant(Buffer)^ := BytesToVar(
              RowAccessor.GetBytes(ColumnIndex, Result));
            System.Move((PChar(RowAccessor.GetColumnData(ColumnIndex, Result)) + 2)^, Buffer^,
              RowAccessor.GetColumnDataSize(ColumnIndex)-2);
            Result := not Result;
          end;
        { Processes blob fields. }
        ftBlob, ftMemo, ftGraphic, ftFmtMemo:
          begin
            Result := not RowAccessor.GetBlob(ColumnIndex, Result).IsEmpty;
          end;
        ftWideString:
          begin
            PWideString(Buffer)^ := RowAccessor.GetUnicodeString(ColumnIndex, Result)
          end;
        { Processes all other fields. }
        else
          begin
            System.Move(RowAccessor.GetColumnData(ColumnIndex, Result)^, Buffer^,
              RowAccessor.GetColumnDataSize(ColumnIndex));
            Result := not Result;
          end;
      end;
    end
    else
    begin
      if Field.DataType in [ftBlob, ftMemo, ftGraphic, ftFmtMemo] then
        Result := not RowAccessor.GetBlob(ColumnIndex, Result).IsEmpty
      else Result := not RowAccessor.IsNull(ColumnIndex);
    end;
  end else
    Result := False;
end;

{**
  Support for widestring field
}
{$IFNDEF VER125BELOW}
procedure TZAbstractRODataset.SetFieldData(Field: TField; Buffer: Pointer;
  NativeFormat: Boolean);
begin
  if Field.DataType = ftWideString then
    NativeFormat := True;
  inherited;
end;
{$ENDIF}

{**
  Stores the column value from the field buffer.
  @param Field an field object to be stored.
  @param Buffer a field value buffer.
}
procedure TZAbstractRODataset.SetFieldData(Field: TField; Buffer: Pointer);
var
  ColumnIndex: Integer;
  RowBuffer: PZRowBuffer;
  WasNull: Boolean;
begin
  if not Active then
    DatabaseError(SOperationIsNotAllowed4);
  if not RequestLive and (Field.FieldKind = fkData) then
    RaiseReadOnlyError;

  if GetActiveBuffer(RowBuffer) then
  begin
    ColumnIndex := DefineFieldIndex(FieldsLookupTable, Field);
    RowAccessor.RowBuffer := RowBuffer;

    if State in [dsEdit, dsInsert] then
      Field.Validate(Buffer);

    if Buffer <> nil then
    begin
      { Processes DateTime fields. }
      if Field.DataType in [ftDate, ftDateTime] then
      begin
        RowAccessor.SetTimestamp(ColumnIndex, NativeToDateTime(Field.DataType,
        Buffer));
      end
      { Processes Time fields. }
      else if Field.DataType = ftTime then
      begin
        RowAccessor.SetTime(ColumnIndex, NativeToDateTime(Field.DataType,
        Buffer));
      end
      { Processes binary array fields. }
      else if Field.DataType = ftBytes then
      begin
        RowAccessor.SetBytes(ColumnIndex, VarToBytes(PVariant(Buffer)^));
      end
      { Processes widestring fields. }
      else if Field.DataType = ftWideString then
      begin
        RowAccessor.SetUnicodeString(ColumnIndex, PWideString(Buffer)^);
      end
      { Processes all other fields. }
      else
      begin
        System.Move(Buffer^, RowAccessor.GetColumnData(ColumnIndex, WasNull)^,
          RowAccessor.GetColumnDataSize(ColumnIndex));
        RowAccessor.SetNotNull(ColumnIndex);
      end;
    end else
      RowAccessor.SetNull(ColumnIndex);

    if not (State in [dsCalcFields, dsFilter, dsNewValue]) then
      DataEvent(deFieldChange, LongInt(Field));
  end else
    DatabaseError(SRowDataIsNotAvailable);

  if Field.FieldKind = fkData then
  begin
    OldRowBuffer.Index := -1;
    NewRowBuffer.Index := -1;
  end;
end;

{**
  Checks is the cursor opened.
  @return <code>True</code> if the cursor is opened.
}
function TZAbstractRODataset.IsCursorOpen: Boolean;
begin
  Result := ResultSet <> nil;
end;

{**
  Gets an affected rows by the last executed statement.
  @return a number of last updated rows.
}
function TZAbstractRODataset.RowsAffected: LongInt;
begin
  if Statement <> nil then
    Result := Statement.GetUpdateCount
  else Result := 0;
end;

{**
  Gets the size of the record buffer.
  @return the size of the record buffer.
}
function TZAbstractRODataset.GetRecordSize: Word;
begin
  Result := RowAccessor.RowSize;
end;

{**
  Allocates a buffer for new record.
  @return an allocated record buffer.
}
function TZAbstractRODataset.AllocRecordBuffer: PChar;
begin
  Result := PChar(RowAccessor.Alloc);
end;

{**
  Frees a previously allocated record buffer.
  @param Buffer a previously allocated buffer.
}
procedure TZAbstractRODataset.FreeRecordBuffer(var Buffer: PChar);
begin
  RowAccessor.DisposeBuffer(PZRowBuffer(Buffer));
end;

{**
  Executes a DML SQL statement.
}
procedure TZAbstractRODataset.ExecSQL;
begin
  Connection.ShowSQLHourGlass;
  try
    if Active then Close;

    CheckSQLQuery;
    CheckInactive;
    CheckConnected;

    if (Statement = nil) or (Statement.GetConnection.IsClosed) then
      Statement := CreateStatement(FSQL.Statements[0].SQL, Properties);

    SetStatementParams(Statement, FSQL.Statements[0].ParamNamesArray,
      FParams, FDataLink);

    Statement.ExecuteUpdatePrepared;
  finally
    Connection.HideSQLHourGlass;
  end;
end;

{**
  Performs an internal initialization of field defiitions.
}
procedure TZAbstractRODataset.InternalInitFieldDefs;
var
  I, J, Size: Integer;
  AutoInit: Boolean;
  FieldType: TFieldType;
  ResultSet: IZResultSet;
  FieldName: string;
  FName: string;
begin
  FieldDefs.Clear;
  ResultSet := Self.ResultSet;
  AutoInit := ResultSet = nil;

  try
    { Opens an internal result set if query is closed. }
    if AutoInit then
    begin
      CheckSQLQuery;
      CheckConnected;
      ResultSet := CreateResultSet(FSQL.Statements[0].SQL, 0);
    end;
    if not Assigned(ResultSet) then
      raise Exception.Create(SCanNotOpenResultSet);

    { Reads metadata from resultset. }
    with ResultSet.GetMetadata do
    begin
      for I := 1 to GetColumnCount do
      begin
        FieldType := ConvertDbcToDatasetType(GetColumnType(I));

        if FieldType in [ftString, ftWidestring, ftBytes] then
          Size := GetPrecision(I)
        else Size := 0;

        J := 0;
        FieldName := GetColumnLabel(I);
        FName := FieldName;
        while FieldDefs.IndexOf(FName) >= 0 do
        begin
          Inc(J);
          FName := Format('%s_%d', [FieldName, J]);
        end;

        with TFieldDef.Create(FieldDefs, FName, FieldType,
          Size, False, I) do
        begin
          Required := IsNullable(I) = ntNoNulls;
          if IsReadOnly(I) then
            Attributes := Attributes + [faReadonly];
          Precision := GetPrecision(I);
          DisplayName := FName;
        end;
      end;
    end;

  finally
    { Closes localy opened resultset. }
    if AutoInit then
    begin
      if ResultSet <> nil then
      begin
        ResultSet.Close;
        ResultSet := nil;
      end;
      if Statement <> nil then
      begin
        Statement.Close;
        Statement := nil;
      end;
    end;
  end;
end;

{**
  Creates a DBC statement for the query.
  @param SQL an SQL query.
  @param Properties a statement specific properties.
  @returns a created DBC statement.
}
function TZAbstractRODataset.CreateStatement(SQL: string; Properties: TStrings):
  IZPreparedStatement;
var
  Temp: TStrings;
begin
  Temp := TStringList.Create;
  try
    { Define TDataset specific parameters. }
    if doCalcDefaults in FOptions then
      Temp.Values['defaults'] := 'true'
    else Temp.Values['defaults'] := 'false';

    Result := FConnection.DbcConnection.PrepareStatementWithParams(SQL, Temp);
  finally
    Temp.Free;
  end;
end;

{**
  Creates a DBC resultset for the query.
  @param SQL an SQL query.
  @param MaxRows a maximum rows number (-1 for all).
  @returns a created DBC resultset.
}
function TZAbstractRODataset.CreateResultSet(SQL: string;
  MaxRows: Integer): IZResultSet;
begin
  Connection.ShowSQLHourGlass;
  try
    if not Assigned(Statement) then
      Statement := CreateStatement(FSQL.Statements[0].SQL, Properties);
    SetStatementParams(Statement, FSQL.Statements[0].ParamNamesArray,
      FParams, FDataLink);
    if RequestLive then
      Statement.SetResultSetConcurrency(rcUpdatable)
    else Statement.SetResultSetConcurrency(rcReadOnly);
    Statement.SetFetchDirection(fdForward);
    if IsUniDirectional then
      Statement.SetResultSetType(rtForwardOnly)
    else Statement.SetResultSetType(rtScrollInsensitive);
    if MaxRows > 0 then
      Statement.SetMaxRows(MaxRows);
    Result := Statement.ExecuteQueryPrepared;
  finally
    Connection.HideSQLHourGlass;
  end;
end;

{**
  Performs internal query opening.
}
procedure TZAbstractRODataset.InternalOpen;
var
  ColumnList: TObjectList;
begin
  CheckSQLQuery;
  CheckConnected;

  CurrentRow := 0;
  FetchCount := 0;
  CurrentRows.Clear;

  Connection.ShowSQLHourGlass;
  try
    { Creates an SQL statement and resultsets }
    ResultSet := CreateResultSet(FSQL.Statements[0].SQL, -1);

    { Initializes field and index defs. }
    InternalInitFieldDefs;
    if DefaultFields and not FRefreshInProgress then
      CreateFields;
    BindFields(True);

    { Initializes accessors and buffers. }
    ColumnList := ConvertFieldsToColumnInfo(Fields);
    try
      RowAccessor := TZRowAccessor.Create(ColumnList);
    finally
      ColumnList.Free;
    end;
    FOldRowBuffer := PZRowBuffer(AllocRecordBuffer);
    FNewRowBuffer := PZRowBuffer(AllocRecordBuffer);

    FieldsLookupTable := CreateFieldsLookupTable(Fields);
    InitFilterFields := False;

    IndexFields.Clear;
    GetFieldList(IndexFields, FIndexFieldNames);

    { Performs sorting. }
    if FSortedFields <> '' then
      InternalSort;
  finally
    Connection.HideSQLHourGlass;
  end;
end;

{**
  Performs internal query closing.
}
procedure TZAbstractRODataset.InternalClose;
begin
  if ResultSet <> nil then
    ResultSet.Close;
  ResultSet := nil;
  if Statement <> nil then
    Statement.Close;
  Statement := nil;

  if FOldRowBuffer <> nil then
    FreeRecordBuffer(PChar(FOldRowBuffer));
  FOldRowBuffer := nil;
  if FNewRowBuffer <> nil then
    FreeRecordBuffer(PChar(FNewRowBuffer));
  FNewRowBuffer := nil;

  if RowAccessor <> nil then
    RowAccessor.Free;
  RowAccessor := nil;

  { Destroy default fields }
  if DefaultFields and not FRefreshInProgress then
    DestroyFields;

  CurrentRows.Clear;
  FieldsLookupTable := nil;
end;

{**
  Performs internal go to first record.
}
procedure TZAbstractRODataset.InternalFirst;
begin
  if CurrentRow > 0 then
    CheckBiDirectional;
  CurrentRow := 0;
end;

{**
  Performs internal go to last record.
}
procedure TZAbstractRODataset.InternalLast;
begin
  FetchRows(0);
  if CurrentRows.Count > 0 then
    CurrentRow := CurrentRows.Count + 1
  else CurrentRow := 0;
end;

{**
  Processes internal exception handling.
}
procedure TZAbstractRODataset.InternalHandleException;
begin
//  Application.HandleException(Self);
end;

{**
  Gets the maximum records count.
  @return the maximum records count.
}
function TZAbstractRODataset.GetRecordCount: LongInt;
begin
  CheckActive;
  if not IsUniDirectional then
    FetchRows(0);
  Result := CurrentRows.Count;
end;

{**
  Gets the current record number.
  @return the current record number.
}
function TZAbstractRODataset.GetRecNo: Longint;
begin
  UpdateCursorPos;
  Result := CurrentRow;
end;

{**
  Moves the current record number.
  @param Value a new current record number.
}
procedure TZAbstractRODataset.MoveRecNo(Value: Integer);
var
  PreviousCurrentRow: Integer;
begin
  Value := Max(1, Value);
  if Value < CurrentRow then
    CheckBiDirectional;

  if FetchRows(Value) then
    CurrentRow := Value
  else CurrentRow := CurrentRows.Count;

  PreviousCurrentRow := CurrentRow;//Resync moves the current row away
  try
    if not (State in [dsInactive]) then Resync([]);
  finally
    CurrentRow := PreviousCurrentRow;
  end;
end;

{**
  Sets a new current record number.
  @param Value a new current record number.
}
procedure TZAbstractRODataset.SetRecNo(Value: Integer);
begin
  Value := Max(1, Value);
  if Value < CurrentRow then
    CheckBiDirectional;

  DoBeforeScroll;
  MoveRecNo(Value);
  DoAfterScroll;
end;

{**
  Defines is the query editable?
  @return <code>True</code> if the query is editable.
}
function TZAbstractRODataset.GetCanModify: Boolean;
begin
  Result := RequestLive;
end;

{**
  Gets a linked datasource.
  @returns a linked datasource.
}
function TZAbstractRODataset.GetDataSource: TDataSource;
begin
  Result := DataLink.DataSource;
end;

{**
  Sets a new linked datasource.
  @param Value a new linked datasource.
}
procedure TZAbstractRODataset.SetDataSource(Value: TDataSource);
begin
  if IsLinkedTo(Value) then
    DatabaseError(SCircularLink, Self);
  DataLink.DataSource := Value;
end;

{**
  Gets a master datasource.
  @returns a master datasource.
}
function TZAbstractRODataset.GetMasterDataSource: TDataSource;
begin
  Result := MasterLink.DataSource;
end;

{**
  Sets a new master datasource.
  @param Value a new master datasource.
}
procedure TZAbstractRODataset.SetMasterDataSource(Value: TDataSource);
begin
  if IsLinkedTo(Value) then
    DatabaseError(SCircularLink, Self);
  MasterLink.DataSource := Value;
  RereadRows;
end;

{**
  Gets master link fields.
  @returns a list with master fields.
}
function TZAbstractRODataset.GetMasterFields: string;
begin
  Result := FMasterLink.FieldNames;
end;

{**
  Sets master link fields.
  @param Value a new master link fields.
}
procedure TZAbstractRODataset.SetMasterFields(Value: string);
begin
  if FMasterLink.FieldNames <> Value then
  begin
    FMasterLink.FieldNames := Value;
    RereadRows;
  end;
end;

{**
  Processes change events from the master dataset.
  @param Sender an event sender object.
}
procedure TZAbstractRODataset.MasterChanged(Sender: TObject);
begin
  CheckBrowseMode;
  if (doAlwaysDetailResync in FOptions) or (FMasterLink.DataSet = nil)
    or not (FMasterLink.DataSet.State in [dsEdit, dsInsert]) then
    RereadRows;
end;

{**
  Processes disable events from the master dataset.
  @param Sender an event sender object.
}
procedure TZAbstractRODataset.MasterDisabled(Sender: TObject);
begin
  RereadRows;
end;

{**
  Initializes new record with master fields.
}
procedure TZAbstractRODataset.DoOnNewRecord;
var
  I: Integer;
  MasterField, DetailField: TField;
  Temp: Int64;
begin
  if MasterLink.Active and (MasterLink.Fields.Count > 0) then
  begin
    for I := 0 to MasterLink.Fields.Count - 1 do
    begin
      if I < IndexFields.Count then
      begin
        MasterField := TField(MasterLink.Fields[I]);
        DetailField := TField(IndexFields[I]);
        // Processes LargeInt fields.
        if (MasterField is TLargeIntField)
          or (DetailField is TLargeIntField) then
        begin
          if MasterField is TLargeIntField then
            Temp := TLargeIntField(MasterField).AsLargeInt
          else Temp := MasterField.AsInteger;
          if DetailField is TLargeIntField then
            TLargeIntField(DetailField).AsLargeInt := Temp
          else DetailField.AsString := IntToStr(Temp);
        end
        // Processes all other fields.
        else
          DetailField.Value := MasterField.Value;
      end;
    end;
  end;
  inherited DoOnNewRecord;
end;

{**
  Gets a list of index field names.
  @returns a list of index field names.
}
function TZAbstractRODataset.GetIndexFieldNames: string;
begin
  Result := FIndexFieldNames;
end;

{**
  Sets a new list of index field names.
  @param Value a new list of index field names.
}
procedure TZAbstractRODataset.SetIndexFieldNames(Value: string);
begin
  if FIndexFieldNames <> Value then
  begin
    FIndexFieldNames := Value;
    IndexFields.Clear;
    if State <> dsInactive then
    begin
      GetFieldList(IndexFields, FIndexFieldNames);
      RereadRows;
    end;
  end;
end;

{**
  Sets a new set of dataset options.
  @param Value a new set of dataset options.
}
procedure TZAbstractRODataset.SetOptions(Value: TZDatasetOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
  end;
end;

{**
  Sets a new sorted fields.
  @param Value a new sorted fields.
}
procedure TZAbstractRODataset.SetSortedFields(Value: string);
begin
  if FSortedFields <> Value then
  begin
    FSortedFields := Value;
    if Active then
      InternalSort;
  end;
end;

{**
  Refreshes parameters and reopens the dataset.
}
procedure TZAbstractRODataset.RefreshParams;
var
  DataSet: TDataSet;
begin
  DisableControls;
  try
    if FDataLink.DataSource <> nil then
    begin
      DataSet := FDataLink.DataSource.DataSet;
      if DataSet <> nil then
        if DataSet.Active and (DataSet.State <> dsSetKey) then
        begin
          Close;
          Open;
        end;
    end;
  finally
    EnableControls;
  end;
end;

{**
  Performs internal switch to the specified bookmark.
  @param Bookmark a specified bookmark.
}
procedure TZAbstractRODataset.InternalGotoBookmark(Bookmark: Pointer);
var
  Index: Integer;
begin
  Index := CurrentRows.IndexOf(PPointer(Bookmark)^);

  if Index < 0 then
    DatabaseError(SBookmarkWasNotFound);
  if Index < CurrentRow then
    CheckBiDirectional;

  CurrentRow := Index + 1;
end;

{**
  Performs an internal switch to the specified record.
  @param Buffer the specified row buffer.
}
procedure TZAbstractRODataset.InternalSetToRecord(Buffer: PChar);
begin
  InternalGotoBookmark(@PZRowBuffer(Buffer)^.Index);
end;

{**
  Performs an internal adding a new record.
  @param Buffer a buffer of the new adding record.
  @param Append <code>True</code> if record should be added to the end
    of the result set.
}
procedure TZAbstractRODataset.InternalAddRecord(Buffer: Pointer;
  Append: Boolean);
begin
  RaiseReadOnlyError;
end;

{**
  Performs an internal record removing.
}
procedure TZAbstractRODataset.InternalDelete;
begin
  RaiseReadOnlyError;
end;

{**
  Performs an internal post updates.
}
procedure TZAbstractRODataset.InternalPost;
begin
  RaiseReadOnlyError;
end;

{**
  Gets a bookmark flag from the specified record.
  @param Buffer a pointer to the record buffer.
  @return a bookmark flag from the specified record.
}
function TZAbstractRODataset.GetBookmarkFlag(Buffer: PChar): TBookmarkFlag;
begin
  Result := TBookmarkFlag(PZRowBuffer(Buffer)^.BookmarkFlag);
end;

{**
  Sets a new bookmark flag to the specified record.
  @param Buffer a pointer to the record buffer.
  @param Value a new bookmark flag to the specified record.
}
procedure TZAbstractRODataset.SetBookmarkFlag(Buffer: PChar;
  Value: TBookmarkFlag);
begin
  PZRowBuffer(Buffer)^.BookmarkFlag := Ord(Value);
end;

{**
  Gets bookmark value from the specified record.
  @param Buffer a pointer to the record buffer.
  @param Data a pointer to the bookmark value.
}
procedure TZAbstractRODataset.GetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PInteger(Data)^ := PZRowBuffer(Buffer)^.Index;
end;

{**
  Sets a new bookmark value from the specified record.
  @param Buffer a pointer to the record buffer.
  @param Data a pointer to the bookmark value.
}
procedure TZAbstractRODataset.SetBookmarkData(Buffer: PChar; Data: Pointer);
begin
  PZRowBuffer(Buffer)^.Index := PInteger(Data)^;
end;

{**
  Compare two specified bookmarks.
  @param Bookmark1 the first bookmark object.
  @param Bookmark2 the second bookmark object.
  @return 0 if bookmarks are equal, -1 if the first bookmark is less,
    1 if the first bookmark is greatter.
}
function TZAbstractRODataset.CompareBookmarks(Bookmark1,
  Bookmark2: TBookmark): Integer;
var
  Index1, Index2: Integer;
begin
  Result := 0;
  if not Assigned(Bookmark1) or not Assigned(Bookmark2) then
    Exit;
  Index1 := CurrentRows.IndexOf(PPointer(Bookmark1)^);
  Index2 := CurrentRows.IndexOf(PPointer(Bookmark2)^);
  if Index1 < Index2 then Result := -1
  else if Index1 > Index2 then Result := 1;
end;

{**
  Checks is the specified bookmark valid.
  @param Bookmark a bookmark object.
  @return <code>True</code> if the bookmark is valid.
}
function TZAbstractRODataset.BookmarkValid(Bookmark: TBookmark): Boolean;
var
  Index: Integer;
begin
  Result := False;
  if Active and Assigned(Bookmark) and (FResultSet <> nil) then
    try
      Index := CurrentRows.IndexOf(PPointer(Bookmark)^);
      Result := Index >= 0;
    except
      Result := False;
    end;
end;

{**
  Performs an internal initialization of record buffer.
  @param Buffer a record buffer for initialization.
}
procedure TZAbstractRODataset.InternalInitRecord(Buffer: PChar);
begin
  RowAccessor.ClearBuffer(PZRowBuffer(Buffer));
end;

{**
  Performs an internal refreshing.
}
procedure TZAbstractRODataset.InternalRefresh;
var
  RowNo: Integer;
  Found: Boolean;
  KeyFields: string;
  Temp: TZVariantDynArray;
  KeyValues: Variant;
  FieldRefs: TObjectDynArray;
  OnlyDataFields: Boolean;
begin
  FieldRefs := nil;
  if Active then
  begin
    if CurrentRow > 0 then
    begin
      RowNo := Integer(CurrentRows[CurrentRow - 1]);
      if ResultSet.GetRow <> RowNo then
        ResultSet.MoveAbsolute(RowNo);

      if Properties.Values['KeyFields'] <> '' then
        KeyFields := Properties.Values['KeyFields']
      else
        KeyFields := DefineKeyFields(Fields);
      FieldRefs := DefineFields(Self, KeyFields, OnlyDataFields);
      SetLength(Temp, Length(FieldRefs));
      RetrieveDataFieldsFromResultSet(FieldRefs, ResultSet, Temp);
      if Length(FieldRefs) = 1 then
        KeyValues := EncodeVariant(Temp[0])
      else KeyValues := EncodeVariantArray(Temp);
    end
    else
    begin
      KeyFields := '';
      KeyValues := Unassigned;
    end;

    DisableControls;
    try
      try
        FRefreshInProgress := True;
        InternalClose;
        InternalOpen;
      finally
        FRefreshInProgress := False;
      end;

      DoBeforeScroll;
      if KeyFields <> '' then
        Found := Locate(KeyFields, KeyValues, [])
      else Found := False;
    finally
      EnableControls;
    end;

    if not Found then
    begin
      DoBeforeScroll;
      DoAfterScroll;
    end;
  end;
end;

{**
  Finds the next record in a filtered query.
  @param Restart a <code>True</code> to find from the start of the query.
  @param GoForward <code>True</code> to navigate in the forward direction.
  @return <code>True</code> if a sutisfied row was found.
}
function TZAbstractRODataset.FindRecord(Restart, GoForward: Boolean): Boolean;
var
  Index: Integer;
  SavedFilterEnabled: Boolean;
begin
  { Checks the current state. }
  CheckBrowseMode;
  DoBeforeScroll;
  Result := False;

  { Defines an initial position position. }
  if Restart then
  begin
    if GoForward then
      Index := 1
    else
    begin
      FetchRows(0);
      Index := CurrentRows.Count;
    end
  end
  else
  begin
    Index := CurrentRow;
    if GoForward then
    begin
      Inc(Index);
      if Index > CurrentRows.Count then
        FetchOneRow;
    end else
      Dec(Index);
  end;

  { Finds a record. }
  SavedFilterEnabled := FilterEnabled;
  try
    FilterEnabled := True;
    while (Index >= 1) and (Index <= CurrentRows.Count) do
    begin
      if FilterRow(Index) then
      begin
        Result := True;
        Break;
      end;
      if GoForward then
      begin
        Inc(Index);
        if Index > CurrentRows.Count then
          FetchOneRow;
      end else
        Dec(Index)
    end
  finally
    FilterEnabled := SavedFilterEnabled;
  end;

  { Sets a new found position. }
  SetFound(Result);
  if Result then
  begin
    MoveRecNo(Index);
    DoAfterScroll;
  end;
end;

{**
  Sets a filtering control flag.
  @param Value <code>True</code> to turn filtering On.
}
procedure TZAbstractRODataset.SetFiltered(Value: Boolean);
begin
  if Value <> FilterEnabled then
  begin
    FilterEnabled := Value;
    inherited SetFiltered(Value);
    RereadRows;
  end;
end;

{**
  Sets a new filter expression string.
  @param Value a new filter expression.
}
procedure TZAbstractRODataset.SetFilterText(const Value: string);
begin
  inherited SetFilterText(Value);
  FilterExpression.DefaultVariables.Clear;
  FilterExpression.Expression := Value;
  InitFilterFields := False;
  if FilterEnabled then
    RereadRows;
end;

{**
  Checks is the opened resultset sequensed?
  @return <code>True</code> if the opened resultset is sequenced.
}
function TZAbstractRODataset.IsSequenced: Boolean;
begin
  Result := (not FilterEnabled);
end;

{**
  Processes component notifications.
  @param AComponent a changed component object.
  @param Operation a component operation code.
}
procedure TZAbstractRODataset.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (AComponent = FConnection) then
  begin
    Close;
    FConnection := nil;
  end;

  if (Operation = opRemove) and Assigned(FDataLink)
    and (AComponent = FDataLink.Datasource) then
    FDataLink.DataSource := nil;

  if (Operation = opRemove) and Assigned(FMasterLink)
    and (AComponent = FMasterLink.Datasource) then
  begin
    FMasterLink.DataSource := nil;
    RereadRows;
  end;
end;

{**
  Performs an internal record search.
  @param KeyFields a list of field names.
  @param KeyValues a list of field values.
  @param Options a search options.
  @return an index of found row or -1 if nothing was found.
}
function TZAbstractRODataset.InternalLocate(KeyFields: string;
  KeyValues: Variant; Options: TLocateOptions): LongInt;
var
  I, RowNo, RowCount: Integer;
  FieldRefs: TObjectDynArray;
  FieldIndices: TIntegerDynArray;
  OnlyDataFields: Boolean;
  SearchRowBuffer: PZRowBuffer;
  DecodedKeyValues: TZVariantDynArray;
  RowValues: TZVariantDynArray;
  PartialKey: Boolean;
  CaseInsensitive: Boolean;
begin
  CheckBrowseMode;
  Result := -1;
  DecodedKeyValues := nil;

  PartialKey := loPartialKey in Options;
  CaseInsensitive := loCaseInsensitive in Options;

  FieldRefs := DefineFields(Self, KeyFields, OnlyDataFields);
  FieldIndices := nil;
  if FieldRefs = nil then Exit;
  DecodedKeyValues := DecodeVariantArray(KeyValues);

  { Checks for equal field and values number }
  if Length(FieldRefs) <> Length(DecodedKeyValues) then
    DatabaseError(SIncorrectSearchFieldsNumber);
  SetLength(RowValues, Length(DecodedKeyValues));

  if not OnlyDataFields then
  begin
    { Processes fields if come calculated or lookup fields are involved. }
    SearchRowBuffer := PZRowBuffer(AllocRecordBuffer);
    try
      I := 0;
      FieldIndices := DefineFieldIndices(FieldsLookupTable, FieldRefs);
      RowCount := CurrentRows.Count;
      while True do
      begin
        while (I >= RowCount) and FetchOneRow do
          RowCount := CurrentRows.Count;
        if I >= RowCount then
          Break;

        RowNo := Integer(CurrentRows[I]);
        ResultSet.MoveAbsolute(RowNo);

        RowAccessor.RowBuffer := SearchRowBuffer;
        RowAccessor.RowBuffer^.Index := RowNo;
        FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
        GetCalcFields(PChar(SearchRowBuffer));
        RetrieveDataFieldsFromRowAccessor(
          FieldRefs, FieldIndices, RowAccessor, RowValues);

        if CompareDataFields(DecodedKeyValues, RowValues,
          PartialKey, CaseInsensitive) then
        begin
          Result := I + 1;
          Break;
        end;

        Inc(I);
      end;
    finally
      if SearchRowBuffer <> nil then
        FreeRecordBuffer(PChar(SearchRowBuffer));
    end;
  end
  else
  begin
    PrepareValuesForComparison(FieldRefs, DecodedKeyValues,
      ResultSet, PartialKey, CaseInsensitive);

    { Processes only data fields. }
    I := 0;
    RowCount := CurrentRows.Count;
    while True do
    begin
      while (I >= RowCount) and FetchOneRow do
        RowCount := CurrentRows.Count;
      if I >= RowCount then
        Break;

      RowNo := Integer(CurrentRows[I]);
      ResultSet.MoveAbsolute(RowNo);

      if CompareFieldsFromResultSet(FieldRefs, DecodedKeyValues,
        ResultSet, PartialKey, CaseInsensitive) then
      begin
        Result := I + 1;
        Break;
      end;

      Inc(I);
    end;
  end;
end;

{**
  Locates an interested record by specified search criteria.
  @param KeyFields a list of field names.
  @param KeyValues a list of field values.
  @param Options a search options.
  @return <code>True</code> if record was found or <code>False</code> otherwise.
}
function TZAbstractRODataset.Locate(const KeyFields: string;
  const KeyValues: Variant; Options: TLocateOptions): Boolean;
var
  Index: Integer;
begin
  DoBeforeScroll;
  Index := InternalLocate(KeyFields, KeyValues, Options);
  if Index > 0 then
  begin
    MoveRecNo(Index);
    DoAfterScroll;
    Result := True;
  end else
    Result := False;
  SetFound(Result);
end;

{**
  Lookups specified fields from the searched record.
  @param KeyValues a list of field names to search record.
  @param KeyValues an array of field values to search record.
  @param ResultFields a list of field names to return as a result.
  @return an array of requested field values.
}
function TZAbstractRODataset.Lookup(const KeyFields: string;
  const KeyValues: Variant; const ResultFields: string): Variant;
var
  RowNo: Integer;
  FieldRefs: TObjectDynArray;
  FieldIndices: TIntegerDynArray;
  OnlyDataFields: Boolean;
  SearchRowBuffer: PZRowBuffer;
  ResultValues: TZVariantDynArray;
begin
  Result := Null;
  RowNo := InternalLocate(KeyFields, KeyValues, []);
  FieldRefs := nil;
  FieldIndices := nil;
  if RowNo < 0 then Exit;

  { Fill result array }
  FieldRefs := DefineFields(Self, ResultFields, OnlyDataFields);
  FieldIndices := DefineFieldIndices(FieldsLookupTable, FieldRefs);
  SetLength(ResultValues, Length(FieldRefs));
  SearchRowBuffer := PZRowBuffer(AllocRecordBuffer);
  try
    RowNo := Integer(CurrentRows[RowNo - 1]);
    if ResultSet.GetRow <> RowNo then
      ResultSet.MoveAbsolute(RowNo);

    RowAccessor.RowBuffer := SearchRowBuffer;
    RowAccessor.RowBuffer^.Index := RowNo;
    FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
    GetCalcFields(PChar(SearchRowBuffer));
    RetrieveDataFieldsFromRowAccessor(
      FieldRefs, FieldIndices, RowAccessor, ResultValues);
  finally
    FreeRecordBuffer(PChar(SearchRowBuffer));
  end;

  if Length(FieldIndices) = 1 then
    Result := EncodeVariant(ResultValues[0])
  else Result := EncodeVariantArray(ResultValues);
end;

{**
  Gets the updated status for the current row.
  @return the UpdateStatus value for the current row.
}
function TZAbstractRODataset.UpdateStatus: TUpdateStatus;
var
  RowNo: Integer;
begin
  Result := usUnmodified;
  if ResultSet <> nil then
  begin
    RowNo := Integer(CurrentRows[CurrentRow - 1]);
    if ResultSet.GetRow <> RowNo then
      ResultSet.MoveAbsolute(RowNo);

    if ResultSet.RowInserted then
      Result := usInserted
    else if ResultSet.RowUpdated then
      Result := usModified
    else if ResultSet.RowDeleted then
      Result := usDeleted;
  end;
end;

{**
  Translates strings between ansi and oem character sets.
}
function TZAbstractRODataset.Translate(Src, Dest: PChar; ToOem: Boolean): Integer;
begin
  if (Src <> nil) then
  begin
    Result := StrLen(Src);
  {$IFNDEF LINUX}
    if doOemTranslate in FOptions then
    begin
      if ToOem then
        CharToOem(Src, Dest)
      else OemToChar(Src, Dest);
      Dest[Result] := #0;
    end
    else
  {$ENDIF}
    begin
      if (Src <> Dest) then
      StrCopy(Dest, Src);
    end;
  end else
    Result := 0;
end;

{**
  Creates a stream object for specified blob field.
  @param Field an interested field object.
  @param Mode a blob open mode.
  @return a created stream object.
}
function TZAbstractRODataset.CreateBlobStream(Field: TField;
  Mode: TBlobStreamMode): TStream;
var
  ColumnIndex: Integer;
  RowBuffer: PZRowBuffer;
  Blob: IZBlob;
  WasNull: Boolean;
begin
  CheckActive;

  Result := nil;
  if (Field.DataType in [ftBlob, ftMemo, ftGraphic, ftFmtMemo])
    and GetActiveBuffer(RowBuffer) then
  begin
    ColumnIndex := DefineFieldIndex(FieldsLookupTable, Field);
    RowAccessor.RowBuffer := RowBuffer;

    if Mode = bmRead then
    begin
      if Field.DataType in [ftMemo, ftFmtMemo] then
        Result := RowAccessor.GetAsciiStream(ColumnIndex, WasNull)
      else Result := RowAccessor.GetBinaryStream(ColumnIndex, WasNull);
    end
    else
    begin
      Blob := RowAccessor.GetBlob(ColumnIndex, WasNull);
      if Blob <> nil then
        Blob := Blob.Clone;
      RowAccessor.SetBlob(ColumnIndex, Blob);
      Result := TZBlobStream.Create(Field as TBlobField, Blob, Mode);
    end;
  end;
  if Result = nil then
    Result := TMemoryStream.Create;
end;

{**
  Closes the specified BLOB field.
  @param a BLOB field object.
}
procedure TZAbstractRODataset.CloseBlob(Field: TField);
begin
end;

{**
  Performs sorting of the internal rows.
}
procedure TZAbstractRODataset.InternalSort;
var
  I, RowNo: Integer;
  SavedRowBuffer: PZRowBuffer;
begin
  if (ResultSet <> nil) and not IsUniDirectional then
  begin
    FSortedFields := Trim(FSortedFields);
    DefineSortedFields(Self, FSortedFields, FSortedFieldRefs,
      FSortedFieldDirs, FSortedOnlyDataFields);

    if (CurrentRow <= CurrentRows.Count) and (CurrentRows.Count > 0)
      and (CurrentRow > 0) then
      RowNo := Integer(CurrentRows[CurrentRow - 1])
    else RowNo := -1;

    { Restores the previous order. }
    if Length(FSortedFieldRefs) = 0 then
    begin
      CurrentRows.Sort(ClearSort);
    end
    else
    begin
      FetchRows(0);
      if FSortedOnlyDataFields then
      begin
        { Converts field objects into field indices. }
        SetLength(FSortedFieldIndices, Length(FSortedFieldRefs));
        for I := 0 to High(FSortedFieldRefs) do
          FSortedFieldIndices[I] := TField(FSortedFieldRefs[I]).FieldNo;
        { Performs a sorting. }
        CurrentRows.Sort(LowLevelSort);
      end
      else
      begin
        SavedRowBuffer := RowAccessor.RowBuffer;
        { Sorts using generic highlevel approach. }
        try
          { Allocates buffers for sorting. }
          RowAccessor.AllocBuffer(FSortRowBuffer1);
          RowAccessor.AllocBuffer(FSortRowBuffer2);
          { Converts field objects into field indices. }
          SetLength(FSortedFieldIndices, Length(FSortedFieldRefs));
          for I := 0 to High(FSortedFieldRefs) do
          begin
            FSortedFieldIndices[I] := DefineFieldIndex(FieldsLookupTable,
              TField(FSortedFieldRefs[I]));
          end;
          { Performs sorting. }
          CurrentRows.Sort(HighLevelSort);
        finally
          { Disposed buffers for sorting. }
          RowAccessor.DisposeBuffer(FSortRowBuffer1);
          RowAccessor.DisposeBuffer(FSortRowBuffer2);
          RowAccessor.RowBuffer := SavedRowBuffer;
        end;
      end;
    end;

    CurrentRow := CurrentRows.IndexOf(Pointer(RowNo)) + 1;
    CurrentRow := Min(Max(0, CurrentRow), CurrentRows.Count);
    if not (State in [dsInactive]) then Resync([]);
  end;
end;

{**
  Clears list sorting and restores the previous order.
  @param Item1 a reference to the first row.
  @param Item2 a reference to the second row.
  @returns &gt;0 if Item1 &gt; Item2, &lt;0 it Item1 &lt; Item2 and 0
    if Item1 and Item2 are equal.
}
function TZAbstractRODataset.ClearSort(Item1, Item2: Pointer): Integer;
begin
  Result := Integer(Item1) - Integer(Item2);
end;

{**
  Sorting list using generic approach which is slow but may be used
  with calculated fields.

  @param Item1 a reference to the first row.
  @param Item2 a reference to the second row.
  @returns &gt;0 if Item1 &gt; Item2, &lt;0 it Item1 &lt; Item2 and 0
    if Item1 and Item2 are equal.
}
function TZAbstractRODataset.HighLevelSort(Item1, Item2: Pointer): Integer;
var
  RowNo: Integer;
begin
  { Gets the first row. }
  RowNo := Integer(Item1);
  ResultSet.MoveAbsolute(RowNo);
  RowAccessor.RowBuffer := FSortRowBuffer1;
  RowAccessor.RowBuffer^.Index := RowNo;
  FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
  FRowAccessor.RowBuffer^.BookmarkFlag := Ord(bfCurrent);
  GetCalcFields(PChar(FSortRowBuffer1));

  { Gets the second row. }
  RowNo := Integer(Item2);
  ResultSet.MoveAbsolute(RowNo);
  RowAccessor.RowBuffer := FSortRowBuffer2;
  RowAccessor.RowBuffer^.Index := RowNo;
  FetchFromResultSet(ResultSet, FieldsLookupTable, Fields, RowAccessor);
  FRowAccessor.RowBuffer^.BookmarkFlag := Ord(bfCurrent);
  GetCalcFields(PChar(FSortRowBuffer2));

  { Compare both records. }
  Result := RowAccessor.CompareBuffers(FSortRowBuffer1, FSortRowBuffer2,
    FSortedFieldIndices, FSortedFieldDirs);
end;

{**
  Sorting list using lowlevel approach which is fast but may not be used
  with calculated fields.

  @param Item1 a reference to the first row.
  @param Item2 a reference to the second row.
  @returns &gt;0 if Item1 &gt; Item2, &lt;0 it Item1 &lt; Item2 and 0
    if Item1 and Item2 are equal.
}
function TZAbstractRODataset.LowLevelSort(Item1, Item2: Pointer): Integer;
begin
  Result := ResultSet.CompareRows(Integer(Item1), Integer(Item2),
    FSortedFieldIndices, FSortedFieldDirs);
end;

{**
   Sets a new dataset properties.
   @param Value a dataset properties.
}
procedure TZAbstractRODataset.SetProperties(const Value: TStrings);
begin
  FProperties.Assign(Value);
end;

end.

