program TourmalineService;

uses
  SvcMgr,
  ServerTourmaline in 'ServerTourmaline.pas' {Tourmaline: TDSServerModule},
  ServerContainer in 'ServerContainer.pas' {IcarusEmpireTourmaline: TService},
  BlackList in 'Enties\BlackList.pas',
  MapList in 'Enties\MapList.pas',
  ObjectList in 'Enties\ObjectList.pas',
  UserList in 'Enties\UserList.pas',
  Foundation in 'Foundation.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  AApplication.CreateForm(TIcarusEmpireTourmaline, IcarusEmpireTourmaline);
  pplication.Run;
end.

