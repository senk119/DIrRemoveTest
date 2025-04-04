unit RemoveUtil;
interface
uses
  SysUtils, Classes;

  procedure DeleteFolderAndFiles(const FolderPath: string);
  // 절대경로 확인 함수
  function IsPathAbsolute(const Path: string): Boolean;

implementation

  {
  1. 삭제 대상 인수가 루트를 가리키지 않도록 체크
  2. 삭제경로는 절대경로만 사용하도록 변경. 상대경로 거름.
  3. 재귀호출에도 절대경로가 전달되록 처리
  }

  procedure DeleteFolderAndFiles(const FolderPath: string);
  var
    SearchRec: TSearchRec;
    FullPath: string;
  begin
    // 폴더 경로가 비어 있거나 루트 디렉토리를 가리키는지 확인
    if (FolderPath = '') or (FolderPath = '\') or (Length(FolderPath) = 2) and (FolderPath[2] = ':') then
    begin
      raise Exception.Create('Invalid FolderPath. It cannot be empty or root directory.');
    end;

    // 절대경로인지 확인
    if not IsPathAbsolute(FolderPath) then
    begin
      raise Exception.Create('FolderPath must be an absolute path.');
    end;

    if FindFirst(FolderPath + '\*', faAnyFile, SearchRec) = 0 then
    begin
      try
        repeat
          if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          begin
            FullPath := FolderPath + '\' + SearchRec.Name;
            if (SearchRec.Attr and faDirectory) = faDirectory then
            begin
              // 서브 디렉토리에 대한 재귀 호출
              DeleteFolderAndFiles(FullPath);
              // 서브 디렉토리 자체 제거
              RemoveDir(FullPath);
            end
            else
            begin
              // 파일 삭제
              DeleteFile(FullPath);
            end;
          end;
        until FindNext(SearchRec) <> 0;
      finally
        FindClose(SearchRec);
      end;
    end;
    // 메인 디렉토리 제거
    RemoveDir(FolderPath);
  end;

  // 절대경로 확인 함수
  function IsPathAbsolute(const Path: string): Boolean;
  begin
    Result := (Length(Path) > 1) and (Path[2] = ':');
  end;


end.