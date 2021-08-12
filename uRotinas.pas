unit uRotinas;

interface

type
  TFormatacoes = class
  public
    function ArredondarCurr(AValor: Currency): Currency;
  end;

var
  Formatacoes : TFormatacoes;

implementation

function TFormatacoes.ArredondarCurr(AValor: Currency): Currency;
begin
  Result := (Trunc((AValor)*100)/100);
end;

initialization
  Formatacoes := TFormatacoes.Create;
finalization
  Formatacoes.Free;
end.
