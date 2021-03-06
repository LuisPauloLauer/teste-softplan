unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Phys.MSAccDef,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.ADSDef, FireDAC.Phys.FBDef,
  FireDAC.Phys.TDBXDef, FireDAC.Phys.TDBXBase, FireDAC.Phys.TDBX,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.ADS, FireDAC.Phys.MySQL,
  FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }
    FspCondicoes: TStrings;
    FspColunas: TStrings;
    FspTabelas: TStrings;

    procedure SetSpCondicoes(const Value: TStrings);
    procedure SetSpColunas(const Value: TStrings);
    procedure SetSpTabelas(const Value: TStrings);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GeraSql;
  published
    { Published declarations }
    property spCondicoes:TStrings read FspCondicoes write SetSpCondicoes;
    property spColunas:TStrings read FspColunas write SetSpColunas;
    property spTabelas:TStrings read FspTabelas write SetSpTabelas;
  end;

//procedure Register;

var
  sSqlPadrao: TStringList;

implementation

//procedure Register;
//begin
//  RegisterComponents('spComponentes', [TspQuery]);
//end;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FspCondicoes  := TStringList.create;
  FspColunas    := TStringList.create;
  FspTabelas    := TStringList.create;
  sSqlPadrao.Add  (
                'SELECT'+#13#10+
                '/*COLUNAS*/'+#13#10+
                'FROM'+#13#10+
                '/*TABELA*/'+#13#10+
                'WHERE'+#13#10+
                '/*CONDICOES*/'
              );
end;

destructor TspQuery.Destroy;
begin
  freeandnil(FspCondicoes);
  freeandnil(FspColunas);
  freeandnil(FspTabelas);
  inherited Destroy;
end;

procedure TspQuery.GeraSql;
var nS, nCol, nCon: Integer;
    xSql: TStringlist;
begin
  xSql := TStringlist.create;
  xSql.clear;
  Self.SQL.Clear;
  Self.SQL.AddStrings(sSqlPadrao);

  try
    if FspTabelas.Count > 1 then
      raise Exception.Create('S? pode inserir uma tabela no select');

    for nS := 0 to Sql.Count - 1 do
    begin
      if Trim(Sql[nS]) = '/*COLUNAS*/' then
      begin
        if FspColunas.Count > 0 then
        begin
          for nCol := 0 to FspColunas.Count - 1 do
            if ((FspColunas.Count - 1 <> 0) and (nCol <> FspColunas.Count - 1)) then
              xSql.Add(FspColunas[nCol]+',')
            else
              xSql.Add(FspColunas[nCol]);
        end
        else
        begin
          xSql.Add('*');
        end;
      end
      else if Trim(Sql[nS]) = '/*TABELA*/' then
      begin
        xSql.Add(FspTabelas[0]);
      end
      else if Trim(Sql[nS]) = '/*CONDICOES*/' then
      begin
        if FspCondicoes.Count > 0 then
        begin
          for nCon := 0 to FspCondicoes.Count - 1 do
            if ((FspCondicoes.Count - 1 <> 0) and (nCon <> FspCondicoes.Count - 1)) then
              xSql.Add(FspCondicoes[nCon]+',')
            else
              xSql.Add(FspCondicoes[nCon]);
        end
        else
        begin
          xSql.Add('1=1');
        end;
      end
      else
        xSql.Add(Sql[nS]);
    end;
  finally
    Self.SQL.Clear;
    Self.SQL.AddStrings(xSql);
    freeandNil(xsql);
  end;
end;

procedure TspQuery.SetSpColunas(const Value: TStrings);
begin
 FspColunas := Value;
end;

procedure TspQuery.SetSpCondicoes(const Value: TStrings);
begin
  FspCondicoes := Value;
end;

procedure TspQuery.SetSpTabelas(const Value: TStrings);
begin
  FspTabelas := Value;
end;

end.
