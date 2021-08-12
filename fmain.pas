unit fmain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls;

type
  TfmMain = class(TForm)
    MainMenu1: TMainMenu;
    mnTarefa: TMenuItem;
    mnTarefa1: TMenuItem;
    mnTarefa2: TMenuItem;
    mnTarefa3: TMenuItem;
    procedure mnTarefa1Click(Sender: TObject);
    procedure mnTarefa2Click(Sender: TObject);
    procedure mnTarefa3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  uFTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TfmMain.mnTarefa1Click(Sender: TObject);
begin
  TfTarefa1.ApresentaTarefa;
end;

procedure TfmMain.mnTarefa2Click(Sender: TObject);
begin
  TfTarefa2.ApresentaTarefa;
end;

procedure TfmMain.mnTarefa3Click(Sender: TObject);
begin
  TfTarefa3.ApresentaTarefa;
end;

end.
