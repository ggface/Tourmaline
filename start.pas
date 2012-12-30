unit start;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinDarkRoom, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDBEdit, glRegistry, cxDropDownEdit, cxCalc, cxGraphics, cxLookAndFeels,
  dxGDIPlusClasses, cxImage, cxGroupBox;

type
  TStartPage = class(TForm)
    glRegistry1: TglRegistry;
    cxLabel5: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartPage: TStartPage;

implementation

uses base, main, ed.user, ed.blacklist, ed.portmapping, about;

{$R *.dfm}

procedure TStartPage.Button1Click(Sender: TObject);
var
  host, port: string;
begin
  host := Copy(cxTextEdit1.Text, 1, Pos(':', cxTextEdit1.Text) - 1);
  port := Copy(cxTextEdit1.Text, Pos(':', cxTextEdit1.Text) + 1, 255);
  try
    Bases.SQLConnection1.Params.Text := 'DriverUnit=DBXDataSnap' + #10 +
      'HostName=' + host + #10 + 'Port=' + port + #10 +
      'CommunicationProtocol=tcp/ip' + #10 + 'DatasnapContext=datasnap/';
    Bases.Connect;
  except
    ShowMessage('Error. Connect failed.');
    exit;
  end;
  glRegistry1.SaveParam(HKEY_CURRENT_USER, 'ConnectionString', cxTextEdit1.Text,
    varString);

  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TED_User, ED_User);
  Application.CreateForm(TED_Blacklist, ED_Blacklist);
  Application.CreateForm(TED_PortMapping, ED_PortMapping);
  Application.CreateForm(TAboutBox, AboutBox);

  MainForm.Show;
  Hide;
end;

procedure TStartPage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // MainForm.dxStatusBar1.Panels[0].Text := 'Port: ' +
  // IntToStr(glRegistry1.LoadParam(HKEY_LOCAL_MACHINE, 'Port',
  // varInteger).mValue);
end;

procedure TStartPage.FormCreate(Sender: TObject);
var
  s: string;
begin
  s := glRegistry1.LoadParam(HKEY_CURRENT_USER, 'ConnectionString',
    varString).mValue;
  if Trim(s) = '' then
    cxTextEdit1.Text := 'localhost:6589'
  else
    cxTextEdit1.Text := s;
end;

end.
