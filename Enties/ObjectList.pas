unit ObjectList;

interface

uses SysUtils, memTableEh;

type
  TNotifyEvent = procedure(Sender: TObject) of object;

  TObjectList = class
  private
    FOnCreatingTable: TNotifyEvent;
  protected
    FTable: TMemTableEh;
    procedure CreatingTable; dynamic;
  public
    constructor Create;
    destructor Destroy;
    procedure Clear();

    property DataSet: TMemTableEh read FTable write FTable;
    property OnCreatingTable: TNotifyEvent read FOnCreatingTable
      write FOnCreatingTable;
  end;

const
  FIELD_NAME_DESCRIPTION = 'DESCRIPTION';
  FIELD_NAME_ENABLED = 'ENABLED';

implementation

{ TObjectList }

procedure TObjectList.Clear;
begin
  FTable.EmptyTable;
end;

constructor TObjectList.Create;
begin
  FTable := TMemTableEh.Create(nil);
  CreatingTable();
  FTable.CreateDataSet;
  FTable.Open;
end;

procedure TObjectList.CreatingTable;
begin
  if Assigned(FOnCreatingTable) then
    FOnCreatingTable(Self);
end;

destructor TObjectList.Destroy;
begin
  FTable.EmptyTable;
  FreeAndNil(FTable);
end;

end.
