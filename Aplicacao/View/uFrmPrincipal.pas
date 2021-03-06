unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.CategoryButtons, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ExtCtrls, Vcl.Imaging.jpeg, uFrmTarefa01,
  uFrmTarefa02, uFrmTarefa03;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    imgBtnMenu: TImage;
    LinkLabel1: TLinkLabel;
    imglBtnMenu: TImageList;
    splvMenu: TSplitView;
    ctbMenu: TCategoryButtons;
    procedure imgBtnMenuClick(Sender: TObject);
    procedure ctbMenuCategories0Items0Click(Sender: TObject);
    procedure ctbMenuCategories0Items1Click(Sender: TObject);
    procedure ctbMenuCategories0Items2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  fcFormExists(fmForm: TForm): boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ctbMenuCategories0Items0Click(Sender: TObject);
begin
  //if not Assigned(frmTarefa01) then
  //begin
  //  frmTarefa01 := TfrmTarefa01.Create(Self);
  //end;
  //frmTarefa01.Show;

  if fcFormExists(frmTarefa01 as TForm) then
     frmTarefa01.Show
  else
     frmTarefa01 := TfrmTarefa01.Create(Self);
end;

procedure TfrmPrincipal.ctbMenuCategories0Items1Click(Sender: TObject);
begin
  if fcFormExists(frmTarefa02 as TForm) then
     frmTarefa02.Show
  else
     frmTarefa02 := TfrmTarefa02.Create(Self);
end;

procedure TfrmPrincipal.ctbMenuCategories0Items2Click(Sender: TObject);
begin
  if fcFormExists(frmTarefa03 as TForm) then
     frmTarefa03.Show
  else
     frmTarefa03 := TfrmTarefa03.Create(Self);
end;

function TfrmPrincipal.fcFormExists(fmForm: TForm): boolean;
var
  inIdx: integer;
begin
  fcFormExists := False;
  for inIdx := 0 to MDIChildCount - 1 do
    if MDIChildren[inIdx] = fmForm then
    begin
      fcFormExists := True;
      Exit;
    end;
end;

procedure TfrmPrincipal.imgBtnMenuClick(Sender: TObject);
begin
  if splvMenu.Width = 250 then
  begin
    splvMenu.Width := 60;
    ctbMenu.Width := 55;
  end
  else
  begin
    splvMenu.Width := 250;
    ctbMenu.Width := 245;
  end;
end;

end.
