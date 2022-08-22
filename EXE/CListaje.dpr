program CListaje;

uses
  Forms,
  CPrincipal in '.oc\CPrincipal.pas' {INDEX},
  CGerTables in '.oc\CGerTables.pas' {INDEX},
  CProgramas in '.oc\CProgramas.pas' {INDEX},
  UUpdatedApConv in '.oc\UUpdatedApConv.pas' {INDEX},
  CConfere in '.oc\CConfere.pas' {INDEX},
  CAgsINI in '.oc\CAgsINI.pas' {INDEX},
  CAgsSAT in '.oc\CAgsSAT.pas' {INDEX};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DB CONVERTER';
  Application.CreateForm(TINDEX, INDEX);
  Application.Run;
end.
