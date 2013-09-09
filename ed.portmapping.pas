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
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel7: TcxLabel;
    chEnabled: TcxCheckBox;
    btnSave: TButton;
    btnCancel: TButton;
    teLocalPort: TcxTextEdit;
    teRemotePort: TcxTextEdit;
    teRemoteIP: TcxTextEdit;
    teDescription: TcxTextEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure ClearControls();
  public
    IsEdit: boolean;
  end;

var
  ED_PortMapping: TED_PortMapping;

implementation

uses Main, MapList, ObjectList, Foundation;

{$R *.dfm}

procedure TED_PortMapping.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TED_PortMapping.btnSaveClick(Sender: TObject);
var
  query: string;
begin
  if (IsEdit) then
    query := 'UPDATE ' + TABLE_NAME_MAPLIST + ' SET ' + FIELD_NAME_LOCAL_PORT +
      ' = ' + QuotedStr(teLocalPort.Text) + ', ' + FIELD_NAME_REMOTE_PORT +
      ' = ' + QuotedStr(teRemotePort.Text) + ', ' + FIELD_NAME_REMOTEIP + ' = '
      + QuotedStr(teRemoteIP.Text) + ', ' + FIELD_NAME_DESCRIPTION + ' = ' +
      QuotedStr(teDescription.Text) + ', ' + FIELD_NAME_ENABLED + ' = ' +
      to_s(chEnabled.Checked) + ' WHERE ' + FIELD_NAME_C_MAPLIST + ' = ' +
      to_s(MainForm.MapList.DataSet.FieldByName(FIELD_NAME_C_MAPLIST).AsInteger)
  else
    query := 'INSERT INTO ' + TABLE_NAME_MAPLIST + ' (' + FIELD_NAME_LOCAL_PORT
      + ', ' + FIELD_NAME_REMOTE_PORT + ', ' + FIELD_NAME_REMOTEIP + ', ' +
      FIELD_NAME_DESCRIPTION + ', ' + FIELD_NAME_ENABLED + ') VALUES (' +
      QuotedStr(teLocalPort.Text) + ',' + QuotedStr(teRemotePort.Text) + ',' +
      QuotedStr(teRemoteIP.Text) + ',' + QuotedStr(teDescription.Text) + ',' +
      to_s(chEnabled.Checked) + ')';

  MainForm.Base.ExecSQL(Ansistring(query));
  MainForm.SetView(ivPortMapping, true);
  close;
end;

procedure TED_PortMapping.ClearControls;
begin
  teLocalPort.Clear;
  teRemotePort.Clear;
  teRemoteIP.Clear;
  teDescription.Clear;
  chEnabled.Checked := false;
end;

procedure TED_PortMapping.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearControls();
end;

procedure TED_PortMapping.FormCreate(Sender: TObject);
begin
  ClearControls();
end;

procedure TED_PortMapping.FormShow(Sender: TObject);
begin
  teLocalPort.SetFocus;
end;

end.
