unit BlackList;

interface

uses Masks, ObjectList, DB, Classes, memTableEh;

type
  TBlackList = class(TObjectList)
  protected
    procedure CreatingTable; Override;
  public
    function ContainsURL(value: string): boolean;
  end;

const
  FIELD_NAME_C_BLACKLIST = 'C_BLACKLIST';
  FIELD_NAME_URL = 'URL';

implementation

{ TBlackList }

function TBlackList.ContainsURL(value: string): boolean;
var
  BookMark: TBookmark;
begin
  try
    BookMark := fTable.GetBookmark;
    fTable.DisableControls;
    fTable.First;

    while not fTable.Eof do
    begin
      if MatchesMask(value, fTable.FieldByName(FIELD_NAME_URL).AsString) then
      begin
        result := true;
        exit;
      end;
    end;
    fTable.BookMark := BookMark;
    fTable.EnableControls;
  finally
    result := false;
  end;
end;

procedure TBlackList.CreatingTable;
begin
  inherited;
  fTable.FieldDefs.Add(FIELD_NAME_C_BLACKLIST, ftInteger, 0);
  fTable.FieldDefs.Add(FIELD_NAME_URL, ftString, 240);
  fTable.FieldDefs.Add(FIELD_NAME_DESCRIPTION, ftString, 240);
  fTable.FieldDefs.Add(FIELD_NAME_ENABLED, ftInteger, 0);
end;

end.
