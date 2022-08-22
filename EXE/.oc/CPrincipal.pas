unit CPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, UrlMon, Grids, ShellAPI, MSHTML,
  ExtCtrls, FileCtrl, DB, DBTables;

type
  TINDEX = class(TForm)
    PnlHeader: TPanel;
    PnlButtons: TPanel;
    IrIBExpert: TBitBtn;
    IrDataPump: TBitBtn;
    IrBDE: TBitBtn;
    IrODBC: TBitBtn;
    IrConfere: TBitBtn;
    IrPaint: TBitBtn;
    PnlTrabalho: TPanel;
    CaminhoAGS_ORIGEM: TEdit;
    LabelAGS_ORIGEM: TLabel;
    Empresa: TEdit;
    Label1: TLabel;
    CD: TLabel;
    EdtCdEmpresa: TEdit;
    LabelAGSORIGEM: TLabel;
    CaminhoAGSORIGEM: TEdit;
    ListaTabelas: TMemo;
    CaminhoTabelas: TEdit;
    Pastas: TDirectoryListBox;
    VerificaTabelas: TBitBtn;
    IrPastas: TBitBtn;
    IrAGSINNER: TBitBtn;
    BtAGSSAT: TBitBtn;
    QryMPADRAO: TQuery;
    QryMPADRAOAGSORIGEM: TStringField;
    QryMPADRAOAGS_ORIGEM: TStringField;
    QryMPADRAOCD: TStringField;
    QryMPADRAOEMPRESA: TStringField;
    procedure BtIrUpdatesClick(Sender: TObject);
    procedure IrIBExpertClick(Sender: TObject);
    procedure IrDataPumpClick(Sender: TObject);
    procedure IrBDEClick(Sender: TObject);
    procedure IrODBCClick(Sender: TObject);
    procedure IrConfereClick(Sender: TObject);
    procedure IrPaintClick(Sender: TObject);
    procedure BtGerenciarDiretoriosClick(Sender: TObject);
    procedure IrPastasClick(Sender: TObject);
    procedure BtAGSSATClick(Sender: TObject);
    procedure IrAGSINNERClick(Sender: TObject);
    procedure PastasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VerificaTabelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INDEX: TINDEX;

implementation

uses CGerTables, CProgramas, UUpdatedApConv, CConfere, CAgsINI, CAgsSAT;

{$R *.dfm}

procedure TINDEX.BtIrUpdatesClick(Sender: TObject);
begin
  FrUpdatesApConversao.Show;
end;

procedure TINDEX.IrIBExpertClick(Sender: TObject);
begin
  WinExec('C:\Program Files (x86)\HK-Software\IBExpert\IBExpert.exe', sw_show);
end;

procedure TINDEX.IrDataPumpClick(Sender: TObject);
begin
  WinExec('C:\ConversorDataDump\DataPump\datapump.exe', sw_show);
end;

procedure TINDEX.IrBDEClick(Sender: TObject);
begin
  WinExec('C:\Program Files (x86)\Common Files\Borland Shared\BDE\BDEADMIN.EXE', sw_show);
end;

procedure TINDEX.IrODBCClick(Sender: TObject);
begin
  WinExec('C:\Windows\syswow64\odbcad32.exe', sw_show);
end;

procedure TINDEX.IrConfereClick(Sender: TObject);
begin
  CONFERE:= TCONFERE.Create(Self);
  CONFERE.Show;
end;

procedure TINDEX.IrPaintClick(Sender: TObject);
begin
  WinExec('C:\Windows\system32\mspaint.exe', sw_show);
end;

procedure TINDEX.BtGerenciarDiretoriosClick(Sender: TObject);
begin
  GERENCIADIRETORIOS.Show;
end;

procedure TINDEX.IrPastasClick(Sender: TObject);
begin
  ShellExecute(Handle, 'explore', PChar('D:\ConversoresFDB'), nil, nil, SW_MAXIMIZE);
  ShellExecute(Handle, 'explore', PChar('\\192.168.0.10\Dados Clientes'), nil, nil, SW_MAXIMIZE);
  ShellExecute(Handle, 'explore', PChar('D:\TABELAS_BORRACHA'), nil, nil, SW_MAXIMIZE);
end;

procedure TINDEX.BtAGSSATClick(Sender: TObject);
begin
  AGSSAT:= TAGSSAT.Create(Self);
  AGSSAT.Show;
end;

procedure TINDEX.IrAGSINNERClick(Sender: TObject);
begin
  AGSINI:= TAGSINI.Create(Self);
  AGSINI.Show;
end;

procedure TINDEX.PastasChange(Sender: TObject);
begin
  CaminhoTabelas.Text:= Pastas.Directory;
end;

procedure TINDEX.FormShow(Sender: TObject);
begin
  QryMPADRAO.Close;
  QryMPADRAO.Open;
  CaminhoAGSORIGEM.Text:= QryMPADRAOAGSORIGEM.Value;
  CaminhoAGS_ORIGEM.Text:= QryMPADRAOAGS_ORIGEM.Value;
  EdtCdEmpresa.Text:= QryMPADRAOCD.AsString;
  Empresa.Text:= QryMPADRAOEMPRESA.AsString;
  ListaTabelas.Clear;
  CaminhoTabelas.SetFocus;

  if DirectoryExists('D:\ConversoresFDB')then
    begin
      Pastas.Directory    := 'D:\ConversoresFDB';
      CaminhoTabelas.Text := 'D:\ConversoresFDB';
    end;

end;

procedure TINDEX.VerificaTabelasClick(Sender: TObject);
var
  Arq: TextFile;
  F: TSearchRec;
  Ret, anos, num, i: Integer;
  Atual: string;
  Destino: string;
begin

  ListaTabelas.Clear;
  Ret := FindFirst(CaminhoTabelas.Text + '\\*.*', faAnyFile, F);
  Atual:= CaminhoTabelas.Text + '\' + F.Name;
  Destino:= CaminhoTabelas.Text + '\RECICLAGEM\' + F.Name;

  if not(DirectoryExists(CaminhoTabelas.Text + '\RECICLAGEM')) then begin
    CreateDir(CaminhoTabelas.Text + '\RECICLAGEM');
  end;

  try
    while Ret = 0 do
    begin

      Ret := FindNext(F);
      Atual:= CaminhoTabelas.Text + '\' + F.Name;
      Destino:= CaminhoTabelas.Text + '\RECICLAGEM\' + F.Name;
      AssignFile(Arq,PChar(Atual));
      RenameFile(PChar(Atual), PChar(UpperCase(Atual)));

      for anos:= 1995 to 2030 do
      begin

        if (Pos(IntToStr(anos),F.Name) > 0)then
        begin
          MoveFile(PChar(Atual), PChar(Destino));
        end;

      end;

      for num:= 0 to 35 do
      begin

        if (Pos(IntToStr(num) +'.ini',F.Name) > 0) or (Pos('-'+ IntToStr(num) +'-',F.Name) > 0) or (Pos('('+ IntToStr(num) +')',F.Name) > 0) or
           (Pos('_0'+ IntToStr(num),F.Name) > 0) then
        begin
          MoveFile(PChar(Atual), PChar(Destino));
        end;

      end;

      if (Pos('ERRADO',F.Name) > 0) or (Pos('_.DBF',F.Name) > 0) or (Pos('.TXT',F.Name) > 0) or (Pos('.EXE',F.Name) > 0) or
         (Pos('.NDX',F.Name) > 0) or (Pos('.NTX',F.Name) > 0) or (Pos('CÓPIA',F.Name) > 0) or
         (Pos('DBDWORK',F.Name) > 0) or (Pos('BKP',F.Name) > 0) or (Pos('BACKUP',F.Name) > 0) or (Pos('.PDF',F.Name) > 0) or
         (Pos('.DLL',F.Name) > 0) or (Pos('.CONF',F.Name) > 0) or (Pos('BKP',F.Name) > 0) or (Pos('.JPG',F.Name) > 0) or
         (Pos('.JPEG',F.Name) > 0) or (Pos('BMP',F.Name) > 0) or (Pos('PNG',F.Name) > 0) or (Pos('.ICO',F.Name) > 0) or
         (Pos('.PFX',F.Name) > 0) or (Pos('.EXT',F.Name) > 0) or (Pos('.TMP',F.Name) > 0) or (Pos('CARTACOR',F.Name) > 0) or
         (Pos('QSQL',F.Name) > 0) or (Pos('.OBJ',F.Name) > 0) or (Pos('.SQL',F.Name) > 0) or (Pos('.PRG',F.Name) > 0) or
         (Pos('~PR',F.Name) > 0) or (Pos('__',F.Name) > 0) or (Pos('IMAGENS',F.Name) > 0) or (Pos('PDF',F.Name) > 0) or
         (Pos('.TV',F.Name) > 0) or (Pos('_.INI',F.Name) > 0) or (Pos('.ZIP',F.Name) > 0) or
         (Pos('.DOC',F.Name) > 0) or (Pos('.XSLX',F.Name) > 0) or (Pos('.CSV',F.Name) > 0) or (Pos('.ALL',F.Name) > 0) or
         ((ExtractFileExt(F.Name) = '') and not(Pos('exp',F.Name) > 0) and not(Pos('copia.BAT',F.Name) > 0) and not(Pos('EXP',F.Name) > 0)) or
         (Pos('.RAR',F.Name) > 0) or (Pos('VERMELHO',F.Name) > 0) or
         (Pos(' ',F.Name) > 0)then
      begin

           MoveFile(PChar(Atual), PChar(Destino));

      end;

      ListaTabelas.Lines.Add(F.Name);

   end;
  finally
  begin
    FindClose(F);
  end;
  end;

end;


end.
