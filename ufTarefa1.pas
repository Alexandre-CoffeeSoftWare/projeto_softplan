unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    mnTabelas: TMemo;
    mnColunas: TMemo;
    mnCondicoes: TMemo;
    mnSqlGerado: TMemo;
    lbColunas: TLabel;
    lbTabelas: TLabel;
    lbCondicoes: TLabel;
    lbSqlGerado: TLabel;
    Button1: TButton;
    spQuery1: TspQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure CarrgarSQL;
  public
    {Padrão inicialização por chamada unica}
    class procedure ApresentaTarefa;
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

class procedure TfTarefa1.ApresentaTarefa;
begin
  if not Assigned(fTarefa1) then
  begin
    fTarefa1 := TfTarefa1.Create(Application);
    fTarefa1.FormStyle := fsMDIChild;
    fTarefa1.Show;
  end;
end;

procedure TfTarefa1.CarrgarSQL;
begin
  spQuery1.spTabelas.Text   := mnTabelas.Lines.Text;
  spQuery1.spColunas.Text   := mnColunas.Lines.Text;
  spQuery1.spCondicoes.Text := mnCondicoes.Lines.Text;
end;

procedure TfTarefa1.Button1Click(Sender: TObject);
begin
  CarrgarSQL;
  spQuery1.GeraSQL;
  mnSqlGerado.Clear;

  {Apresenta sql gerado}
  mnSqlGerado.Lines.AddStrings( spQuery1.SQL );
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  fTarefa1 := nil;
end;

end.
