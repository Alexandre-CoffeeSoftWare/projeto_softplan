program ProvaDelphiApp;

uses
  Vcl.Forms,
  fmain in 'fmain.pas' {fmMain},
  uspQuery in 'component\uspQuery.pas',
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {ufTarefa2},
  uThreadTarefa2 in 'uThreadTarefa2.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  uRotinas in 'uRotinas.pas',
  uInterfaceTarefa3 in 'uInterfaceTarefa3.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
