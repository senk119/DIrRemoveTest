unit TestUnit1;

interface



uses
  SysUtils, Classes;
  //, TestFramework;

type
  TDeleteFolderAndFilesTest = class(TTestCase)
  published
    procedure TestDeleteValidAbsoluteFolder;
    procedure TestDeleteInvalidRelativeFolder;
    procedure TestDeleteEmptyFolderPath;
    procedure TestDeleteRootDirectory;
  end;

implementation

{
  1. TestDeleteValidAbsoluteFolder: ��ȿ�� �����θ� ���� ������ �����Ǵ��� �׽�Ʈ�մϴ�.
  2. TestDeleteInvalidRelativeFolder: ����θ� ���� ������ �����Ϸ��� �� �� ���ܰ� �߻��ϴ��� �׽�Ʈ�մϴ�.
  3. TestDeleteEmptyFolderPath: �� ��θ� �����Ϸ��� �� �� ���ܰ� �߻��ϴ��� �׽�Ʈ�մϴ�.
  4. TestDeleteRootDirectory: ��Ʈ ���丮�� �����Ϸ��� �� �� ���ܰ� �߻��ϴ��� �׽�Ʈ�մϴ�.
}

procedure TDeleteFolderAndFilesTest.TestDeleteValidAbsoluteFolder;
var
  TestFolder: string;
begin
  TestFolder := 'C:\TestFolder';
  ForceDirectories(TestFolder);
  DeleteFolderAndFiles(TestFolder);
  CheckFalse(DirectoryExists(TestFolder), 'Folder should be deleted');
end;

procedure TDeleteFolderAndFilesTest.TestDeleteInvalidRelativeFolder;
var
  TestFolder: string;
begin
  TestFolder := 'TestFolder';
  try
    DeleteFolderAndFiles(TestFolder);
    Fail('Exception should be raised for relative folder path');
  except
    on E: Exception do
      CheckEquals('FolderPath must be an absolute path.', E.Message);
  end;
end;

procedure TDeleteFolderAndFilesTest.TestDeleteEmptyFolderPath;
begin
  try
    DeleteFolderAndFiles('');
    Fail('Exception should be raised for empty folder path');
  except
    on E: Exception do
      CheckEquals('Invalid FolderPath. It cannot be empty or root directory.', E.Message);
  end;
end;

procedure TDeleteFolderAndFilesTest.TestDeleteRootDirectory;
begin
  try
    DeleteFolderAndFiles('C:\');
    Fail('Exception should be raised for root directory');
  except
    on E: Exception do
      CheckEquals('Invalid FolderPath. It cannot be empty or root directory.', E.Message);
  end;
end;

initialization
  RegisterTest(TDeleteFolderAndFilesTest.Suite);
end.

end.
 