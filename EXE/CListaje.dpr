program CListaje;

uses
  Forms,
  CPrincipal in 'CPrincipal.pas' {INDEX},
  CConfere in 'CConfere.pas' {INDEX},
  CAgsINI in 'CAgsINI.pas' {INDEX},
  CAgsSAT in 'CAgsSAT.pas' {INDEX};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DB CONVERTER';
  Application.Run;
end.
