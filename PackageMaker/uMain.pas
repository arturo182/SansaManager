unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CabSTComps, IniFiles, SpTBXEditors, DateUtils,
  TBXDkPanels, SpTBXControls, ComCtrls, ShellAPI;

type
  TForm1 = class(TForm)
    STCabWriter: TSTCabWriter;
    Edit1: TSpTBXSpinEdit;
    Edit2: TSpTBXSpinEdit;
    Edit3: TSpTBXSpinEdit;
    Edit4: TSpTBXSpinEdit;
    SpTBXGroupBox1: TSpTBXGroupBox;
    lvHosts: TListView;
    SpTBXGroupBox2: TSpTBXGroupBox;
    SpTBXButton1: TSpTBXButton;
    SpTBXGroupBox3: TSpTBXGroupBox;
    lvTransl: TListView;
    SpTBXButton2: TSpTBXButton;
    SpTBXButton3: TSpTBXButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpTBXButton2Click(Sender: TObject);
    procedure SpTBXButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure SaveListViewToFile(AListView: TListView; sFileName: string);
var
  idxItem, idxSub, IdxImage: Integer;
  F: TFileStream;
  pText: PChar;
  sText: string;
  W, ItemCount, SubCount: Word;
  MySignature: array [0..2] of Char;
begin
  with AListView do
  begin
    ItemCount := 0;
    SubCount  := 0;
    MySignature := 'LVF';
    F := TFileStream.Create(sFileName, fmCreate or fmOpenWrite);
    F.Write(MySignature, SizeOf(MySignature));

    if Items.Count = 0 then
      ItemCount := 0
    else
      ItemCount := Items.Count;
    F.Write(ItemCount, SizeOf(ItemCount));

    if Items.Count > 0 then
    begin
      for idxItem := 1 to ItemCount do
      begin
        with Items[idxItem - 1] do
        begin
          if SubItems.Count = 0 then
            SubCount := 0
          else
            SubCount := Subitems.Count;
          F.Write(SubCount, SizeOf(SubCount));
          IdxImage := ImageIndex;
          F.Write(IdxImage, SizeOf(IdxImage));
          sText := Caption;
          w     := Length(sText);
          pText := StrAlloc(Length(sText) + 1);
          StrPLCopy(pText, sText, Length(sText));
          F.Write(w, SizeOf(w));
          F.Write(pText^, w);
          StrDispose(pText);
          if SubCount > 0 then
          begin
            for idxSub := 0 to SubItems.Count - 1 do
            begin
              sText := SubItems[idxSub];
              w     := Length(sText);
              pText := StrAlloc(Length(sText) + 1);
              StrPLCopy(pText, sText, Length(sText));
              F.Write(w, SizeOf(w));
              F.Write(pText^, w);
              StrDispose(pText);
            end;
          end;
        end;
      end;
    end;
    F.Free;
  end;
end;

procedure LoadListViewFromFile(AListView: TListView; sFileName: string);
var
  F: TFileStream;
  IdxItem, IdxSubItem, IdxImage: Integer;
  W, ItemCount, SubCount: Word;
  pText: PChar;
  PTemp: PChar;
  MySignature: array [0..2] of Char;
  sExeName: string;
begin
  with AListView do
  begin
    ItemCount := 0;
    SubCount  := 0;

    sExeName := ExtractFileName(sFileName);

    if not FileExists(sFileName) then
    begin
      Exit;
    end;

    F := TFileStream.Create(sFileName, fmOpenRead);
    F.Read(MySignature, SizeOf(MySignature));

    if MySignature <> 'LVF' then
    begin
      Exit;
    end;

    F.Read(ItemCount, SizeOf(ItemCount));
    Items.Clear;

    for idxItem := 1 to ItemCount do
    begin
      with Items.Add do
      begin
        F.Read(SubCount, SizeOf(SubCount));
        F.Read(IdxImage, SizeOf(IdxImage));
        ImageIndex := IdxImage;
        F.Read(w, SizeOf(w));
        pText := StrAlloc(w + 1);
        pTemp := StrAlloc(w + 1);
        F.Read(pTemp^, W);
        StrLCopy(pText, pTemp, W);
        Caption := StrPas(pText);
        StrDispose(pTemp);
        StrDispose(pText);
        if SubCount > 0 then
        begin
          for idxSubItem := 1 to SubCount do
          begin
            F.Read(w, SizeOf(w));
            pText := StrAlloc(w + 1);
            pTemp := StrAlloc(w + 1);
            F.Read(pTemp^, W);
            StrLCopy(pText, pTemp, W);
            Items[idxItem - 1].SubItems.Add(StrPas(pText));
            StrDispose(pTemp);
            StrDispose(pText);
          end;
        end;
      end;
    end;

    F.Free;
  end;
end;

function ExtractDomain(URL : String): String;
begin
  Result := URL;

  if Pos( '://', URL ) > 0 then
    Result := Copy( URL, Pos( '://', Result ) + 3 , Length(URL));

  Delete( Result  , Pos( '/', Result ) , Length(URL) )
end;

function DelDir(dir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc  := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom  := PChar(dir + #0);
  end;
  Result := (0 = ShFileOperation(fos));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ini : TIniFile;
  i, j: Integer;
  dir: String;
begin
  STCabWriter.Open(ExtractFilePath(Application.ExeName) + 'update.upd');
  STCabWriter.AddFiles(ExtractFilePath(Application.ExeName) + 'DAT\*', '', [cafsoRecurseSubdirs]);
  STCabWriter.Close;

  for i := 0 to lvHosts.Items.Count -1 do
  begin
    dir := ExtractFilePath(Application.ExeName) + 'upload\' + ExtractDomain(lvHosts.Items[i].Caption) + '\';
    DelDir(dir);
    CreateDir(dir);
    CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'update.upd'), PChar(dir + 'update.upd'), false);

    ini := TIniFile.Create(dir + 'update.ini');
    ini.WriteInteger('update', 'ver1', Edit1.ValueAsInteger);
    ini.WriteInteger('update', 'ver2', Edit2.ValueAsInteger);
    ini.WriteInteger('update', 'ver3', Edit3.ValueAsInteger);
    ini.WriteInteger('update', 'ver4', Edit4.ValueAsInteger);
    ini.WriteString('update', 'URL', lvHosts.Items[i].Caption + 'update.upd');
    ini.WriteFloat('update', 'release', DaysBetween(Now, 0));
    ini.Free;

    ini := TIniFile.Create(dir + 'transl.ini');
    ini.WriteInteger('transl', 'count', lvTransl.Items.Count);

    for j := 0 to lvTransl.Items.Count -1 do
    begin
      ini.WriteString('transl', 't' + IntToStr(j + 1), lvTransl.Items[j].SubItems[0]);
      ini.WriteString(lvTransl.Items[j].SubItems[0], 'desc', lvTransl.Items[j].Caption);
      ini.WriteString(lvTransl.Items[j].SubItems[0], 'URL', lvHosts.Items[i].Caption + lvTransl.Items[j].Caption + '.lng');
      ini.WriteString(lvTransl.Items[j].SubItems[0], 'modified', lvTransl.Items[j].SubItems[1]);
    end;

    ini.Free;
  end;

  ShowMessage('Done!');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini : TIniFile;
begin
  SaveListViewToFile(lvTransl, ExtractFilePath(Application.ExeName) + 'transl.dat');
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'version.dat');
  ini.WriteInteger('.', 'v1', Edit1.ValueAsInteger);
  ini.WriteInteger('.', 'v2', Edit2.ValueAsInteger);
  ini.WriteInteger('.', 'v3', Edit3.ValueAsInteger);
  ini.WriteInteger('.', 'v4', Edit4.ValueAsInteger);
  ini.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ini : TIniFile;
begin
  LoadListViewFromFile(lvTransl, ExtractFilePath(Application.ExeName) + 'transl.dat');
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'version.dat');
  Edit1.ValueAsInteger := ini.ReadInteger('.', 'v1', 0);
  Edit2.ValueAsInteger := ini.ReadInteger('.', 'v2', 0);
  Edit3.ValueAsInteger := ini.ReadInteger('.', 'v3', 0);
  Edit4.ValueAsInteger := ini.ReadInteger('.', 'v4', 0);
  ini.Free;
end;

procedure TForm1.SpTBXButton2Click(Sender: TObject);
begin
  if lvTransl.SelCount > 0 then
    lvTransl.Selected.SubItems[1] := IntToStr(DaysBetween(Now, 0));
end;

procedure TForm1.SpTBXButton3Click(Sender: TObject);
var
  s, s2: String;
begin
  InputQuery('name', 'name', s);
  InputQuery('short', 'short', s2);

  with lvTransl.Items.Add do
  begin
     Caption := s;
     SubItems.Add(s2);
     SubItems.Add('');
  end;
end;

end.
