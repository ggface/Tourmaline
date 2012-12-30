unit ed.portmapping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinDarkRoom, StdCtrls, cxCheckBox,
  cxTextEdit, cxDBEdit, cxLabel;

type
  TED_PortMapping = class(TForm)
    cxLabel5: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
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
  ED_PortMapping: TED_PortMapping;

implementation

uses base, main;

{$R *.dfm}

procedure TED_PortMapping.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TED_PortMapping.Button2Click(Sender: TObject);
begin
  if cxCheckBox1.Checked then
    Bases.cdsPORTFORWARDING.FieldByName('ACTIVE').Value := 1
  else
    Bases.cdsPORTFORWARDING.FieldByName('ACTIVE').Value := 0;
  Bases.cdsPORTFORWARDING.Post;
  Bases.cdsPORTFORWARDING.ApplyUpdates(-1);
  Close;
end;

procedure TED_PortMapping.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Bases.cdsPORTFORWARDING.Cancel;
end;

end.
