unit uFrmTarefa03;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask;

type
  TfrmTarefa03 = class(TfrmPadrao)
    dbgRegistros: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    edTotal: TMaskEdit;
    edTotalDiv: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarefa03: TfrmTarefa03;
  oCdsRegistros: TClientDataSet;
  oDts: TDataSource;

implementation

{$R *.dfm}

procedure TfrmTarefa03.Button1Click(Sender: TObject);
var
 i: Integer;
 fTotal: Double;
begin
  inherited;
  fTotal := 0.00;
  try
    oCdsRegistros.First;
    while not oCdsRegistros.eof do
    begin
      fTotal := fTotal + oCdsRegistros.FieldByName('Valor').AsFloat;
      oCdsRegistros.Next;
    end;
  finally
    edTotal.Text := formatfloat('0.##',fTotal);
    edTotal.Text := StringReplace(edTotal.Text, '.', ',', [rfReplaceAll]);
  end;

end;

procedure TfrmTarefa03.Button2Click(Sender: TObject);
var
  i,j: Integer;
  fValorAutal, fValorProximo, fValorAux, fValorDiv, fTotalDiv: Double;
begin
  inherited;
  i := 0;
  fValorDiv := 0.00;
  fTotalDiv := 0.00;
  j := oCdsRegistros.RecordCount -1;
  try
    oCdsRegistros.First;
    while not oCdsRegistros.eof do
    begin
      if oCdsRegistros.RecNo <> oCdsRegistros.RecordCount then
      begin
        fValorAutal := oCdsRegistros.FieldByName('Valor').AsFloat;
        oCdsRegistros.Next;
        fValorProximo := oCdsRegistros.FieldByName('Valor').AsFloat;
        fValorDiv :=  fValorProximo / fValorAutal;
        fTotalDiv := fTotalDiv + fValorDiv;
      end
      else
        oCdsRegistros.Next;
    end;
  finally
    edTotalDiv.Text := FormatFloat('0.00', fTotalDiv);
    edTotalDiv.Text := StringReplace(edTotalDiv.Text, '.', ',', [rfReplaceAll]);
  end;
end;

procedure TfrmTarefa03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(oCdsRegistros);
  FreeAndNil(oDts);
  Action := caFree;
  //Release;
  //frmTarefa03 := nil;
end;

procedure TfrmTarefa03.FormCreate(Sender: TObject);
var
 i : integer;
 fValor: Double;
begin
  inherited;
  stbRodapePadrao.Panels[1].Text := 'Tarefa 03';
  oCdsRegistros := TClientDataSet.Create(Self);
  oCdsRegistros.Close;
  oCdsRegistros.FieldDefs.Clear;
  oCdsRegistros.FieldDefs.add('idProjeto',ftInteger);
  oCdsRegistros.FieldDefs.add('NomeProjeto',ftString,200);
  oCdsRegistros.FieldDefs.add('Valor',ftFloat);
  oCdsRegistros.CreateDataSet;
  oDts := TDataSource.Create(nil);
  oDts.DataSet := oCdsRegistros;
  dbgRegistros.DataSource := oDts;

  fValor := 10.00;

  try
    for i := 1 to  10 do
    begin
      oCdsRegistros.Insert;
      oCdsRegistros.FieldByName('idProjeto').AsInteger := i;
      oCdsRegistros.FieldByName('NomeProjeto').AsString := 'Projeto '+IntToStr(i);
      oCdsRegistros.FieldByName('Valor').AsFloat := fValor;
      oCdsRegistros.Post;

      fValor := fValor + 10.00;
    end;
  finally
    oCdsRegistros.IndexFieldNames := 'idProjeto';
    oCdsRegistros.Open;
    oCdsRegistros.First;
    dbgRegistros.Columns[0].Title.Caption := 'ID do Projeto';
    dbgRegistros.Columns[1].Title.Caption := 'Nome do Projeto';
    dbgRegistros.Columns[2].Title.Caption := 'Valor';
    dbgRegistros.Columns[0].Width := 100;
    dbgRegistros.Columns[1].Width := 200;
    dbgRegistros.Columns[2].Width := 100;
  end;

end;

end.
