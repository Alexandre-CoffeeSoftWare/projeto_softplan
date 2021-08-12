program ProvaDelphiAppTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestufTarefa1 in 'TestufTarefa1.pas',
  ufTarefa1 in '..\ufTarefa1.pas',
  TestufTarefa3 in 'TestufTarefa3.pas',
  ufTarefa3 in '..\ufTarefa3.pas',
  uInterfaceTarefa3 in '..\uInterfaceTarefa3.pas',
  uRotinas in '..\uRotinas.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

