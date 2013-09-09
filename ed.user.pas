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
    cxLabel2: TcxLabel;
    cxLabel7: TcxLabel;
    chEnabled: TcxCheckBox;
    btnCancel: TButton;
    btnSave: TButton;
    teDisplayName: TcxTextEdit;
    teIP: TcxTextEdit;
    teDescription: TcxTextEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure ClearControls();
  public
    IsEdit: boolean;
  end;

var
  ED_User: TED_User;

implementation

uses Main, UserList, ObjectList, Foundation;

{$R *.dfm}

procedure TED_User.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TED_User.btnSaveClick(Sender: TObject);
var
  query: string;
begin
  if (IsEdit) then
    query := 'UPDATE ' + TABLE_NAME_USERS + ' SET ' + FIELD_NAME_N_USER + ' = '
      + QuotedStr(teDisplayName.Text) + ', ' + FIELD_NAME_IP_ADRESS + ' = ' +
      QuotedStr(teIP.Text) + ', ' + FIELD_NAME_DESCRIPTION + ' = ' +
      QuotedStr(teDescription.Text) + ', ' + FIELD_NAME_ENABLED + ' = ' +
      to_s(chEnabled.Checked) + ' WHERE ' + FIELD_NAME_C_USER + ' = ' +
      to_s(MainForm.UserList.DataSet.FieldByName(FIELD_NAME_C_USER).AsInteger)
  else
    query := 'INSERT INTO ' + TABLE_NAME_USERS + ' (' + FIELD_NAME_N_USER + ', '
      + FIELD_NAME_IP_ADRESS + ', ' + FIELD_NAME_DESCRIPTION + ', ' +
      FIELD_NAME_ENABLED + ') VALUES (' + QuotedStr(teDisplayName.Text) + ',' +
      QuotedStr(teIP.Text) + ',' + QuotedStr(teDescription.Text) + ',' +
      to_s(chEnabled.Checked) + ')';

  MainForm.Base.ExecSQL(Ansistring(query));
  MainForm.SetView(ivUser, true);
  close;
end;

procedure TED_User.ClearControls;
begin
  teDisplayName.Clear;
  teIP.Clear;
  teDescription.Clear;
  chEnabled.Checked := false;
end;

procedure TED_User.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearControls;
end;

procedure TED_User.FormCreate(Sender: TObject);
begin
  ClearControls;
end;

procedure TED_User.FormShow(Sender: TObject);
begin
  teDisplayName.SetFocus;
end;

end.
