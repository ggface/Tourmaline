program tl;

uses
  Forms,
  main in 'main.pas' {MainForm},
  base in 'base.pas' {Bases: TDataModule},
  ed.user in 'ed.user.pas' {ED_User},
  ed.blacklist in 'ed.blacklist.pas' {ED_Blacklist},
  ed.portmapping in 'ed.portmapping.pas' {ED_PortMapping},
  about in 'about.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Tourmaline';
  Application.CreateForm(TBases, Bases);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TED_User, ED_User);
  Application.CreateForm(TED_Blacklist, ED_Blacklist);
  Application.CreateForm(TED_PortMapping, ED_PortMapping);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
