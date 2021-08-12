unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  {para teste interno / mySql}
  FireDAC.Phys.MySQLDef, FireDAC.Phys, FireDAC.Phys.MySQL;

type
  TspQuery = class(TFDQuery)
    procedure GeraSQL;
  private
    FspCondicoes : TStringList;
    FspColunas   : TStringList;
    FspTabelas   : TStringList;
    FPhysDrive   : TFDPhysMySQLDriverLink;
    procedure ValidaTabelas;
    procedure ValidaCondicao;
    procedure ValidaColunas;
  protected
  public
    constructor Create(Aowner: TComponent);override;
    destructor Destroy;override;
  published
    property spCondicoes: TStringList read FspCondicoes write FspCondicoes;
    property spColunas  : TStringList read FspColunas   write FspColunas;
    property spTabelas  : TStringList read FspTabelas   write FspTabelas;
  end;


implementation

procedure TspQuery.ValidaTabelas;
begin
  {Verifica se exista mais de uma tabela tanto na mesma linha quando em uma linha diferente}
  if Length(FspTabelas.Text.Split([#32,#13,#10], TStringSplitOptions.ExcludeEmpty)) > 1 then
    raise Exception.Create('É permitido apenas informar uma tabela para gerar o SQL!');

  {Remove where se informado}
  FspTabelas.Text := StringReplace(FspTabelas.Text, 'WHERE', '', [rfReplaceAll]);

  {Retira caracters indevido}
  FspTabelas.Text := Trim(FspTabelas.Text);
end;

procedure TspQuery.ValidaCondicao;
var
  recCodicao : integer;
  strValor   : String;
begin
  for recCodicao := FspCondicoes.Count -1 downto 1 do
  begin
    strValor :=  FspCondicoes[recCodicao].Trim;

    if strValor = '' then
    begin
      FspCondicoes.Delete(recCodicao);
      Continue;
    end;

    if SameText(Copy(strValor, 1, 4),'AND ') then
      strValor := Copy(strValor, 5);

    FspCondicoes[recCodicao] := 'AND ' + #13#10#32#32 + strValor;
  end;
end;

procedure TspQuery.ValidaColunas;
var
  recColuna : integer;
  strValor  : String;
begin
  {Remove espaços em branco por erro de usuário}
  FspColunas.Text := FspColunas.Text.Trim;

  for recColuna := FspColunas.Count -1 downto 0 do
  begin
    strValor := '  ' + FspColunas[recColuna].Trim;

    {Sem coluna remove}
    if strValor = '' then
      FspColunas.Delete(recColuna)

    else if not (recColuna = FspColunas.Count -1) then
      FspColunas[recColuna] := strValor + ','
    else
      FspColunas[recColuna] := strValor;
  end;
end;

procedure TspQuery.GeraSQL;
begin
  SQL.Clear;

  {Valida info}
  ValidaTabelas;
  ValidaCondicao;
  ValidaColunas;

  {Gera sql da consulta}
  SQL.Add('SELECT'                       );
  SQL.Add('  ' + FspColunas.Text.Trim    );
  SQL.Add('FROM'                         );
  SQL.Add('  ' + FspTabelas.Text.Trim    );
  SQL.Add('WHERE'                        );
  SQL.Add('  ' +  FspCondicoes.Text.Trim );
end;

constructor TspQuery.Create(Aowner: TComponent);
begin
  inherited Create( AOwner );

  {Parametros para gerar o estrutura sql}
  FspCondicoes := TStringList.Create;
  FspColunas   := TStringList.Create;
  FspTabelas   := TStringList.Create;
  FPhysDrive   := TFDPhysMySQLDriverLink.Create( Self );
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;
  { Destroy via ownerList
    FPhysDrive}
  inherited Destroy;
end;

end.
