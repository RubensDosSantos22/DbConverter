unit CProgramas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, StdCtrls, Buttons;

type
  TPROGRAMAS = class(TForm)
    SYSPROG: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PROGRAMAS: TPROGRAMAS;

implementation

uses CConfere;

{$R *.dfm}

end.
