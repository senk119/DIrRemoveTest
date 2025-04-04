unit RemoveUtil;
interface
uses
  SysUtils, Classes;

  procedure DeleteFolderAndFiles(const FolderPath: string);
  // ������ Ȯ�� �Լ�
  function IsPathAbsolute(const Path: string): Boolean;

implementation

  {
  1. ���� ��� �μ��� ��Ʈ�� ����Ű�� �ʵ��� üũ
  2. ������δ� �����θ� ����ϵ��� ����. ����� �Ÿ�.
  3. ���ȣ�⿡�� �����ΰ� ���޵Ƿ� ó��
  }

  procedure DeleteFolderAndFiles(const FolderPath: string);
  var
    SearchRec: TSearchRec;
    FullPath: string;
  begin
    // ���� ��ΰ� ��� �ְų� ��Ʈ ���丮�� ����Ű���� Ȯ��
    if (FolderPath = '') or (FolderPath = '\') or (Length(FolderPath) = 2) and (FolderPath[2] = ':') then
    begin
      raise Exception.Create('Invalid FolderPath. It cannot be empty or root directory.');
    end;

    // ���������� Ȯ��
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
              // ���� ���丮�� ���� ��� ȣ��
              DeleteFolderAndFiles(FullPath);
              // ���� ���丮 ��ü ����
              RemoveDir(FullPath);
            end
            else
            begin
              // ���� ����
              DeleteFile(FullPath);
            end;
          end;
        until FindNext(SearchRec) <> 0;
      finally
        FindClose(SearchRec);
      end;
    end;
    // ���� ���丮 ����
    RemoveDir(FolderPath);
  end;

  // ������ Ȯ�� �Լ�
  function IsPathAbsolute(const Path: string): Boolean;
  begin
    Result := (Length(Path) > 1) and (Path[2] = ':');
  end;


end.