unit Foundation;

interface

uses SysUtils;

const
  DB_FILENAME = 'tourmaline.tdb';
  CURRENT_VERSION = 'v0.4 RC';

  TABLE_NAME_USERS = 'USERS';
  TABLE_NAME_BLACKLIST = 'BLACKLIST';
  TABLE_NAME_MAPLIST = 'MAPLIST';

  ERROR_STR = 'Error';
  ERROR_CREATE_SQLITE_TABLE = 'Error. Failed to create a table.';

function to_s(value: integer): string; overload;
function to_s(value: boolean): string; overload;

function to_b(value: integer): boolean; overload;

implementation

function to_s(value: integer): string;
begin
  Result := IntToStr(value);
end;

function to_s(value: boolean): string;
begin
  if value then
    Result := '1'
  else
    Result := '0';
end;

function to_b(value: integer): boolean; overload;
begin
  if (value = 0) then
    Result := false
  else
    Result := true;
end;

end.
