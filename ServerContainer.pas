unit ServerContainer;

interface

uses
  SysUtils, Classes, 
  SvcMgr, 
  DSTCPServerTransport,
  DSServer, DSCommonServer, DSAuth; 

type
  TServerContainer1 = class(TService)
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
  ServerContainer1: TServerContainer1;

implementation

uses Windows, ServerTourmaline;

{$R *.dfm}

procedure TServerContainer1.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerTourmaline.TTourmaline;
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServerContainer1.Controller(CtrlCode);
end;

function TServerContainer1.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TServerContainer1.DoContinue: Boolean;
begin
  Result := inherited;
  DSServer1.Start;
end;

procedure TServerContainer1.DoInterrogate;
begin
  inherited;
end;

function TServerContainer1.DoPause: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

function TServerContainer1.DoStop: Boolean;
begin
  DSServer1.Stop;
  Result := inherited;
end;

procedure TServerContainer1.ServiceStart(Sender: TService; var Started: Boolean);
begin
  DSServer1.Start;
end;
end.

