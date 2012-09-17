unit uLang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, SpTBXControls, StdCtrls, TntStdCtrls, SpTBXEditors,
  TBXDkPanels, ShellAPI, ExtCtrls, TntControls;

type
  TfLang = class(TForm)
    cbLang: TSpTBXComboBox;
    btnOK: TSpTBXButton;
    Image1: TImage;
    lbTranslation: TSpTBXLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbLangChange(Sender: TObject);
    procedure lbTranslationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLang: TfLang;
  ini: TIniFile;
  
implementation

{$R *.dfm}

procedure GetSubDirs(const sRootDir: string; slt: TStrings; Filter: String);
var
  srSearch: TSearchRec;
  sSearchPath: string;
  sltSub: TStrings;
  i: Integer;
begin
  sltSub := TStringList.Create;
  slt.BeginUpdate;
  try
    sSearchPath := IncludeTrailingPathDelimiter(sRootDir);
    if FindFirst(sSearchPath + '*', faDirectory, srSearch) = 0 then
      repeat
        if ((srSearch.Attr and faDirectory) = faDirectory) and (srSearch.Name <> '.') and (srSearch.Name <> '..') then
        begin
          sltSub.Add(sSearchPath + srSearch.Name);
        end;
      until (FindNext(srSearch) <> 0);
    FindClose(srSearch);

    if FindFirst(sSearchPath + Filter, faAnyFile, srSearch) = 0 then
    begin
      repeat
        if (srSearch.Attr <> faDirectory) then
        begin
          slt.Add(sSearchPath + srSearch.Name);
        end;
      until FindNext(srSearch) <> 0;
      FindClose(srSearch);
    end;

    for i := 0 to sltSub.Count - 1 do
      GetSubDirs(sltSub.Strings[i], slt, Filter);
  finally
    slt.EndUpdate;
    FreeAndNil(sltSub);
  end;
end;

procedure TfLang.FormShow(Sender: TObject);
var
  str: TStringList;
  i: Integer;
begin
  str := TStringList.Create;
  GetSubDirs(ExtractFilePath(Application.ExeName) + 'lang\', str, '*.lng');
    for i := 0 to str.Count -1 do
    begin
      cbLang.Items.Add(ChangeFileExt(ExtractFileName(str.Strings[i]), ''));
    end;
  str.Free;
end;

procedure TfLang.btnOKClick(Sender: TObject);
begin
  if cbLang.Text <> '' then
  begin
    ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
    ini.WriteString('App', 'lang', cbLang.Text);
    ini.Free;
    Close;
    ShellExecute(0, 'open', PChar(Application.ExeName), nil, nil, 0);
  end;
end;

procedure TfLang.cbLangChange(Sender: TObject);
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'lang\' + cbLang.Text + '.lng');
  lbTranslation.Caption := 'by ' + ini.ReadString('Translation', 'Author', '');
  lbTranslation.Caption := lbTranslation.Caption + ' <' + ini.ReadString('Translation', 'Email', '') + '>';
  lbTranslation.Hint := ini.ReadString('Translation', 'Email', '');
  lbTranslation.LinkText := lbTranslation.Caption;
  ini.Free;
end;

procedure TfLang.lbTranslationClick(Sender: TObject);
var
  Param: string;
begin
  Param := 'mailto:' + lbTranslation.Hint + '?subject=SansaManager translation';
  ShellExecute(fLang.Handle, 'open', PChar(Param), nil, nil, SW_SHOWNORMAL);
end;

end.
