unit uThreadTarefa2;

interface

uses
  windows, messages, Classes, Vcl.ComCtrls, Forms;

type
  TThereadTarefa2 = class(TThread)
  private
    FCountLoop   : SmallInt;
    FProgressBar : TProgressBar;
    FStopMiliSec : SmallInt;
    FOnTerminar  : TNotifyEvent;
    procedure UpdateBarr;
  protected
    procedure execute;override;
  public
    constructor Create(AProgressBar: TProgressBar);reintroduce;
    procedure Iniciar(AMiliSegundos: SmallInt);
    procedure Finalizar;
  published
    property OnTerminar : TNotifyEvent read FOnTerminar write FOnTerminar;
  end;

implementation

procedure TThereadTarefa2.Finalizar;
begin
  if not Self.Terminated then
    Terminate;
end;

procedure TThereadTarefa2.Iniciar(AMiliSegundos: SmallInt);
begin
  FProgressBar.Position := 0;
  {Conversão de milisegundos}
  FStopMiliSec := AMiliSegundos;
  {Inicia a exeução}
  Start;
end;

constructor TThereadTarefa2.Create(AProgressBar: TProgressBar);
begin
  inherited Create( True );

  FreeOnTerminate       := True;
  FProgressBar          := AProgressBar;
  FProgressBar.Max      := 100;
end;

procedure TThereadTarefa2.UpdateBarr;
begin
  FProgressBar.Position := FCountLoop;
end;

procedure TThereadTarefa2.execute;
var
  countErro : integer;
begin
  countErro := 0;

  {Enqnto o processo existir}
  while not Application.Terminated and not Terminated do
  try
    {Finalliza após 5 tentativas}
    if countErro > 5 then
      Break;

    {Atualiza barra de stauts}
    Synchronize( UpdateBarr );

    {Para o tempo configurado do usuário}
    TThread.Sleep( FStopMiliSec );

    Inc( FCountLoop );

    if FCountLoop > 100 then
      Break;
  except
    INC( countErro );
  end;

  if Assigned( OnTerminar ) then
    OnTerminar( Self );

  Terminate;
end;

end.
