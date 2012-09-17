unit uTags;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TBXDkPanels, SpTBXControls, SpTBXItem, SpTBXTabs, LngINISupp,
  ImgList, TB2Item, TBX, StdCtrls, SpTBXEditors, TntStdCtrls, jpeg,
  ExtCtrls, JvExExtCtrls, JvSpecialImage, JvComponentBase, JvID3v2Base,
  JvID3v2, JvId3v1, JvGIF, ImagingTypes, Imaging, ImagingClasses,
  ImagingComponents, ImagingCanvases, ImagingUtility, JvID3v2Types;

type
  TfTags = class(TForm)
    tcMain: TSpTBXTabControl;
    btnCancel: TSpTBXButton;
    btnOk: TSpTBXButton;
    sbtnBack: TSpTBXSpeedButton;
    sbtnFrwd: TSpTBXSpeedButton;
    imgButtons: TImageList;
    tabBasic: TSpTBXTabItem;
    tsBasic: TSpTBXTabSheet;
    tabInfo: TSpTBXTabItem;
    tsInfo: TSpTBXTabSheet;
    tabAlbumArt: TSpTBXTabItem;
    tsAlbumArt: TSpTBXTabSheet;
    lbArtist: TSpTBXLabel;
    edArtist: TSpTBXEdit;
    edTrTitle: TSpTBXEdit;
    edAlbum: TSpTBXEdit;
    edYear: TSpTBXEdit;
    lbTrTitle: TSpTBXLabel;
    lbAlbum: TSpTBXLabel;
    lbYear: TSpTBXLabel;
    lbGenre: TSpTBXLabel;
    lbTrNumber: TSpTBXLabel;
    seTrNumber: TSpTBXSpinEdit;
    lbComment: TSpTBXLabel;
    mmComment: TMemo;
    cbGenre: TSpTBXComboBox;
    gbAlbumTags: TSpTBXGroupBox;
    gbAlbumDirectory: TSpTBXGroupBox;
    imAlbumTags: TJvSpecialImage;
    imAlbumDir: TJvSpecialImage;
    JvID3v2: TJvID3v2;
    lbLength: TSpTBXLabel;
    edLength: TSpTBXEdit;
    lbBitrate: TSpTBXLabel;
    edBitrate: TSpTBXEdit;
    lbCopyr: TSpTBXLabel;
    edCopyr: TSpTBXEdit;
    edFrequency: TSpTBXEdit;
    lbFrequency: TSpTBXLabel;
    lbFileSize: TSpTBXLabel;
    edFileSize: TSpTBXEdit;
    edOriginal: TSpTBXEdit;
    lbOriginal: TSpTBXLabel;
    imAlbumNone: TJvSpecialImage;
    lbAlbumTagsWidth: TSpTBXLabel;
    lbAlbumTagsHeight: TSpTBXLabel;
    edAlbumTagsWidth: TSpTBXEdit;
    edAlbumTagsHeight: TSpTBXEdit;
    lbAlbumTagsFileSize: TSpTBXLabel;
    edAlbumTagsFileSize: TSpTBXEdit;
    btnAlbumTagsDel: TSpTBXButton;
    btnAlbumTagsSave: TSpTBXButton;
    btnAlbumTagsCompress: TSpTBXButton;
    btnAlbumDirCompress: TSpTBXButton;
    btnAlbumDirSave: TSpTBXButton;
    btnAlbumDirDel: TSpTBXButton;
    lbAlbumDirFileSize: TSpTBXLabel;
    lbAlbumDirHeight: TSpTBXLabel;
    lbAlbumDirWidth: TSpTBXLabel;
    edAlbumDirWidth: TSpTBXEdit;
    edAlbumDirHeight: TSpTBXEdit;
    edAlbumDirFileSize: TSpTBXEdit;
    btnSearchAmazon: TSpTBXButton;
    dlgSaveAlbum: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure imAlbumTagsClick(Sender: TObject);
    procedure imAlbumDirClick(Sender: TObject);
    procedure btnSearchAmazonClick(Sender: TObject);
    procedure btnAlbumTagsSaveClick(Sender: TObject);
    procedure btnAlbumDirSaveClick(Sender: TObject);
    procedure btnAlbumTagsDelClick(Sender: TObject);
    procedure btnAlbumDirDelClick(Sender: TObject);
    procedure btnAlbumDirCompressClick(Sender: TObject);
    procedure btnAlbumTagsCompressClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure sbtnFrwdClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FileTag2: TJvID3v2;
    FileTag1: TJvID3v1;
  public
    IIndex: Integer;
    FName: String;
    procedure ReadTags(Path: String; Index: Integer; AlbumArt: Boolean = False);
    function GetTempDir: string;
  end;

var
  fTags: TfTags;


implementation

uses uMain, uAlbumArt;
{$R *.dfm}

function GetFileSize(sFileToExamine: string): Int64;
var
  SearchRec: TSearchRec;
begin
  FindFirst(ExpandFileName(sFileToExamine), faAnyFile, SearchRec);
  Result := SearchRec.Size;
  SysUtils.FindClose(SearchRec);
end;

function TfTags.GetTempDir: string;
var
  Buffer: array[0..MAX_PATH] of Char;
begin
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  Result := StrPas(Buffer);
end;

function SecondsToTimeStr(RemainingSeconds: Integer): string;
var
    Minutes, Seconds: Integer;
    MinuteString, SecondString: string;
begin
    Seconds := RemainingSeconds mod 60;
    Minutes := RemainingSeconds div 60;

    if Minutes < 10 then
        MinuteString := '0' + IntToStr(Minutes) + ':'
      else
        MinuteString := IntToStr(Minutes) + ':';
 
    if Seconds < 10 then
        SecondString := '0' + IntToStr(Seconds)
      else
        SecondString := IntToStr(Seconds);
    Result := MinuteString + SecondString;
end;

procedure TfTags.ReadTags(Path: String; Index: Integer; AlbumArt: Boolean = False);
var
  SearchRec: TSearchRec;
begin
  IIndex:= Index;
  FName := Path;
  tcMain.ActiveTabIndex := 0;
  FileTag1.FileName := Path;
  FileTag1.Active := True;
  FileTag2.FileName := Path;
  FileTag2.Active := True;

  JvID3v2.FileName := Path;
  JvID3v2.Active := True;

  if FileTag2.Texts.LeadArtist.Count > 0 then
  begin
    edArtist.Text := FileTag2.Texts.LeadArtist.Strings[0];
    edTrTitle.Text := FileTag2.Texts.Title;
    edAlbum.Text := FileTag2.Texts.Album;
    edYear.Text := IntToStr(FileTag2.Texts.Year);
    if FileTag2.Texts.ContentType.Count > 0 then
      cbGenre.Text := GenreToNiceGenre(FileTag2.Texts.ContentType.Strings[0])
    else
      cbGenre.Text := 'Blues';

    seTrNumber.Text := FileTag2.Texts.TrackNum;
    mmComment.Text := TJvID3ContentFrame.FindOrCreate(FileTag2, fiComment).Text;
  end else if FileTag1.Artist <> '' then
  begin
    edArtist.Text := FileTag1.Artist;
    edTrTitle.Text := FileTag1.SongName;
    edAlbum.Text := FileTag1.Album;
    edYear.Text := FileTag1.Year;
    cbGenre.Text := FileTag1.GenreAsString;
    seTrNumber.Value := FileTag1.AlbumTrack;
    mmComment.Text := FileTag1.Comment;
  end;
                   
  edLength.Text := SecondsToTimeStr(JvID3v2.FileInfo.LengthInSec);
  edBitrate.Text := IntToStr(JvID3v2.FileInfo.Bitrate);
  edFrequency.Text := IntToStr(JvID3v2.FileInfo.SamplingRateFrequency);
  edFileSize.Text := fMain.BytesToStr(JvID3v2.FileInfo.FileSize);
  edCopyr.Text := BoolToStr((mbCopyrighted in JvID3v2.FileInfo.Bits), True);
  edOriginal.Text := BoolToStr((mbOriginal in JvID3v2.FileInfo.Bits), True);

  if JvID3v2.Images.Pictures.Other.Height > 0 then
  begin
    imAlbumTags.Picture := JvID3v2.Images.Pictures.Other;
    edAlbumTagsWidth.Text := IntToStr(JvID3v2.Images.Pictures.Other.Width);
    edAlbumTagsHeight.Text := IntToStr(JvID3v2.Images.Pictures.Other.Height);
    imAlbumTags.Picture.SaveToFile(GetTempDir + 'albumart.jpg');
    edAlbumTagsFileSize.Text := fMain.BytesToStr(GetFileSize(GetTempDir + 'albumart.jpg'));
    if GetFileSize(GetTempDir + 'albumart.jpg') > 32500 then
      btnAlbumTagsCompress.Font.Color := clRed
    else
      btnAlbumTagsCompress.Font.Color := clWindowText;
  end else
  begin
    imAlbumtags.Picture := imAlbumNone.Picture;
    edAlbumTagsWidth.Text := '';
    edAlbumTagsHeight.Text := '';
    edAlbumTagsFileSize.Text := '';
    btnAlbumTagsCompress.Font.Color := clWindowText;
  end;

  if FindFirst(ExtractFilePath(Path) + '*.jpg', faAnyFile, SearchRec) = 0 then
  begin
    imAlbumDir.Picture.LoadFromFile(ExtractFilePath(Path) + SearchRec.Name);
    edAlbumDirWidth.Text := IntToStr(imAlbumDir.Width);
    edAlbumDirHeight.Text := IntToStr(imAlbumDir.Height);
    edAlbumDirFileSize.Text := fMain.BytesToStr(GetFileSize(ExtractFilePath(Path) + SearchRec.Name));
    if GetFileSize(ExtractFilePath(Path) + SearchRec.Name) > 32500 then
      edAlbumDirFileSize.Font.Color := clRed
    else
      edAlbumDirFileSize.Font.Color := clWindowText;
    FindClose(SearchRec);
  end else begin
    imAlbumDir.Picture := imAlbumNone.Picture;
    edAlbumDirWidth.Text := '';
    edAlbumDirHeight.Text := '';
    edAlbumDirFileSize.Text := '';
    edAlbumDirFileSize.Font.Color := clWindowText;
  end;

  JvID3v2.Active := False;

  if AlbumArt then
    tcMain.ActiveTabIndex := 2;
end;

procedure TfTags.FormCreate(Sender: TObject);
begin
  FileTag2 := TJvID3v2.Create(self);
  FileTag1 := TJvID3v1.Create(self);
end;

procedure TfTags.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTags.imAlbumTagsClick(Sender: TObject);
var
  f: TForm;
  i: Integer;
begin
  f := CreateMessageDialog('xxx', mtError, []);

  for i := 0 to f.ComponentCount -1 do
  begin
    if f.Components[i].ClassName = 'TImage' then
    begin
      with f.Components[i] as TImage do
      begin
        Picture := imAlbumtags.Picture;
        Autosize := True;
      end;
    end;
    if f.Components[i].ClassName = 'TLabel' then
      (f.Components[i] as tLabel).visible := False;
  end;

  f.Caption := '';
  f.Position := poDesktopCenter;
  f.AutoSize := True;
  f.Show;
end;

procedure TfTags.imAlbumDirClick(Sender: TObject);
var
  f: TForm;
  i: Integer;
begin
  f := CreateMessageDialog('xxx', mtError, []);

  for i := 0 to f.ComponentCount -1 do
  begin
    if f.Components[i].ClassName = 'TImage' then
    begin
      with f.Components[i] as TImage do
      begin
        Picture := imAlbumDir.Picture;
        Autosize := True;
      end;
    end;
    if f.Components[i].ClassName = 'TLabel' then
      (f.Components[i] as tLabel).visible := False;
  end;

  f.Caption := '';
  f.Position := poDesktopCenter;
  f.AutoSize := True;
  f.Show;
end;

procedure TfTags.btnSearchAmazonClick(Sender: TObject);
begin
  if Length(edAlbum.Text) > 0 then
    fAlbumArt.SearchAlbumArt(edAlbum.Text)
  else if Length(edArtist.Text) > 0 then
    fAlbumArt.SearchAlbumArt(edArtist.Text)
  else if Length(edTrTitle.Text) > 0 then
    fAlbumArt.SearchAlbumArt(edTrTitle.Text);
end;

procedure TfTags.btnAlbumTagsSaveClick(Sender: TObject);
begin
  if (length(edArtist.Text) > 0) AND (length(edAlbum.Text) > 0) then
    dlgSaveAlbum.FileName := ExtractFilePath(FName) + edArtist.Text + ' - ' + edAlbum.Text + '.jpg'
  else
    dlgSaveAlbum.FileName := ExtractFilePath(FName) + 'folder.jpg';

  if dlgSaveAlbum.Execute then
  begin
    imAlbumTags.Picture.Graphic.SaveToFile(dlgSaveAlbum.FileName);
    ReadTags(FName, IIndex, True);
  end;
end;

procedure TfTags.btnAlbumDirSaveClick(Sender: TObject);
begin
  if (length(edArtist.Text) > 0) AND (length(edAlbum.Text) > 0) then
    dlgSaveAlbum.FileName := ExtractFilePath(FName) + edArtist.Text + ' - ' + edAlbum.Text + '.jpg'
  else
    dlgSaveAlbum.FileName := ExtractFilePath(FName) + 'folder.jpg';

  if dlgSaveAlbum.Execute then
  begin
    imAlbumTags.Picture.Graphic.SaveToFile(dlgSaveAlbum.FileName);
    ReadTags(FName, IIndex, True);
  end;
end;

procedure TfTags.btnAlbumTagsDelClick(Sender: TObject);
var
  jpg: TJPEGImage;
begin
  jpg := TJPEGImage.Create;
  JvID3v2.Active := True;
  JvID3v2.Images.Pictures.Other.Assign(jpg);
  JvID3v2.Commit;
  JvID3v2.Active := False;
  ReadTags(FName, IIndex, True);
end;

procedure TfTags.btnAlbumDirDelClick(Sender: TObject);
var
  SearchRec: TSearchRec;
begin
  if FindFirst(ExtractFilePath(FName) + '*.jpg', faAnyFile, SearchRec) = 0 then
  begin
    DeleteFile(ExtractFilePath(FName) + SearchRec.Name);
    FindClose(SearchRec);
    ReadTags(FName, IIndex, True);
  end;
end;

procedure TfTags.btnAlbumDirCompressClick(Sender: TObject);
var
  img: TMultiImage;
  SearchRec: TSearchRec;
begin
  img := TMultiImage.Create;

  imAlbumDir.Picture.SaveToFile(GetTempDir + 'album_comp.jpg');
  repeat
    img.LoadMultiFromFile(GetTempDir + 'album_comp.jpg');
    img.ResizeImages(img.Width -5, img.Height -5, rfBicubic);
    img.SaveMultiToFile(GetTempDir + 'album_comp.jpg');
  until GetFileSize(GetTempDir + 'album_comp.jpg') < 32500;

  if FindFirst(ExtractFilePath(FName) + '*.jpg', faAnyFile, SearchRec) = 0 then
  begin
    FindClose(SearchRec);
    img.SaveMultiToFile(ExtractFilePath(FName) +  SearchRec.Name);
    ReadTags(FName, IIndex, True);
  end;
end;

procedure TfTags.btnAlbumTagsCompressClick(Sender: TObject);
var
  img: TMultiImage;
begin
  img := TMultiImage.Create;

  imAlbumTags.Picture.SaveToFile(GetTempDir + 'album_comp.jpg');
  repeat
    img.LoadMultiFromFile(GetTempDir + 'album_comp.jpg');
    img.ResizeImages(img.Width -5, img.Height -5, rfBicubic);
    img.SaveMultiToFile(GetTempDir + 'album_comp.jpg');
  until GetFileSize(GetTempDir + 'album_comp.jpg') < 32500;

  JvID3v2.Active := True;
  JvID3v2.Images.Pictures.Other.LoadFromFile(GetTempDir + 'album_comp.jpg');
  JvID3v2.Commit;
  JvID3v2.Active := False;
  ReadTags(FName, IIndex, True);
end;

procedure TfTags.sbtnBackClick(Sender: TObject);
begin
  if IIndex > 0 then
  begin
    IIndex := IIndex - 1;
    ReadTags(fMain.lvMusicTags.Items[IIndex].SubItems[4], IIndex, (tcMain.ActiveTabIndex = 2));
  end;
end;

procedure TfTags.sbtnFrwdClick(Sender: TObject);
begin
  if IIndex < fMain.lvMusicTags.Items.Count -1 then
  begin
    IIndex := IIndex + 1;
    ReadTags(fMain.lvMusicTags.Items[IIndex].SubItems[4], IIndex, (tcMain.ActiveTabIndex = 2));
  end;
end;

procedure TfTags.btnOkClick(Sender: TObject);
begin
  FileTag2.Filename := FName;
  FileTag2.Active := True;

  FileTag2.Texts.LeadArtist.Clear;
  FileTag2.Texts.LeadArtist.Add(edArtist.Text);
  FileTag2.Texts.Title := edTrTitle.Text;
  FileTag2.Texts.Album := edAlbum.Text;
  FileTag2.Texts.Year := StrToInt(edYear.Text);
  FileTag2.Texts.ContentType.Clear;
  FileTag2.Texts.ContentType.Add(NiceGenreToGenre(cbGenre.Text));
  FileTag2.Texts.TrackNum := IntToStr(seTrNumber.ValueAsInteger);
  TJvID3ContentFrame.FindOrCreate(FileTag2, fiComment).Text := mmComment.Text;
  FileTag2.Commit;
  FileTag2.Active := False;

  FileTag1.Filename := FName;
  FileTag1.Active := True;

  FileTag1.Artist := edArtist.Text;
  FileTag1.SongName := edTrTitle.Text;
  FileTag1.Album := edAlbum.Text;
  FileTag1.Year := edYear.Text;
  FileTag1.Genre := cbGenre.ItemIndex;
  FileTag1.AlbumTrack := seTrNumber.ValueAsInteger;
  FileTag1.Comment := mmComment.Text;
  FileTag1.Commit;
  FileTag1.Active := False;

  with fmain.lvMusicTags.Items[IIndex] do
  begin
    Caption := edArtist.Text;
    SubItems[0] := edTrTitle.Text;
    SubItems[1] := edAlbum.Text;
    SubItems[2] := edYear.Text;
    SubItems[3] := cbGenre.Text;
  end;

  Close;
end;

end.
