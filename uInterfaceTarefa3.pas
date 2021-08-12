unit uInterfaceTarefa3;

interface

uses
  Datasnap.DBClient;

{Padrão de trabalho com dados}
type
  IIntefaceTarefa3 = interface
    function CriarDataSets: Boolean;
    procedure CarregarDados(AQryDados: TClientDataSet);
    procedure GerarTotal(AQryDados: TClientDataSet);
    procedure GerarTotalDivisao(AQryDados: TClientDataSet);
  end;

implementation

end.
