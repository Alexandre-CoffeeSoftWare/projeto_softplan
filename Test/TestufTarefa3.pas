unit TestufTarefa3;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, System.Variants, Data.DB, Datasnap.DBClient, Winapi.Windows,
  Vcl.Dialogs, Vcl.Grids, Vcl.Forms, uInterfaceTarefa3, Vcl.Controls, ufTarefa3,
  System.Classes, System.SysUtils, Winapi.Messages, Vcl.Graphics, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  // Test methods for class TfTarefa3

  TestTfTarefa3 = class(TTestCase)
  strict private
    FfTarefa3: TfTarefa3;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestbtnObterTotalClick;
  end;

implementation

procedure TestTfTarefa3.SetUp;
var
  recInt : integer;
begin
  FfTarefa3 := TfTarefa3.Create(Application);

  FfTarefa3.ClientDados.Close;
  FfTarefa3.ClientDados.CreateDataSet;

  for recInt := 1 to 3 do
  begin
    FfTarefa3.ClientDados.Append;
    FfTarefa3.ClientDados.FieldByName('IdProduto'  ).AsInteger := recInt;
    FfTarefa3.ClientDados.FieldByName('NomeProjeto').AsString  := 'Projeto ' + recInt.ToString;
    FfTarefa3.ClientDados.FieldByName('Valor'      ).AsCurrency:= recInt * 10;
    FfTarefa3.ClientDados.Post;
  end;
end;

procedure TestTfTarefa3.TearDown;
begin
  FfTarefa3.Free;
  FfTarefa3 := nil;
end;

procedure TestTfTarefa3.TestbtnObterTotalClick;
var
  Sender: TObject;
begin
  FfTarefa3.btnObterTotalClick(Sender);

  if FfTarefa3.edtTotal.Text <> '60,00' then
    raise Exception.Create('Opera??o de soma de dados (btnObterTotalClick)' +
                           ' est? inv?lido');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTfTarefa3.Suite);
end.

