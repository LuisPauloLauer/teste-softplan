unit uFrmTarefa01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Data.DB, uspQuery, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSAccDef,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.ADSDef, FireDAC.Phys.FBDef,
  FireDAC.Phys.TDBXDef, FireDAC.Phys.TDBXBase, FireDAC.Phys.TDBX,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.ADS, FireDAC.Phys.MySQL,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc;

type
  TfrmTarefa01 = class(TfrmPadrao)
    tmSQLGerado: TMemo;
    Label4: TLabel;
    tmCondicoes: TMemo;
    tmTabela: TMemo;
    tmColunas: TMemo;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    btnGerarSql: TButton;
    spQGeraSql: TspQuery;
    procedure btnGerarSqlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTarefa01: TfrmTarefa01;

implementation

{$R *.dfm}

procedure TfrmTarefa01.btnGerarSqlClick(Sender: TObject);
begin
  inherited;
    { spQGeraSql.SQL.Clear;
    spQGeraSql.SQL.Add( 'SELECT'+#13#10+
                  '/*COLUNAS*/'+#13#10+
                  'FROM'+#13#10+
                  '/*TABELA*/'+#13#10+
                  'WHERE'+#13#10+
                  '/*CONDICOES*/'
    ); }
    spQGeraSql.spColunas    := tmColunas.Lines;
    spQGeraSql.spTabelas    := tmTabela.Lines;
    spQGeraSql.spCondicoes  := tmCondicoes.Lines;
    spQGeraSql.GeraSql;
    tmSQLGerado.Lines := spQGeraSql.SQL;
end;

procedure TfrmTarefa01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  inherited;
  //Release;
  //frmTarefa01 := nil;
  //FreeAndNil(frmTarefa01);
end;

procedure TfrmTarefa01.FormCreate(Sender: TObject);
begin
  inherited;
  stbRodapePadrao.Panels[1].Text := 'Tarefa 01'
end;

end.
