unit uAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TBXDkPanels, SpTBXControls, ShellAPI, uMain,
  SpTBXTabs, TB2Item, TBX, SpTBXItem, JvExControls, JvComponent,
  JvScrollText;

type
  TfAbout = class(TForm)
    lbLegalInfo: TSpTBXLabel;
    lbAppName: TSpTBXLabel;
    imIcon: TImage;
    lbCopyRight: TSpTBXLabel;
    lbEmail: TSpTBXLabel;
    btnOK: TSpTBXButton;
    tcMain: TSpTBXTabControl;
    tabInfo: TSpTBXTabItem;
    tiThanks: TSpTBXTabItem;
    tsInfo: TSpTBXTabSheet;
    tsThanks: TSpTBXTabSheet;
    lbWebSite: TSpTBXLabel;
    lbVer: TSpTBXLabel;
    ScrollText: TJvScrollText;
    procedure lbEmailClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Ver1, Ver2, Ver3, Ver4, Ver: Integer;
    procedure GetSMBuild;
  end;

var
  fAbout: TfAbout;

implementation

{$R *.dfm}

procedure TfAbout.lbEmailClick(Sender: TObject);
begin
  ShellExecute(0, 'open', 'mailto:arturo182@tlen.pl?subject=SansaManager', '', '', 0);
end;

procedure TfAbout.btnOKClick(Sender: TObject);
begin
 Close;
end;

procedure TfAbout.GetSMBuild;
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

procedure TfAbout.FormShow(Sender: TObject);
begin
  GetSMBuild;
  lbVer.Caption := 'v' + IntToStr(Ver1) + '.' + IntToStr(Ver2) + '.' + IntToStr(Ver3) + '.' + IntToStr(Ver4);
end;

end.
