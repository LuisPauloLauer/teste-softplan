unit uFrmPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmPadrao = class(TForm)
    pnlRodapePadrao: TPanel;
    stbRodapePadrao: TStatusBar;
    btnFecharBase: TBitBtn;
    procedure btnFecharBaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

procedure TfrmPadrao.btnFecharBaseClick(Sender: TObject);
begin
  Close;
end;

end.

