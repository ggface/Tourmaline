unit ServerTourmaline;

interface

uses
  SysUtils, Windows, Classes, DSServer, DBXFirebird, FMTBcd, DB, SqlExpr,
  Provider, IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdCmdTCPServer, IdHTTPProxyServer, IdAntiFreezeBase,
  IdAntiFreeze, glRegistry, IdMappedPortTCP, SQLite3, SQLiteTable3,
  Blacklist, UserList, MapList, ObjectList, Foundation;

type
  TTourmaline = class(TDSServerModule)
    HTTP: TIdHTTPProxyServer;
    IdAntiFreeze1: TIdAntiFreeze;
    REG: TglRegistry;
    MapPartTCP: TIdMappedPortTCP;
    procedure HTTPBeforeCommandHandler(ASender: TIdCmdTCPServer;
      var AData: string; AContext: TIdContext);
    procedure HTTPConnect(AContext: TIdContext);
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    FBase: TSQLiteDatabase;
    FUserList: TUserList;
    FBlackList: TBlackList;
    FMapList: TMapList;
  public
    property Base: TSQLiteDatabase read FBase write FBase;
    property UserList: TUserList read FUserList write FUserList;
    property Blacklist: TBlackList read FBlackList write FBlackList;
    property MapList: TMapList read FMapList write FMapList;

    procedure FillUserList();
    procedure FillBlackList();
    procedure FillMapList();
    procedure CreateDatabase(Filename: string);
    // function ExistUrl(Query: string): boolean;
    // function ExistIP(IP: string): boolean;
  end;

implementation

uses masks;

{$R *.dfm}

var
  DBpath: string;

procedure TTourmaline.CreateDatabase(Filename: string);
begin
  FBase := TSQLiteDatabase.Create(Filename);
  try
    if not FBase.TableExists(TABLE_NAME_USERS) then
      FBase.ExecSQL('CREATE TABLE ' + TABLE_NAME_USERS + ' (' +
        FIELD_NAME_C_USER + ' INTEGER PRIMARY KEY AUTOINCREMENT,' +
        FIELD_NAME_N_USER + ' TEXT,' + FIELD_NAME_IP_ADRESS + ' TEXT,' +
        FIELD_NAME_DESCRIPTION + ' TEXT,' + FIELD_NAME_ENABLED + ' INTEGER)');
    if not FBase.TableExists(TABLE_NAME_BLACKLIST) then
      FBase.ExecSQL('CREATE TABLE ' + TABLE_NAME_BLACKLIST + ' (' +
        FIELD_NAME_C_BLACKLIST + ' INTEGER PRIMARY KEY AUTOINCREMENT,' +
        FIELD_NAME_URL + ' TEXT,' + FIELD_NAME_DESCRIPTION + ' TEXT,' +
        FIELD_NAME_ENABLED + ' INTEGER)');
    if not FBase.TableExists(TABLE_NAME_MAPLIST) then
      FBase.ExecSQL('CREATE TABLE ' + TABLE_NAME_MAPLIST + ' (' +
        FIELD_NAME_C_MAPLIST + ' INTEGER PRIMARY KEY AUTOINCREMENT,' +
        FIELD_NAME_LOCAL_PORT + ' INTEGER,' + FIELD_NAME_REMOTE_PORT +
        ' INTEGER,' + FIELD_NAME_REMOTEIP + ' TEXT,' + FIELD_NAME_DESCRIPTION +
        ' TEXT,' + FIELD_NAME_ENABLED + ' INTEGER)');
  except
    MessageBox(0, ERROR_CREATE_SQLITE_TABLE, ERROR_STR, MB_OK + MB_ICONERROR);
    Halt;
  end;
end;

procedure TTourmaline.DSServerModuleCreate(Sender: TObject);
begin
  DBpath := REG.LoadParam(HKEY_LOCAL_MACHINE, 'Database', varString).mValue;
  CreateDatabase(DBpath);
  FillUserList;
  FillBlackList;
  FillMapList;
  HTTP.DefaultPort := REG.LoadParam(HKEY_LOCAL_MACHINE, 'Port',
    varInteger).mValue;
  HTTP.Active := true;
end;

procedure TTourmaline.DSServerModuleDestroy(Sender: TObject);
begin
  HTTP.Active := false;
end;

procedure TTourmaline.FillBlackList;
var
  SQLite_table: TSQLiteTable;
begin
  SQLite_table := TSQLiteTable.Create(FBase, 'SELECT ' + FIELD_NAME_C_BLACKLIST
    + ', ' + FIELD_NAME_URL + ', ' + FIELD_NAME_DESCRIPTION + ', ' +
    FIELD_NAME_ENABLED + ' FROM ' + TABLE_NAME_BLACKLIST);

  Blacklist.DataSet.DisableControls;
  Blacklist.Clear;

  while not SQLite_table.Eof do
  begin
    Blacklist.DataSet.Append;

    Blacklist.DataSet.FieldByName(FIELD_NAME_C_BLACKLIST).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex
      [FIELD_NAME_C_BLACKLIST]);

    Blacklist.DataSet.FieldByName(FIELD_NAME_URL).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex[FIELD_NAME_URL]);

    Blacklist.DataSet.FieldByName(FIELD_NAME_DESCRIPTION).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex
      [FIELD_NAME_DESCRIPTION]);

    Blacklist.DataSet.FieldByName(FIELD_NAME_ENABLED).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex[FIELD_NAME_ENABLED]);

    Blacklist.DataSet.Post;

    SQLite_table.Next;
  end;

  Blacklist.DataSet.EnableControls;
  Blacklist.DataSet.First;
end;

procedure TTourmaline.FillMapList;
var
  SQLite_table: TSQLiteTable;
begin
  SQLite_table := TSQLiteTable.Create(FBase, 'SELECT ' + FIELD_NAME_C_MAPLIST +
    ', ' + FIELD_NAME_LOCAL_PORT + ', ' + FIELD_NAME_REMOTE_PORT + ', ' +
    FIELD_NAME_REMOTEIP + ', ' + FIELD_NAME_DESCRIPTION + ', ' +
    FIELD_NAME_ENABLED + ' FROM ' + TABLE_NAME_MAPLIST);

  MapList.DataSet.DisableControls;
  MapList.Clear;

  while not SQLite_table.Eof do
  begin
    MapList.DataSet.Append;

    MapList.DataSet.FieldByName(FIELD_NAME_C_MAPLIST).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex
      [FIELD_NAME_C_MAPLIST]);

    MapList.DataSet.FieldByName(FIELD_NAME_LOCAL_PORT).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex
      [FIELD_NAME_LOCAL_PORT]);

    MapList.DataSet.FieldByName(FIELD_NAME_REMOTE_PORT).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex
      [FIELD_NAME_REMOTE_PORT]);

    MapList.DataSet.FieldByName(FIELD_NAME_REMOTEIP).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex[FIELD_NAME_REMOTEIP]);

    MapList.DataSet.FieldByName(FIELD_NAME_DESCRIPTION).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex
      [FIELD_NAME_DESCRIPTION]);

    MapList.DataSet.FieldByName(FIELD_NAME_ENABLED).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex[FIELD_NAME_ENABLED]);

    MapList.DataSet.Post;

    SQLite_table.Next;
  end;

  MapList.DataSet.EnableControls;
  MapList.DataSet.First;
end;

procedure TTourmaline.FillUserList;
var
  SQLite_table: TSQLiteTable;
  query: string;
begin
  query := 'SELECT ' + FIELD_NAME_C_USER + ', ' + FIELD_NAME_N_USER + ', ' +
    FIELD_NAME_IP_ADRESS + ', ' + FIELD_NAME_DESCRIPTION + ', ' +
    FIELD_NAME_ENABLED + ' FROM ' + TABLE_NAME_USERS;
  SQLite_table := TSQLiteTable.Create(FBase, Ansistring(query));

  UserList.DataSet.DisableControls;
  UserList.Clear;

  while not SQLite_table.Eof do
  begin
    UserList.DataSet.Append;

    UserList.DataSet.FieldByName(FIELD_NAME_C_USER).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex[FIELD_NAME_C_USER]);

    UserList.DataSet.FieldByName(FIELD_NAME_N_USER).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex[FIELD_NAME_N_USER]);

    UserList.DataSet.FieldByName(FIELD_NAME_IP_ADRESS).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex[FIELD_NAME_IP_ADRESS]);

    UserList.DataSet.FieldByName(FIELD_NAME_DESCRIPTION).value :=
      SQLite_table.FieldAsString(SQLite_table.FieldIndex
      [FIELD_NAME_DESCRIPTION]);

    UserList.DataSet.FieldByName(FIELD_NAME_ENABLED).value :=
      SQLite_table.FieldAsInteger(SQLite_table.FieldIndex[FIELD_NAME_ENABLED]);

    UserList.DataSet.Post;

    SQLite_table.Next;
  end;

  UserList.DataSet.EnableControls;
  UserList.DataSet.First;
end;

procedure TTourmaline.HTTPBeforeCommandHandler(ASender: TIdCmdTCPServer;
  var AData: string; AContext: TIdContext);
begin
  if (Blacklist.ContainsURL(AData)) then
  begin
    AContext.Connection.IOHandler.WriteFile(ExtractFilePath(DBpath) +
      '\access_deny.html');
    AContext.Binding.CloseSocket;
  end;
end;

procedure TTourmaline.HTTPConnect(AContext: TIdContext);
begin
  if (UserList.ContainsIP(AContext.Binding.PeerIP)) then
  begin
    if not(UserList.IsEnabled(AContext.Binding.PeerIP)) then
    begin
      AContext.Connection.IOHandler.WriteFile(ExtractFilePath(DBpath) +
        '\user_access.html');
      Abort;
    end;
  end;
end;

end.
