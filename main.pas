unit main;

interface

uses
  IdContext, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, cxGraphics, dxSkinsCore, dxSkinDarkRoom,
  dxSkinsdxStatusBarPainter, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxSkinsdxBarPainter,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, cxClasses,
  cxLookAndFeels, dxSkinsForm, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxGridLevel,
  dxStatusBar, glRegistry, ExtCtrls, Menus, CoolTrayIcon, cxLookAndFeelPainters,
  glTools;

type
  TInsideView = (ivUser, ivBlackList, ivPortMapping, ivNone);

  TMainForm = class(TForm)
    GVR: TcxGridViewRepository;
    GV_Users: TcxGridDBTableView;
    GV_UsersColumn1: TcxGridDBColumn;
    GV_UsersColumn2: TcxGridDBColumn;
    GV_UsersColumn3: TcxGridDBColumn;
    GV_UsersColumn4: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    GV_UsersColumn5: TcxGridDBColumn;
    GV_UsersColumn6: TcxGridDBColumn;
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
    GV_BlackListColumn1: TcxGridDBColumn;
    GV_BlackListColumn2: TcxGridDBColumn;
    GV_BlackListColumn3: TcxGridDBColumn;
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
    procedure GV_BlackListColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GV_UsersColumn6GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GV_PortForwardingColumn1GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    procedure WMEndSession(var Msg: TWMEndSession); message WM_ENDSESSION;
    procedure WMQueryEndSession(var Msg: TMessage); message WM_QUERYENDSESSION;
  public
    procedure SetView(ViewState: TInsideView);
  end;

var
  MainForm: TMainForm;
  TotalClient: integer;
  PP: string;
  CS, PrevCS: TInsideView;
  bForceClose: Boolean;

implementation

uses base, ed.user, ed.blacklist, ed.portmapping, about;

{$R *.dfm}

procedure TMainForm.CoolTrayIcon1DblClick(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TMainForm.CoolTrayIcon1MinimizeToTray(Sender: TObject);
begin
  CoolTrayIcon1.HideTaskbarIcon;
end;

procedure TMainForm.dxBarButton10Click(Sender: TObject);
begin
  Bases.cdsBLACKLIST.Append;
  ED_Blacklist.ShowModal;
end;

procedure TMainForm.dxBarButton11Click(Sender: TObject);
begin
  Bases.cdsBLACKLIST.Edit;
  if Bases.cdsBLACKLIST.FieldByName('ACTIVE').AsInteger = 0 then
    ED_Blacklist.cxCheckBox1.Checked := false
  else
    ED_Blacklist.cxCheckBox1.Checked := true;
  ED_Blacklist.ShowModal;
end;

procedure TMainForm.dxBarButton12Click(Sender: TObject);
begin
  Bases.cdsBLACKLIST.Delete;
  Bases.cdsBLACKLIST.ApplyUpdates(-1);
end;

procedure TMainForm.dxBarButton14Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.dxBarButton15Click(Sender: TObject);
begin
  SetView(ivPortMapping);
end;

procedure TMainForm.dxBarButton16Click(Sender: TObject);
begin
  glTools1.Stop('TourmalineSrv');
  glTools1.Start('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton17Click(Sender: TObject);
begin
  Bases.cdsPORTFORWARDING.Append;
  ED_PortMapping.ShowModal;
end;

procedure TMainForm.dxBarButton18Click(Sender: TObject);
begin
  Bases.cdsPORTFORWARDING.Edit;
  if Bases.cdsPORTFORWARDING.FieldByName('ACTIVE').AsInteger = 0 then
    ED_PortMapping.cxCheckBox1.Checked := false
  else
    ED_PortMapping.cxCheckBox1.Checked := true;
  ED_PortMapping.ShowModal;
end;

procedure TMainForm.dxBarButton19Click(Sender: TObject);
begin
  Bases.cdsPORTFORWARDING.Delete;
  Bases.cdsPORTFORWARDING.ApplyUpdates(-1);
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
begin
  glTools1.Start('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton20Click(Sender: TObject);
begin
  glTools1.Install('tourmaline', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton21Click(Sender: TObject);
begin
  glTools1.Uninstall('tourmaline', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton22Click(Sender: TObject);
begin
  glTools1.FullRestart('TourmalineSrv', 'tourmaline', PP);
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton2Click(Sender: TObject);
begin
  glTools1.Stop('TourmalineSrv');
  Timer1Timer(self);
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
  SetView(ivUser);
end;

procedure TMainForm.dxBarButton5Click(Sender: TObject);
begin
  Bases.cdsUSERS.Edit;
  if Bases.cdsUSERS.FieldByName('ACTIVE').AsInteger = 0 then
    ED_User.cxCheckBox1.Checked := false
  else
    ED_User.cxCheckBox1.Checked := true;
  ED_User.ShowModal;
end;

procedure TMainForm.dxBarButton6Click(Sender: TObject);
begin
  Bases.cdsUSERS.Append;
  ED_User.ShowModal;
end;

procedure TMainForm.dxBarButton7Click(Sender: TObject);
begin
  Bases.cdsUSERS.Delete;
  Bases.cdsUSERS.ApplyUpdates(-1);
end;

procedure TMainForm.dxBarButton8Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.dxBarButton9Click(Sender: TObject);
begin
  SetView(ivBlackList);
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  bForceClose := true;
  Close;
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
  SetView(ivUser);
  Timer1Timer(self);
  MainForm.dxStatusBar1.Panels[0].Text := 'Port: ' +
    IntToStr(glRegistry1.LoadParam(HKEY_LOCAL_MACHINE, 'Port',
    varInteger).mValue);
end;

procedure TMainForm.GV_BlackListCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton11Click(self);
end;

procedure TMainForm.GV_BlackListColumn1GetDisplayText
  (Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then
    AText := 'Не активен'
  else
    AText := ' Активен';
end;

procedure TMainForm.GV_PortForwardingCellDblClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton18Click(self);
end;

procedure TMainForm.GV_PortForwardingColumn1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then
    AText := 'Не активен'
  else
    AText := ' Активен';
end;

procedure TMainForm.GV_UsersCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  dxBarButton5Click(self);
end;

procedure TMainForm.GV_UsersColumn6GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if AText = '0' then
    AText := 'Не активен'
  else
    AText := ' Активен';
end;

procedure TMainForm.Hide1Click(Sender: TObject);
begin
  Application.Minimize;
  CoolTrayIcon1.HideMainForm;
end;

procedure TMainForm.Restore1Click(Sender: TObject);
begin
  CoolTrayIcon1.ShowMainForm;
end;

procedure TMainForm.SetView(ViewState: TInsideView);
begin
  // Проверим а нужно ли блин перерисовывать,
  // если нужный ViewState уже активен
  if CS = ViewState then
    exit;
  // Запрещаем отрисовку формы
  LockWindowUpdate(MainForm.Handle);
  // Вырубаем все маркеры на редакторы, потом откроем выбранный
  dxBarSubItem2.Enabled := false;
  dxBarSubItem4.Enabled := false;
  dxBarSubItem5.Enabled := false;
  // Выбираем что нам надо
  case ViewState of
    ivBlackList:
      begin
        CS := ivBlackList;
        cxGrid1Level1.GridView := GV_BlackList;
        dxStatusBar1.Panels[2].Text := 'ST.: BlackList';
        dxBarSubItem4.Enabled := true;
      end;
    ivPortMapping:
      begin
        CS := ivPortMapping;
        cxGrid1Level1.GridView := GV_PortForwarding;
        dxStatusBar1.Panels[2].Text := 'ST.: Port Mapping';
        dxBarSubItem5.Enabled := true;
      end;
    ivUser:
      begin
        CS := ivUser;
        cxGrid1Level1.GridView := GV_Users;
        dxStatusBar1.Panels[2].Text := 'ST.: Users';
        dxBarSubItem2.Enabled := true;
      end;
  end;
  // Возобновляем отрисовку формы
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
