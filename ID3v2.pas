{ *************************************************************************** }
{                                                                             }
{ Audio Tools Library (Freeware)                                              }
{ Class TID3v2 - for manipulating with ID3v2 tags                             }
{                                                                             }
{ Copyright (c) 2001 by Jurgen Faul                                           }
{ E-mail: jfaul@gmx.de                                                        }
{ http://jfaul.de/atl                                                         }
{                                                                             }
{ Version 1.2 (17 October 2001)                                               }
{   - Writing support for ID3v2.3.x tags                                      }
{   - Fixed bug with track number detection                                   }
{   - Fixed bug with tag reading                                              }
{                                                                             }
{ Version 1.1 (31 August 2001)                                                }
{   - Added public procedure ResetData                                        }
{                                                                             }
{ Version 1.0 (14 August 2001)                                                }
{   - Reading support for ID3v2.3.x tags                                      }
{   - Tag info: title, artist, album, track, year, genre, comment             }
{                                                                             }
{ *************************************************************************** }

unit ID3v2;

interface

uses
  Classes, SysUtils;

const
  TAG_VERSION_2_3 = 3;                               { Code for ID3v2.3.x tag }

type
  { Class TID3v2 }
  TID3v2 = class(TObject)
    private
      { Private declarations }
      FExists: Boolean;
      FVersionID: Byte;
      FSize: Integer;
      FTitle: string;
      FArtist: string;
      FAlbum: string;
      FTrack: Byte;
      FYear: string;
      FGenre: string;
      FComment: string;
      procedure FSetTitle(const NewTitle: string);
      procedure FSetArtist(const NewArtist: string);
      procedure FSetAlbum(const NewAlbum: string);
      procedure FSetTrack(const NewTrack: Byte);
      procedure FSetYear(const NewYear: string);
      procedure FSetGenre(const NewGenre: string);
      procedure FSetComment(const NewComment: string);
    public
      { Public declarations }
      constructor Create;                                     { Create object }
      procedure ResetData;                                   { Reset all data }
      function ReadFromFile(const FileName: string): Boolean;      { Load tag }
      function RemoveFromFile(const FileName: string): Boolean;  { Delete tag }
      function SaveToFile(const FileName: string): Boolean;        { Save tag }
      property Exists: Boolean read FExists;              { True if tag found }
      property VersionID: Byte read FVersionID;                { Version code }
      property Size: Integer read FSize;                     { Total tag size }
      property Title: string read FTitle write FSetTitle;        { Song title }
      property Artist: string read FArtist write FSetArtist;    { Artist name }
      property Album: string read FAlbum write FSetAlbum;       { Album title }
      property Track: Byte read FTrack write FSetTrack;        { Track number }
      property Year: string read FYear write FSetYear;         { Release year }
      property Genre: string read FGenre write FSetGenre;        { Genre name }
      property Comment: string read FComment write FSetComment;     { Comment }
  end;

implementation

const
  { ID3v2 tag ID }
  ID3V2_ID = 'ID3';

  { Max. number of supported tag frames }
  ID3V2_FRAME_COUNT = 7;

  { Names of supported tag frames }
  ID3V2_FRAME: array [1..ID3V2_FRAME_COUNT] of string =
    ('TIT2', 'TPE1', 'TALB', 'TRCK', 'TYER', 'TCON', 'COMM');

type
  { ID3v2 frame header }
  FrameHeader = record
    ID: array [1..4] of Char;                                      { Frame ID }
    Size: Integer;                                    { Size excluding header }
    Flags: Word;                                                      { Flags }
  end;

  { ID3v2 header data - for internal use }
  TagInfo = record
    { Real structure of ID3v2 header }
    ID: array [1..3] of Char;                                  { Always "ID3" }
    Version: Byte;                                           { Version number }
    Revision: Byte;                                         { Revision number }
    Flags: Byte;                                               { Flags of tag }
    Size: array [1..4] of Byte;                   { Tag size excluding header }
    { Extended data }
    FileSize: Integer;                                    { File size (bytes) }
    Frame: array [1..ID3V2_FRAME_COUNT] of string;  { Information from frames }
  end;

{ ********************* Auxiliary functions & procedures ******************** }

function ReadHeader(const FileName: string; var Tag: TagInfo): Boolean;
var
  SourceFile: file;
  Transferred: Integer;
begin
  try
    Result := true;
    { Set read-access and open file }
    AssignFile(SourceFile, FileName);
    FileMode := 0;
    Reset(SourceFile, 1);
    { Read header and get file size }
    BlockRead(SourceFile, Tag, 10, Transferred);
    Tag.FileSize := FileSize(SourceFile);
    CloseFile(SourceFile);
    { if transfer is not complete }
    if Transferred < 10 then Result := false;
  except
    { Error }
    Result := false;
  end;
end;

{ --------------------------------------------------------------------------- }

function GetVersionID(const Tag: TagInfo): Byte;
begin
  { Get tag version from header }
  Result := Tag.Version;
end;

{ --------------------------------------------------------------------------- }

function GetTagSize(const Tag: TagInfo): Integer;
begin
  { Get total tag size }
  Result :=
    Tag.Size[1] * $200000 +
    Tag.Size[2] * $4000 +
    Tag.Size[3] * $80 +
    Tag.Size[4] + 10;
  if Result > Tag.FileSize then Result := 0;
end;

{ --------------------------------------------------------------------------- }

procedure SetTagItem(const ID, Data: string; var Tag: TagInfo);
var
  Iterator: Byte;
begin
  { Set tag item if supported frame found }
  for Iterator := 1 to ID3V2_FRAME_COUNT do
    if ID3V2_FRAME[Iterator] = ID then Tag.Frame[Iterator] := Data;
end;

{ --------------------------------------------------------------------------- }

function Swap32(const Figure: Integer): Integer;
var
  ByteArray: array [1..4] of Byte absolute Figure;
begin
  { Swap 4 bytes }
  Result :=
    ByteArray[1] * $1000000 +
    ByteArray[2] * $10000 +
    ByteArray[3] * $100 +
    ByteArray[4];
end;

{ --------------------------------------------------------------------------- }

procedure ReadFrames(const FileName: string; var Tag: TagInfo);
var
  SourceFile: file;
  Frame: FrameHeader;
  Data: array [1..250] of Char;
  DataPosition: Integer;
begin
  try
    { Set read-access, open file }
    AssignFile(SourceFile, FileName);
    FileMode := 0;
    Reset(SourceFile, 1);
    Seek(SourceFile, 10);
    while (FilePos(SourceFile) < GetTagSize(Tag)) and (not EOF(SourceFile)) do
    begin
      FillChar(Data, SizeOf(Data), 0);
      { Read frame header and check frame ID }
      BlockRead(SourceFile, Frame, 10);
      if not (Frame.ID[1] in ['A'..'Z']) then break;
      DataPosition := FilePos(SourceFile);
      { Read frame data and set tag item if frame supported }
      BlockRead(SourceFile, Data, Swap32(Frame.Size) mod SizeOf(Data));
      SetTagItem(Frame.ID, Data, Tag);
      Seek(SourceFile, DataPosition + Swap32(Frame.Size));
    end;
    CloseFile(SourceFile);
  except
  end;
end;

{ --------------------------------------------------------------------------- }

function ExtractTrack(const TrackString: string): Byte;
var
  Index, Value, Code: Integer;
begin
  { Extract track from string }
  Index := Pos('/', Trim(TrackString));
  if Index = 0 then Val(Trim(TrackString), Value, Code)
  else Val(Copy(Trim(TrackString), 1, Index - 1), Value, Code);
  if Code = 0 then Result := Value
  else Result := 0;
end;

{ --------------------------------------------------------------------------- }

function ExtractGenre(const GenreString: string): string;
begin
  { Extract genre from string }
  Result := Trim(GenreString);
  if Pos(')', Result) > 0 then Delete(Result, 1, LastDelimiter(')', Result));
end;

{ --------------------------------------------------------------------------- }

function RebuildFile(const FileName: string; NewTagData: TStream): Boolean;
var
  Tag: TagInfo;
  Source, Destination: TFileStream;
  BufferName: string;
begin
  { Rebuild file with old file data and new tag (optional) }
  Result := false;
  if (not FileExists(FileName)) or (FileSetAttr(FileName, 0) <> 0) then exit;
  if not ReadHeader(FileName, Tag) then exit;
  if (NewTagData = nil) and (Tag.ID <> ID3V2_ID) then exit;
  try
    { Create file streams }
    BufferName := FileName + '~';
    Source := TFileStream.Create(FileName, fmOpenRead	or fmShareExclusive);
    Destination := TFileStream.Create(BufferName, fmCreate);
    { Copy data blocks }
    if Tag.ID = ID3V2_ID then Source.Seek(GetTagSize(Tag), soFromBeginning);
    if NewTagData <> nil then Destination.CopyFrom(NewTagData, 0);
    Destination.CopyFrom(Source, Source.Size - Source.Position);
    { Free resources }
    Source.Free;
    Destination.Free;
    { Replace old file and delete temporary file }
    if (DeleteFile(FileName)) and (RenameFile(BufferName, FileName)) then
      Result := true
    else
      raise Exception.Create('');
  except
    { Access error }
    if FileExists(BufferName) then DeleteFile(BufferName);
  end;
end;

{ --------------------------------------------------------------------------- }

procedure BuildHeader(var Tag: TagInfo);
var
  Iterator, TagSize: Integer;
begin
  { Build tag header }
  Tag.ID := ID3V2_ID;
  Tag.Version := TAG_VERSION_2_3;
  Tag.Revision := 0;
  Tag.Flags := 0;
  TagSize := 0;
  for Iterator := 1 to ID3V2_FRAME_COUNT do
    if Tag.Frame[Iterator] <> '' then
      Inc(TagSize, Length(Tag.Frame[Iterator]) + 11);
  { Convert tag size }
  Tag.Size[1] := TagSize div $200000;
  Tag.Size[2] := TagSize div $4000;
  Tag.Size[3] := TagSize div $80;
  Tag.Size[4] := TagSize mod $80;
end;

{ ********************** Private functions & procedures ********************* }

procedure TID3v2.FSetTitle(const NewTitle: string);
begin
  { Set song title }
  FTitle := TrimRight(NewTitle);
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetArtist(const NewArtist: string);
begin
  { Set artist name }
  FArtist := TrimRight(NewArtist);
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetAlbum(const NewAlbum: string);
begin
  { Set album title }
  FAlbum := TrimRight(NewAlbum);
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetTrack(const NewTrack: Byte);
begin
  { Set track number }
  FTrack := NewTrack;
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetYear(const NewYear: string);
begin
  { Set release year }
  FYear := TrimRight(NewYear);
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetGenre(const NewGenre: string);
begin
  { Set genre name }
  FGenre := TrimRight(NewGenre);
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.FSetComment(const NewComment: string);
begin
  { Set comment }
  FComment := TrimRight(NewComment);
end;

{ ********************** Public functions & procedures ********************** }

constructor TID3v2.Create;
begin
  { Create object }
  inherited;
  ResetData;
end;

{ --------------------------------------------------------------------------- }

procedure TID3v2.ResetData;
begin
  { Reset all variables }
  FExists := false;
  FVersionID := 0;
  FSize := 0;
  FTitle := '';
  FArtist := '';
  FAlbum := '';
  FTrack := 0;
  FYear := '';
  FGenre := '';
  FComment := '';
end;

{ --------------------------------------------------------------------------- }

function TID3v2.ReadFromFile(const FileName: string): Boolean;
var
  Tag: TagInfo;
begin
  { Reset data and load header from file to variable }
  ResetData;
  Result := ReadHeader(FileName, Tag);
  { Process data if loaded and header valid }
  if (Result) and (Tag.ID = ID3V2_ID) then
  begin
    FExists := true;
    { Fill properties with header data }
    FVersionID := GetVersionID(Tag);
    FSize := GetTagSize(Tag);
    { Get information from frames if version supported }
    if (FVersionID = TAG_VERSION_2_3) and (FSize > 0) then
    begin
      ReadFrames(FileName, Tag);
      { Fill properties with data from frames }
      FTitle := Trim(Tag.Frame[1]);
      FArtist := Trim(Tag.Frame[2]);
      FAlbum := Trim(Tag.Frame[3]);
      FTrack := ExtractTrack(Tag.Frame[4]);
      FYear := Trim(Tag.Frame[5]);
      FGenre := ExtractGenre(Tag.Frame[6]);
      FComment := Trim(Copy(Tag.Frame[7], 5, Length(Tag.Frame[7]) - 4));
    end;
  end;
end;

{ --------------------------------------------------------------------------- }

function TID3v2.RemoveFromFile(const FileName: string): Boolean;
begin
  { Remove tag from file }
  Result := RebuildFile(FileName, nil);
end;

{ --------------------------------------------------------------------------- }

function TID3v2.SaveToFile(const FileName: string): Boolean;
var
  NewTagData: TStringStream;
  Tag: TagInfo;
  Iterator, FrameSize: Integer;
begin
  { Build tag and save to file }
  NewTagData := TStringStream.Create('');
  { Prepare tag data }
  FillChar(Tag, SizeOf(Tag), 0);
  Tag.Frame[1] := FTitle;
  Tag.Frame[2] := FArtist;
  Tag.Frame[3] := FAlbum;
  if FTrack > 0 then Tag.Frame[4] := IntToStr(FTrack);
  Tag.Frame[5] := FYear;
  Tag.Frame[6] := FGenre;
  if FComment <> '' then Tag.Frame[7] := 'eng' + #0 + FComment;
  { Build and write tag header }
  BuildHeader(Tag);
  NewTagData.Write(Tag, 10);
  { Build and write tag frames }
  for Iterator := 1 to ID3V2_FRAME_COUNT do
    if Tag.Frame[Iterator] <> '' then
    begin
      NewTagData.WriteString(ID3V2_FRAME[Iterator]);
      FrameSize := Swap32(Length(Tag.Frame[Iterator]) + 1);
      NewTagData.Write(FrameSize, SizeOf(FrameSize));
      NewTagData.WriteString(#0#0#0 + Tag.Frame[Iterator]);
    end;
  { Rebuild file with new tag }
  Result := RebuildFile(FileName, NewTagData);
  NewTagData.Free;
end;

end.
