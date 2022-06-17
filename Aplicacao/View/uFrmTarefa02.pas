unit uFrmTarefa02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  objTThread = class(TThread)
    private
      FaProgressBar: TProgressBar;
      FIntervalo: Integer;
      FProcesso: Integer;

      procedure DoProgresso;
      procedure SetaProgresso(const Value: TProgressBar);
    protected
      procedure Execute; override;
    public
      constructor Create;
      destructor Destroy; override;
      property aProgressBar: TProgressBar read FaProgressBar write SetaProgresso;
      property Processo: Integer read FProcesso write FProcesso;
      property Intervalo: Integer read FIntervalo write FIntervalo;
  end;

  TfrmTarefa02 = class(TfrmPadrao)
    btIniciar: TButton;
    gpbIntervaloTemp: TGroupBox;
    edIntervalo: TEdit;
    pgbContagem: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btIniciarClick(Sender: TObject);
  private
    { Private declarations }
    procedure desabilitaControls;
    procedure habilitaControls;
  public
    { Public declarations }
  end;

var
  frmTarefa02: TfrmTarefa02;
  iProcesso: Integer;
 // aProgresso: TProgressBar;
  aThread: objTThread;

implementation

{$R *.dfm}

procedure TfrmTarefa02.FormCreate(Sender: TObject);
begin
  inherited;
  stbRodapePadrao.Panels[1].Text := 'Tarefa 02';
  iProcesso := 0;
end;

procedure TfrmTarefa02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  if Assigned(aThread) then
    if not aThread.Terminated then
      TerminateThread(aThread.Handle, 0);
end;

procedure TfrmTarefa02.btIniciarClick(Sender: TObject);
begin
  if Length(edIntervalo.Text) = 0 then
  begin
    ShowMessage('Valor invalido...');
    exit;
  end;

  desabilitaControls;
  pgbContagem.Position    := 0;
  aThread                 := objTThread.Create;

  with aThread do
  begin
    Intervalo     := StrToInt(edIntervalo.Text);
    Processo      := iProcesso;
    aProgressBar  := pgbContagem;
    inc(iProcesso);
    edIntervalo.Text      := '150';
  end;
end;

procedure TfrmTarefa02.desabilitaControls;
begin
   gpbIntervaloTemp.Enabled := False;
   btIniciar.Enabled        := False;
   btnFecharBase.Enabled    := False;
   stbRodapePadrao.Panels[2].Text := 'Executando a Thread..';
end;

procedure TfrmTarefa02.habilitaControls;
begin
   gpbIntervaloTemp.Enabled := True;
   btIniciar.Enabled        := True;
   btnFecharBase.Enabled    := True;
   stbRodapePadrao.Panels[2].Text := EmptyStr;
end;

{ objTThread }

constructor objTThread.Create;
begin
   inherited Create(False);
   FreeOnTerminate := True;
end;

destructor objTThread.Destroy;
begin
  inherited;
end;

procedure objTThread.DoProgresso;
begin
  Application.ProcessMessages;
end;

procedure objTThread.Execute;
var
  I: Integer;
begin
  inherited;
  try
    for I := 0 to 100 do
    begin
      Sleep(FIntervalo);
      aProgressBar.Position := aProgressBar.Position + 2;
      Synchronize(DoProgresso);
    end;
  finally
     frmTarefa02.habilitaControls;
     ShowMessage('Thread finalizada!');
  end;
end;

procedure objTThread.SetaProgresso(const Value: TProgressBar);
begin
  FaProgressBar := Value;
end;

end.
