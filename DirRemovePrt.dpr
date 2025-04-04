program DirRemovePrt;

uses
  Forms,
  DirRemoveUnit1 in 'DirRemoveUnit1.pas' {Form1},
  RemoveUtil in 'RemoveUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
