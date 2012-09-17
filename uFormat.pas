unit uFormat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SpTBXEditors, ImgList, TBXDkPanels, SpTBXControls;

type
  TfFormat = class(TForm)
    lbFormats: TListBox;
    btnAdd: TSpTBXButton;
    btnDuplicate: TSpTBXButton;
    btnDelete: TSpTBXButton;
    btnUp: TSpTBXButton;
    btnDown: TSpTBXButton;
    imgFormat: TImageList;
    edFormat: TSpTBXEdit;
    btnArtist: TSpTBXButton;
    btnTitle: TSpTBXButton;
    btnAlbum: TSpTBXButton;
    btnYear: TSpTBXButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDuplicateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure lbFormatsClick(Sender: TObject);
    procedure edFormatChange(Sender: TObject);
    procedure AddVariable(Sender: TObject);
    procedure btnSubDirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFormat: TfFormat;

implementation

uses uMain;

{$R *.dfm}

procedure TfFormat.FormShow(Sender: TObject);
begin
  edFormat.Clear;
  lbFormats.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\formats.dat');
end;

procedure TfFormat.btnAddClick(Sender: TObject);
begin
  lbFormats.Items.Add(fMain.MsgINI.GetMsg('FormatBlank'));
end;

procedure TfFormat.btnDuplicateClick(Sender: TObject);
begin
  if lbFormats.ItemIndex > -1 then
    lbFormats.Items.Insert(lbFormats.Items.Count, lbFormats.Items.Strings[lbFormats.ItemIndex])
end;

procedure TfFormat.btnDeleteClick(Sender: TObject);
begin
  if lbFormats.ItemIndex > -1 then
    lbFormats.DeleteSelected;
end;

procedure TfFormat.btnUpClick(Sender: TObject);
var
  x: Integer;
begin
  if (lbFormats.ItemIndex > -1) AND (lbFormats.ItemIndex - 1 > 0)then

  begin
    x := lbFormats.ItemIndex;
    lbFormats.Items.Move(lbFormats.ItemIndex, lbFormats.ItemIndex -1);
    lbFormats.ItemIndex := x -1;
    lbFormats.SetFocus;
  end;
end;

procedure TfFormat.btnDownClick(Sender: TObject);
var
  x: Integer;
begin
  if (lbFormats.ItemIndex > -1) AND (lbFormats.ItemIndex + 1 < lbFormats.Items.Count)then
  begin
    x := lbFormats.ItemIndex;
    lbFormats.Items.Move(lbFormats.ItemIndex, lbFormats.ItemIndex +1);
    lbFormats.ItemIndex := x +1;
    lbFormats.SetFocus;
  end;
end;

procedure TfFormat.lbFormatsClick(Sender: TObject);
begin
 if lbFormats.ItemIndex > -1 then
 begin
   edFormat.Text := lbFormats.Items.Strings[lbFormats.ItemIndex];
   edFormat.SetFocus;
   edFormat.SelStart := Length(edFormat.Text);
 end;
end;

procedure TfFormat.edFormatChange(Sender: TObject);
begin
 if lbFormats.ItemIndex > -1 then
   lbFormats.Items.Strings[lbFormats.ItemIndex] := edFormat.Text;
end;

procedure TfFormat.AddVariable(Sender: TObject);
begin
 if lbFormats.ItemIndex > -1 then
 begin
   edFormat.SelText := TButton(Sender).Caption;
   edFormat.SetFocus;
   edFormat.SelStart := Length(edFormat.Text);
 end;
end;

procedure TfFormat.btnSubDirClick(Sender: TObject);
begin
 if lbFormats.ItemIndex > -1 then
 begin
   edFormat.SelText := '\';
   edFormat.SetFocus;
   edFormat.SelStart := Length(edFormat.Text);   
 end;
end;

procedure TfFormat.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := lbFormats.Items.Count -1 downto 0 do
  begin
    if lbFormats.Items.Strings[i] = fMain.MsgINI.GetMsg('FormatBlank') then
      lbFormats.Items.Delete(i);
  end;

  lbFormats.Items.SaveToFile(ExtractFilePath(Application.ExeName) + 'data\formats.dat');
end;

end.
