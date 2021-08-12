unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, uInterfaceTarefa3;

type
  TfTarefa3 = class(TForm, IIntefaceTarefa3)
    gridDados: TDBGrid;
    edtTotal: TEdit;
    btnObterTotal: TButton;
    edtTotalDivisoes: TEdit;
    lbTotal: TLabel;
    Label2: TLabel;
    btnObterDivisao: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterDivisaoClick(Sender: TObject);
  private
    FClientDados      : TClientDataSet;
    FDataScDados      : TDataSource;
    function CriarDataSets: Boolean;
    procedure CarregarDados(AQryDados: TClientDataSet);
    procedure GerarTotal(AQryDados: TClientDataSet);
    procedure GerarTotalDivisao(AQryDados: TClientDataSet);
    procedure ValidaClients;
  public
    class procedure ApresentaTarefa;
    property ClientDados: TClientDataSet read FClientDados;
  end;

var
  fTarefa3: TfTarefa3;

implementation

uses
  uRotinas;

{$R *.dfm}

procedure TfTarefa3.ValidaClients;
begin
  if not FClientDados.Active then
    raise Exception.Create('Não foi possivél carregados os dados da consulta, '+
                           'por favor reiniciar a consulta!');
end;

procedure TfTarefa3.GerarTotal(AQryDados: TClientDataSet);
var
  valorAcumular : Currency;
  fieldValor    : TField;
begin
  ValidaClients;

  fieldValor := AQryDados.FieldByName('Valor');

  AQryDados.DisableControls;
  try
    valorAcumular := 0;

    AQryDados.First;

    while not AQryDados.Eof do
    begin
      valorAcumular := valorAcumular + fieldValor.AsCurrency;

      AQryDados.Next;
    end;
  finally
    AQryDados.EnableControls;
  end;

  edtTotal.Text := FormatCurr('#,##0.00', valorAcumular);
end;

class procedure TfTarefa3.ApresentaTarefa;
begin
  fTarefa3 := TfTarefa3.Create(Application);
  fTarefa3.FormStyle := fsMDIChild;
  fTarefa3.Show;
end;

procedure TfTarefa3.btnObterTotalClick(Sender: TObject);
begin
  GerarTotal(FClientDados);
end;

procedure TfTarefa3.GerarTotalDivisao(AQryDados: TClientDataSet);
var
  valorAcumular : Currency;
  valorAnterior : Currency;
  valorReal     : Currency;
  fieldValor    : TField;
begin
  ValidaClients;

  fieldValor := AQryDados.FieldByName('Valor');

  AQryDados.DisableControls;
  try
    valorAcumular := 0;
    valorAnterior := 0;

    AQryDados.First;

    while not AQryDados.Eof do
    begin
      AQryDados.Next;

      {Arredondamento por valor monetario}
      if (fieldValor.AsCurrency > 0) then
      begin
        valorReal     := Formatacoes.ArredondarCurr(valorAnterior / fieldValor.AsCurrency);
        valorAcumular := valorAcumular + valorReal;
      end;

      valorAnterior := fieldValor.AsCurrency;
    end;
  finally
    AQryDados.EnableControls;
  end;

  edtTotalDivisoes.Text := FormatCurr('#,##0.00', valorAcumular);
end;

procedure TfTarefa3.btnObterDivisaoClick(Sender: TObject);
begin
  GerarTotalDivisao(FClientDados);
end;

function TfTarefa3.CriarDataSets: Boolean;
begin
  Result       := False;
  FClientDados := TClientDataSet.Create( Self );
  FDataScDados := TDataSource.Create( Self );
  try
    FClientDados.FieldDefs.Add('idProduto',   ftInteger);
    FClientDados.FieldDefs.Add('NomeProjeto', ftString, 100);
    FClientDados.FieldDefs.Add('Valor',       ftCurrency);

    FClientDados.CreateDataSet;

    Result := True;
  except
    on e: exception do
      Application.MessageBox('Não foi possivel iniciar o objeto dataset',
                             'Erro', MB_ICONERROR);
  end;
end;

procedure TfTarefa3.CarregarDados(AQryDados: TClientDataSet);
var
  recRegistro      : integer;
  fieldIdProduto   : TField;
  fieldNomeProduto : TField;
  fieldValor       : TField;
begin
  try
    if not AQryDados.Active then
      AQryDados.Open;

    fieldIdProduto   := AQryDados.FieldByName('IdProduto');
    fieldNomeProduto := AQryDados.FieldByName('NomeProjeto');
    fieldValor       := AQryDados.FieldByName('Valor');

    AQryDados.DisableControls;
    try

      for recRegistro := 1 to 10 do
      begin
        AQryDados.Append;

        fieldIdProduto.AsInteger  := recRegistro;
        fieldNomeProduto.AsString := 'Projeto ' + recRegistro.ToString;
        fieldValor.AsCurrency     := Random(100);

        AQryDados.Post;
      end;

    finally
      AQryDados.EnableControls;
    end;

  except
    on e : exception do
    begin
      Application.MessageBox(pWideChar('Erro ao carregar dados:'#13#10 +
                             e.message), 'Erro', MB_ICONERROR);
      Close;
    end;
  end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  if CriarDataSets then
  try
    FDataScDados.DataSet := FClientDados;
    gridDados.DataSource := FDataScDados;

    CarregarDados(FClientDados);
  except
    on e: exception do
      Application.MessageBox(pWideChar('Erro ao iniciar a consulta:'#13#10 +
                             e.Message), 'Erro', MB_ICONERROR);
  end;
end;

end.
