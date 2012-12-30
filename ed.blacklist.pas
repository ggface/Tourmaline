unit ed.blacklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinDarkRoom, StdCtrls, cxCheckBox,
  cxTextEdit, cxDBEdit, cxLabel;

type
  TED_Blacklist = class(TForm)
    cxLabel5: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxCheckBox1: TcxCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ED_Blacklist: TED_Blacklist;

implementation

uses base;

{$R *.dfm}

procedure TED_Blacklist.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TED_Blacklist.Button2Click(Sender: TObject);
begin
  if cxCheckBox1.Checked then
    Bases.cdsBLACKLIST.FieldByName('ACTIVE').Value := 1
  else
    Bases.cdsBLACKLIST.FieldByName('ACTIVE').Value := 0;
  Bases.cdsBLACKLIST.Post;
  Bases.cdsBLACKLIST.ApplyUpdates(-1);
  Close;
end;

procedure TED_Blacklist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Bases.cdsBLACKLIST.Cancel;
end;

end.
