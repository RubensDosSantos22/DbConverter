unit UUpdatedApConv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabase, DB, IBCustomDataSet, IBQuery, DBTables,
  ComCtrls, Buttons, CommCtrl;

type
  TFrUpdatesApConversao = class(TForm)
    MemoUpdates: TMemo;
    MemoCreate: TMemo;
    MemoAlterTable: TMemo;
    mmo1: TMemo;
    MemoTriggers: TMemo;
    QrCaminho: TQuery;
    DataBase1: TDatabase;
    BarraDeProgresso: TProgressBar;
    BtExecutarUpdates: TSpeedButton;
    procedure BtExecutarUpdatesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrUpdatesApConversao: TFrUpdatesApConversao;

implementation

{$R *.dfm}



procedure TFrUpdatesApConversao.BtExecutarUpdatesClick(Sender: TObject);
var
  linha: Integer;
  Update, Atualiza: string;
begin

SendMessage(BarraDeProgresso.Handle, PBM_SETBARCOLOR, 0, clGradientActiveCaption);
mmo1.Clear;

for  linha := 0 TO MemoCreate.LINES.COUNT -1 DO
  begin

    Update := (MemoCreate.Lines[linha]);
    mmo1.Lines.Add(Copy(Update, 0, Length(Update)));

  end;

for  linha := 0 TO MemoUpdates.LINES.COUNT -1 DO
  begin

    Update := (MemoUpdates.Lines[linha]);
    mmo1.Lines.Add(Copy(Update, 0, Length(Update)));

  end;

for  linha := 0 TO MemoAlterTable.LINES.COUNT -1 DO
  begin

    Update := (MemoAlterTable.Lines[linha]);
    mmo1.Lines.Add(Copy(Update, 0, Length(Update)));

  end;

for  linha := 0 TO MemoTriggers.LINES.COUNT -1 DO
  begin

    Update := (MemoTriggers.Lines[linha]);
    mmo1.Lines.Add(Copy(Update, 0, Length(Update)));

  end;


for  linha := 0 TO mmo1.LINES.COUNT -1 DO
  begin
  
    BarraDeProgresso.Max:= mmo1.Lines.Count;

    try
      Update := (mmo1.Lines[linha]);
      Atualiza:= Copy(Update, 0, Length(Update));
      QrCaminho.Close;
      QrCaminho.SQL.Clear;
      QrCaminho.SQL.Text:= Update;
      QrCaminho.ExecSQL;
    except
      On E: Exception do
        begin
        Mmo1.Lines.Add(#13);
        end;
    end;

    BarraDeProgresso.Position := BarraDeProgresso.Position +1;

  end;
 ShowMessage('Updates Finalizados');
FrUpdatesApConversao.Close;

end;

end.
