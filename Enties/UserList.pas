unit UserList;

interface

uses ObjectList, DB, Classes, memTableEh;

type
  TUserList = class(TObjectList)
  protected
    procedure CreatingTable; Override;
  public
    function ContainsIP(value: string): boolean;
    function IsEnabled(value: string): boolean;
  end;

const
  FIELD_NAME_C_USER = 'C_USER';
  FIELD_NAME_N_USER = 'N_USER';
  FIELD_NAME_IP_ADRESS = 'IP_ADRESS';

implementation

{ TUserList }

function TUserList.ContainsIP(value: string): boolean;
begin
  Result := Contains(FIELD_NAME_IP_ADRESS, value);
end;

procedure TUserList.CreatingTable;
begin
  inherited;
  FTable.FieldDefs.Add(FIELD_NAME_C_USER, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_N_USER, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_IP_ADRESS, ftString, 15);
  FTable.FieldDefs.Add(FIELD_NAME_DESCRIPTION, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_ENABLED, ftInteger, 0);
end;

function TUserList.IsEnabled(value: string): boolean;
var
  index: integer;
  BookMark: TBookmark;
begin
  try
    BookMark := FTable.GetBookmark;
    FTable.DisableControls;
    FTable.First;
    index := FTable.Lookup(FIELD_NAME_IP_ADRESS, value, FIELD_NAME_ENABLED);
    if (index = 1) then
      Result := true;
    FTable.BookMark := BookMark;
    FTable.EnableControls;
  finally
    Result := false;
  end;
end;

end.
