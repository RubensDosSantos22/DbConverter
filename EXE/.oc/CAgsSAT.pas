unit CAgsSAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, INIFiles, Buttons, DB, DBTables, IBDatabase,
  IBCustomDataSet, IBQuery, ShellAPI, Registry, Mask, ToolEdit;

type
  TAGSSAT = class(TForm)
    SEARCHDATA: TGroupBox;
    RESULTS: TGroupBox;
    MMDATA: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    LOGO: TEdit;
    USARFORTES: TEdit;
    LARGURA: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GERAL: TGroupBox;
    EXTRATO: TGroupBox;
    REDE: TGroupBox;
    SWH: TGroupBox;
    MODELO: TEdit;
    ARQLOG: TEdit;
    NOMEDLL: TEdit;
    CODIGOATIVACAO: TEdit;
    CODIGOUF: TEdit;
    Lbl: TLabel;
    lblFormaEmissao: TLabel;
    lblSALVAR: TLabel;
    lblLOGOMARCA: TLabel;
    lblPATHSALVAR: TLabel;
    EMIT: TGroupBox;
    PORTA: TEdit;
    PARSTRING: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    CNPJ: TEdit;
    IE: TEdit;
    REGTRIBUTARIO: TEdit;
    REGIMETRIBUTARIOISSQN: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IR: TBitBtn;
    SCNPJ: TEdit;
    ASSINATURA: TEdit;
    Label11: TLabel;
    lbl8: TLabel;
    TIPOINTER: TEdit;
    TIPOLAN: TEdit;
    SSID: TEdit;
    SEG: TEdit;
    CODIGO: TEdit;
    LANIP: TEdit;
    LANMASK: TEdit;
    LANGW: TEdit;
    LANDNS1: TEdit;
    LANDNS2: TEdit;
    USUARIO: TEdit;
    SENHA: TEdit;
    PROXY: TEdit;
    PROXYIP: TEdit;
    PROXYPORTA: TEdit;
    PROXYUSER: TEdit;
    Label12: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    btn1: TBitBtn;
    MARGEMTOPO: TEdit;
    MARGEMFUNDO: TEdit;
    MARGEMESQUERDA: TEdit;
    MARGEMDIREITA: TEdit;
    Lbl24: TLabel;
    Lbl25: TLabel;
    Lbl26: TLabel;
    Lbl27: TLabel;
    PREVIEW: TEdit;
    Lbl28: TLabel;
    NUMEROCAIXA: TEdit;
    AMBIENTE: TEdit;
    PAGINADECODIGO: TEdit;
    VERSAODADOS: TEdit;
    Lbl29: TLabel;
    Lbl30: TLabel;
    Lbl31: TLabel;
    Lbl32: TLabel;
    FORMATARXML: TEdit;
    Lbl33: TLabel;
    PRINTER: TGroupBox;
    NAME: TEdit;
    Lbl34: TLabel;
    INDRATLISSQN: TEdit;
    Lbl35: TLabel;
    SALVAREM: TEdit;
    Lbl36: TLabel;
    PROXYSENHA: TEdit;
    Lbl3: TLabel;
    IM: TEdit;
    Label5: TLabel;
    DbSAT: TDatabase;
    QrSAT: TQuery;
    EdtCaminhoIniSat: TFilenameEdit;
    procedure IRClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure EdtCaminhoIniSatButtonClick(Sender: TObject);
    procedure EdtCaminhoIniSatChange(Sender: TObject);
  private
     Trava: Boolean;
  public
    { Public declarations }
  end;

var
  AGSSAT: TAGSSAT;

implementation

{$R *.dfm}

procedure TAGSSAT.IRClick(Sender: TObject);
  var
    arq: TextFile;
    linha: string;
    ArqIni: TIniFile;
begin
  MMDATA.Clear;

  AssignFile(arq, EdtCaminhoIniSat.Text);
  ArqIni := TIniFile.Create(EdtCaminhoIniSat.Text);

  {$I-}
  Reset(arq);
  {$I+}

  if (IOResult <> 0)
     then MMDATA.Lines.Add('Erro na abertura do arquivo !!!')
  else begin
         while (not eof(arq)) do
         begin
           readln(arq, linha);

           MMDATA.Lines.Add(linha);
         end;

         CloseFile(arq);
       end;

      LOGO.Text:= ArqIni.ReadString('Fortes', 'Logo', '');
      USARFORTES.Text:= ArqIni.ReadString('Fortes', 'UsarFortes', '');
      LARGURA.Text:= ArqIni.ReadString('Fortes', 'Largura', '');
      MARGEMTOPO.Text:= ArqIni.ReadString('Fortes', 'MargemTopo', '');
      MARGEMFUNDO.Text:= ArqIni.ReadString('Fortes', 'MargemFundo', '');
      MARGEMESQUERDA.Text:= ArqIni.ReadString('Fortes', 'MargemEsquerda', '');
      MARGEMDIREITA.Text:= ArqIni.ReadString('Fortes', 'MargemDireita', '');
      PREVIEW.Text:= ArqIni.ReadString('Fortes', 'Preview', '');
      MODELO.Text:= ArqIni.ReadString('SAT', 'Modelo', '');
      ARQLOG.Text:= ArqIni.ReadString('SAT', 'ArqLog', '');
      NOMEDLL.Text:= ArqIni.ReadString('SAT', 'NomeDLL', '');
      CODIGOATIVACAO.Text:= ArqIni.ReadString('SAT', 'CodigoAtivacao', '');
      CODIGOUF.Text:= ArqIni.ReadString('SAT', 'CodigoUF', '');
      NUMEROCAIXA.Text:= ArqIni.ReadString('SAT', 'NumeroCaixa', '');
      AMBIENTE.Text:= ArqIni.ReadString('SAT', 'Ambiente', '');
      PAGINADECODIGO.Text:= ArqIni.ReadString('SAT', 'PaginaDeCodigo', '');
      VERSAODADOS.Text:= ArqIni.ReadString('SAT', 'versaoDadosEnt', '');
      FORMATARXML.Text:= ArqIni.ReadString('SAT', 'FormatarXML', '');
      PORTA.Text:= ArqIni.ReadString('Extrato', 'Porta', '');
      PARSTRING.Text:= ArqIni.ReadString('Extrato', 'ParamsString', '');

      if PARSTRING.Text = '' then
        begin
          PARSTRING.Text:= '-1';
        end;

      CNPJ.Text:= ArqIni.ReadString('Emit', 'CNPJ', '');
      IE.Text:= ArqIni.ReadString('Emit', 'IE', '');
      IM.Text:= ArqIni.ReadString('Emit', 'IM', '');
      REGTRIBUTARIO.Text:= ArqIni.ReadString('Emit', 'RegTributario', '');
      REGIMETRIBUTARIOISSQN.Text:= ArqIni.ReadString('Emit', 'RegTribISSQN', '');
      INDRATLISSQN.Text:= ArqIni.ReadString('Emit', 'IndRatISSQN', '');
      SALVAREM.Text:= ArqIni.ReadString('Emit', 'SalvarEm', '');
      SCNPJ.Text:= ArqIni.ReadString('SwH', 'CNPJ', '');
      ASSINATURA.Text:= ArqIni.ReadString('SwH', 'Assinatura', '');
      NAME.Text:= ArqIni.ReadString('Printer', 'Name', '');
      TIPOINTER.Text:= ArqIni.ReadString('Rede', 'tipoInter', '');
      TIPOLAN.Text:= ArqIni.ReadString('Rede', 'tipoLan', '');
      SSID.Text:= ArqIni.ReadString('Rede', 'SSID', '');
      SEG.Text:= ArqIni.ReadString('Rede', 'seg', '');
      CODIGO.Text:= ArqIni.ReadString('Rede', 'codigo', '');
      LANIP.Text:= ArqIni.ReadString('Rede', 'lanIP', '');
      LANMASK.Text:= ArqIni.ReadString('Rede', 'lanMask', '');
      LANGW.Text:= ArqIni.ReadString('Rede', 'lanGW', '');
      LANDNS1.Text:= ArqIni.ReadString('Rede', 'lanDNS1', '');
      LANDNS2.Text:= ArqIni.ReadString('Rede', 'lanDNS2', '');
      USUARIO.Text:= ArqIni.ReadString('Rede', 'usuario', '');
      SENHA.Text:= ArqIni.ReadString('Rede', 'senha', '');
      PROXY.Text:= ArqIni.ReadString('Rede', 'proxy', '');
      PROXYIP.Text:= ArqIni.ReadString('Rede', 'proxy_ip', '');
      PROXYPORTA.Text:= ArqIni.ReadString('Rede', 'proxy_porta', '');
      PROXYUSER.Text:= ArqIni.ReadString('Rede', 'proxy_user', '');
      PROXYSENHA.Text:= ArqIni.ReadString('Rede', 'proxy_senha', '');
      ArqIni.Free;



end;

procedure TAGSSAT.btn1Click(Sender: TObject);
var

Arq : TextFile;
Linha : string;

begin

  QrSAT.Close;
  QrSAT.SQL.Clear;
  QrSAT.SQL.Text:= 'SELECT * FROM AGSINI';
  QrSAT.Open;
  {if (QrSAT.Eof = True)then begin
  QrSAT.SQL.Text:= 'INSERT INTO AGSINI (EMPRESA) VALUES (1)';
  QrSAT.ExecSQL;
  end;}
  QrSAT.Close;
  QrSAT.SQL.Clear;
  QrSAT.SQL.Text:=       'UPDATE AGSINI SET SATMODEL = ' + '''' + MODELO.Text + '''' + ', SATARQLG = ' + '''' + ARQLOG.Text + '''' + ', SATNODLL = ' + '''' + NOMEDLL.Text + '''' + ', SATCODAT = ' + '''' + CODIGOATIVACAO.Text + '''' + ', SATCODUF = ' + '''' + CODIGOUF.Text + '''' + ', SATNUMCX = ' + '''' + NUMEROCAIXA.Text + '''' + ', SATAMBIE = ' + '''' + AMBIENTE.Text + '''' + ', '+
                         'SATPAGCD = ' + '''' + PAGINADECODIGO.Text + '''' + ', SATVERSA = ' + '''' + VERSAODADOS.Text + '''' + ', SATFTXML = ' + '''' + FORMATARXML.Text + '''' + ', SATPORTA = ' + '''' + PORTA.Text + '''' + ', SATPARST = ' + '''' + PARSTRING.Text + '''' + ', SATECNPJ = ' + '''' + CNPJ.Text + '''' + ', SATEINSC = ' + '''' + IE.Text + '''' + ',           '+
                         'SATEIM = ' + '''' + IM.Text + '''' + ', SATREGTR = ' + '''' + REGTRIBUTARIO.Text + '''' + ', SATREGIS = ' + '''' + REGIMETRIBUTARIOISSQN.Text + '''' + ', SATRATIS = ' + '''' + INDRATLISSQN.Text + '''' + ', SATSALV = ' + '''' + SALVAREM.Text + '''' + ', SATSCNPJ = ' + '''' + SCNPJ.Text + '''' + ', ASSINSAT = ' + '''' + ASSINATURA.Text + '''' + ',           '+
                         'SATFUSAR = ' + '''' + USARFORTES.Text + '''' + ', SATFLARG = ' + '''' + LARGURA.Text + '''' + ', SATFMTOP = ' + '''' + MARGEMTOPO.Text + '''' + ', SATFMFUN = ' + '''' + MARGEMFUNDO.Text + '''' + ', SATFMDIR = ' + '''' + MARGEMDIREITA.Text + '''' + ', SATFMESQ = ' + '''' + MARGEMESQUERDA.Text + '''' + ', SATFPREV = ' + '''' + PREVIEW.Text + '''' + ',        '+
                         'SATFLOGO = ' + '''' + LOGO.Text + '''' + ', SATPNOME = ' + '''' + NAME.Text + '''' + ', SATRTINT = ' + '''' + TIPOINTER.Text + '''' + ', SATRTLAN = ' + '''' + TIPOLAN.Text + '''' + ', SATRSSID = ' + '''' + SSID.Text + '''' + ', SATRSEG = ' + '''' + SEG.Text + '''' + ', SATRCODI = ' + '''' + CODIGO.Text + '''' + ',         '+
                         'SATRLIP = ' + '''' + LANIP.Text + '''' + ', SATRLMAS = ' + '''' + LANMASK.Text + '''' + ', SATRLGW = ' + '''' + LANGW.Text + '''' + ', SATRDNS1 = ' + '''' + LANDNS1.Text + '''' + ', SATRDNS2 = ' + '''' + LANDNS2.Text + '''' + ', SATRUSUA = ' + '''' + USUARIO.Text + '''' + ', SATRSENH = ' + '''' + SENHA.Text + '''' + ',          '+
                         'SATRPROX = ' + '''' + PROXY.Text + '''' + ', SATRPRIP = ' + '''' + PROXYIP.Text + '''' + ', SATRPPOR = ' + '''' + PROXYPORTA.Text + '''' + ', SATRPUSR = ' + '''' + PROXYUSER.Text + '''' + ', SATRPPAS = ' + '''' + PROXYSENHA.Text + '''' + '';

  QrSAT.ExecSQL;
  QrSAT.Close;

  ShowMessage('Configura��o do AGSSAT Finalizada. Tenha um bom dia');

end;


procedure TAGSSAT.EdtCaminhoIniSatButtonClick(Sender: TObject);
begin
  Trava:= False;
end;

procedure TAGSSAT.EdtCaminhoIniSatChange(Sender: TObject);
var
  Arquivo: string;
begin
  {if Trava = False then
    begin
      Arquivo:= Copy(EdtCaminhoIniSat.Text, 2, length(EdtCaminhoIniSat.Text)-2);
      Trava:= True;
      EdtCaminhoIniSat.Text:= Arquivo;
    end;}
end;

end.
