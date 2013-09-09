unit BlackList;

interface

uses ObjectList, DB, Classes, memTableEh;

type
  TBlackList = class(TObjectList)
  protected
    procedure CreatingTable; Override;
  public
  end;

const
  FIELD_NAME_C_BLACKLIST = 'C_BLACKLIST';
  FIELD_NAME_URL = 'URL';

implementation

{ TBlackList }

procedure TBlackList.CreatingTable;
begin
  inherited;
  FTable.FieldDefs.Add(FIELD_NAME_C_BLACKLIST, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_URL, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_DESCRIPTION, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_ENABLED, ftInteger, 0);
end;

end.
