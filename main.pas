unit main;

interface

uses
  IdContext, Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls,
  Forms, Dialogs, cxGraphics, dxSkinsCore, dxSkinDarkRoom,
  dxSkinsdxStatusBarPainter, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxSkinsdxBarPainter,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, cxClasses,
  cxLookAndFeels, dxSkinsForm, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxGridLevel,
  dxStatusBar, glRegistry, ExtCtrls, Menus, CoolTrayIcon,
  cxLookAndFeelPainters, glTools, SQLite3, SQLiteTable3,
  Blacklist, UserList, MapList, ObjectList, Foundation, dxSkinsDefaultPainters;

type
  TInsideView = (ivUser, ivBlackList, ivPortMapping, ivNone);

  TMainForm = class(TForm)
    GVR: TcxGridViewRepository;
    GV_Users: TcxGridDBTableView;
    gvcUsersDisplayName: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    gvcUsersIP: TcxGridDBColumn;
    gvcUsersStatus: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxBarButton4: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton7: TdxBarButton;
    Userlist_Cell_PM: TdxBarPopupMenu;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Userlist_None_PM: TdxBarPopupMenu;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    GV_BlackList: TcxGridDBTableView;
    gvcBlacklistStatus: TcxGridDBColumn;
    gvcBlacklistURL: TcxGridDBColumn;
    gvcBlacklistDescription: TcxGridDBColumn;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    Blacklist_Cell_PM: TdxBarPopupMenu;
    Blacklist_None_PM: TdxBarPopupMenu;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    GV_PortForwarding: TcxGridDBTableView;
    GV_PortForwardingColumn1: TcxGridDBColumn;
    GV_PortForwardingColumn2: TcxGridDBColumn;
    GV_PortForwardingColumn3: TcxGridDBColumn;
    GV_PortForwardingColumn4: TcxGridDBColumn;
    GV_PortForwardingColumn5: TcxGridDBColumn;
    dxBarButton16: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    glRegistry1: TglRegistry;
    Timer1: TTimer;
    PortMapping_None_PM: TdxBarPopupMenu;
    PortMapping_Cell_PM: TdxBarPopupMenu;
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    Hide1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    Skin: TdxSkinController;
    glTools1: TglTools;
    OpenDialog1: TOpenDialog;
    dsUsers: TDataSource;
    dsMaplist: TDataSource;
    dsBlackList: TDataSource;
    gvcUsersDescription: TcxGridDBColumn;
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure GV_UsersCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure GV_BlackListCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarButton15Click(Sender: TObject);
    procedure dxBarButton17Click(Sender: TObject);
    procedure dxBarButton18Click(Sender: TObject);
    procedure dxBarButton19Click(Sender: TObject);
    procedure GV_PortForwardingCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton16Click(Sender: TObject);
    procedure dxBarButton20Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton21Click(Sender: TObject);
    procedure dxBarButton22Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure CoolTrayIcon1MinimizeToTray(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure gvcBlacklistStatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure gvcUsersStatusGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GV_PortForwardingColumn1GetDisplayText
      (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure FormDestroy(Sender: TObject);
  private
    FBase: TSQLiteDatabase;
    FUserList: TUserList;
    FBlackList: TBlackList;
    FMapList: TMapList;
    procedure WMEndSession(var Msg: TWMEndSession); message WM_ENDSESSION;
    procedure WMQueryEndSession(var Msg: TMessage); message WM_QUERYENDSESSION;
  public
    property Base: TSQLiteDatabase read FBase write FBase;
    property UserList: TUserList read FUserList write FUserList;
    property Blacklist: TBlackList read FBlackList write FBlackList;
    property MapList: TMapList read FMapList write FMapList;

    procedure SetView(ViewState: TInsideView; Force: Boolean);
    procedure CreateDatabase(Filename: string);
    procedure MakeLink();
    procedure FillUserList();
    procedure FillBlackList();
    procedure FillMapList();
  end;

var
  MainForm: TMainForm;
  TotalClient: integer;
  PP: string;
  CS, PrevCS: TInsideView;
  bForceClose: Boolean;

implementation

uses ed.user, ed.Blacklist, ed.portmapping, about;

{$R *.dfm}

procedure TMainForm.CoolTrayIcon1DblClick(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TMainForm.CoolTrayIcon1MinimizeToTray(Sender: TObject);
begin
  CoolTrayIcon1.HideTaskbarIcon;
end;

procedure TMainForm.CreateDatabase(Filename: string);
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

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
  ED_Blacklist.IsEdit := false;
  ED_Blacklist.ShowModal;
end;

procedure TMainForm.dxBarButton11Click(Sender: TObject);
begin
  ED_Blacklist.IsEdit := true;
  ED_Blacklist.teURL.Text := Blacklist.DataSet.FieldByName
    (FIELD_NAME_URL).AsString;
  ED_Blacklist.teDescription.Text := Blacklist.DataSet.FieldByName
    (FIELD_NAME_DESCRIPTION).AsString;
  ED_Blacklist.chEnabled.Checked :=
    to_b(Blacklist.DataSet.FieldByName(FIELD_NAME_ENABLED).AsInteger);
  ED_Blacklist.ShowModal;
end;

procedure TMainForm.dxBarButton12Click(Sender: TObject);
begin
  FBase.ExecSQL(Ansistring('DELETE FROM ' + TABLE_NAME_BLACKLIST + ' WHERE ' +
    FIELD_NAME_C_BLACKLIST + ' = ' + IntToStr(Blacklist.DataSet.FieldByName
    (FIELD_NAME_C_BLACKLIST).AsInteger)));
  Blacklist.DataSet.Delete;
end;

procedure TMainForm.dxBarButton14Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.dxBarButton15Click(Sender: TObject);
begin
  SetView(ivPortMapping, false);
end;

procedure TMainForm.dxBarButton16Click(Sender: TObject);
begin
  glTools1.Stop('TourmalineSrv');
  glTools1.Start('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton17Click(Sender: TObject);
begin
  ED_PortMapping.IsEdit := false;
  ED_PortMapping.ShowModal;
end;

procedure TMainForm.dxBarButton18Click(Sender: TObject);
begin
  ED_PortMapping.IsEdit := true;
  ED_PortMapping.teLocalPort.Text := MapList.DataSet.FieldByName
    (FIELD_NAME_LOCAL_PORT).AsString;
  ED_PortMapping.teRemotePort.Text := MapList.DataSet.FieldByName
    (FIELD_NAME_REMOTE_PORT).AsString;
      ED_PortMapping.teRemoteIP.Text := MapList.DataSet.FieldByName
    (FIELD_NAME_REMOTEIP).AsString;
  ED_PortMapping.teDescription.Text := MapList.DataSet.FieldByName
    (FIELD_NAME_DESCRIPTION).AsString;
  ED_PortMapping.chEnabled.Checked :=
    to_b(MapList.DataSet.FieldByName(FIELD_NAME_ENABLED).AsInteger);
  ED_PortMapping.ShowModal;
end;

procedure TMainForm.dxBarButton19Click(Sender: TObject);
begin
  FBase.ExecSQL(Ansistring('DELETE FROM ' + TABLE_NAME_MAPLIST + ' WHERE ' +
    FIELD_NAME_C_MAPLIST + ' = ' + IntToStr(MapList.DataSet.FieldByName
    (FIELD_NAME_C_MAPLIST).AsInteger)));
  MapList.DataSet.Delete;
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
begin
  glTools1.Start('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton20Click(Sender: TObject);
begin
  glTools1.Install('TourmalineService', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton21Click(Sender: TObject);
begin
  glTools1.Uninstall('TourmalineService', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton22Click(Sender: TObject);
begin
  glTools1.FullRestart('TourmalineSrv', 'TourmalineService', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton2Click(Sender: TObject);
begin
  glTools1.Stop('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
  SetView(ivUser, false);
end;

procedure TMainForm.dxBarButton5Click(Sender: TObject);
begin
  ED_User.IsEdit := true;
  ED_User.teDisplayName.Text := UserList.DataSet.FieldByName
    (FIELD_NAME_N_USER).AsString;
  ED_User.teIP.Text := UserList.DataSet.FieldByName
    (FIELD_NAME_IP_ADRESS).AsString;
  ED_User.teDescription.Text := UserList.DataSet.FieldByName
    (FIELD_NAME_DESCRIPTION).AsString;
  ED_User.chEnabled.Checked :=
    to_b(UserList.DataSet.FieldByName(FIELD_NAME_ENABLED).AsInteger);
  ED_User.ShowModal;
end;

procedure TMainForm.dxBarButton6Click(Sender: TObject);
begin
  ED_User.IsEdit := false;
  ED_User.ShowModal;
end;

procedure TMainForm.dxBarButton7Click(Sender: TObject);
begin
  FBase.ExecSQL(Ansistring('DELETE FROM ' + TABLE_NAME_USERS + ' WHERE ' +
    FIELD_NAME_C_USER + ' = ' + IntToStr(UserList.DataSet.FieldByName
    (FIELD_NAME_C_USER).AsInteger)));
  UserList.DataSet.Delete;
end;

procedure TMainForm.dxBarButton8Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.dxBarButton9Click(Sender: TObject);
begin
  SetView(ivBlackList, false);
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  bForceClose := true;
  Close;
end;

procedure TMainForm.FillBlackList;
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

procedure TMainForm.FillMapList;
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

procedure TMainForm.FillUserList;
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

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := true;
  if not bForceClose then
  begin
    CanClose := false;
    Application.Minimize;
    CoolTrayIcon1.HideMainForm;
  end
  else
    CanClose := true;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  PP := Copy(paramstr(0), 1, LastDelimiter('\:', paramstr(0)));
  CoolTrayIcon1.Icon := Application.Icon;
  CoolTrayIcon1.Behavior := bhWin95;
  CS := ivNone;
  Timer1Timer(self);
  MainForm.dxStatusBar1.Panels[0].Text := 'Port: ' +
    IntToStr(glRegistry1.LoadParam(HKEY_LOCAL_MACHINE, 'Port',
    varInteger).mValue);
  Caption := 'Tourmaline ' + CURRENT_VERSION;
  CreateDatabase(PP + DB_FILENAME);
  UserList := TUserList.Create();
  Blacklist := TBlackList.Create();
  MapList := TMapList.Create();
  MakeLink;
  SetView(ivUser, false);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FBase.ExecSQL('VACUUM;');
end;

procedure TMainForm.GV_BlackListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton11Click(self);
end;

procedure TMainForm.gvcBlacklistStatusGetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then
    AText := 'Disabled'
  else
    AText := 'Enabled';
end;

procedure TMainForm.GV_PortForwardingCellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton18Click(self);
end;

procedure TMainForm.GV_PortForwardingColumn1GetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then
    AText := 'Disabled'
  else
    AText := 'Enabled';
end;

procedure TMainForm.GV_UsersCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton5Click(self);
end;

procedure TMainForm.gvcUsersStatusGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  if AText = '0' then
    AText := 'Disabled'
  else
    AText := 'Enabled';
end;

procedure TMainForm.Hide1Click(Sender: TObject);
begin
  Application.Minimize;
  CoolTrayIcon1.HideMainForm;
end;

procedure TMainForm.MakeLink;
begin
  dsUsers.DataSet := UserList.DataSet;
  dsBlackList.DataSet := Blacklist.DataSet;
  dsMaplist.DataSet := MapList.DataSet;
end;

procedure TMainForm.Restore1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TMainForm.SetView;
begin
  // ѕроверим а нужно ли блин перерисовывать,
  // если нужный ViewState уже активен
  if not Force then
    if CS = ViewState then
      exit;
  // «апрещаем отрисовку формы
  LockWindowUpdate(MainForm.Handle);
  // ¬ырубаем все маркеры на редакторы, потом откроем выбранный
  dxBarSubItem2.Enabled := false;
  dxBarSubItem4.Enabled := false;
  dxBarSubItem5.Enabled := false;
  // ¬ыбираем что нам надо
  case ViewState of
    ivBlackList:
      begin
        FillBlackList;
        CS := ivBlackList;
        cxGrid1Level1.GridView := GV_BlackList;
        dxStatusBar1.Panels[2].Text := 'ST.: BlackList';
        dxBarSubItem4.Enabled := true;
      end;
    ivPortMapping:
      begin
        FillMapList;
        CS := ivPortMapping;
        cxGrid1Level1.GridView := GV_PortForwarding;
        dxStatusBar1.Panels[2].Text := 'ST.: Port Mapping';
        dxBarSubItem5.Enabled := true;
      end;
    ivUser:
      begin
        FillUserList;
        CS := ivUser;
        cxGrid1Level1.GridView := GV_Users;
        dxStatusBar1.Panels[2].Text := 'ST.: Users';
        dxBarSubItem2.Enabled := true;
      end;
  end;
  // ¬озобновл€ем отрисовку формы
  LockWindowUpdate(0);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var
  d: dWord;
begin
  d := glTools1.Working('TourmalineSrv');
  case d of
    $00000001:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: STOPPED';
    $00000004:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: RUNNING';
    $00000007:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: PAUSED';
    $00000002:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: START_PENDING';
    $00000003:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: STOP_PENDING';
    $00000005:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: CONTINUE_PENDING';
    $00000006:
      MainForm.dxStatusBar1.Panels[1].Text := 'Status: PAUSE_PENDING';
  end;
end;

procedure TMainForm.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession = true then
  begin
    bForceClose := true;
    inherited;
  end
  else
    inherited;
end;

procedure TMainForm.WMQueryEndSession(var Msg: TMessage);
begin
  bForceClose := true;
  Msg.Result := 1;
  inherited;
end;

end.
