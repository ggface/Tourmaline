unit UserList;

interface

uses ObjectList, DB, Classes, memTableEh;

type
  TUserList = class(TObjectList)
  protected
    procedure CreatingTable; Override;
  public
  end;

const
  FIELD_NAME_C_USER = 'C_USER';
  FIELD_NAME_N_USER = 'N_USER';
  FIELD_NAME_IP_ADRESS = 'IP_ADRESS';

implementation

{ TUserList }

procedure TUserList.CreatingTable;
begin
  inherited;
  FTable.FieldDefs.Add(FIELD_NAME_C_USER, ftInteger, 0);
  FTable.FieldDefs.Add(FIELD_NAME_N_USER, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_IP_ADRESS, ftString, 15);
  FTable.FieldDefs.Add(FIELD_NAME_DESCRIPTION, ftString, 240);
  FTable.FieldDefs.Add(FIELD_NAME_ENABLED, ftInteger, 0);
end;

end.
