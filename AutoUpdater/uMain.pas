unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, XPMan, JvWizard, JvExControls, JvComponent, StdCtrls,
  UrlMon, IniFiles, CabSTComps, HTTPGet, TBXDkPanels, SpTBXControls, JvWizardCommon;

type
  TfAutoUpdate = class(TForm)
    Wizard: TJvWizard;
    Welcome: TJvWizardWelcomePage;
    XPManifest: TXPManifest;
    Translations: TJvWizardInteriorPage;
    lbTranslations: TListBox;
    btnDownload: TButton;
    UpdateList: TJvWizardInteriorPage;
    lbYourBuild: TLabel;
    lvUpdates: TListView;
    CabReader: TSTCabReader;
    HTTPGet: THTTPGet;
    Download: TJvWizardInteriorPage;
    ProgressBar: TSpTBXProgressBar;
    lbDownloadProgress: TLabel;
    Install: TJvWizardInteriorPage;
    Done: TJvWizardWelcomePage;
    lbTranslOwn: TLabel;
    procedure WelcomeHelpButtonClick(Sender: TObject; var Stop: Boolean);
    procedure WelcomeCancelButtonClick(Sender: TObject; var Stop: Boolean);
    procedure TranslationsFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure btnDownloadClick(Sender: TObject);
    procedure WelcomeNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure UpdateListCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure UpdateListBackButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure UpdateListNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure HTTPGetProgress(Sender: TObject; TotalSize, Readed: Integer);
    procedure DownloadCancelButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure HTTPGetDoneFile(Sender: TObject; FileName: String;
      FileSize: Integer);
    procedure DoneFinishButtonClick(Sender: TObject; var Stop: Boolean);
    procedure DonePage(Sender: TObject);
    procedure TranslationsBackButtonClick(Sender: TObject;
      var Stop: Boolean);
  private
    { Private declarations }
  public
    Ver1, Ver2, Ver3, Ver4, Ver: Integer;
    procedure GetSMBuild;
  end;

var
  fAutoUpdate: TfAutoUpdate;

implementation

{$R *.dfm}

function DownloadFile(Source, Dest: string): Boolean;
begin
  try
    Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

function GetTempDir: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  Result := StrPas(Buffer);
end;

function ExtractUrlFileName(const AUrl: string): string; 
var 
  i: Integer; 
begin 
  i := LastDelimiter('/', AUrl);
  Result := Copy(AUrl, i + 1, Length(AUrl) - (i)); 
end;

procedure TfAutoUpdate.WelcomeHelpButtonClick(Sender: TObject; var Stop: Boolean);
var
  ini: TIniFile;
  i: Integer;
  temp: String;
begin
  if DownloadFile('http://www.thesansa.com/sansamanager/transl.ini', GetTempDir + 'transl.ini') then
  begin
    lbTranslations.Items.Clear;
    ini := TIniFile.Create(GetTempDir + 'transl.ini');

    for i := 1 to ini.ReadInteger('transl', 'count', 0) do
    begin
      temp := ini.ReadString('transl', 't' + IntToStr(i), '');
      temp := Format('%s (last modified: %s)', [ini.ReadString(temp, 'desc', ''), DateToStr(ini.ReadFloat(temp, 'modified', 0))]);
      lbTranslations.Items.Add(temp);
    end;

    ini.Free;
    Wizard.ActivePage := Translations;
    Stop := True;
  end;
end;

procedure TfAutoUpdate.WelcomeCancelButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Close;
end;

procedure TfAutoUpdate.TranslationsFinishButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Close;
end;

procedure TfAutoUpdate.btnDownloadClick(Sender: TObject);
var
  ini: TIniFile;
  temp: String;
begin
  if lbTranslations.ItemIndex > -1 then
  begin
    ini := TIniFile.Create(GetTempDir + 'transl.ini');
    temp := ini.ReadString('transl', 't' + IntToStr(lbTranslations.ItemIndex + 1), '');
    temp := ini.ReadString(temp, 'URL', '');

    if DownloadFile(temp, ExtractFilePath(Application.ExeName) + 'lang\' + ExtractURLFilename(temp)) then
    begin
      ShowMessage('Download finished successfully!');
    end;
    ini.Free;
  end;
end;

procedure TfAutoUpdate.GetSMBuild;
var
  FileVerInfoSize, FVIS2, VerValueSize : Cardinal;
  VerInfo: pointer;
  VerValue: PVSFixedFileInfo;
  temp: string;
begin
  temp := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'SansaManager.exe';
  FileVerInfoSize := GetFileVersionInfoSize(PChar(temp), FVIS2);
  if FileVerInfoSize=0 then Exit;
  GetMem(VerInfo, FileVerInfoSize);
  try
    GetFileVersionInfo(PChar(temp), FVIS2, FileVerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    with VerValue^ do begin
      Ver1 := dwFileVersionMS shr 16;
      Ver2 := dwFileVersionMS and $FFFF;
      Ver3 := dwFileVersionLS shr 16;
      Ver4 := dwFileVersionLS and $FFFF;
      Ver  := (Ver1 * 1000000) + (Ver2 * 100000) + (Ver3 * 1000) + Ver4;
    end;
  finally
    FreeMem(VerInfo, FileVerInfoSize);
  end;
end;

procedure TfAutoUpdate.WelcomeNextButtonClick(Sender: TObject; var Stop: Boolean);
var
  ini: TIniFile;
  str, str2: TStringList;
  i: Integer;
begin
  lvUpdates.Items.Clear;
  GetSMBuild;
  lbYourBuild.Caption := 'Your build: ' + IntToStr(Ver1) + '.'+ IntToStr(Ver2) + '.'+ IntToStr(Ver3) + '.'+ IntToStr(Ver4);

  str := TStringList.Create;
  str.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\update_hosts.dat');
    for i := 0 to str.Count -1 do
    begin
      str2 := TStringList.Create;
      str2.Delimiter := '|';
      str2.DelimitedText := str.Strings[i];
        if DownloadFile(str2.Strings[0], GetTempDir + 'update.ini') then
        begin
          ini := TIniFile.Create(GetTempDir + 'update.ini');
          with lvUpdates.Items.Add do
          begin
            Caption := str2.Strings[1];
            SubItems.Add(DateToStr(ini.ReadFloat('update', 'release', 0)));
            SubItems.Add(IntToStr(ini.ReadInteger('update', 'ver1', 0)) + '.'+ IntToStr(ini.ReadInteger('update', 'ver2', 0)) + '.'+ IntToStr(ini.ReadInteger('update', 'ver3', 0)) + '.'+ IntToStr(ini.ReadInteger('update', 'ver4', 0)));
            SubItems.Add(ini.ReadString('update', 'URL', ''));
          end;
          ini.Free;
        end;
      str2.Free;
    end;
  str.Free;

  Wizard.ActivePage := UpdateList;
  Stop := True;
end;

procedure TfAutoUpdate.UpdateListCancelButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Close;
end;

procedure TfAutoUpdate.UpdateListBackButtonClick(Sender: TObject; var Stop: Boolean);
begin
  Wizard.ActivePage := Welcome;
  Stop := True;  
end;

procedure TfAutoUpdate.UpdateListNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  if lvUpdates.SelCount > 0 then
  begin
    HTTPGet.FileName := GetTempDir + 'SM.upd';
    HTTPGet.URL := lvUpdates.Selected.SubItems.Strings[2];
    lbDownloadProgress.Caption := 'Starting download process';
    HTTPGet.GetFile;
    Wizard.ActivePage := Download;
    Stop := True;
  end else
    Stop := True;
end;

procedure TfAutoUpdate.HTTPGetProgress(Sender: TObject; TotalSize, Readed: Integer);
begin
  ProgressBar.Max := TotalSize;
  ProgressBar.Position := Readed;
  lbDownloadProgress.Caption := 'Downloaded ' + IntToStr(Trunc(Readed / 1024)) + ' kB of ' + IntToStr(Trunc(TotalSize / 1024)) + ' kB';
end;

procedure TfAutoUpdate.DownloadCancelButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  HTTPGet.Abort;
  Close;
end;

procedure TfAutoUpdate.HTTPGetDoneFile(Sender: TObject; FileName: String;
  FileSize: Integer);
begin
  Wizard.ActivePage := Install;
  CabReader.ExtractFiles(GetTempDir + 'SM.upd', ExtractFilePath(Application.ExeName));
  Wizard.ActivePage := Done;
end;

procedure TfAutoUpdate.DoneFinishButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  Close;
end;

procedure TfAutoUpdate.DonePage(Sender: TObject);
begin
  Done.WaterMark.Image.Picture := Welcome.WaterMark.Image.Picture;
  Done.WaterMark.Image.Alignment := TJvWizardImageAlignment(0);
  Done.WaterMark.Image.Layout := ilCenter;
  Done.WaterMark.Width := 163;
end;

procedure TfAutoUpdate.TranslationsBackButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  Wizard.ActivePage := Welcome;
  Stop := True;
end;

end.
