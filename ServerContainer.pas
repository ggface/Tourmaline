unit ServerContainer;

interface

uses
  SysUtils, Classes, 
  SvcMgr, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSAuth, IndyPeerImpl;

type
  TSIcarusEmpireTourmaline= class(TService)
    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
  private
    { Private declarations }
  protected
    function DoStop: Boolean; override;
    function DoPause: Boolean; override;
    function DoContinue: Boolean; override;
    procedure DoInterrogate; override;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  SIcarusEmpireTourmaline TSIcarusEmpireTourmaline

implementation

uses Windows, ServerTourmaline;

{$R *.dfm}

procedure TSIcarusEmpireTourmalineDSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerTourmaline.TTourmaline;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  SIcarusEmpireTourmalineController(CtrlCode);
end;

function TSIcarusEmpireTourmalineGetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TSIcarusEmpireTourmalineDoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TSIcarusEmpireTourmalineDoInterrogate;
begin
  inherited;
end;

function TSIcarusEmpireTourmalineDoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TSIcarusEmpireTourmalineDoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TSIcarusEmpireTourmalineServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;
end.

