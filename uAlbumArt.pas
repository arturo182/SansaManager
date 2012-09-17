unit uAlbumArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, HTTPGet, StdCtrls, ComCtrls, SimpleRSS, xmldom, XMLIntf,
  msxmldom, XMLDoc, TntStdCtrls, SpTBXEditors, OleCtrls, SHDocVw,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  TBXDkPanels, SpTBXControls, LngINISupp;

type
  TfAlbumArt = class(TForm)
    HTTPGet: THTTPGet;
    XMLDocument: TXMLDocument;
    ComboBox: TSpTBXComboBox;
    WebBrowser: TWebBrowser;
    btnAlbumArtUse: TSpTBXButton;
    HTTPGet2: THTTPGet;
    procedure HTTPGetDoneString(Sender: TObject; Result: String);
    procedure ComboBoxChange(Sender: TObject);
    procedure btnAlbumArtUseClick(Sender: TObject);
    procedure HTTPGet2DoneFile(Sender: TObject; FileName: String;
      FileSize: Integer);
  private
    { Private declarations }
  public
    procedure SearchAlbumArt(Query: String);
  end;

var
  fAlbumArt: TfAlbumArt;

implementation

uses uMain, uTags;

{$R *.dfm}

procedure TfAlbumArt.SearchAlbumArt(Query: String);
begin
  HTTPGet.URL := 'http://xml.amazon.com/onca/xml3?t=php9comweblot-20;&dev-t=D37FFQXOC3MRYZ&mode=music&type=lite&page=1&f=xml&KeywordSearch=' + StringReplace(Query, ' ', '+', [rfReplaceAll, rfIgnoreCase]);
  HTTPGet.GetString;
end;

procedure TfAlbumArt.HTTPGetDoneString(Sender: TObject; Result: String);
var
i, j: Integer;
begin
  WebBrowser.Navigate('about:blank');
  XMLDocument.XML.Text := StringReplace(Result, #10, #13#10, [rfReplaceAll, rfIgnoreCase]);
  XMLDocument.Active := True;
  ComboBox.Clear;
  
  with XMLDocument.Node.ChildNodes.Nodes[1] do
  begin
    for j := 0 to ChildNodes.Count -1 do
    begin
      if ChildNodes.Nodes[j].NodeName = 'Details' then
      begin
        if Length(ChildNodes.Nodes[j].ChildValues['ProductName']) > 120 then
          ComboBox.Items.Add(Copy(ChildNodes.Nodes[j].ChildValues['ProductName'], 0, 120) + '...')
        else
          ComboBox.Items.Add(ChildNodes.Nodes[j].ChildValues['ProductName']);
      end else if ChildNodes.Nodes[j].NodeName = 'ErrorMsg' then
      begin
        CreateMessageDialog(PChar(String(ChildNodes.Nodes[j].NodeValue)), mtError, [mbOK]).ShowModal;
      end;
    end;
  end;

  if ComboBox.Items.AnsiStrings.Count > 0 then
    ShowModal;
end;

procedure TfAlbumArt.ComboBoxChange(Sender: TObject);
var
  str: TStringList;
begin
  str := TStringList.Create;

  with XMLDocument.Node.ChildNodes.Nodes[1].ChildNodes.Nodes[(ComboBox.ItemIndex + 3)] do
  begin
    str.Add('<link type="text/css" rel="stylesheet" href="' + ExtractFilePath(Application.Exename) + 'data\style.css">');
    str.Add('<table border="0" width="100%">');
    str.Add('<tr>');
    str.Add('<td align="center" width="1%"><img src="' + ChildValues['ImageUrlMedium'] + '" alt=""></td>');
    str.Add('<td valign="top">');
    if ChildValues['ProductName'] <> null then
      if length(ChildValues['ProductName']) > 120 then
        str.Add('&nbsp;<b>Product name:</b> ' + Copy(ChildValues['ProductName'], 0, 120)  + '...<br>')
      else
        str.Add('&nbsp;<b>Product name:</b> ' + ChildValues['ProductName']  + '<br>');
    if ChildNodes.Nodes['Artists'].ChildValues['Artist'] <> null then
    str.Add('&nbsp;<b>Artist:</b> ' + ChildNodes.Nodes['Artists'].ChildValues['Artist'] + '<br>');
    if ChildValues['ReleaseDate'] <> null then
    str.Add('&nbsp;<b>Release date:</b> ' + ChildValues['ReleaseDate'] + '<br>');
    if ChildValues['Manufacturer'] <> null then
    str.Add('&nbsp;<b>Manufacturer:</b> ' + ChildValues['Manufacturer'] + '<br>');
    str.Add('</td></tr>');
    str.Add('</table>');
  end;

  str.SaveToFile(ftags.GetTempDir + 'albumart.html');
  WebBrowser.Navigate(ftags.GetTempDir + 'albumart.html');

  str.Free;
end;

procedure TfAlbumArt.btnAlbumArtUseClick(Sender: TObject);
begin
  if ComboBox.ItemIndex > -1 then
  begin
    fTags.imAlbumDir.Picture := nil;
    DeleteFile(ExtractFilePath(fTags.FName) + 'folder.jpg');
    HTTPGet2.FileName := ExtractFilePath(fTags.FName) + 'folder.jpg';
    HTTPGet2.URL := XMLDocument.Node.ChildNodes.Nodes[1].ChildNodes.Nodes[(ComboBox.ItemIndex + 3)].ChildValues['ImageUrlMedium'];
    HTTPGet2.GetFile;
  end;
end;

procedure TfAlbumArt.HTTPGet2DoneFile(Sender: TObject; FileName: String; FileSize: Integer);
begin
  fTags.ReadTags(ftags.FName, ftags.IIndex, True);
  Close;
end;

end.
