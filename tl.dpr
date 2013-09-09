program tl;

uses
  Forms,
  main in 'main.pas' {MainForm},
  ed.user in 'ed.user.pas' {ED_User},
  ed.blacklist in 'ed.blacklist.pas' {ED_Blacklist},
  ed.portmapping in 'ed.portmapping.pas' {ED_PortMapping},
  about in 'about.pas' {AboutBox},
  UserList in 'Enties\UserList.pas',
  ObjectList in 'Enties\ObjectList.pas',
  BlackList in 'Enties\BlackList.pas',
  MapList in 'Enties\MapList.pas',
  Foundation in 'Foundation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Tourmaline';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TED_User, ED_User);
  Application.CreateForm(TED_Blacklist, ED_Blacklist);
  Application.CreateForm(TED_PortMapping, ED_PortMapping);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
