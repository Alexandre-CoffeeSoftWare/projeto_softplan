unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  uThreadTarefa2;

type
  TfTarefa2 = class(TForm)
    pnEvento: TPanel;
    prog2: TProgressBar;
    btnIniciaContagem: TButton;
    prog1: TProgressBar;
    pnConfig: TPanel;
    edtTempo1: TEdit;
    edtTempo2: TEdit;
    lbTempo1: TLabel;
    lbTempo2: TLabel;
    lbMili1: TLabel;
    Label1: TLabel;
    procedure btnIniciaContagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FIniThreads   : integer;
    procedure ValidaTempo;
    procedure ThreadModelo2(AMiliSegundos: SmallInt);
  public
    class procedure ApresentaTarefa;
    procedure OnTerminaThread(ASender: TObject);
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  Threading;

{$R *.dfm}

procedure TfTarefa2.ThreadModelo2(AMiliSegundos: SmallInt);
var
  taskProgress: ITask;
begin
  try
    taskProgress := TTask.Create(
      {Processo anomimo}
      procedure
      var
        countLoop    : Integer;
        miliSegundos : Integer;
      begin
        prog2.Max      := 100;
        prog2.Position := 0;
        countLoop      := 0;
        miliSegundos   := AMiliSegundos;
        while not Application.Terminated do//envita o bug de ao fechar a tela
        begin
          INC( countLoop );
          {Ao chegar ao final }
          if countLoop > 100 then
            Break;
          {Espera do loop}
          TThread.Sleep( miliSegundos );
          {Sincroniza parte visual do progresso da tela}
          TThread.Synchronize(TThread.Current,
          procedure
          begin
            prog2.Position := countLoop;
            if countLoop = 100 then
              OnTerminaThread(Self);
          end);
        end;
      end );

    taskProgress.Start;
  except
    on e: exception do
      Application.MessageBox(pWideChar('Ñão foi possível iniciar a Thread ' +
                                       'modelo 2:'#13#10 + e.Message),
                                       'Atenção', MB_ICONERROR);
  end;
end;

procedure TfTarefa2.OnTerminaThread(ASender: TObject);
begin
  Dec( FIniThreads );

  if FIniThreads = 0 then
    btnIniciaContagem.Enabled := True;
end;

class procedure TfTarefa2.ApresentaTarefa;
begin
  fTarefa2 := TfTarefa2.Create(Application);
  fTarefa2.FormStyle := fsMDIChild;
  fTarefa2.Show;
end;

procedure TfTarefa2.ValidaTempo;
 const msgValida = 'Digite um valor maior que zero para o tempo do contador %d';
begin
  if StrToIntDef(edtTempo1.Text, 0) = 0 then
  begin
    edtTempo1.SetFocus;
    raise Exception.Create( Format(msgValida, [1]) );
  end;

  if StrToIntDef(edtTempo2.Text, 0) = 0 then
  begin
    edtTempo2.SetFocus;
    raise Exception.Create( Format(msgValida, [2]) );
  end;

  FIniThreads := 2;
  btnIniciaContagem.Enabled := False;
end;

procedure TfTarefa2.btnIniciaContagemClick(Sender: TObject);
var
  threadTarefa2 : TThereadTarefa2;
begin
  ValidaTempo;

  {Modelo 1 de tthread com object/ auto destroy ao finalizar}
  threadTarefa2 := TThereadTarefa2.Create( prog1 );
  threadTarefa2.Iniciar( StrToInt(edtTempo1.Text) );
  threadTarefa2.OnTerminar := OnTerminaThread;

  {Modelo 2 de thread com função anonima}
  ThreadModelo2( StrToInt(edtTempo2.Text) );
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FIniThreads > 0 then
    raise Exception.Create('Aguarde finalizar o processo!');

  Action   := caFree;
  fTarefa2 := nil;
end;

end.
