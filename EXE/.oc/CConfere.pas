unit CConfere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Mask, ToolEdit, CurrEdit, FileCtrl,
  Buttons;

type
  TCONFERE = class(TForm)
    qryBranca: TQuery;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    Label7: TLabel;
    CurrencyEdit9: TCurrencyEdit;
    Label9: TLabel;
    CurrencyEdit12: TCurrencyEdit;
    Label11: TLabel;
    CurrencyEdit15: TCurrencyEdit;
    Label13: TLabel;
    CurrencyEdit18: TCurrencyEdit;
    CurrencyEdit21: TCurrencyEdit;
    Label15: TLabel;
    Label17: TLabel;
    CurrencyEdit24: TCurrencyEdit;
    Label19: TLabel;
    CurrencyEdit27: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    CurrencyEdit13: TCurrencyEdit;
    CurrencyEdit16: TCurrencyEdit;
    CurrencyEdit19: TCurrencyEdit;
    CurrencyEdit22: TCurrencyEdit;
    CurrencyEdit25: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit11: TCurrencyEdit;
    CurrencyEdit14: TCurrencyEdit;
    CurrencyEdit17: TCurrencyEdit;
    CurrencyEdit20: TCurrencyEdit;
    CurrencyEdit23: TCurrencyEdit;
    CurrencyEdit26: TCurrencyEdit;
    Label23: TLabel;
    CurrencyEdit28: TCurrencyEdit;
    CurrencyEdit29: TCurrencyEdit;
    CurrencyEdit30: TCurrencyEdit;
    Label25: TLabel;
    CurrencyEdit31: TCurrencyEdit;
    CurrencyEdit32: TCurrencyEdit;
    CurrencyEdit33: TCurrencyEdit;
    Label27: TLabel;
    CurrencyEdit34: TCurrencyEdit;
    CurrencyEdit35: TCurrencyEdit;
    CurrencyEdit36: TCurrencyEdit;
    Label29: TLabel;
    CurrencyEdit37: TCurrencyEdit;
    CurrencyEdit38: TCurrencyEdit;
    CurrencyEdit39: TCurrencyEdit;
    Label31: TLabel;
    CurrencyEdit40: TCurrencyEdit;
    CurrencyEdit41: TCurrencyEdit;
    CurrencyEdit42: TCurrencyEdit;
    file_1: TFileListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    CONF: TGroupBox;
    DBF: TGroupBox;
    FDB: TGroupBox;
    RESULTADOS: TGroupBox;
    CTABLES: TGroupBox;
    BRANCO: TGroupBox;
    VERMELHO: TGroupBox;
    BASEBRANCOb: TDatabase;
    BASEVERMELHOb: TDatabase;
    qryVermelha: TQuery;
    SourceWhite: TDataSource;
    SourcRed: TDataSource;
    BBDEBaseR: TDatabase;
    BBDEBasev: TDatabase;
    qrybdebr: TQuery;
    qrybdebv: TQuery;
    bdesourcewhite: TDataSource;
    bdesourcered: TDataSource;
    qrybdebrtotalbb: TFloatField;
    VermelhaTOTALV: TFloatField;
    BrancaTOTAL: TFloatField;
    qrybdebvTOTALBV: TFloatField;
    GBOXDBF: TGroupBox;
    Button2: TBitBtn;
    Button1: TBitBtn;
    QrContaProdFDB: TQuery;
    QrContaProdFDBQTDPRODUTOS: TIntegerField;
    QrContaProdDBF: TQuery;
    QrContaProdDBFQtdProdutos: TIntegerField;
    LblQuantidadeProdutosFDB: TLabel;
    LblQuantidadeProdutosDBF: TLabel;
    QrContaClienteFDB: TQuery;
    QrContaClienteDBF: TQuery;
    QrContaClienteFDBQTDCLIENTES: TIntegerField;
    LblQuantidadeClientesFDB: TLabel;
    LblQuantidadeClientesDBF: TLabel;
    QrContaClienteDBFQtdClientes: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CONFERE: TCONFERE;

implementation

{$R *.dfm}
procedure TCONFERE.FormActivate(Sender: TObject);
begin
        DateEdit1.Date := Now -365;
        DateEdit2.Date := Now;
end;

procedure TCONFERE.Button1Click(Sender: TObject);
begin

//BRANCO 1
          qrybdebr.close;
          qrybdebr.SQL.Text := 'Select sum(valor_rec) as totalbb from drec00 where venct_rec >= :Datai and venct_Rec <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit1.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(valor_rec) as total from drec00 where venct_rec >= :Datai and venct_Rec <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit2.Value :=  BrancaTOTAL.Value;
          CurrencyEdit3.Value :=  CurrencyEdit1.Value - CurrencyEdit2.Value;
//--------

//VERMELHO 1
          qrybdebv.close;
          qrybdebv.SQL.Text := 'Select sum(valor_rec) as totalbv from drec00 where venct_rec >= :Datai and venct_Rec <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit4.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(valor_rec) as totalv from drec00 where venct_rec >= :Datai and venct_Rec <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit5.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit6.Value :=  CurrencyEdit4.Value - CurrencyEdit5.Value;
//--------
//SESS�O 2

// BRANCO 1

          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select sum(valor_pag) as totalbb from dpag00 where venct_pag >= :Datai and venct_pag <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit7.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(valor_pag) as total from dpag00 where venct_pag >= :Datai and venct_pag <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit8.Value :=  BrancaTOTAL.Value;
          CurrencyEdit9.Value :=  CurrencyEdit7.Value - CurrencyEdit8.Value;
//--------

//VERMELHO 1
          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select sum(valor_pag) as totalbv from dpag00 where venct_pag >= :Datai and venct_pag <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit10.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(valor_pag) as totalv from dpag00 where venct_pag >= :Datai and venct_pag <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit11.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit12.Value :=  CurrencyEdit11.Value - CurrencyEdit10.Value;
//--------

//BRANCO 2

          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select sum(ttnf_ped) as totalbb from ped200 where data_ped >= :Datai and data_ped <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit13.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(ttnf_ped) as total from ped200 where data_ped >= :Datai and data_ped <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit14.Value :=  BrancaTOTAL.Value;
          CurrencyEdit15.Value :=  CurrencyEdit13.Value - CurrencyEdit14.Value;
//--------

//VERMELHO 2
          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select sum(ttnf_ped) as totalbv from ped200 where data_ped >= :Datai and data_ped <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit16.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(ttnf_ped) as totalv from ped200 where data_ped >= :Datai and data_ped <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit17.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit18.Value :=  CurrencyEdit17.Value - CurrencyEdit16.Value;
//--------

//BRANCO 3

          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select sum(valo_ccl) as totalbb from carteira where venc_ccl >= :Datai and venc_ccl <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit19.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(valo_ccl) as total from carteira where venc_ccl >= :Datai and venc_ccl <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit20.Value :=  BrancaTOTAL.Value;
          CurrencyEdit21.Value :=  CurrencyEdit19.Value - CurrencyEdit20.Value;
//--------


//VERMELHO 3
          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select sum(valo_ccl) as totalbv from carteira where venc_ccl >= :Datai and venc_ccl <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit22.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(valo_ccl) as totalv from carteira where venc_ccl >= :Datai and venc_ccl <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit23.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit24.Value :=  CurrencyEdit22.Value - CurrencyEdit23.Value;
//--------

//VERMELHO 4
          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select sum(qtdd_pp) as totalbv from ped2pro,ped200 where chav_pp = nume_ped and data_ped >= :Datai and data_ped <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit25.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(qtdd_pp) as totalv from ped2pro,ped200 where chav_pp = nume_ped and data_ped >= :Datai and data_ped <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit26.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit27.Value :=  CurrencyEdit25.Value - CurrencyEdit26.Value;
//--------

//VERMELHO 5
          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select sum(qtdd_pp) as totalBV from pedpro,ent000 where chav_pp = chav_ent and data_ent >= :Datai and data_ent <= :Dataf';
          qrybdebv.Params[0].Value := DateEdit1.Date;
          qrybdebv.Params[1].Value := DateEdit2.Date;
          qrybdebv.Open;
          CurrencyEdit29.Value :=  qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select sum(qtdd_pp) as totalV from pedpro,ent000 where chav_pp = chav_ent and data_ent >= :Datai and data_ent <= :Dataf';
          qryVermelha.Params[0].Value := DateEdit1.Date;
          qryVermelha.Params[1].Value := DateEdit2.Date;
          qryVermelha.Open;
          CurrencyEdit30.Value :=  VermelhaTOTALV.Value;
          CurrencyEdit28.Value :=  CurrencyEdit29.Value - CurrencyEdit30.Value;
//--------

//BRANCO 5
          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select sum(qtdd_pp) as totalBB from pedpro,ent000 where chav_pp = chav_ent and data_ent >= :Datai and data_ent <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit32.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(qtdd_pp) as total from pedpro,ent000 where chav_pp = chav_ent and data_ent >= :Datai and data_ent <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit33.Value :=  BrancaTOTAL.Value;
          CurrencyEdit31.Value :=  CurrencyEdit33.Value - CurrencyEdit32.Value;
//--------

//BRANCO 6
          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select sum(NPBQTD) as totalbb from ENTCER where NPBDAT >= :Datai and NPBDAT <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit35.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select sum(NPBQTD) as total from ENTCER where NPBDAT >= :Datai and NPBDAT <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit36.Value :=  BrancaTOTAL.Value;
          CurrencyEdit34.Value :=  CurrencyEdit35.Value - CurrencyEdit36.Value;
//--------

//BRANCO 7

          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select SUM(QTDADE) AS TOTALBB  from ipentra,PENTRADA where IPENTRA.numero = pentrada.NUMERO AND  DATA >= :Datai and DATA <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit38.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select SUM(QTDADE) AS TOTAL  from ipentra,PENTRADA where IPENTRA.numero = pentrada.NUMERO AND  DATA >= :Datai and DATA <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit39.Value :=  BrancaTOTAL.Value;
          CurrencyEdit37.Value :=  CurrencyEdit39.Value - CurrencyEdit38.Value;
 //-------

//BRANCO 8

          qrybdebr.Close;
          qrybdebr.SQL.Text := ' Select SUM(QTDADE) AS TOTALBB  from ipSAIDAS,PSAIDAS  where PSAIDAS.NUMERO = IPSAIDAS.numero  AND  DATA >= :Datai and DATA <= :Dataf';
          qrybdebr.Params[0].Value := DateEdit1.Date;
          qrybdebr.Params[1].Value := DateEdit2.Date;
          qrybdebr.Open;
          CurrencyEdit41.Value :=  qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := ' Select SUM(QTDADE) AS TOTAL  from ipSAIDAS,PSAIDAS  where PSAIDAS.NUMERO = IPSAIDAS.numero  AND  DATA >= :Datai and DATA <= :Dataf';
          qryBranca.Params[0].Value := DateEdit1.Date;
          qryBranca.Params[1].Value := DateEdit2.Date;
          qryBranca.Open;
          CurrencyEdit42.Value :=  BrancaTOTAL.Value;
          CurrencyEdit40.Value :=  CurrencyEdit42.Value - CurrencyEdit41.Value;
//---------

  QrContaProdFDB.Close;
  QrContaProdFDB.SQL.Text:= 'select count(1) as QtdProdutos from pro000';
  QrContaProdFDB.Open;

  QrContaProdDBF.Close;
  QrContaProdDBF.SQL.Text:= 'select count(*) as QtdProdutos from pro000';
  QrContaProdDBF.Open;

  QrContaClienteFDB.Close;
  QrContaClienteFDB.SQL.Text:= 'select count(1) as QtdClientes from cli000';
  QrContaClienteFDB.Open;

  QrContaClienteDBF.Close;
  QrContaClienteDBF.SQL.Text:= 'select count(*) as QtdClientes from cli000';
  QrContaClienteDBF.Open;

  LblQuantidadeProdutosFDB.Caption:= 'QUANTIDADE DE PRODUTOS EM FIREBIRD: ' + IntToStr(QrContaProdFDBQTDPRODUTOS.Value);
  LblQuantidadeProdutosDBF.Caption:= 'QUANTIDADE DE PRODUTOS EM DBF: ' + IntToStr(QrContaProdDBFQtdProdutos.Value);
  LblQuantidadeClientesFDB.Caption:= 'QUANTIDADE DE CLIENTES EM FIREBIRD: ' + IntToStr(QrContaClienteFDBQTDCLIENTES.Value);
  LblQuantidadeClientesDBF.Caption:= 'QUANTIDADE DE CLIENTES EM DBF: ' + IntToStr(QrContaClienteDBFQtdClientes.Value);



end;




procedure TCONFERE.Button2Click(Sender: TObject);
Var
        WAlias : TStringList; //Captura o Alias do Bde
        WServidor : String; //Retorna o Caminho
        a :Integer;
        CountDbf :Double;
Begin
   wAlias := TStringList.Create;
   Session.GetAliasParams('AGS',WAlias);   // Fluxo_de_Caixa � o Alias a ser retornado
   WServidor := WAlias[0];                        // o caminho
   WServidor := Copy(WServidor,6,255);
   WServidor := Copy(WServidor,1,(Length(WServidor)));
   file_1.Directory := WServidor;
   file_1.Refresh;

   Memo1.Clear;
   Memo2.Clear;
   for a:=0 to file_1.Items.Count -1 do begin

          qrybdebr.Close;
          qrybdebr.SQL.Text := 'Select cast(count(*)  as float(10)) as totalbb from ' + copy(ExtractFilename(file_1.Items[a]),0, Length(ExtractFilename(file_1.Items[a])) - 4) ;
          qrybdebr.Open;

          CountDbf := qrybdebrtotalbb.Value;

          qryBranca.Close;
          qryBranca.SQL.Text := 'Select cast(count(*)  as float(10)) as total from ' + copy(ExtractFilename(file_1.Items[a]),0, Length(ExtractFilename(file_1.Items[a])) - 4) ;
          qryBranca.Open;
          if BrancaTOTAL.Value <> CountDbf then
                begin
                      Memo1.Lines.Add(ExtractFilename(file_1.Items[a]) + ' ' +  FloatToStr( CountDbf ) + ' ' +  FloatToStr( BrancaTOTAL.Value ) )
                end;



   end;


   wAlias := TStringList.Create;
   Session.GetAliasParams('AGS_',WAlias);   // Fluxo_de_Caixa � o Alias a ser retornado
   WServidor := WAlias[0];                        // o caminho
   WServidor := Copy(WServidor,6,255);
   WServidor := Copy(WServidor,1,(Length(WServidor)));
   file_1.Directory := WServidor;
   file_1.Refresh;

   for a:=0 to file_1.Items.Count -1 do begin

          qrybdebv.Close;
          qrybdebv.SQL.Text := 'Select cast(count(*)  as float(10)) as totalbv from ' + copy(ExtractFilename(file_1.Items[a]),0, Length(ExtractFilename(file_1.Items[a])) - 4) ;
          qrybdebv.Open;

          CountDbf := qrybdebvTOTALBV.Value;

          qryVermelha.Close;
          qryVermelha.SQL.Text := 'Select cast(count(*)  as float(10)) as totalv from ' + copy(ExtractFilename(file_1.Items[a]),0, Length(ExtractFilename(file_1.Items[a])) - 4) ;
          qryVermelha.Open;
          if VermelhaTOTALV.Value <> CountDbf then
                begin
                      Memo2.Lines.Add(ExtractFilename(file_1.Items[a]) + ' ' +  FloatToStr( CountDbf ) + ' ' +  FloatToStr( VermelhaTOTALV.Value ) )
                end;

   end;
   ShowMessage('CONFER�NCIA FINALIZADA');
end;

procedure TCONFERE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
CONFERE.Destroy;
end;
end.
