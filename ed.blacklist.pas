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
    cxLabel1: TcxLabel;
    btnCancel: TButton;
    btnSave: TButton;
    teURL: TcxTextEdit;
    teDescription: TcxTextEdit;
    chEnabled: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure ClearControls();
  public
    IsEdit: boolean;
  end;

var
  ED_Blacklist: TED_Blacklist;

implementation

uses Main, blacklist, ObjectList, Foundation;

{$R *.dfm}

procedure TED_Blacklist.btnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TED_Blacklist.btnSaveClick(Sender: TObject);
var
  query: string;
begin
  if (IsEdit) then
    query := 'UPDATE ' + TABLE_NAME_BLACKLIST + ' SET ' + FIELD_NAME_URL + ' = '
      + QuotedStr(teURL.Text) + ', ' + FIELD_NAME_DESCRIPTION + ' = ' +
      QuotedStr(teDescription.Text) + ', ' + FIELD_NAME_ENABLED + ' = ' +
      to_s(chEnabled.Checked) + ' WHERE ' + FIELD_NAME_C_BLACKLIST + ' = ' +
      to_s(MainForm.blacklist.DataSet.FieldByName(FIELD_NAME_C_BLACKLIST)
      .AsInteger)
  else
    query := 'INSERT INTO ' + TABLE_NAME_BLACKLIST + ' (' + FIELD_NAME_URL +
      ', ' + FIELD_NAME_DESCRIPTION + ', ' + FIELD_NAME_ENABLED + ') VALUES (' +
      QuotedStr(teURL.Text) + ',' + QuotedStr(teDescription.Text) + ',' +
      to_s(chEnabled.Checked) + ')';

  MainForm.Base.ExecSQL(Ansistring(query));
  MainForm.SetView(ivBlackList, true);
  close;
end;

procedure TED_Blacklist.ClearControls;
begin
  teURL.Clear;
  teDescription.Clear;
  chEnabled.Checked := false;
end;

procedure TED_Blacklist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearControls;
end;

procedure TED_Blacklist.FormCreate(Sender: TObject);
begin
  ClearControls;
end;

procedure TED_Blacklist.FormShow(Sender: TObject);
begin
  teURL.SetFocus;
end;

end.
