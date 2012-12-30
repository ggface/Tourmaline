unit ServerTourmaline;

interface

uses
  SysUtils, Windows, Classes, DSServer, DBXFirebird, FMTBcd, DB, SqlExpr,
  Provider, IdContext, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdTCPServer, IdCmdTCPServer, IdHTTPProxyServer, IdAntiFreezeBase,
  IdAntiFreeze, glRegistry, IdMappedPortTCP;

type
  TTourmaline = class(TDSServerModule)
    Tourmaline: TSQLConnection;
    PORTFORWARDING: TSQLDataSet;
    PORTFORWARDINGLOCALPORT: TIntegerField;
    PORTFORWARDINGREMOTEPORT: TIntegerField;
    PORTFORWARDINGREMOTEIP: TStringField;
    PORTFORWARDINGDESCRIPTION: TStringField;
    PORTFORWARDINGACTIVE: TSmallintField;
    dspPORTFORWARDING: TDataSetProvider;
    USERS: TSQLDataSet;
    dspBLACKLIST: TDataSetProvider;
    dspUSERS: TDataSetProvider;
    USERSUSERNAME: TStringField;
    USERSFIRSTNAME: TStringField;
    USERSLASTNAME: TStringField;
    USERSDESCRIPTION: TStringField;
    USERSADRESSIP: TStringField;
    USERSACTIVE: TSmallintField;
    HTTP: TIdHTTPProxyServer;
    IdAntiFreeze1: TIdAntiFreeze;
    REG: TglRegistry;
    BLACKLIST: TSQLDataSet;
    BLACKLISTURL: TStringField;
    BLACKLISTDESCRIPTION: TStringField;
    BLACKLISTACTIVE: TSmallintField;
    MapPartTCP: TIdMappedPortTCP;
    procedure HTTPBeforeCommandHandler(ASender: TIdCmdTCPServer;
      var AData: string; AContext: TIdContext);
    procedure HTTPConnect(AContext: TIdContext);
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function ExistUrl(Query: string): boolean;
    function ExistIP(IP: string): boolean;
  end;

implementation

uses masks;

{$R *.dfm}

var
  DBpath: string;

procedure TTourmaline.DSServerModuleCreate(Sender: TObject);
begin
  PORTFORWARDING.Open;
  BLACKLIST.Open;
  USERS.Open;
  DBpath := REG.LoadParam(HKEY_LOCAL_MACHINE, 'Database', varString).mValue;
  HTTP.DefaultPort := REG.LoadParam(HKEY_LOCAL_MACHINE, 'Port',
    varInteger).mValue;
  HTTP.Active := true;
end;

procedure TTourmaline.DSServerModuleDestroy(Sender: TObject);
begin
  HTTP.Active := false;
end;

function TTourmaline.ExistIP(IP: string): boolean;
begin
  try
    USERS.First;
    while not USERS.Eof do
    begin
      if USERS.FieldByName('ADRESSIP').AsString = IP then
      begin
        result := true;
        exit;
      end;
    end;
  finally
    result := false;
  end;
end;

function TTourmaline.ExistUrl(Query: string): boolean;
begin
  try
    BLACKLIST.First;
    while not BLACKLIST.Eof do
    begin
      if MatchesMask(Query, BLACKLIST.FieldByName('URL').AsString) then
      begin
        result := true;
        exit;
      end;
    end;
  finally
    result := false;
  end;
end;

procedure TTourmaline.HTTPBeforeCommandHandler(ASender: TIdCmdTCPServer;
  var AData: string; AContext: TIdContext);
begin
  if ExistUrl(AData) then
  begin
    AContext.Connection.IOHandler.WriteFile(ExtractFilePath(DBpath) +
      '\access_deny.html');
    AContext.Binding.CloseSocket;
  end;
end;

procedure TTourmaline.HTTPConnect(AContext: TIdContext);
begin
  if not ExistIP(AContext.Binding.PeerIP) then
  begin
    AContext.Connection.IOHandler.WriteFile(ExtractFilePath(DBpath) +
      '\user_access.html');
    Abort;
  end;
end;

end.
