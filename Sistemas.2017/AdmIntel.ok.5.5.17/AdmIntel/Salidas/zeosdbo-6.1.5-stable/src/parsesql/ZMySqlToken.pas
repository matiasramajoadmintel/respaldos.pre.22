{*********************************************************}
{                                                         }
{                 Zeos Database Objects                   }
{           String tokenizing classes for MySQL           }
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

unit ZMySqlToken;

interface

{$I ZParseSql.inc}

uses
  Classes, ZClasses, ZSysUtils, ZTokenizer, ZGenericSqlToken;

type

  {** Implements a MySQL-specific number state object. }
  TZMySQLNumberState = class (TZNumberState)
  public
    function NextToken(Stream: TStream; FirstChar: Char;
      Tokenizer: TZTokenizer): TZToken; override;
  end;

  {** Implements a MySQL-specific quote string state object. }
  TZMySQLQuoteState = class (TZQuoteState)
  public
    function NextToken(Stream: TStream; FirstChar: Char;
      Tokenizer: TZTokenizer): TZToken; override;

    function EncodeString(Value: string; QuoteChar: Char): string; override;
    function DecodeString(Value: string; QuoteChar: Char): string; override;
  end;

  {**
    This state will either delegate to a comment-handling
    state, or return a token with just a slash in it.
  }
  TZMySQLCommentState = class (TZCppCommentState)
  public
    function NextToken(Stream: TStream; FirstChar: Char;
      Tokenizer: TZTokenizer): TZToken; override;
  end;

  {** Implements a symbol state object. }
  TZMySQLSymbolState = class (TZSymbolState)
  public
    constructor Create;
  end;

  {** Implements a word state object. }
  TZMySQLWordState = class (TZGenericSQLWordState)
  public
    constructor Create;
  end;

  {** Implements a default tokenizer object. }
  TZMySQLTokenizer = class (TZTokenizer)
  public
    constructor Create;
  end;

implementation

{ TZMySQLNumberState }

{**
  Return a number token from a reader.
  @return a number token from a reader
}
function TZMySQLNumberState.NextToken(Stream: TStream; FirstChar: Char;
  Tokenizer: TZTokenizer): TZToken;
var
  HexDecimal: Boolean;
  FloatPoint: Boolean;
  LastChar: Char;

  function ReadHexDigits: string;
  begin
    Result := '';
    LastChar := #0;
    while Stream.Read(LastChar, 1) > 0 do
    begin
      if LastChar in ['0'..'9','a'..'f','A'..'F'] then
      begin
        Result := Result + LastChar;
        HexDecimal := HexDecimal or (LastChar in ['a'..'f','A'..'F']);
        LastChar := #0;
      end
      else
      begin
        Stream.Seek(-1, soFromCurrent);
        Break;
      end;
    end;
  end;

  function ReadDecDigits: string;
  begin
    Result := '';
    LastChar := #0;
    while Stream.Read(LastChar, 1) > 0 do
    begin
      if LastChar in ['0'..'9'] then
      begin
        Result := Result + LastChar;
        LastChar := #0;
      end
      else
      begin
        Stream.Seek(-1, soFromCurrent);
        Break;
      end;
    end;
  end;

begin
  HexDecimal := False;
  FloatPoint := FirstChar = '.';
  Result.Value := FirstChar;
  Result.TokenType := ttUnknown;
  LastChar := #0;

  { Reads the first part of the number before decimal point }
  if not FloatPoint then
  begin
    Result.Value := Result.Value + ReadDecDigits;
    FloatPoint := (LastChar = '.') and not HexDecimal;
    if FloatPoint then
    begin
      Stream.Read(LastChar, 1);
      Result.Value := Result.Value + LastChar;
    end;
  end;

  { Reads the second part of the number after decimal point }
  if FloatPoint then
    Result.Value := Result.Value + ReadDecDigits;

  { Reads a power part of the number }
  if not HexDecimal and (LastChar in ['e','E']) then
  begin
    Stream.Read(LastChar, 1);
    Result.Value := Result.Value + LastChar;
    FloatPoint := True;

    Stream.Read(LastChar, 1);
    if LastChar in ['0'..'9','-','+'] then
      Result.Value := Result.Value + LastChar + ReadDecDigits
    else
    begin
      Result.Value := Copy(Result.Value, 1, Length(Result.Value) - 1);
      Stream.Seek(-2, soFromCurrent);
    end;
  end;

  { Reads the nexdecimal number }
  if (Result.Value = '0') and (LastChar in ['x','X']) then
  begin
    Stream.Read(LastChar, 1);
    Result.Value := Result.Value + LastChar + ReadHexDigits;
    HexDecimal := True;
  end;

  { Prepare the result }
  if Result.Value = '.' then
  begin
    if Tokenizer.SymbolState <> nil then
      Result := Tokenizer.SymbolState.NextToken(Stream, FirstChar, Tokenizer);
  end
  else
  begin
    if HexDecimal then
      Result.TokenType := ttHexDecimal
    else if FloatPoint then
      Result.TokenType := ttFloat
    else Result.TokenType := ttInteger;
  end;
end;

{ TZMySQLQuoteState }

{**
  Return a quoted string token from a reader. This method
  will collect characters until it sees a match to the
  character that the tokenizer used to switch to this state.

  @return a quoted string token from a reader
}
function TZMySQLQuoteState.NextToken(Stream: TStream; FirstChar: Char;
  Tokenizer: TZTokenizer): TZToken;
var
  ReadChar: Char;
  LastChar: Char;
begin
  Result.TokenType := ttQuoted;
  Result.Value := FirstChar;
  LastChar := #0;

  while Stream.Read(ReadChar, 1) > 0 do
  begin
    if (LastChar = FirstChar) and (ReadChar <> FirstChar) then
    begin
      Stream.Seek(-1, soFromCurrent);
      Break;
    end;
    Result.Value := Result.Value + ReadChar;
    if LastChar = '\' then
      LastChar := #0
    else if (LastChar = FirstChar) and (ReadChar = FirstChar) then
      LastChar := #0
    else LastChar := ReadChar;
  end;
end;

{**
  Encodes a string value.
  @param Value a string value to be encoded.
  @param QuoteChar a string quote character.
  @returns an encoded string.
}
function TZMySQLQuoteState.EncodeString(Value: string; QuoteChar: Char): string;
begin
  if QuoteChar in [#39, '"', '`'] then
    Result := QuoteChar + EncodeCString(Value) + QuoteChar
  else Result := Value;
end;

{**
  Decodes a string value.
  @param Value a string value to be decoded.
  @param QuoteChar a string quote character.
  @returns an decoded string.
}
function TZMySQLQuoteState.DecodeString(Value: string; QuoteChar: Char): string;
begin
  if (Length(Value) >= 2) and (QuoteChar in [#39, '"', '`'])
    and (Value[1] = QuoteChar) and (Value[Length(Value)] = QuoteChar) then
  begin
    if Length(Value) > 2 then
      Result := DecodeCString(Copy(Value, 2, Length(Value) - 2))
    else Result := '';
  end
  else Result := Value;
end;

{ TZMySQLCommentState }

{**
  Gets a MySQL specific comments like # or /* */.
  @return either just a slash token, or the results of
    delegating to a comment-handling state
}
function TZMySQLCommentState.NextToken(Stream: TStream; FirstChar: Char;
  Tokenizer: TZTokenizer): TZToken;
var
  ReadChar: Char;
  ReadNum: Integer;
begin
  Result.TokenType := ttUnknown;
  Result.Value := FirstChar;

  if FirstChar = '-' then
  begin
    ReadNum := Stream.Read(ReadChar, 1);
    if (ReadNum > 0) and (ReadChar = '-') then
    begin
      Result.TokenType := ttComment;
      Result.Value := '--' + GetSingleLineComment(Stream);
    end
    else
    begin
      if ReadNum > 0 then
        Stream.Seek(-1, soFromCurrent);
    end;
  end
  else if FirstChar = '#' then
  begin
    Result.TokenType := ttComment;
    Result.Value := '#' + GetSingleLineComment(Stream);
  end
  else if FirstChar = '/' then
  begin
    ReadNum := Stream.Read(ReadChar, 1);
    if (ReadNum > 0) and (ReadChar = '*') then
    begin
      Result.TokenType := ttComment;
      Result.Value := '/*' + GetMultiLineComment(Stream);
    end
    else
    begin
      if ReadNum > 0 then
        Stream.Seek(-1, soFromCurrent);
    end;
  end;

  if (Result.TokenType = ttUnknown) and (Tokenizer.SymbolState <> nil) then
    Result := Tokenizer.SymbolState.NextToken(Stream, FirstChar, Tokenizer);
end;

{ TZMySQLSymbolState }

{**
  Creates this MySQL-specific symbol state object.
}
constructor TZMySQLSymbolState.Create;
begin
  inherited Create;
  Add('<=');
  Add('>=');
  Add('<>');
  Add('<<');
  Add('>>');
end;

{ TZMySQLWordState }

{**
  Constructs this MySQL-specific word state object.
}
constructor TZMySQLWordState.Create;
begin
  SetWordChars(#0, #255, False);
  SetWordChars('a', 'z', True);
  SetWordChars('A', 'Z', True);
  SetWordChars('0', '9', True);
  SetWordChars('$', '$', True);
  SetWordChars('_', '_', True);
  SetWordChars(Char($c0), Char($ff), True);
end;

{ TZMySQLTokenizer }

{**
  Constructs a tokenizer with a default state table (as
  described in the class comment).
}
constructor TZMySQLTokenizer.Create;
begin
  WhitespaceState := TZWhitespaceState.Create;

  SymbolState := TZMySQLSymbolState.Create;
  NumberState := TZMySQLNumberState.Create;
  QuoteState := TZMySQLQuoteState.Create;
  WordState := TZMySQLWordState.Create;
  CommentState := TZMySQLCommentState.Create;

  SetCharacterState(#0, #255, SymbolState);
  SetCharacterState(#0, ' ', WhitespaceState);

  SetCharacterState('a', 'z', WordState);
  SetCharacterState('A', 'Z', WordState);
  SetCharacterState(Chr($c0),  Chr($ff), WordState);
  SetCharacterState('_', '_', WordState);
  SetCharacterState('$', '$', WordState);

  SetCharacterState('0', '9', NumberState);
  SetCharacterState('.', '.', NumberState);

  SetCharacterState('"', '"', QuoteState);
  SetCharacterState(#39, #39, QuoteState);
  SetCharacterState('`', '`', QuoteState);

  SetCharacterState('/', '/', CommentState);
  SetCharacterState('#', '#', CommentState);
  SetCharacterState('-', '-', CommentState);
end;

end.

