unit DirRemoveUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt_Path: TEdit;
    btn_Remove: TButton;
    mmo1: TMemo;
    procedure btn_RemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;




var
  Form1: TForm1;

implementation

uses RemoveUtil;

{$R *.dfm}

procedure TForm1.btn_RemoveClick(Sender: TObject);
var
  sPth : string;
begin
  sPth := edt_Path.Text;
  mmo1.Lines.Clear;
  mmo1.Lines.add(sPth);
  DeleteFolderAndFiles(sPth);
end;

end.
