program SansaManager;

uses
  Forms,
  IniFiles,
  SysUtils,
  uMain in 'uMain.pas' {fMain},
  uTags in 'uTags.pas' {fTags},
  uAlbumArt in 'uAlbumArt.pas' {fAlbumArt},
  uAbout in 'uAbout.pas' {fAbout},
  uLang in 'uLang.pas' {fLang},
  uSplash in 'uSplash.pas' {fSplash},
  uFormat in 'uFormat.pas' {fFormat},
  uDrop in 'uDrop.pas' {fDrop};

{$R *.res}

var
  ini: TIniFile;

begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
  if ini.ValueExists('App', 'lang') then
  begin
    fSplash := TfSplash.Create(Application);
    fSplash.Show;
    fSplash.Update;

    Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfTags, fTags);
  Application.CreateForm(TfAlbumArt, fAlbumArt);
  Application.CreateForm(TfAbout, fAbout);
  Application.CreateForm(TfFormat, fFormat);
  Application.CreateForm(TfDrop, fDrop);
  sleep(500);

    fSplash.Hide;
    fSplash.Free;
  end else
  begin
    Application.CreateForm(TfLang, fLang);
  end;

  Application.Initialize;
  Application.Title := 'SansaManager';
  Application.Run;
end.
