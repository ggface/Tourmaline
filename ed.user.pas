unit ed.user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinDarkRoom, StdCtrls, cxCheckBox,
  cxTextEdit, cxDBEdit, cxLabel;

type
  TED_User = class(TForm)
    cxLabel5: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxCheckBox1: TcxCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ED_User: TED_User;

implementation

uses base;

{$R *.dfm}

procedure TED_User.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TED_User.Button2Click(Sender: TObject);
begin
  if cxCheckBox1.Checked then
    Bases.cdsUSERS.FieldByName('ACTIVE').Value := 1
  else
    Bases.cdsUSERS.FieldByName('ACTIVE').Value := 0;
  Bases.cdsUSERS.Post;
  Bases.cdsUSERS.ApplyUpdates(-1);
  Close;
end;

procedure TED_User.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Bases.cdsUSERS.Cancel;
end;

end.
