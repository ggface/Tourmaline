unit MapList;

interface

uses ObjectList, DB, Classes, memTableEh;

type
  TMapList = class(TObjectList)
  protected
    procedure CreatingTable; Override;
  public
  end;

const
  FIELD_NAME_C_MAPLIST = 'C_MAPLIST';
  FIELD_NAME_LOCAL_PORT = 'LOCAL_PORT';
  FIELD_NAME_REMOTE_PORT = 'REMOTE_PORT';
  FIELD_NAME_REMOTEIP = 'REMOTEIP';

implementation

{ TMapList }

procedure TMapList.CreatingTable;
begin
  inherited;
  FTable.FieldDefs.Add(FIELD_NAME_C_MAPLIST, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_LOCAL_PORT, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_REMOTE_PORT, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_REMOTEIP, ftString, 15);
  FTable.FieldDefs.Add(FIELD_NAME_DESCRIPTION, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_ENABLED, ftInteger, 0);
end;

end.
