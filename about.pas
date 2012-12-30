unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinDarkRoom, Menus, cxLookAndFeelPainters,
  dxGDIPlusClasses, cxImage, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxLabel;

type
  TAboutBox = class(TForm)
    cxLabel5: TcxLabel;
    cxButton1: TcxButton;
    cxImage1: TcxImage;
    cxLabel1: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

end.
