program ProvaDelphiApp;

uses
  Vcl.Forms,
  uFrmPrincipal in 'View\uFrmPrincipal.pas' {frmPrincipal},
  uFrmPadrao in '..\Pacotes\spComponentes\View\Padrao\uFrmPadrao.pas' {frmPadrao},
  uFrmTarefa01 in 'View\uFrmTarefa01.pas' {frmTarefa01},
  uFrmTarefa02 in 'View\uFrmTarefa02.pas' {frmTarefa02},
  uFrmTarefa03 in 'View\uFrmTarefa03.pas' {frmTarefa03};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  // Application.CreateForm(TfrmTeste, frmTeste);
  // Application.CreateForm(TfThreads, fThreads);
  // Application.CreateForm(TfrmPadrao, frmPadrao);
  // Application.CreateForm(TfrmTarefa01, frmTarefa01);
  // Application.CreateForm(TfrmTarefa02, frmTarefa02);
  // Application.CreateForm(TfrmTarefa03, frmTarefa03);
  Application.Run;
end.
