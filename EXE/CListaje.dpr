program CListaje;

uses
  Forms,
  CPrincipal in 'CPrincipal.pas' {INDEX};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DB CONVERTER';
  Application.CreateForm(TINDEX, INDEX);
  Application.Run;
end.
