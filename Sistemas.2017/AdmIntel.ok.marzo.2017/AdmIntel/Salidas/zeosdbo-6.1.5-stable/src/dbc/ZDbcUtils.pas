{*********************************************************}
{                                                         }
{                 Zeos Database Objects                   }
{            Database Connectivity Functions              }
{                                                         }
{    Copyright (c) 1999-2003 Zeos Development Group       }
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

unit ZDbcUtils;

interface

{$I ZDbc.inc}

uses Classes, SysUtils, ZCompatibility, ZDbcIntfs, ZDbcResultSetMetadata;

{**
  Resolves a connection protocol and raises an exception with protocol
  is not supported.
  @param Url an initial database URL.
  @param SuupportedProtocols a driver's supported subprotocols.
}
function ResolveConnectionProtocol(Url: string;
  SupportedProtocols: TStringDynArray): string;

{**
  Resolves a database URL and fills the database connection parameters.
  @param Url an initial database URL.
  @param Info an initial info parameters.
  @param HostName a name of the database host.
  @param Port a port number.
  @param Database a database name.
  @param UserName a name of the database user.
  @param Password a user's password.
  @param ResutlInfo a result info parameters.
}
procedure ResolveDatabaseUrl(Url: string; Info: TStrings;
  var HostName: string; var Port: Integer; var Database: string;
  var UserName: string; var Password: string; ResultInfo: TStrings);

{**
  Checks is the convertion from one type to another type allowed.
  @param InitialType an initial data type.
  @param ResultType a result data type.
  @return <code>True</code> if convertion is allowed
    or <code>False</code> otherwise.
}
function CheckConvertion(InitialType: TZSQLType; ResultType: TZSQLType): Boolean;

{**
  Defines a name of the column type.
  @param ColumnType a type of the column.
  @return a name of the specified type.
}
function DefineColumnTypeName(ColumnType: TZSQLType): string;

{**
  Raises a copy of the given exception.
  @param E an exception to be raised.
}
procedure RaiseSQLException(E: Exception);

{**
  Copies column information objects from one object list to another one.
  @param FromList the source object list.
  @param ToList the destination object list.
}
procedure CopyColumnsInfo(FromList: TObjectList; ToList: TObjectList);

{**
  Defines a statement specific parameter.
  @param Statement a statement interface reference.
  @param ParamName a name of the parameter.
  @param Default a parameter default value.
  @return a parameter value or default if nothing was found.
}
function DefineStatementParameter(Statement: IZStatement; ParamName: string;
  Default: string): string;

implementation

uses ZMessages, ZSysUtils;

{**
  Resolves a connection protocol and raises an exception with protocol
  is not supported.
  @param Url an initial database URL.
  @param SupportedProtocols a driver's supported subprotocols.
}
function ResolveConnectionProtocol(Url: string;
  SupportedProtocols: TStringDynArray): string;
var
  I: Integer;
  Protocol: string;
  Index: Integer;
begin
  Result := '';

  Index := FirstDelimiter(':', Url);
  if Index > 0 then
    Protocol := Copy(Url, Index + 1, Length(Url) - Index)
  else Protocol := '';
  Index := FirstDelimiter(':', Protocol);
  if Index > 1 then
    Protocol := Copy(Protocol, 1, Index - 1)
  else Protocol := '';

  if Protocol = '' then
    raise EZSQLException.Create(Format(SIncorrectConnectionURL, [Url]));

  for I := Low(SupportedProtocols) to High(SupportedProtocols) do
  begin
    if SupportedProtocols[I] = Protocol then
    begin
      Result := Protocol;
      Break;
    end;
  end;

  if Result = '' then
    raise EZSQLException.Create(Format(SUnsupportedProtocol, [Protocol]));
end;

{**
  Resolves a database URL and fills the database connection parameters.
  @param Url an initial database URL.
  @param Info an initial info parameters.
  @param HostName a name of the database host.
  @param Port a port number.
  @param Database a database name.
  @param UserName a name of the database user.
  @param Password a user's password.
  @param ResutlInfo a result info parameters.
}
procedure ResolveDatabaseUrl(Url: string; Info: TStrings;
  var HostName: string; var Port: Integer; var Database: string;
  var UserName: string; var Password: string; ResultInfo: TStrings);
var
  Index: Integer;
  Temp: string;

  procedure RaiseException;
  begin
    raise EZSQLException.Create(Format(SIncorrectConnectionURL, [Url]));
  end;

begin
  { Set default values. }
  HostName := 'localhost';
  Port := 0;
  Database := '';
  UserName := '';
  Password := '';
  ResultInfo.Clear;

  Temp := Copy(Url, 6, Length(Url) - 5);
  Index := FirstDelimiter(':', Temp);
  if Index > 0 then
    Temp := Copy(Temp, Index + 1, Length(Temp) - Index)
  else RaiseException;

  { Retrieves the host name. }
  if Pos('//', Temp) = 1 then
  begin
    Delete(Temp, 1, 2);
    Index := FirstDelimiter('/:?', Temp);
    if Index = 0 then
      RaiseException;

    HostName := Copy(Temp, 1, Index - 1);
    Delete(Temp, 1, Index - 1);

    { Retrieves port }
    if Pos(':', Temp) = 1 then
    begin
      Delete(Temp, 1, 1);
      Index := FirstDelimiter('/?', Temp);
      if Index = 0 then
        RaiseException;

      Port := StrToInt(Copy(Temp, 1, Index - 1));
      Delete(Temp, 1, Index - 1);
    end;

    if Pos('/', Temp) <> 1 then
      RaiseException;
    Delete(Temp, 1, 1);
  end;

  { Retrieves database }
  Index := FirstDelimiter('?', Temp);
  if Index > 0 then
  begin
    Database := Copy(Temp, 1, Index - 1);
    Delete(Temp, 1, Index);
    PutSplitString(ResultInfo, Temp, ';');
  end else
    Database := Temp;

  if Info <> nil then
    ResultInfo.AddStrings(Info);

  { Defines user name }
  UserName := ResultInfo.Values['UID'];
  if UserName = '' then
    UserName := ResultInfo.Values['username'];

  { Defines user password }
  Password := ResultInfo.Values['PWD'];
  if Password = '' then
    Password := ResultInfo.Values['password'];
end;

{**
  Checks is the convertion from one type to another type allowed.
  @param InitialType an initial data type.
  @param ResultType a result data type.
  @return <code>True</code> if convertion is allowed
    or <code>False</code> otherwise.
}
function CheckConvertion(InitialType: TZSQLType; ResultType: TZSQLType): Boolean;
begin
  case ResultType of
    stBoolean, stByte, stShort, stInteger,
    stLong, stFloat, stDouble, stBigDecimal:
      Result := InitialType in [stBoolean, stByte, stShort, stInteger,
        stLong, stFloat, stDouble, stBigDecimal, stString, stUnicodeString];
    stString, stUnicodeString:
      Result := True;
    stBytes:
      Result := InitialType in [stString, stUnicodeString, stBytes,
        stAsciiStream, stUnicodeStream, stBinaryStream];
    stTimestamp:
      Result := InitialType in [stString, stUnicodeString, stDate, stTime, stTimestamp];
    stDate:
      Result := InitialType in [stString, stUnicodeString, stDate, stTimestamp];
    stTime:
      Result := InitialType in [stString, stUnicodeString, stTime, stTimestamp];
    else
      Result := (ResultType = InitialType) and (InitialType <> stUnknown);
  end;
end;

{**
  Defines a name of the column type.
  @param ColumnType a type of the column.
  @return a name of the specified type.
}
function DefineColumnTypeName(ColumnType: TZSQLType): string;
begin
  case ColumnType of
    stBoolean:
      Result := 'Boolean';
    stByte:
      Result := 'Byte';
    stShort:
      Result := 'Short';
    stInteger:
      Result := 'Integer';
    stLong:
      Result := 'Long';
    stFloat:
      Result := 'Float';
    stDouble:
      Result := 'Double';
    stBigDecimal:
      Result := 'BigDecimal';
    stString:
      Result := 'String';
    stUnicodeString:
      Result := 'UnicodeString';
    stBytes:
      Result := 'Bytes';
    stDate:
      Result := 'Date';
    stTime:
      Result := 'Time';
    stTimestamp:
      Result := 'Timestamp';
    stAsciiStream:
      Result := 'AsciiStream';
    stUnicodeStream:
      Result := 'UnicodeStream';
    stBinaryStream:
      Result := 'BinaryStream';
    else
      Result := 'Unknown';
  end;
end;

{**
  Raises a copy of the given exception.
  @param E an exception to be raised.
}
procedure RaiseSQLException(E: Exception);
begin
  if E is EZSQLException then
  begin
    raise EZSQLException.CreateWithCode(
      (E as EZSQLException).ErrorCode, E.Message);
  end else
    raise EZSQLException.Create(E.Message);
end;

{**
  Copies column information objects from one object list to another one.
  @param FromList the source object list.
  @param ToList the destination object list.
}
procedure CopyColumnsInfo(FromList: TObjectList; ToList: TObjectList);
var
  I: Integer;
  Current: TZColumnInfo;
  ColumnInfo: TZColumnInfo;
begin
  for I := 0 to FromList.Count - 1 do
  begin
    Current := TZColumnInfo(FromList[I]);
    ColumnInfo := TZColumnInfo.Create;

    ColumnInfo.AutoIncrement := Current.AutoIncrement;
    ColumnInfo.CaseSensitive := Current.CaseSensitive;
    ColumnInfo.Searchable := Current.Searchable;
    ColumnInfo.Currency := Current.Currency;
    ColumnInfo.Nullable := Current.Nullable;
    ColumnInfo.Signed := Current.Signed;
    ColumnInfo.ColumnDisplaySize := Current.ColumnDisplaySize;
    ColumnInfo.ColumnLabel := Current.ColumnLabel;
    ColumnInfo.ColumnName := Current.ColumnName;
    ColumnInfo.SchemaName := Current.SchemaName;
    ColumnInfo.Precision := Current.Precision;
    ColumnInfo.Scale := Current.Scale;
    ColumnInfo.TableName := Current.TableName;
    ColumnInfo.CatalogName := Current.CatalogName;
    ColumnInfo.ColumnType := Current.ColumnType;
    ColumnInfo.ReadOnly := Current.ReadOnly;
    ColumnInfo.Writable := Current.Writable;
    ColumnInfo.DefinitelyWritable := Current.DefinitelyWritable;

    ToList.Add(ColumnInfo);
  end;
end;

{**
  Defines a statement specific parameter.
  @param Statement a statement interface reference.
  @param ParamName a name of the parameter.
  @param Default a parameter default value.
  @return a parameter value or default if nothing was found.
}
function DefineStatementParameter(Statement: IZStatement; ParamName: string;
  Default: string): string;
begin
  Result := Statement.GetParameters.Values[ParamName];
  if Result = '' then
    Result := Statement.GetConnection.GetParameters.Values[ParamName];
  if Result = '' then
    Result := Default;
end;

end.

