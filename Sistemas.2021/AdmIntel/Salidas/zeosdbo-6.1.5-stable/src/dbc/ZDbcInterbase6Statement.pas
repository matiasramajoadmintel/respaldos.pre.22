{*********************************************************}
{                                                         }
{                 Zeos Database Objects                   }
{         Interbase Database Connectivity Classes         }
{                                                         }
{    Copyright (c) 1999-2003 Zeos Development Group       }
{            Written by Sergey Merkuriev                  }
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

unit ZDbcInterbase6Statement;

interface

{$I ZDbc.inc}

uses Classes, SysUtils, ZDbcIntfs, ZDbcStatement, ZDbcInterbase6,
  ZPlainInterbase6, ZDbcInterbase6Utils, ZDbcInterbase6ResultSet,
  ZPlainInterbaseDriver, ZCompatibility, ZDbcLogging, ZVariant, ZMessages;

type

  {** Implements Generic Interbase6 Statement. }
  TZInterbase6Statement = class(TZAbstractStatement)
  private
    FCachedBlob: boolean;
    FStatusVector: TARRAY_ISC_STATUS;
    FIBConnection: IZInterbase6Connection;
  protected
    procedure CheckInterbase6Error(Sql: string = '');
  public
    constructor Create(Connection: IZConnection; Info: TStrings);

    function ExecuteQuery(SQL: string): IZResultSet; override;
    function ExecuteUpdate(SQL: string): Integer; override;
    function Execute(SQL: string): Boolean; override;
  end;

  {** Implements Prepared SQL Statement. }
  TZInterbase6PreparedStatement = class(TZAbstractPreparedStatement)
  private
    FCachedBlob: boolean;
    FCursorName: string;
    FParamSQLData: IZParamsSQLDA;
    FStatusVector: TARRAY_ISC_STATUS;
    FIBConnection: IZInterbase6Connection;
  protected
    procedure CheckInterbase6Error(Sql: string = '');
  public
    constructor Create(Connection: IZConnection; SQL: string; Info: TStrings);

    function ExecuteQuery(SQL: string): IZResultSet; override;
    function ExecuteUpdate(SQL: string): Integer; override;
    function Execute(SQL: string): Boolean; override;

    function ExecuteQueryPrepared: IZResultSet; override;
    function ExecuteUpdatePrepared: Integer; override;
    function ExecutePrepared: Boolean; override;
  end;

  TZInterbase6CallableStatement = class(TZAbstractCallableStatement)
  private
    FCachedBlob: boolean;
    FCursorName: string;
    FParamSQLData: IZParamsSQLDA;
    FStatusVector: TARRAY_ISC_STATUS;
    FIBConnection: IZInterbase6Connection;
  protected
    procedure CheckInterbase6Error(Sql: string = '');
    procedure FetchOutParams(Value: IZResultSQLDA);
    function GetProcedureSql(SelectProc: boolean): string;
  public
    constructor Create(Connection: IZConnection; SQL: string; Info: TStrings);

    function ExecuteQuery(SQL: string): IZResultSet; override;
    function ExecuteUpdate(SQL: string): Integer; override;
    function Execute(SQL: string): Boolean; override;

    function ExecuteQueryPrepared: IZResultSet; override;
    function ExecuteUpdatePrepared: Integer; override;
    function ExecutePrepared: Boolean; override;
  end;

implementation

uses ZDbcCachedResultSet, ZSysUtils, ZDbcUtils;

{ TZInterbase6Statement }

{**
   Check interbase error status
   @param Sql the used sql tring
}
procedure TZInterbase6Statement.CheckInterbase6Error(Sql: string = '');
begin
  ZDbcInterbase6Utils.CheckInterbase6Error(FIBConnection.GetPlainDriver,
    FStatusVector, lcExecute, SQL);
end;


{**
  Constructs this object and assignes the main properties.
  @param Connection a database connection object.
  @param Handle a connection handle pointer.
  @param Dialect a dialect Interbase SQL must be 1 or 2 or 3.
  @param Info a statement parameters.
}
constructor TZInterbase6Statement.Create(Connection: IZConnection;
  Info: TStrings);
{$IFDEF VER125BELOW}
var
  OldRefCount: Integer;
{$ENDIF}
begin
  { Prevents destroying object in delphi 4 }
{$IFDEF VER125BELOW}
  OldRefCount := FRefCount;
  FRefCount := 100;
  try
{$ENDIF}
  inherited Create(Connection, Info);

  FIBConnection := Connection as IZInterbase6Connection;
  ResultSetType := rtScrollInsensitive;
  FCachedBlob := StrToBoolEx(DefineStatementParameter(Self, 'cashedblob', 'true'));
{$IFDEF VER125BELOW}
  finally
    FRefCount := OldRefCount;
  end;
{$ENDIF}
end;

{**
  Destroys this object and cleanups the memory.
}
{**
  Executes an SQL statement that returns a single <code>ResultSet</code> object.
  @param sql typically this is a static SQL <code>SELECT</code> statement
  @return a <code>ResultSet</code> object that contains the data produced by the
    given query; never <code>null</code>
}
{$HINTS OFF}
function TZInterbase6Statement.ExecuteQuery(SQL: string): IZResultSet;
var
  Cursor: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  StmtHandle := nil;

  with FIBConnection do
  begin
    SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);

    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, SQL, StmtHandle);

//      if not(StatementType in [stSelect, stSelectForUpdate]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
          SQL, StmtHandle, SQLData);

      GetPlainDriver.isc_dsql_execute(@FStatusVector, GetTrHandle,
        @StmtHandle, GetDialect, SQLData.GetData);
      CheckInterbase6Error(SQL);

      Cursor := RandomString(12);
      GetPlainDriver.isc_dsql_set_cursor_name(@FStatusVector,
        @StmtHandle, PChar(Cursor), 0);
      CheckInterbase6Error(SQL);

      Result := GetCachedResultSet(SQL, Self,
        TZInterbase6ResultSet.Create(Self, SQL, StmtHandle, Cursor, SQLData, nil, FCachedBlob));
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
       FreeStatement(GetPlainDriver, StmtHandle);
       raise;
      end;
    end;
  end;
end;
{$HINTS OFF}

{**
  Executes an SQL <code>INSERT</code>, <code>UPDATE</code> or
  <code>DELETE</code> statement. In addition,
  SQL statements that return nothing, such as SQL DDL statements,
  can be executed.

  @param sql an SQL <code>INSERT</code>, <code>UPDATE</code> or
    <code>DELETE</code> statement or an SQL statement that returns nothing
  @return either the row count for <code>INSERT</code>, <code>UPDATE</code>
    or <code>DELETE</code> statements, or 0 for SQL statements that return nothing
}
{$HINTS OFF}
function TZInterbase6Statement.ExecuteUpdate(SQL: string): Integer;
var
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  Result := -1;
  StmtHandle := nil;
  with FIBConnection do
  begin
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, SQL, StmtHandle);

//      if StatementType in [stExecProc, stSelect, stSelectForUpdate] then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle,
        @StmtHandle, GetDialect, nil, nil);
      CheckInterbase6Error(SQL);

      case StatementType of
        stCommit, stRollback, stUnknown: Result := -1;
        else begin
          Result := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);
          LastUpdateCount := Result;
        end;
      end;

      { Autocommit statement. }
      if Connection.GetAutoCommit then
        Connection.Commit;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    finally
      FreeStatement(GetPlainDriver, StmtHandle);
    end;
  end;
end;
{$HINTS ON}

{**
  Executes an SQL statement that may return multiple results.
  Under some (uncommon) situations a single SQL statement may return
  multiple result sets and/or update counts.  Normally you can ignore
  this unless you are (1) executing a stored procedure that you know may
  return multiple results or (2) you are dynamically executing an
  unknown SQL string.  The  methods <code>execute</code>,
  <code>getMoreResults</code>, <code>getResultSet</code>,
  and <code>getUpdateCount</code> let you navigate through multiple results.

  The <code>execute</code> method executes an SQL statement and indicates the
  form of the first result.  You can then use the methods
  <code>getResultSet</code> or <code>getUpdateCount</code>
  to retrieve the result, and <code>getMoreResults</code> to
  move to any subsequent result(s).

  @param sql any SQL statement
  @return <code>true</code> if the next result is a <code>ResultSet</code> object;
  <code>false</code> if it is an update count or there are no more results
  @see #getResultSet
  @see #getUpdateCount
  @see #getMoreResults
}
{$HINTS OFF}
function TZInterbase6Statement.Execute(SQL: string): Boolean;
var
  Cursor: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  StmtHandle := nil;
  with FIBConnection do
  begin
    try
      Result := False;
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver, GetDBHandle, GetTrHandle,
        GetDialect, SQL, StmtHandle);

      { Check statement type }
//      if not (StatementType in [stExecProc]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      { Create Result SQLData if statement returns result }
      if StatementType in [stSelect, stSelectForUpdate] then
      begin
        SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
        PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
          SQL, StmtHandle, SQLData);
      end;

      { Execute prepared statement }
      GetPlainDriver.isc_dsql_execute(@FStatusVector, GetTrHandle,
              @StmtHandle, GetDialect, nil);
      CheckInterbase6Error(Sql);
      { Set updated rows count }
      LastUpdateCount := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);

      case StatementType of
        stInsert, stDelete, stUpdate, stSelectForUpdate: Result := False;
      else
        Result := True;
      end;

      { Create ResultSet if possible else free Stateent Handle }
      if (StatementType in [stSelect, stSelectForUpdate, stExecProc])
        and (SQLData.GetFieldCount <> 0) then
      begin
        Cursor := RandomString(12);
        LastResultSet := GetCachedResultSet(SQL, Self,
          TZInterbase6ResultSet.Create(Self, SQL, StmtHandle, Cursor,
            SQLData, nil, FCachedBlob));
      end else  begin
        LastResultSet := nil;
        FreeStatement(GetPlainDriver, StmtHandle);
      end;

      { Autocommit statement. }
      if Connection.GetAutoCommit then
        Connection.Commit;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
       FreeStatement(GetPlainDriver, StmtHandle);
       raise;
      end;
    end;
  end;
end;
{$HINTS ON}

{ TZInterbase6PreparedStatement }

{**
   Check interbase error status
   @param Sql the used sql tring
}
procedure TZInterbase6PreparedStatement.CheckInterbase6Error(Sql: string);
begin
  ZDbcInterbase6Utils.CheckInterbase6Error(FIBConnection.GetPlainDriver,
    FStatusVector, lcExecute, SQL);
end;

{**
  Constructs this object and assignes the main properties.
  @param Connection a database connection object.
  @param Handle a connection handle pointer.
  @param Dialect a dialect Interbase SQL must be 1 or 2 or 3.
  @param Info a statement parameters.
}
constructor TZInterbase6PreparedStatement.Create(Connection: IZConnection;
  SQL: string; Info: TStrings);
{$IFDEF VER125BELOW}
var
  OldRefCount: Integer;
{$ENDIF}
begin
  { Prevents destroying object in delphi 4 }
{$IFDEF VER125BELOW}
  OldRefCount := FRefCount;
  FRefCount := 100;
  try
{$ENDIF}
  inherited Create(Connection, SQL, Info);

  FIBConnection := Connection as IZInterbase6Connection;
  ResultSetType := rtScrollInsensitive;
  if Assigned(Info) then
    FCursorName := Info.Values['cursor'];
  FCachedBlob := StrToBoolEx(DefineStatementParameter(Self, 'cashedblob', 'true'));
  with FIBConnection do
    FParamSQLData := TZParamsSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
{$IFDEF VER125BELOW}
  finally
    FRefCount := OldRefCount;
  end;
{$ENDIF}
end;

{**
  Executes an SQL statement that may return multiple results.
  Under some (uncommon) situations a single SQL statement may return
  multiple result sets and/or update counts.  Normally you can ignore
  this unless you are (1) executing a stored procedure that you know may
  return multiple results or (2) you are dynamically executing an
  unknown SQL string.  The  methods <code>execute</code>,
  <code>getMoreResults</code>, <code>getResultSet</code>,
  and <code>getUpdateCount</code> let you navigate through multiple results.

  The <code>execute</code> method executes an SQL statement and indicates the
  form of the first result.  You can then use the methods
  <code>getResultSet</code> or <code>getUpdateCount</code>
  to retrieve the result, and <code>getMoreResults</code> to
  move to any subsequent result(s).

  @param sql any SQL statement
  @return <code>true</code> if the next result is a <code>ResultSet</code> object;
  <code>false</code> if it is an update count or there are no more results
  @see #getResultSet
  @see #getUpdateCount
  @see #getMoreResults
}

function TZInterbase6PreparedStatement.Execute(SQL: string): Boolean;
begin
  Self.SQL := SQL;
  Result := ExecutePrepared;
end;

{**
  Executes any kind of SQL statement.
  Some prepared statements return multiple results; the <code>execute</code>
  method handles these complex statements as well as the simpler
  form of statements handled by the methods <code>executeQuery</code>
  and <code>executeUpdate</code>.
  @see Statement#execute
}
{$HINTS OFF}
function TZInterbase6PreparedStatement.ExecutePrepared: Boolean;
var
  Cursor: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  Result := False;
  StmtHandle := nil;
  with FIBConnection do
  begin
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, SQL, StmtHandle);

//      if not (StatementType in [stExecProc]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      if StatementType in [stSelect, stSelectForUpdate] then
      begin
        SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
        PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
          SQL, StmtHandle, SQLData);
      end;

      PrepareParameters(GetPlainDriver, SQL, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle, @StmtHandle,
            GetDialect, FParamSQLData.GetData, nil);
      CheckInterbase6Error(SQL);

      LastUpdateCount := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);

      case StatementType of
        stInsert, stDelete, stUpdate, stSelectForUpdate: Result := False;
      else
        Result := True;
      end;

      { Create ResultSet if possible else free Stateent Handle }
      if (StatementType in [stSelect, stSelectForUpdate, stExecProc])
        and (SQLData.GetFieldCount <> 0) then
      begin
        Cursor := RandomString(12);
        LastResultSet := GetCachedResultSet(SQL, Self,
          TZInterbase6ResultSet.Create(Self, SQL, StmtHandle, Cursor,
            SQLData, nil, FCachedBlob));
      end
      else begin
        LastResultSet := nil;
        FreeStatement(GetPlainDriver, StmtHandle);
      end;

      { Autocommit statement. }
      if Connection.GetAutoCommit then
        Connection.Commit;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
       FreeStatement(GetPlainDriver, StmtHandle);
       raise;
      end;
    end;
  end;
end;
{$HINTS ON}

{**
  Executes an SQL statement that returns a single <code>ResultSet</code> object.
  @param sql typically this is a static SQL <code>SELECT</code> statement
  @return a <code>ResultSet</code> object that contains the data produced by the
    given query; never <code>null</code>
}
function TZInterbase6PreparedStatement.ExecuteQuery(SQL: string): IZResultSet;
begin
  Self.SQL := SQL;
  Result := ExecuteQueryPrepared;
end;

{**
  Executes the SQL query in this <code>PreparedStatement</code> object
  and returns the result set generated by the query.

  @return a <code>ResultSet</code> object that contains the data produced by the
    query; never <code>null</code>
}
{$HINTS OFF}
function TZInterbase6PreparedStatement.ExecuteQueryPrepared: IZResultSet;
var
  Cursor: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  StmtHandle := nil;
  with FIBConnection do
  begin
    SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, SQL, StmtHandle);

//      if not(StatementType in [stSelect, stSelectForUpdate]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
        SQL, StmtHandle, SQLData);
      PrepareParameters(GetPlainDriver, SQL, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle, @StmtHandle,
        GetDialect, FParamSQLData.GetData, nil);
      CheckInterbase6Error(SQL);

      if FCursorName = '' then
        Cursor := RandomString(12)
      else
        Cursor := FCursorName;

      GetPlainDriver.isc_dsql_set_cursor_name(@FStatusVector,
        @StmtHandle, PChar(Cursor), 0);
      CheckInterbase6Error(SQL);

      Result := GetCachedResultSet(SQL, Self,
        TZInterbase6ResultSet.Create(Self, SQL, StmtHandle, Cursor, SQLData, nil, FCachedBlob));
      LastResultSet := Result;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
        FreeStatement(GetPlainDriver, StmtHandle);
        raise;
      end;
    end;
  end;
end;
{$HINTS ON}

{**
  Executes an SQL <code>INSERT</code>, <code>UPDATE</code> or
  <code>DELETE</code> statement. In addition,
  SQL statements that return nothing, such as SQL DDL statements,
  can be executed.

  @param sql an SQL <code>INSERT</code>, <code>UPDATE</code> or
    <code>DELETE</code> statement or an SQL statement that returns nothing
  @return either the row count for <code>INSERT</code>, <code>UPDATE</code>
    or <code>DELETE</code> statements, or 0 for SQL statements that return nothing
}
function TZInterbase6PreparedStatement.ExecuteUpdate(SQL: string): Integer;
begin
  Self.SQL := SQL;
  Result := ExecuteUpdatePrepared;
end;

{**
  Executes the SQL INSERT, UPDATE or DELETE statement
  in this <code>PreparedStatement</code> object.
  In addition,
  SQL statements that return nothing, such as SQL DDL statements,
  can be executed.

  @return either the row count for INSERT, UPDATE or DELETE statements;
  or 0 for SQL statements that return nothing
}
{$HINTS OFF}
function TZInterbase6PreparedStatement.ExecuteUpdatePrepared: Integer;
var
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  Result := -1;
  StmtHandle := nil;

  with FIBConnection do
  begin
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver, GetDBHandle,
        GetTrHandle, GetDialect, SQL, StmtHandle);

//      if StatementType in [stExecProc, stSelect, stSelectForUpdate] then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      PrepareParameters(GetPlainDriver, SQL, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute(@FStatusVector, GetTrHandle,
        @StmtHandle, GetDialect, FParamSQLData.GetData);
      CheckInterbase6Error(SQL);

      Result := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);
      LastUpdateCount := Result;

      case StatementType of
        stCommit, stRollback, stUnknown: Result := -1;
      end;

      { Autocommit statement. }
      if Connection.GetAutoCommit then
        Connection.Commit;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    finally
      FreeStatement(GetPlainDriver, StmtHandle);
    end;
  end;
end;
{$HINTS ON}


{ TZInterbase6CallableStatement }

{**
   Check interbase error status
   @param Sql the used sql tring
}
procedure TZInterbase6CallableStatement.CheckInterbase6Error(Sql: string);
begin
  ZDbcInterbase6Utils.CheckInterbase6Error(FIBConnection.GetPlainDriver,
    FStatusVector, lcExecute, SQL);
end;

{**
  Constructs this object and assignes the main properties.
  @param Connection a database connection object.
  @param Handle a connection handle pointer.
  @param Dialect a dialect Interbase SQL must be 1 or 2 or 3.
  @param Info a statement parameters.
}
constructor TZInterbase6CallableStatement.Create(Connection: IZConnection;
  SQL: string; Info: TStrings);
{$IFDEF VER125BELOW}
var
  OldRefCount: Integer;
{$ENDIF}
begin
  { Prevents destroying object in delphi 4 }
{$IFDEF VER125BELOW}
  OldRefCount := FRefCount;
  FRefCount := 100;
  try
{$ENDIF}
  inherited Create(Connection, SQL, Info);

  FIBConnection := Connection as IZInterbase6Connection;
  ResultSetType := rtScrollInsensitive;
  if Assigned(Info) then
    FCursorName := Info.Values['cursor'];
  FCachedBlob := StrToBoolEx(DefineStatementParameter(Self, 'cashedblob', 'true'));
  with FIBConnection do
    FParamSQLData := TZParamsSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
{$IFDEF VER125BELOW}
  finally
    FRefCount := OldRefCount;
  end;
{$ENDIF}
end;

{**
  Executes an SQL statement that may return multiple results.
  Under some (uncommon) situations a single SQL statement may return
  multiple result sets and/or update counts.  Normally you can ignore
  this unless you are (1) executing a stored procedure that you know may
  return multiple results or (2) you are dynamically executing an
  unknown SQL string.  The  methods <code>execute</code>,
  <code>getMoreResults</code>, <code>getResultSet</code>,
  and <code>getUpdateCount</code> let you navigate through multiple results.

  The <code>execute</code> method executes an SQL statement and indicates the
  form of the first result.  You can then use the methods
  <code>getResultSet</code> or <code>getUpdateCount</code>
  to retrieve the result, and <code>getMoreResults</code> to
  move to any subsequent result(s).

  @param sql any SQL statement
  @return <code>true</code> if the next result is a <code>ResultSet</code> object;
  <code>false</code> if it is an update count or there are no more results
  @see #getResultSet
  @see #getUpdateCount
  @see #getMoreResults
}

function TZInterbase6CallableStatement.Execute(SQL: string): Boolean;
begin
  Self.SQL := SQL;
  Result := ExecutePrepared;
end;

{**
  Executes any kind of SQL statement.
  Some prepared statements return multiple results; the <code>execute</code>
  method handles these complex statements as well as the simpler
  form of statements handled by the methods <code>executeQuery</code>
  and <code>executeUpdate</code>.
  @see Statement#execute
}
{$HINTS OFF}
function TZInterbase6CallableStatement.ExecutePrepared: Boolean;
var
  Cursor, ProcSql: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  Result := False;
  StmtHandle := nil;
  with FIBConnection do
  begin
    ProcSql := GetProcedureSql(False);
    SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
    try
      { Prepare statement }
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver, GetDBHandle, GetTrHandle,
        GetDialect, ProcSql, StmtHandle);
      PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
        SQL, StmtHandle, SQLData);
      PrepareParameters(GetPlainDriver, ProcSql, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle, @StmtHandle,
            GetDialect, FParamSQLData.GetData, SQLData.GetData);
      CheckInterbase6Error(SQL);

      LastUpdateCount := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);

      case StatementType of
        stInsert, stDelete, stUpdate, stSelectForUpdate: Result := False;
      else
        Result := True;
      end;

      { Create ResultSet if possible else free Stateent Handle, ResultSQlData and
        ParamSqlData }
      if StatementType in [stSelect, stSelectForUpdate] then
      begin
        Cursor := RandomString(12);
        LastResultSet := GetCachedResultSet(SQL, Self,
          TZInterbase6ResultSet.Create(Self, SQL, StmtHandle, Cursor,
            SQLData, nil, FCachedBlob));
      end else begin
        { Fetch data and fill Output params }
        FetchOutParams(SQLData);
        FreeStatement(GetPlainDriver, StmtHandle);
        LastResultSet := nil;
      end;

      { Autocommit statement. }
      if Connection.GetAutoCommit then
        Connection.Commit;
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
       FreeStatement(GetPlainDriver, StmtHandle);
       raise;
      end;
    end;
  end;
end;
{$HINTS ON}

{**
  Executes an SQL statement that returns a single <code>ResultSet</code> object.
  @param sql typically this is a static SQL <code>SELECT</code> statement
  @return a <code>ResultSet</code> object that contains the data produced by the
    given query; never <code>null</code>
}
function TZInterbase6CallableStatement.ExecuteQuery(
  SQL: string): IZResultSet;
begin
  Self.SQL := SQL;
  Result := ExecuteQueryPrepared;
end;

{**
  Executes the SQL query in this <code>PreparedStatement</code> object
  and returns the result set generated by the query.

  @return a <code>ResultSet</code> object that contains the data produced by the
    query; never <code>null</code>
}
{$HINTS OFF}
function TZInterbase6CallableStatement.ExecuteQueryPrepared: IZResultSet;
var
  Cursor: string;
  ProcSql: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  StmtHandle := nil;

  with FIBConnection do
  begin
    ProcSql := GetProcedureSql(True);
    SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, ProcSql, StmtHandle);

//      if not(StatementType in [stSelect, stSelectForUpdate]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
        SQL, StmtHandle, SQLData);
      PrepareParameters(GetPlainDriver, ProcSql, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle, @StmtHandle,
        GetDialect, FParamSQLData.GetData, nil);
      CheckInterbase6Error(ProcSql);

      if FCursorName = '' then
        Cursor := RandomString(12)
      else
        Cursor := FCursorName;

      GetPlainDriver.isc_dsql_set_cursor_name(@FStatusVector,
        @StmtHandle, PChar(Cursor), 0);
      CheckInterbase6Error(ProcSql);

      Result := GetCachedResultSet(ProcSql, Self,
        TZInterbase6ResultSet.Create(Self, ProcSql, StmtHandle, Cursor, SQLData, nil, FCachedBlob));
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      on E: Exception do begin
        FreeStatement(GetPlainDriver, StmtHandle);
        raise;
      end;
    end;
  end;
end;
{$HINTS ON}

{**
  Executes an SQL <code>INSERT</code>, <code>UPDATE</code> or
  <code>DELETE</code> statement. In addition,
  SQL statements that return nothing, such as SQL DDL statements,
  can be executed.

  @param sql an SQL <code>INSERT</code>, <code>UPDATE</code> or
    <code>DELETE</code> statement or an SQL statement that returns nothing
  @return either the row count for <code>INSERT</code>, <code>UPDATE</code>
    or <code>DELETE</code> statements, or 0 for SQL statements that return nothing
}
function TZInterbase6CallableStatement.ExecuteUpdate(SQL: string): Integer;
begin
  Self.SQL := SQL;
  Result := ExecuteUpdatePrepared;
end;

{**
  Executes the SQL INSERT, UPDATE or DELETE statement
  in this <code>PreparedStatement</code> object.
  In addition,
  SQL statements that return nothing, such as SQL DDL statements,
  can be executed.

  @return either the row count for INSERT, UPDATE or DELETE statements;
  or 0 for SQL statements that return nothing
}
function TZInterbase6CallableStatement.ExecuteUpdatePrepared: Integer;
var
  ProcSql: string;
  SQLData: IZResultSQLDA;
  StmtHandle: TISC_STMT_HANDLE;
  StatementType: TZIbSqlStatementType;
begin
  Result := -1;
  StmtHandle := nil;

  with FIBConnection do
  begin
    ProcSql := GetProcedureSql(False);
    SQLData := TZResultSQLDA.Create(GetPlainDriver, GetDBHandle, GetTrHandle);
    try
      StatementType := ZDbcInterbase6Utils.PrepareStatement(GetPlainDriver,
        GetDBHandle, GetTrHandle, GetDialect, ProcSql, StmtHandle);

//      if not (StatementType in [stSelect, stSelectForUpdate]) then
//        raise EZSQLException.Create(SStatementIsNotAllowed);

      PrepareResultSqlData(GetPlainDriver, GetDBHandle, GetDialect,
        SQL, StmtHandle, SQLData);
      PrepareParameters(GetPlainDriver, ProcSql, InParamValues, InParamTypes,
        InParamCount, GetDialect, StmtHandle, FParamSQLData);

      GetPlainDriver.isc_dsql_execute2(@FStatusVector, GetTrHandle, @StmtHandle,
        GetDialect, FParamSQLData.GetData, SQLData.GetData);
      CheckInterbase6Error(ProcSql);

      Result := GetAffectedRows(GetPlainDriver, StmtHandle, StatementType);
      LastUpdateCount := Result;
      { Fetch data and fill Output params }
      FetchOutParams(SQLData);
      { Logging SQL Command }
      DriverManager.LogMessage(lcExecute, GetPlainDriver.GetProtocol, SQL);
    except
      FreeStatement(GetPlainDriver, StmtHandle);
    end;
  end;
end;

{**
  Set output parameters values from IZResultSQLDA.
  @param Value a IZResultSQLDA object.
}
procedure TZInterbase6CallableStatement.FetchOutParams(
  Value: IZResultSQLDA);
var
  I: Integer;
  Temp: TZVariant;
begin
  for I := 0 to Value.GetFieldCount -1 do
  begin
    if Value.IsNull(I) then
      DefVarManager.SetNull(Temp)
    else
      case Value.GetFieldSqlType(I) of
      stBoolean:
        DefVarManager.SetAsBoolean(Temp, Value.GetBoolean(I));
      stByte:
        DefVarManager.SetAsInteger(Temp, Value.GetByte(I));
      stShort:
        DefVarManager.SetAsInteger(Temp, Value.GetShort(I));
      stInteger:
        DefVarManager.SetAsInteger(Temp, Value.GetInt(I));
      stLong:
        DefVarManager.SetAsInteger(Temp, Value.GetLong(I));
      stFloat:
        DefVarManager.SetAsFloat(Temp, Value.GetFloat(I));
      stDouble:
        DefVarManager.SetAsFloat(Temp, Value.GetDouble(I));
      stBigDecimal:
        DefVarManager.SetAsFloat(Temp, Value.GetBigDecimal(I));
      stString:
        DefVarManager.SetAsString(Temp, Value.GetString(I));
      stUnicodeString:
//        DefVarManager.SetAsUnicodeString(Temp, Value.GetUnicodeString(I));
        DefVarManager.SetAsUnicodeString(Temp, Value.GetString(I));
      stDate:
        DefVarManager.SetAsDateTime(Temp, Value.GetDate(I));
      stTime:
        DefVarManager.SetAsDateTime(Temp, Value.GetTime(I));
      stTimestamp:
        DefVarManager.SetAsDateTime(Temp, Value.GetTimestamp(I));
    end;
    OutParamValues[I] := Temp;
  end;
end;

{**
   Create sql string for calling stored procedure.
   @param SelectProc indicate use <b>EXECUTE PROCEDURE</b> or
    <b>SELECT</b> staement
   @return a Stored Procedure SQL string 
}
function TZInterbase6CallableStatement.GetProcedureSql(
  SelectProc: boolean): string;

  function GenerateParamsStr(Count: integer): string;
  var
    I: integer;
  begin
    for I := 0 to Count - 1 do
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + '?';
    end;
  end;

var
  InParams: string;
begin
  InParams := GenerateParamsStr(High(InParamValues) + 1);
  if InParams <> '' then
    InParams := '(' + InParams + ')';

  if SelectProc then
    Result := 'SELECT * FROM ' + SQL + InParams
  else
    Result := 'EXECUTE PROCEDURE ' + SQL + InParams;
end;

end.


