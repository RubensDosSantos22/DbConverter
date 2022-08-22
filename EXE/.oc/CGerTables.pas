unit CGerTables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, ShellAPI, FileCtrl;

type
  TGERENCIADIRETORIOS = class(TForm)
    NavGerDir: TGroupBox;
    IrAGSINNER: TBitBtn;
    IrPastas: TBitBtn;
    GroupMpadrao: TGroupBox;
    GroupTabelas: TGroupBox;
    LabelCaminhoTabelas: TLabel;
    VerificaTabelas: TBitBtn;
    ListaTabelas: TMemo;
    CaminhoTabelas: TEdit;
    BtAGSSAT: TBitBtn;
    Pastas: TDirectoryListBox;
    CaminhoAGS_ORIGEM: TEdit;
    LabelAGS_ORIGEM: TLabel;
    Empresa: TEdit;
    Label1: TLabel;
    CD: TLabel;
    EdtCdEmpresa: TEdit;
    LabelAGSORIGEM: TLabel;
    CaminhoAGSORIGEM: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GERENCIADIRETORIOS: TGERENCIADIRETORIOS;

implementation

{$R *.dfm}

end.
