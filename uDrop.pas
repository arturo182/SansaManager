unit uDrop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SpTBXControls, StdCtrls, ShellAPI, TBXDkPanels,
  ExplorerDrop, MsgINISupp, LngINISupp, JvBaseDlg, JvSelectDirectory;

type
  TfDrop = class(TForm)
    Shape: TShape;
    ExplorerDrop: TExplorerDrop;
    btnMusic: TSpTBXSpeedButton;
    btnVideo: TSpTBXSpeedButton;
    btnRoot: TSpTBXSpeedButton;
    btnPlaylist: TSpTBXSpeedButton;
    btnPhotos: TSpTBXSpeedButton;
    btnCustom: TSpTBXSpeedButton;
    ExplorerDrop1: TExplorerDrop;
    ExplorerDrop2: TExplorerDrop;
    ExplorerDrop3: TExplorerDrop;
    ExplorerDrop4: TExplorerDrop;
    ExplorerDrop5: TExplorerDrop;
    JvSelectDirectory: TJvSelectDirectory;
    procedure FormCreate(Sender: TObject);
    procedure btnMusicClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnRootClick(Sender: TObject);
    procedure btnPlaylistClick(Sender: TObject);
    procedure btnPhotosClick(Sender: TObject);
    procedure ExplorerDropDropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
    procedure ExplorerDrop1Dropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
    procedure ExplorerDrop2Dropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
    procedure ExplorerDrop3Dropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
    procedure ExplorerDrop4Dropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
    procedure ExplorerDrop5Dropped(Sender: TObject; Files: TStrings;
      FileCount, x, y: Integer);
  private
  public
    { Public declarations }
  end;

var
  fDrop: TfDrop;

implementation

uses uMain;

{$R *.dfm}
procedure TfDrop.FormCreate(Sender: TObject);
begin
  btnMusic.ImageIndex := fMain.imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\music.ico');
  btnCustom.ImageIndex := fMain.imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName));
  btnPhotos.ImageIndex := fMain.imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\photos.ico');
  btnPlaylist.ImageIndex := fMain.imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\playlist.ico');
  btnRoot.ImageIndex := fMain.imsSystem.ImageIndexOf('C:\');
  btnVideo.ImageIndex := fMain.imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\video.ico');

end;

procedure TfDrop.btnMusicClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(fMain.Drive + 'MUSIC\'), nil, nil, 1);
end;

procedure TfDrop.btnVideoClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(fMain.Drive + 'VIDEO\'), nil, nil, 1);
end;

procedure TfDrop.btnRootClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(fMain.Drive), nil, nil, 1);
end;

procedure TfDrop.btnPlaylistClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(fMain.Drive + 'PLAYLISTS\'), nil, nil, 1);
end;

procedure TfDrop.btnPhotosClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(fMain.Drive + 'PHOTO\'), nil, nil, 1);
end;

procedure setState(State: Boolean);
begin
  with fDrop do
  begin
    btnCustom.Enabled := State;
    btnMusic.Enabled := State;
    btnPhotos.Enabled := State;
    btnPlayList.Enabled := State;
    btnRoot.Enabled := State;
    btnVideo.Enabled := State;
  end;
end;

procedure TfDrop.ExplorerDropDropped(Sender: TObject; Files: TStrings; FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  for i := 0 to FileCount -1 do
  begin
    fMain.FileSystemAction(FO_COPY, Files.Strings[i], fMain.Drive + 'MUSIC\', False);
  end;
  setState(True);
end;

procedure TfDrop.ExplorerDrop1Dropped(Sender: TObject; Files: TStrings;
  FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  for i := 0 to FileCount -1 do
  begin
    fMain.FileSystemAction(FO_COPY, Files.Strings[i], fMain.Drive + 'VIDEO\', False);
  end;
  setState(True);
end;

procedure TfDrop.ExplorerDrop2Dropped(Sender: TObject; Files: TStrings;
  FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  for i := 0 to FileCount -1 do
  begin
    fMain.FileSystemAction(FO_COPY, Files.Strings[i], fMain.Drive, False);
  end;
  setState(True);
end;

procedure TfDrop.ExplorerDrop3Dropped(Sender: TObject; Files: TStrings;
  FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  for i := 0 to FileCount -1 do
  begin
    fMain.FileSystemAction(FO_COPY, Files.Strings[i], fMain.Drive + 'PLAYLISTS\', False);
  end;
  setState(True);
end;

procedure TfDrop.ExplorerDrop4Dropped(Sender: TObject; Files: TStrings;
  FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  for i := 0 to FileCount -1 do
  begin
    fMain.FileSystemAction(FO_COPY, Files.Strings[i], fMain.Drive + 'PHOTO\', False);
  end;
  setState(True);
end;

procedure TfDrop.ExplorerDrop5Dropped(Sender: TObject; Files: TStrings;
  FileCount, x, y: Integer);
var
  i: Integer;
begin
  setState(False);
  JvSelectDirectory.InitialDir := fMain.Drive;
  if JvSelectDirectory.Execute then
  begin
    for i := 0 to FileCount -1 do
    begin
      fMain.FileSystemAction(FO_COPY, Files.Strings[i], JvSelectDirectory.Directory, False);
    end;
  end;
  setState(True);
end;

end.
