unit CAgsINI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, INIFiles, Buttons, DB, DBTables, IBDatabase,
  IBCustomDataSet, IBQuery, ShellAPI, Registry, Mask, ToolEdit;

type
  TAGSINI = class(TForm)
    SEARCHDATA: TGroupBox;
    RESULTS: TGroupBox;
    MMDATA: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    CAMINHO: TEdit;
    SENHA: TEdit;
    NUMSERIE: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GERAL: TGroupBox;
    WEBSERVICE: TGroupBox;
    EMITENTE: TGroupBox;
    EMAIL: TGroupBox;
    DANFE: TEdit;
    FORMEMISS: TEdit;
    SALVAR: TEdit;
    LOGOMARCA: TEdit;
    PATHSALVA: TEdit;
    lblDANFE: TLabel;
    lblFormaEmissao: TLabel;
    lblSALVAR: TLabel;
    lblLOGOMARCA: TLabel;
    lblPATHSALVAR: TLabel;
    PROXY: TGroupBox;
    UF1: TEdit;
    AMBIENTE: TEdit;
    VISUALIZAR: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    HOST: TEdit;
    PORTA: TEdit;
    USER: TEdit;
    PASS: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    IR: TBitBtn;
    HOST1: TEdit;
    SSL: TEdit;
    MENSAGEM: TEdit;
    PASSWORD: TEdit;
    USER1: TEdit;
    ASSUNTO: TEdit;
    PORTA1: TEdit;
    Label11: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    RAZSOCIAL: TEdit;
    FANTASIA: TEdit;
    CNPJ: TEdit;
    IE: TEdit;
    IM: TEdit;
    CNAE: TEdit;
    FONE: TEdit;
    CEP: TEdit;
    LOGRADOURO: TEdit;
    NUMERO: TEdit;
    COMPLEMENTO: TEdit;
    BAIRRO: TEdit;
    CODCIDADE: TEdit;
    UF: TEdit;
    CIDADE: TEdit;
    SITE: TEdit;
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
    BaseINI: TDatabase;
    QrINI: TQuery;
    PESQUISAARQ: TFilenameEdit;
    procedure btn1Click(Sender: TObject);
    procedure PESQUISAARQButtonClick(Sender: TObject);
    procedure PESQUISAARQChange(Sender: TObject);
    procedure IRClick(Sender: TObject);
  private
    Trava: Boolean;
  public
    { Public declarations }
  end;

var
  AGSINI: TAGSINI;

implementation

{$R *.dfm}

procedure TAGSINI.btn1Click(Sender: TObject);
var

  Arq : TextFile;
  Linha : string;

begin

  QrINI.SQL.Clear;
  QrINI.SQL.Text:= 'SELECT * FROM AGSINI';
  QrINI.Open;

  if (QrINI.Eof = True)then
    begin
      QrINI.SQL.Text:= 'INSERT INTO AGSINI (EMPRESA) VALUES (1)';
      QrINI.ExecSQL;
    end;

  QrINI.Close;
  QrINI.SQL.Clear;
  QrINI.SQL.Text:= 'UPDATE AGSINI SET CAMINHO = ' + '''' + CAMINHO.Text + '''' + ', CTECAMINH = '+ '''' + CAMINHO.Text    + '''' + ', SENHA = '   + '''' + SENHA.Text       + '''' + ', CTESENHA = ' + '''' + SENHA.Text    + '''' + ', NUMSERIE = '  + '''' + NUMSERIE.Text    + '''' + ', DANFE = '     + '''' + DANFE.Text       + '''' + ', CTEDACTE = '+ '''' + DANFE.Text       + '''' + ', F_EMISS = '  + '''' + FORMEMISS.Text   + '''' + ', CTEF_EMIS = '+ '''' + FORMEMISS.Text  + '''' + ', LOGO = ' + '''' + LOGOMARCA.Text   + '''' + ', CTELOGO = ' + '''' + LOGOMARCA.Text + '''' + ', SALVAR = ' + '''' + SALVAR.Text + ''''
  + ', CTESALVAR = ' + '''' + SALVAR.Text     + '''' + ', PATH_SAL = '  + '''' + PATHSALVA.Text  + '''' + ', CTEPATH_S = '+ '''' + PATHSALVA.Text + '''' + ', WSUF = '      + '''' + UF1.Text      + '''' + ', CTEWSUF = '  + '''' + UF1.Text         + '''' + ', WSAMBI = '    + '''' + AMBIENTE.Text    + '''' + ', CTEWSAMBI = ' + '''' + AMBIENTE.Text  + '''' + ', WSVISUAL = '  + '''' + VISUALIZAR.Text + '''' + ', CTEWSVISU = ' + '''' + VISUALIZAR.Text + ''''
  + ', PRX_HOS = '   + '''' + HOST.Text       + '''' + ', CTEPRX_HO = ' + '''' + HOST.Text       + '''' + ', PRX_PORT = ' + '''' + PORTA.Text     + '''' + ', CTEPRX_PO = ' + '''' + PORTA.Text    + '''' + ', PRX_USER = ' + '''' + USER.Text        + '''' + ', CTEPRX_US = ' + '''' + USER.Text        + '''' + ', PRX_PASS = '  + '''' + PASS.Text      + '''' + ', CTEPRX_PA = ' + '''' + PASS.Text       + '''' + ', EM_CNPJ = '   + '''' + CNPJ.Text       + ''''
  + ', CTEEMCNPJ = ' + '''' + CNPJ.Text       + '''' + ', EM_IE = '     + '''' + IE.Text         + '''' + ', CTEEMIE = '  + '''' + IE.Text        + '''' + ', EM_IM = '     + '''' + IM.Text       + '''' + ', EM_CNAE = '  + '''' + CNAE.Text        + '''' + ', EM_RAZAO = '  + '''' + RAZSOCIAL.Text   + '''' + ', CTEEMRAZA = ' + '''' + RAZSOCIAL.Text + '''' + ', EM_FANT = '   + '''' + FANTASIA.Text   + '''' + ', CTEEMFANT = ' + '''' + FANTASIA.Text   + '''' + ', EM_FONE = '  + '''' + FONE.Text   + '''' + ', CTEEMFONE = ' + '''' + FONE.Text  + '''' + ', EM_CEP = '   + '''' + CEP.Text   + '''' + ', CTEEMCEP = '  + '''' + CEP.Text   + ''''
  + ', EM_LOGRA = '  + '''' + LOGRADOURO.Text + '''' + ', CTEEMLOGR = ' + '''' + LOGRADOURO.Text + '''' + ', EM_NUME = '  + '''' + NUMERO.Text    + '''' + ', CTEEMNUME = ' + '''' + NUMERO.Text   + '''' + ', EM_COMPL = ' + '''' + COMPLEMENTO.Text + '''' + ', CTEEMCOMP = ' + '''' + COMPLEMENTO.Text + '''' + ', EM_BAIR = '   + '''' + BAIRRO.Text    + '''' + ', CTEEMBAIR = ' + '''' + BAIRRO.Text     + '''' + ', EM_CODCI = '  + '''' + CODCIDADE.Text  + ''''
  + ', CTEEMCODC = ' + '''' + CODCIDADE.Text  + '''' + ', EM_CIDA = '   + '''' + CIDADE.Text     + '''' + ', CTEEMCIDA = '+ '''' + CIDADE.Text    + '''' + ', EM_UF = '     + '''' + UF.Text       + '''' + ', CTEEMUF = '  + '''' + UF.Text          + '''' + ', EM_SITE = '   + '''' + SITE.Text        + '''' + ', CTEEMSITE = ' + '''' + SITE.Text      + '''' + ', EMA_HOST = '  + '''' + HOST1.Text      + '''' + ', CTEEMAHOS = ' + '''' + HOST1.Text      + '''' + ', EMA_PORT = ' + '''' + PORTA1.Text + '''' + ', CTEEMAPOR = ' + '''' + PORTA1.Text + ''''+ ', EMA_USER = ' + '''' + USER1.Text + '''' + ', CTEEMAUSE = ' + '''' + USER1.Text + ''''
  + ', EMA_PASS = '  + '''' + PASSWORD.Text   + '''' + ', CTEEMAPAS = ' + '''' + PASSWORD.Text   + '''' + ', EMA_ASSU = ' + '''' + ASSUNTO.Text   + '''' + ', CTEEMAASS = ' + '''' + ASSUNTO.Text  + '''' + ', EMA_SSL = '  + '''' + SSL.Text         + '''' + ', CTEEMASSL = ' + '''' + SSL.Text         + '''' + ', EMA_MENS = '  + '''' + 'ENVIO DE NFE' + '''' + ', CTEEMAMEN = ' + '''' + 'ENVIO DE CTE'  + '''' + ', CTEVERSAO = 1'
  + ', SATEHOST = '  + '''' + HOST1.Text       + '''' + ', SATEPORT = '  + '''' + PORTA1.Text      + '''' + ', SATEUSER = ' + '''' + USER1.Text     + '''' + ', SATEPASS = '  + '''' + PASSWORD.Text + '''' + ', SATEASSU = ' + '''' + ASSUNTO.Text     + '''' + ', SATESSL = '   + '''' + SSL.Text         + '''' + ', SATEMENS = '  + '''' + 'ENVIO DE SAT' + '''';
  QrINI.ExecSQL;
  QrINI.Close;

  ShowMessage('Configura��o do AGSINI Finalizada. Tenha um bom dia');

end;

procedure TAGSINI.PESQUISAARQButtonClick(Sender: TObject);
begin
  Trava:= False;
end;

procedure TAGSINI.PESQUISAARQChange(Sender: TObject);
var
  Arquivo: string;
begin

  {if Trava = False then
    begin
      Arquivo:=  Copy(PESQUISAARQ.Text, 2, length(PESQUISAARQ.Text)-2);
      Trava:= True;
      PESQUISAARQ.Text:= Arquivo;
    end;}

end;

procedure TAGSINI.IRClick(Sender: TObject);
var
    arq: TextFile;
    linha: string;
    ArqIni: TIniFile;
begin
  MMDATA.Clear;

  AssignFile(arq, PESQUISAARQ.Text);
  ArqIni := TIniFile.Create(PESQUISAARQ.Text);

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

      CAMINHO.Text:= ArqIni.ReadString('Certificado', 'Caminho', '');
      SENHA.Text:= ArqIni.ReadString('Certificado', 'senha', '');
      NUMSERIE.Text:= ArqIni.ReadString('Certificado', 'NumSerie', '');
      DANFE.Text:= ArqIni.ReadString('Geral', 'DANFE', '');
      FORMEMISS.Text:= ArqIni.ReadString('Geral', 'FormaEmissao', '');
      SALVAR.Text:= ArqIni.ReadString('Geral', 'Salvar', '');
      LOGOMARCA.Text:= ArqIni.ReadString('Geral', 'LogoMarca', '');
      PATHSALVA.Text:= ArqIni.ReadString('Geral', 'PathSalvar', '');
      UF1.Text:= ArqIni.ReadString('WebService', 'UF', '');
      AMBIENTE.Text:= ArqIni.ReadString('WebService', 'Ambiente', '');
      VISUALIZAR.Text:= ArqIni.ReadString('WebService', 'Visualizar', '');
      HOST.Text:= ArqIni.ReadString('Proxy', 'Host', '');
      PORTA.Text:= ArqIni.ReadString('Proxy', 'Porta', '');
      USER.Text:= ArqIni.ReadString('Proxy', 'User', '');
      HOST1.Text:= ArqIni.ReadString('Email', 'Host', '');
      PORTA1.Text:= ArqIni.ReadString('Email', 'Port', '');
      SSL.Text:= ArqIni.ReadString('Email', 'SSL', '');
      USER1.Text:= ArqIni.ReadString('Email', 'User', '');
      ASSUNTO.Text:= ArqIni.ReadString('Email', 'Assunto', '');
      MENSAGEM.Text:= ArqIni.ReadString('Email', 'Mensagem', '');
      PASSWORD.Text:= ArqIni.ReadString('Email', 'Pass', '');
      RAZSOCIAL.Text:= ArqIni.ReadString('Emitente', 'RazaoSocial', '');
      FANTASIA.Text:= ArqIni.ReadString('Emitente', 'Fantasia', '');
      CNPJ.Text:= ArqIni.ReadString('Emitente', 'CNPJ', '');
      IE.Text:= ArqIni.ReadString('Emitente', 'IE', '');
      IM.Text:= ArqIni.ReadString('Emitente', 'IM', '');
      CNAE.Text:= ArqIni.ReadString('Emitente', 'CNAE', '');
      FONE.Text:= ArqIni.ReadString('Emitente', 'Fone', '');
      CEP.Text:= ArqIni.ReadString('Emitente', 'CEP', '');
      LOGRADOURO.Text:= ArqIni.ReadString('Emitente', 'Logradouro', '');
      NUMERO.Text:= ArqIni.ReadString('Emitente', 'Numero', '');
      COMPLEMENTO.Text:= ArqIni.ReadString('Emitente', 'Complemento', '');
      BAIRRO.Text:= ArqIni.ReadString('Emitente', 'Bairro', '');
      CODCIDADE.Text:= ArqIni.ReadString('Emitente', 'CodCidade', '');
      CIDADE.Text:= ArqIni.ReadString('Emitente', 'Cidade', '');
      UF.Text:= ArqIni.ReadString('Emitente', 'UF', '');
      SITE.Text:= ArqIni.ReadString('Emitente', 'Site', '');
      ArqIni.Free;
end;

end.