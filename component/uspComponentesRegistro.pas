unit uspComponentesRegistro;

interface

uses
  System.SysUtils, System.Classes, uspQuery;

type
  TInstallSpQuery = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.
