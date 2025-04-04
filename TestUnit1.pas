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
  1. TestDeleteValidAbsoluteFolder: 유효한 절대경로를 가진 폴더가 삭제되는지 테스트합니다.
  2. TestDeleteInvalidRelativeFolder: 상대경로를 가진 폴더를 삭제하려고 할 때 예외가 발생하는지 테스트합니다.
  3. TestDeleteEmptyFolderPath: 빈 경로를 삭제하려고 할 때 예외가 발생하는지 테스트합니다.
  4. TestDeleteRootDirectory: 루트 디렉토리를 삭제하려고 할 때 예외가 발생하는지 테스트합니다.
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
 