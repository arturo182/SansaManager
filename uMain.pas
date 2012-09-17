unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, JvExStdCtrls, JvListBox, JvDriveCtrls, TB2Item, TBX,
  SpTBXItem, ImgList, TB2Dock, TB2Toolbar, SpTBXTabs, XPMan, SpTBXControls, ExtCtrls,
  TBXDkPanels, SpTBXEditors, TntStdCtrls, JvTranslator, JvComponentBase, ComCtrls,
  ShellCtrls, Menus, ShellApi, ExtDlgs, ImagingTypes, Imaging, ImagingClasses,
  ImagingComponents, ImagingCanvases, ImagingUtility, JvExExtCtrls, JvSpecialImage,
  JPEG, JvGIF, MsgINISupp, LngINISupp, IniFiles, ToolWin,
  VirtualShellToolBar, VirtualTrees, VirtualExplorerTree, SysImg, SpTBXCustomizer,
  JvBaseDlg, JvSelectDirectory, JvDialogs, AppEvnts, JvProgressDialog, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, SimpleRSS, JvCaptionButton,
  CoolTrayIcon, CheckLst, TntCheckLst, GR32_Image,  mbColorPreview, OleCtrls,
  GR32, TB2ExtItems, JvDesktopAlert, MPCommonObjects, EasyListview, JvId3v1, JvId3v2,
  SpTBXDkPanels, SynEdit, VirtualShellUtilities, ShlObj, ComObj, DSPack, DirectShow9,
  JvID3v2Base, fisHotKey, U_Usb, SHDocVw_TLB;

type
  TfMain = class(TForm)
    dkMain: TSpTBXDock;
    tbMain: TSpTBXToolbar;
    itmPhotos: TSpTBXItem;
    itmVideo: TSpTBXItem;
    itmPlay: TSpTBXItem;
    itmThemes: TSpTBXItem;
    StatusBar: TSpTBXStatusBar;
    XPManifest: TXPManifest;
    tcMain: TSpTBXTabControl;
    tmrConnected: TTimer;
    sepMain1: TSpTBXSeparatorItem;
    itmAbout: TSpTBXItem;
    pbCapacity: TSpTBXProgressBar;
    sbCapacityItem: TTBControlItem;
    sbSpacer: TSpTBXRightAlignSpacerItem;
    sepSBar1: TSpTBXSeparatorItem;
    lbCapacity: TSpTBXLabelItem;
    lbStatus: TSpTBXLabelItem;
    itmEbooks: TSpTBXItem;
    tabPhotos: TSpTBXTabItem;
    tsPhotos: TSpTBXTabSheet;
    tabVideo: TSpTBXTabItem;
    tsVideo: TSpTBXTabSheet;
    tabPlay: TSpTBXTabItem;
    tsPlay: TSpTBXTabSheet;
    tabThemes: TSpTBXTabItem;
    tsThemes: TSpTBXTabSheet;
    tabEbooks: TSpTBXTabItem;
    tsEbooks: TSpTBXTabSheet;
    sbSpacer2: TSpTBXRightAlignSpacerItem;
    lbPhotosImages: TSpTBXLabel;
    lbPhotosList: TSpTBXListBox;
    gbPhotos: TSpTBXGroupBox;
    btnPhotosConvert: TSpTBXButton;
    btnPhotosAdd: TSpTBXButton;
    imgPhotos: TImageList;
    btnPhotosDel: TSpTBXButton;
    btnPhotosClear: TSpTBXButton;
    dlgPhotosAdd: TOpenDialog;
    edPhotosAlbum: TSpTBXEdit;
    lPhotosAlbum: TSpTBXLabel;
    pbPhotos: TSpTBXProgressBar;
    imPhotos: TJvSpecialImage;
    lbPhotosRotate: TSpTBXLabel;
    edPhotosResizeW: TSpTBXEdit;
    lbPhotosResizeW: TSpTBXLabel;
    edPhotosResizeH: TSpTBXEdit;
    lbPhotosResizeH: TSpTBXLabel;
    sePhotosRotate: TSpTBXSpinEdit;
    cbPhotosResize: TSpTBXCheckBox;
    tmrPhotosBar: TTimer;
    itmMusic: TSpTBXItem;
    tabMusic: TSpTBXTabItem;
    tsMusic: TSpTBXTabSheet;
    LngINI: TLngINISupp;
    MsgINI: TMsgINISupp;
    pnMusicComp: TPanel;
    pnMusicSansa: TPanel;
    splMusic1: TSpTBXSplitter;
    pnMusicCompRight: TPanel;
    pnMusicSansaLeft: TPanel;
    splMusic2: TSpTBXSplitter;
    splMusic3: TSpTBXSplitter;
    pnMusicCompLeft: TPanel;
    pnMusicSansaRight: TPanel;
    cbMusicComp: TVirtualExplorerCombobox;
    tvMusicComp: TVirtualExplorerTreeview;
    lvMusicComp: TVirtualExplorerListview;
    imsSystem: TSysImageList;
    tvMusicSansa: TVirtualExplorerTreeview;
    cbMusicSansa: TVirtualExplorerCombobox;
    lvMusicSansa: TVirtualExplorerListview;
    tbCustomizer: TSpTBXCustomizer;
    tcMusic: TSpTBXTabControl;
    tabMusicFolders: TSpTBXTabItem;
    tsMusicFolders: TSpTBXTabSheet;
    tabMusicTags: TSpTBXTabItem;
    tsMusicTags: TSpTBXTabSheet;
    imgMusic: TImageList;
    pnMusicTagsRight: TPanel;
    lvMusicTags: TListView;
    lbMusicTags: TListBox;
    CoolTrayIcon: TCoolTrayIcon;
    cbToTray: TJvCaptionButton;
    itmRecordings: TSpTBXItem;
    itmPodcasts: TSpTBXItem;
    tabRecordings: TSpTBXTabItem;
    tsRecordings: TSpTBXTabSheet;
    tabPodcasts: TSpTBXTabItem;
    tsPodcasts: TSpTBXTabSheet;
    splPodcasts2: TSpTBXSplitter;
    pnPodcastsLeft: TPanel;
    lvPodcasts: TListView;
    splPodcasts1: TSpTBXSplitter;
    wbPodcasts: TWebBrowser;
    dkPodcasts: TSpTBXDock;
    tbPodcasts: TSpTBXToolbar;
    imgPodcasts: TImageList;
    itmPodcastsAdd: TSpTBXItem;
    itmPodcastsRefresh: TSpTBXItem;
    itmPodcastsDel: TSpTBXItem;
    itmPodcastsDown: TSpTBXItem;
    lvPodcastsFeeds: TListView;
    SimpleRSS: TSimpleRSS;
    IdHTTP: TIdHTTP;
    ProgressDialog: TJvProgressDialog;
    ApplicationEvents: TApplicationEvents;
    lbEBooksFiles: TSpTBXLabel;
    edbtnEBooksAdd: TSpTBXButtonEdit;
    gbEBooks: TSpTBXGroupBox;
    edEBooksAlbum: TSpTBXEdit;
    lbEBooksAlbum: TSpTBXLabel;
    lbEBooksTxtColor: TSpTBXLabel;
    cpEBooksTxt: TmbColorPreview;
    lbEBooksBGColor: TSpTBXLabel;
    cpEBooksBG: TmbColorPreview;
    cbEBooksAA: TSpTBXCheckBox;
    cbEBooksPgNb: TSpTBXCheckBox;
    dlgEBooksAdd: TOpenDialog;
    mmEBooks: TMemo;
    btnEBooksConvert: TSpTBXButton;
    dlgEBooksColor: TJvColorDialog;
    im32EBooks: TImage32;
    pbEBooks: TSpTBXProgressBar;
    trmEBooksBar: TTimer;
    chlbRecordings: TSpTBXCheckListBox;
    lbRecordings: TSpTBXLabel;
    gbRecordings: TSpTBXGroupBox;
    btnRecordingsConvert: TSpTBXButton;
    rbRecordingsMP3: TSpTBXRadioButton;
    rbRecordingsWMA: TSpTBXRadioButton;
    rbRecordingsOGG: TSpTBXRadioButton;
    lbRecordingsOutput: TSpTBXLabel;
    btnedRecordingsOut: TSpTBXButtonEdit;
    dlgSelectDir: TJvSelectDirectory;
    pbRecordings: TSpTBXProgressBar;
    tmrRecordingsBar: TTimer;
    tabMusicAlbum: TSpTBXTabItem;
    tsMusicAlbum: TSpTBXTabSheet;
    dkMusicTagSearch: TSpTBXDock;
    tbMusicTagSearch: TSpTBXToolbar;
    itmMusicTagsSearchNext: TSpTBXItem;
    itmMusicTagsSearchPrev: TSpTBXItem;
    sepMusicTagsSearch: TSpTBXSeparatorItem;
    lbMusicTagsSearch: TSpTBXLabelItem;
    imgAlbumFind: TImageList;
    edMusicTagsSearch: TSpTBXEdit;
    itmMusicTagsSearch: TTBControlItem;
    JvDesktopAlert: TJvDesktopAlert;
    rbRecordingsWAV: TSpTBXRadioButton;
    imsSystem32: TSysImageList;
    elvMusicAlbums: TEasyListview;
    tabAbout: TSpTBXTabItem;
    tsAbout: TSpTBXTabSheet;
    imAboutLogo: TJvSpecialImage;
    lvPlayLists: TListView;
    splPlay1: TSpTBXSplitter;
    lvPlayFiles: TListView;
    dkPlay: TSpTBXDock;
    tbPlay: TSpTBXToolbar;
    itmPlayAdd: TSpTBXItem;
    itmPlayDel: TSpTBXItem;
    sepPlaySub1: TSpTBXSeparatorItem;
    itmPlayAddFile: TSpTBXItem;
    itmPlayDelFile: TSpTBXItem;
    imgMusicAlbums: TImageList;
    mmPlayTemp: TMemo;
    imsSystem24: TSysImageList;
    itmPlaySave: TSpTBXItem;
    dlgPlayFiles: TOpenDialog;
    sepPodcasts2: TSpTBXSeparatorItem;
    sepPodcasts1: TSpTBXSeparatorItem;
    itmPlayAddDir: TSpTBXItem;
    itmTags: TSpTBXItem;
    tabTags: TSpTBXTabItem;
    tsTags: TSpTBXTabSheet;
    SpTBXTabControl1: TSpTBXTabControl;
    tabTagsRename: TSpTBXTabItem;
    tsTagsRename: TSpTBXTabSheet;
    lvTags: TListView;
    imgTags: TImageList;
    dkTags: TSpTBXDock;
    tbTags: TSpTBXToolbar;
    itmTagsAdd: TSpTBXItem;
    itmTagsAddDir: TSpTBXItem;
    itmTagsDelSel: TSpTBXItem;
    itmTagsClear: TSpTBXItem;
    lbTagsRenDest: TSpTBXLabel;
    btnedTagsRenDest: TSpTBXButtonEdit;
    lbTagsRenFormat: TSpTBXLabel;
    cbTagsRenFormat: TSpTBXComboBox;
    btnTagsRenameGo: TSpTBXButton;
    btnTagsRenameFormatEdit: TSpTBXButton;
    itmContacts: TSpTBXItem;
    tabContracts: TSpTBXTabItem;
    tsContacts: TSpTBXTabSheet;
    dkContacts: TSpTBXDock;
    tbContacts: TSpTBXToolbar;
    itmContactsImport: TSpTBXSubmenuItem;
    itmContactsImportOutlook: TSpTBXItem;
    itmContactsSave: TSpTBXItem;
    lvContacts: TListView;
    imContacts: TImage32;
    imgContacts: TImageList;
    itmContactsAdd: TSpTBXItem;
    sepContacts1: TSpTBXSeparatorItem;
    itmContactsDel: TSpTBXItem;
    pnlMediaPlayer: TPanel;
    imBackground: TJvSpecialImage;
    imBack: TJvSpecialImage;
    imVolumeBar: TImage;
    imVolumeHandle: TImage;
    imProgressBar: TImage;
    imProgressHandle: TImage;
    sBtnPause: TSpTBXSpeedButton;
    SBtnPlay: TSpTBXSpeedButton;
    SBtnPlaylist: TSpTBXSpeedButton;
    SBtnShuffle: TSpTBXSpeedButton;
    SBtnRepeat: TSpTBXSpeedButton;
    SBtnStop: TSpTBXSpeedButton;
    SBtnSpeaker: TSpTBXSpeedButton;
    SBtnPrev: TSpTBXSpeedButton;
    SBtnNext: TSpTBXSpeedButton;
    FilterGraph: TFilterGraph;
    DSTrackBar1: TDSTrackBar;
    dkPlaylist: TSpTBXDock;
    dPnlPlaylist: TSpTBXDockablePanel;
    lvPlaylist: TListView;
    imgThemes: TJvSpecialImage;
    lvThemes: TListView;
    splThemes1: TSpTBXSplitter;
    fisHotKey: TfisHotKey;
    dkMenu: TSpTBXDock;
    tbMenu: TSpTBXToolbar;
    subFile: TSpTBXSubmenuItem;
    subHelp: TSpTBXSubmenuItem;
    itmAbout2: TSpTBXItem;
    itmHelpTopics: TSpTBXItem;
    itmExit: TSpTBXItem;
    subView: TSpTBXSubmenuItem;
    subSections: TSpTBXSubmenuItem;
    itmMusic2: TSpTBXItem;
    itmPhotos2: TSpTBXItem;
    itmVideo2: TSpTBXItem;
    itmPlay2: TSpTBXItem;
    itmThemes2: TSpTBXItem;
    itmeBooks2: TSpTBXItem;
    itmRecordings2: TSpTBXItem;
    itmPodcasts2: TSpTBXItem;
    itmTags2: TSpTBXItem;
    itmContacts2: TSpTBXItem;
    sepSections1: TSpTBXSeparatorItem;
    itmAbout3: TSpTBXItem;
    itmDropAss: TSpTBXItem;
    imgMenu: TImageList;
    itmMPlayer: TSpTBXItem;
    spcTags: TSpTBXRightAlignSpacerItem;
    itmTagsFilesRefresh: TSpTBXItem;
    dkThemes: TSpTBXDock;
    tbThemes: TSpTBXToolbar;
    itmThemesAdd: TSpTBXItem;
    itmThemesDel: TSpTBXItem;
    splThemes2: TSpTBXSeparatorItem;
    itmThemesApply: TSpTBXItem;
    dlgAddTheme: TOpenDialog;
    tmrThemeApply: TTimer;
    itmRockB: TSpTBXItem;
    tabRockB: TSpTBXTabItem;
    tsRockB: TSpTBXTabSheet;
    tcRockB: TSpTBXTabControl;
    tiRockBAudioS: TSpTBXTabItem;
    tsRockBAudioS: TSpTBXTabSheet;
    imgRockB: TImageList;
    SpTBXGroupBox1: TSpTBXGroupBox;
    SpTBXEdit1: TSpTBXEdit;
    SpTBXLabel1: TSpTBXLabel;
    SpTBXLabel2: TSpTBXLabel;
    SpTBXEdit2: TSpTBXEdit;
    SpTBXCheckBox1: TSpTBXCheckBox;
    procedure tmrConnectedTimer(Sender: TObject);
    procedure itmMusicClick(Sender: TObject);
    procedure itmPhotosClick(Sender: TObject);
    procedure itmVideoClick(Sender: TObject);
    procedure itmPlayClick(Sender: TObject);
    procedure itmThemesClick(Sender: TObject);
    procedure itmEbooksClick(Sender: TObject);
    procedure btnPhotosAddClick(Sender: TObject);
    procedure btnPhotosDelClick(Sender: TObject);
    procedure btnPhotosClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPhotosConvertClick(Sender: TObject);
    procedure tmrPhotosBarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure itmCompLevelUpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabMusicTagsClick(Sender: TObject);
    procedure cbToTrayClick(Sender: TObject);
    procedure itmRecordingsClick(Sender: TObject);
    procedure itmPodcastsClick(Sender: TObject);
    procedure itmPodcastsRefreshClick(Sender: TObject);
    procedure lvPodcastsFeedsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure itmPodcastsDelClick(Sender: TObject);
    procedure lvPodcastsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure itmPodcastsAddClick(Sender: TObject);
    procedure edbtnEBooksAddSubEditButton0Click(Sender: TObject);
    procedure btnEBooksConvertClick(Sender: TObject);
    procedure cpEBooksTxtDblClick(Sender: TObject);
    procedure cpEBooksBGDblClick(Sender: TObject);
    procedure trmEBooksBarTimer(Sender: TObject);
    procedure btnRecordingsConvertClick(Sender: TObject);
    procedure btnedRecordingsOutSubEditButton0Click(Sender: TObject);
    procedure tmrRecordingsBarTimer(Sender: TObject);
    procedure lvMusicTagsDblClick(Sender: TObject);
    procedure itmMusicTagsSearchNextClick(Sender: TObject);
    procedure itmMusicTagsSearchPrevClick(Sender: TObject);
    procedure lvMusicTagsCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure edMusicTagsSearchAcceptText(Sender: TObject; var NewText: WideString; var Accept: Boolean);
    procedure edMusicTagsSearchChange(Sender: TObject);
    procedure CoolTrayIconClick(Sender: TObject);
    procedure tabMusicAlbumClick(Sender: TObject);
    procedure imAboutLogoClick(Sender: TObject);
    procedure itmAboutClick(Sender: TObject);
    procedure tabPlayClick(Sender: TObject);
    procedure lvPlayListsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure itmPlayDelFileClick(Sender: TObject);
    procedure itmPlayAddClick(Sender: TObject);
    procedure lvPlayFilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure itmPlayDelClick(Sender: TObject);
    procedure lvPlayListsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure itmPlaySaveClick(Sender: TObject);
    procedure lvPlayFilesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvPlayFilesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure itmPlayAddFileClick(Sender: TObject);
    procedure itmPodcastsDownClick(Sender: TObject);
    procedure itmPlayAddDirClick(Sender: TObject);
    procedure itmTagsClick(Sender: TObject);
    procedure itmTagsAddClick(Sender: TObject);
    procedure itmTagsAddDirClick(Sender: TObject);
    procedure itmTagsDelSelClick(Sender: TObject);
    procedure itmTagsClearClick(Sender: TObject);
    procedure btnTagsRenameFormatEditClick(Sender: TObject);
    procedure btnTagsRenameGoClick(Sender: TObject);
    procedure btnedTagsRenDestSubEditButton0Click(Sender: TObject);
    procedure lvTagsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure itmContactsImportOutlookClick(Sender: TObject);
    procedure itmContactsClick(Sender: TObject);
    procedure itmContactsSaveClick(Sender: TObject);
    procedure itmContactsDelClick(Sender: TObject);
    procedure lvContactsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnlMediaPlayerResize(Sender: TObject);
    procedure sBtnPlayClick(Sender: TObject);
    procedure imVolumeHandleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imVolumeHandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imVolumeHandleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imVolumeBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DSTrackBar1Change(Sender: TObject);
    procedure imProgressHandleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imProgressHandleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imProgressBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SBtnSpeakerClick(Sender: TObject);
    procedure SBtnStopClick(Sender: TObject);
    procedure imProgressHandleMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SBtnPlaylistClick(Sender: TObject);
    procedure lvPlaylistDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lvPlaylistDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvPlaylistKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvPlaylistDblClick(Sender: TObject);
    procedure SBtnNextClick(Sender: TObject);
    procedure imBackDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure imBackDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SBtnPrevClick(Sender: TObject);
    procedure lvPlaylistCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure fisHotKeyHotKey(Sender: TObject);
    procedure itmExitClick(Sender: TObject);
    procedure itmDropAssClick(Sender: TObject);
    procedure itmMPlayerClick(Sender: TObject);
    procedure itmAbout2Click(Sender: TObject);
    procedure itmHelpTopicsClick(Sender: TObject);
    procedure tabMusicFoldersClick(Sender: TObject);
    procedure itmTagsFilesRefreshClick(Sender: TObject);
    procedure tabThemesClick(Sender: TObject);
    procedure itmThemesAddClick(Sender: TObject);
    procedure imgThemesClick(Sender: TObject);
    procedure lvThemesSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure itmThemesDelClick(Sender: TObject);
    procedure itmThemesApplyClick(Sender: TObject);
    procedure tmrThemeApplyTimer(Sender: TObject);
    procedure lvMusicTagsColumnClick(Sender: TObject; Column: TListColumn);
    procedure itmRockBClick(Sender: TObject);
  private
    FileTag2: TJvId3v2;
    FileTag1: TJvId3v1;
  public
    ini: TIniFile;
    Drive: String;
    A, B: Int64;
    C: TLargeInteger;
    IItem: Integer;
    DragVol: Boolean;
    DownX: Integer;
    ConTries: Integer;
    DropWnd: Boolean;
    procedure GetSubDirs(const sRootDir: string; slt: TStrings; Filter: String);    
    function SansaConnected: Boolean;
    procedure SaveListViewToFile(AListView: TListView; sFileName: string);
    procedure LoadListViewFromFile(AListView: TListView; sFileName: string);
    procedure eBook(Image: TImage32; Memo: TMemo; Path: String; bgColor: TColor; txtColor: TColor; AntiAliasing: Boolean; Pages: Boolean);
    procedure ShellExecute_AndWait(FileName: string; Params: string);
    procedure FileSystemAction(Action: longint; fromDir, toDir: string; Silent: boolean = True);
    function BytesToStr(const i64Size: Int64): string;
    procedure RenderContact(Contact: TListItem);
    procedure LoadFile(Name: String);
    procedure USBArriv(Sender: TObject);
    procedure USBRemove(Sender: TObject);
    procedure LoadPlugins;
    procedure FreePlugins;
  end;

type
  TCustomSortStyle = (cssAlphaNum, cssNumeric, cssDateTime);

var
  fMain: TfMain;
	Plugins: TList;
  USB_U: TComponentUSB;
  LvSortStyle: TCustomSortStyle;
  LvSortOrder: array[0..4] of Boolean;

implementation

uses uTags, uAlbumArt, uAbout, uFormat, uDrop;

type
	TPlugin = class
  	Name: String;
    Address: Integer;
  end;

  PluginName = function: PChar;
	PluginLoad = procedure(Owner: Integer; OwnerF: TForm);
  PluginMusic = procedure(OwnerF: TForm);
  PluginPhotos = procedure(OwnerF: TForm);
  PluginVideo = procedure(OwnerF: TForm);
  PluginPlaylists = procedure(OwnerF: TForm);
  PluginThemes = procedure(OwnerF: TForm);
  PluginEBooks = procedure(OwnerF: TForm);
  PluginRecordings = procedure(OwnerF: TForm);
  PluginPodcasts = procedure(OwnerF: TForm);
  PluginTags = procedure(OwnerF: TForm);
  PluginContacts = procedure(OwnerF: TForm);
  PluginConnected = procedure(OwnerF: TForm);
  PluginDisconnected = procedure(OwnerF: TForm);

{$R *.dfm}

function TfMain.SansaConnected: Boolean;
var
  i: Integer;
  DrvLetter: String;
  VolumeNameBuffer, FileSystemNameBuffer : PChar;
  VolumeSerialNumber, FileSystemFlags, MaximumComponentLength : DWORD;
begin
  Result := False;
  for i := Ord('C') to Ord('Z') do
  begin
    DrvLetter := Chr(i) + ':\';
    if GetDriveType(pChar(DrvLetter)) = DRIVE_REMOVABLE then
    begin
      VolumeNameBuffer := StrAlloc(256);
      FileSystemNameBuffer := StrAlloc(256);
      GetVolumeInformation(PChar(DrvLetter), VolumeNameBuffer, 255, @VolumeSerialNumber, MaximumComponentLength, FileSystemFlags, FileSystemNameBuffer, 255);
      if Pos('sansa', lowercase(VolumeNameBuffer)) > 0 then
      begin
        Result := True;
        Drive := DrvLetter;
        GetDiskFreeSpaceEx(PChar(DrvLetter), A, B, @C);
        break;
      end;
    end;
    Application.ProcessMessages;
  end;
end;

function FindItem(LV: TListView; FromItem: TListItem; Cols: array of byte; const TextToFind: string; Inclusive, Ascending, Wrap: boolean): TListItem;

function _NextItem(Item: TListItem): TListItem;
begin
  result := nil;

  if Item <> nil then begin
    if Item.Index +1 < LV.Items.Count then
      result := LV.Items[Item.Index +1];
  end;
end;

function _PrevItem(Item: TListItem): TListItem;
begin
  result := nil;

  if Item <> nil then begin
    if (Item.Index -1 > -1) and (LV.Items.Count > 0) then
      result := LV.Items[Item.Index -1];
  end;
end;

function _Match(const s: string): boolean;
var
  src, target : string;
begin
  src := AnsiLowerCase(s);
  target := AnsiLowerCase(TextToFind);
  result := (AnsiPos(target, src) > 0)
end;

function _Matches(Item: TListItem): boolean;
var
  i, col : integer;
begin
  Result := false;
  if High(Cols) < 0 then
    result := _Match(Item.Caption)
  else begin
    i := Low(Cols);
    while (i <= High(Cols)) and not result do begin
      col := Cols[i];
      if col = 0 then
        result := _Match(Item.Caption)
      else begin
        if col -1 < Item.SubItems.Count then
          result := _Match(Item.SubItems[i -1]);
      end;

      Inc(i);
    end;
  end;
end;

begin
  result := nil;

  if FromItem = nil then begin
    if LV.Items.Count > 0 then begin
      if Ascending then
        result := LV.Items[0]
      else
        result := LV.Items[LV.Items.Count -1];
    end else
      exit;
  end else begin
    if Inclusive then
      result := FromItem
    else
      if Ascending then
        result := _NextItem(FromItem)
      else
        result := _PrevItem(FromItem);
  end;

  while (result <> nil) and not _Matches(result) do
  begin
    if Ascending then
    begin
      result := _NextItem(result);
    end else
    begin
      result := _PrevItem(result);
    end;  
  end;

  if (result = nil) and Wrap and (FromItem <> nil) then
    result := FindItem(LV, nil, Cols, TextToFind, Inclusive, Ascending, Wrap);
end;

function CustomSortProc(Item1, Item2: TListItem; SortColumn: Integer): Integer; stdcall;
var
  s1, s2: string;
  i1, i2: Integer;
  r1, r2: Boolean;
  d1, d2: TDateTime;

  function IsValidNumber(AString : string; var AInteger : Integer): Boolean;
  var
    Code: Integer;
  begin
    Val(AString, AInteger, Code);
    Result := (Code = 0);
  end;
 
  function IsValidDate(AString : string; var ADateTime : TDateTime): Boolean;
  begin
    Result := True;
    try
      ADateTime := StrToDateTime(AString);
    except
      ADateTime := 0;
      Result := False;
    end;
  end;
 
  function CompareDates(dt1, dt2: TDateTime): Integer;
  begin
    if (dt1 > dt2) then Result := 1
    else
      if (dt1 = dt2) then Result := 0
    else
      Result := -1;
  end;
 
  function CompareNumeric(AInt1, AInt2: Integer): Integer;
  begin
    if AInt1 > AInt2 then Result := 1
    else
      if AInt1 = AInt2 then Result := 0
    else
      Result := -1;
  end;
 
begin
  Result := 0;
  if (Item1 = nil) or (Item2 = nil) then Exit;

  case SortColumn of
    -1 :
    begin
      s1 := Item1.Caption;
      s2 := Item2.Caption;
    end;
    else
    begin
      s1 := '';
      s2 := '';
      if (SortColumn < Item1.SubItems.Count) then
        s1 := Item1.SubItems[SortColumn];
      if (SortColumn < Item2.SubItems.Count) then
        s2 := Item2.SubItems[SortColumn]
    end;
  end;

 
  case LvSortStyle of
    cssAlphaNum : Result := lstrcmp(PChar(s1), PChar(s2));
    cssNumeric  : begin
                    r1 := IsValidNumber(s1, i1);
                    r2 := IsValidNumber(s2, i2);
                    Result := ord(r1 or r2);
                    if Result <> 0 then
                      Result := CompareNumeric(i2, i1);
                  end;
    cssDateTime : begin
                    r1 := IsValidDate(s1, d1);
                    r2 := IsValidDate(s2, d2);
                    Result := ord(r1 or r2);
                    if Result <> 0 then
                      Result := CompareDates(d1, d2);
                  end;
  end;

  if LvSortOrder[SortColumn + 1] then
    Result := - Result;
end;

function TfMain.BytesToStr(const i64Size: Int64): string;
const
  i64GB = 1024 * 1024 * 1024;
  i64MB = 1024 * 1024;
  i64KB = 1024;
begin
  if i64Size div i64GB > 0 then
    Result := Format('%.2f GB', [i64Size / i64GB])
  else if i64Size div i64MB > 0 then
    Result := Format('%.2f MB', [i64Size / i64MB])
  else if i64Size div i64KB > 0 then
    Result := Format('%.2f KB', [i64Size / i64KB])
  else
    Result := IntToStr(i64Size) + ' ' + fMain.MsgIni.GetMsg('Bytes');
end;

procedure TfMain.tmrConnectedTimer(Sender: TObject);
var
  i : Integer;
begin
  if (ConTries = 12) then
  begin
    tmrConnected.Enabled := False;
    Exit;
  end;

  inc(ConTries);
  if SansaConnected then
  begin
    ConTries := 11;
    if (lbStatus.Caption = MsgIni.GetMsg('PlayerDisconnected')) then
    begin
      JvDesktopAlert.HeaderText := MsgIni.GetMsg('PlayerConnected');
      JvDesktopAlert.MessageText := '' + #10#13 + '';
      JvDesktopAlert.Execute;

      lbStatus.FontSettings.Color := clGreen;
      lbStatus.Caption := MsgIni.GetMsg('PlayerConnected');
      pbCapacity.Max := B div 1024;
      pbCapacity.Position := (B - C) div 1024;
      lbCapacity.Caption := BytesToStr(C) + ' / ' + BytesToStr(B);
      CoolTrayIcon.IconIndex := imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\sansa_connected.ico');
      CoolTrayIcon.Hint := MsgIni.GetMsg('PlayerConnected');
        for i := 0 to Plugins.Count -1 do
        begin
          PluginConnected(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnConnected'))(fMain);
        end;
    end;
  end else
  begin
    if (lbStatus.Caption = MsgIni.GetMsg('PlayerConnected')) then
    begin
      JvDesktopAlert.HeaderText := MsgIni.GetMsg('PlayerDisconnected');
      JvDesktopAlert.Execute;
      lbStatus.FontSettings.Color := clRed;
      lbStatus.Caption := MsgIni.GetMsg('PlayerDisconnected');
      CoolTrayIcon.IconIndex := imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\sansa_disconnected.ico');
      CoolTrayIcon.Hint := MsgIni.GetMsg('PlayerDisconnected');
      pbCapacity.Position := 0;
      lbCapacity.Caption := '';
        for i := 0 to Plugins.Count -1 do
        begin
          PluginDisconnected(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnDisconnected'))(fMain);
        end;
    end;
      Drive := 'C:\';
  end;

  if DirectoryExists(Drive + 'MUSIC\') then
  begin
    if not (tvMusicSansa.RootFolderCustomPath = Drive + 'MUSIC\') then
      tvMusicSansa.RootFolderCustomPath := Drive + 'MUSIC\';
  end else
  begin
    if not (tvMusicSansa.RootFolderCustomPath = Drive) then
      tvMusicSansa.RootFolderCustomPath := Drive;
  end;
end;

procedure TfMain.eBook(Image: TImage32; Memo: TMemo; Path: String; bgColor: TColor; txtColor: TColor; AntiAliasing: Boolean; Pages: Boolean);
var
  i, j, k, l, m, n, aa, w: Integer;
begin
  Image.Bitmap.Font := Memo.Font;
  Image.SetupBitmap;
  Image.Bitmap.Clear(Color32(bgColor));
  n := Image.Bitmap.TextHeight(Memo.Lines[0]);
  j := 176 div n;
  k := Memo.Lines.Count div j;
  m := 176 - j * n;
  if AntiAliasing then aa := 4 else aa := 0;

  pbEBooks.Max := Memo.Lines.Count;
  pbEBooks.Position := 0;
  pbEBooks.Show;

  for i := 1 to k + 1 do
  begin
    Image.Bitmap.Font := Memo.Font;
    Image.Bitmap.Clear(Color32(bgColor));

    for l := 0 to j -1 do
    begin
      Image.Bitmap.RenderText(5, j * l + (m div 2), Memo.Lines[(i - 1) * j + l], aa, Color32(txtColor));
    end;

    if Pages then
    begin
      Image.Bitmap.Font.Size := Image.Bitmap.Font.Size - 2;
      w := Image.Bitmap.TextWidth(IntToStr(k));
      Image.Bitmap.RenderText(220 - w - (m div 2), (m div 2), IntToStr(i), aa, Color32(txtColor));
    end;

    Image.Bitmap.SaveToFile(ExtractFilePath(Application.ExeName) + 'temp.bmp');
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'SansaBMP.exe', '"' + ExtractFilePath(Application.ExeName) + 'temp.bmp" "' + ExtractFilePath(Application.ExeName) + Format('%.4d', [i]) + '.bmp' + '" 270');
    FileSystemAction(FO_MOVE , ExtractFilePath(Application.ExeName) + Format('%.4d', [i]) + '.bmp', Path + Format('%.4d', [i]) + '.bmp');

    pbEBooks.Position := (i - 1) * j + l + 1;
    Application.ProcessMessages;
  end;

  trmEBooksBar.Enabled := True;
  DeleteFile(ExtractFilePath(Application.ExeName) + 'ebook.txt');
  DeleteFile(ExtractFilePath(Application.ExeName) + 'temp.bmp');
end;

procedure TfMain.SaveListViewToFile(AListView: TListView; sFileName: string);
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

procedure TfMain.LoadListViewFromFile(AListView: TListView; sFileName: string);
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

procedure TfMain.itmMusicClick(Sender: TObject);
var
  i : Integer;
begin
  itmMusic.Checked := True;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsMusic;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginMusic(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnMusic'))(fMain);
  end;
end;

procedure TfMain.itmPhotosClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := True;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsPhotos;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginPhotos(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnPhotos'))(fMain);
  end;
end;

procedure TfMain.itmVideoClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := True;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsVideo;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginVideo(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnVideo'))(fMain);
  end;
end;

procedure TfMain.itmPlayClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := True;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsPlay;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  if not SansaConnected then
  begin
    itmMusic.Click;
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  tabPlayClick(sender);

  for i := 0 to Plugins.Count -1 do
  begin
    PluginPlaylists(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnPlaylists'))(fMain);
  end;
end;

procedure TfMain.itmThemesClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := True;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsThemes;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginThemes(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnThemes'))(fMain);
  end;

  tabThemesClick(Sender);
end;

procedure TfMain.itmEbooksClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := True;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsEbooks;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginEBooks(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnEBooks'))(fMain);
  end;
end;

function SelectedFiles(AShellView: TShellListView): TStringList;
var 
  i: Integer;
begin
  Result := TStringList.Create;
  for i := 0 to AShellView.Items.Count - 1 do
    if AShellView.Items[i].Selected = True then
        Result.Add(AShellView.Folders[i].PathName);
end;

procedure TfMain.FileSystemAction(Action: longint; fromDir, toDir: string; Silent: boolean = True);
var
  SHFileOp:TSHFileOpStruct;
begin
   With SHFileOp do
   begin  
	wnd    := fMain.handle;
	wFunc  := action;
	pFrom  := Pchar(fromDir  +#0+#0);
	pTo    := Pchar(toDir    +#0+#0);
  if silent then fFlags := FOF_SILENT else fFlags := 0;

	fAnyOperationsAborted := false;
	hNameMappings         := NIL;
	lpszProgressTitle     := NIL;
   end;
   SHFileOperation(SHFileOp);
end;

procedure TfMain.ShellExecute_AndWait(FileName: string; Params: string);
var
  exInfo: TShellExecuteInfo;
  Ph: DWORD;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
    Wnd := GetActiveWindow();
    lpVerb := 'open';
    lpParameters := PChar(Params);
    lpDirectory := PChar(ExtractFilePath(FileName));
    nShow := SW_HIDE;
    lpFile := PChar(FileName);
  end;
  if ShellExecuteEx(@exInfo) then
    Ph := exInfo.HProcess
  else
  begin
    ShowMessage(SysErrorMessage(GetLastError));
    Exit;
  end;
  while WaitForSingleObject(ExInfo.hProcess, 50) <> WAIT_OBJECT_0 do
    Application.ProcessMessages;
  CloseHandle(Ph);
end;

procedure TfMain.GetSubDirs(const sRootDir: string; slt: TStrings; Filter: String);
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

procedure GetSubDirs2(const sRootDir: string; slt: TStrings; Filter: String; Add: String);
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
          slt.Add(Add + srSearch.Name);
        end;
      until FindNext(srSearch) <> 0;
      FindClose(srSearch);
    end;

    for i := 0 to sltSub.Count - 1 do
      GetSubDirs2(sltSub.Strings[i], slt, Filter, Add);
  finally
    slt.EndUpdate;
    FreeAndNil(sltSub);
  end;
end;

procedure TfMain.btnPhotosAddClick(Sender: TObject);
var
  i: Integer;
begin
  dlgPhotosAdd.Filter := MsgIni.GetMsg('PhotosFilter');
  if dlgPhotosAdd.Execute then
  begin
    for i := 0 to dlgPhotosAdd.Files.Count -1 do
    begin
      lbPhotosList.Items.Add(dlgPhotosAdd.Files[i]);
    end;
  end;
end;

procedure TfMain.btnPhotosDelClick(Sender: TObject);
begin
  if lbPhotosList.SelCount > 0 then
    lbPhotosList.DeleteSelected;
end;

procedure TfMain.btnPhotosClearClick(Sender: TObject);
begin
  lbPhotosList.Items.Clear;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  ConTries := 0;
  Drive := ExtractFilePath(Application.ExeName);
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'settings.ini');
  FileTag2 := TJvId3v2.Create(self);
  FileTag1 := TJvId3v1.Create(self);
  wbPodcasts.Navigate('about:blank');
  IItem := -1;
  CoolTrayIcon.IconIndex := imsSystem.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\sansa_disconnected.ico');
  itmMusic.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\music.ico');
  itmPhotos.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\photos.ico');
  itmVideo.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\video.ico');
  itmPlay.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\playlist.ico');
  itmThemes.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\themes.ico');
  itmEBooks.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\ebook.ico');
  itmRecordings.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\recordings.ico');
  itmPodcasts.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\podcasts.ico');
  itmTags.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\tags.ico');
  itmContacts.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\contacts.ico');
  itmAbout.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\about.ico');
  itmRockB.ImageIndex := imsSystem32.ImageIndexOf(ExtractFilePath(Application.ExeName) + 'data\icons\rockbox.ico');
  {ShowMessage(IntToStr(itmMusic.ImageIndex));
  ShowMessage(IntToStr(itmPhotos.ImageIndex));
  ShowMessage(IntToStr(itmVideo.ImageIndex));
  ShowMessage(IntToStr(itmPlay.ImageIndex));
  ShowMessage(IntToStr(itmThemes.ImageIndex));
  ShowMessage(IntToStr(itmEBooks.ImageIndex));
  ShowMessage(IntToStr(itmRecordings.ImageIndex));
  ShowMessage(IntToStr(itmPodcasts.ImageIndex));
  ShowMessage(IntToStr(itmTags.ImageIndex));
  ShowMessage(IntToStr(itmContacts.ImageIndex));
  ShowMessage(IntToStr(itmAbout.ImageIndex));  }

  itmMusic2.ImageIndex := itmMusic.ImageIndex;
  itmPhotos2.ImageIndex := itmPhotos.ImageIndex;
  itmVideo2.ImageIndex := itmVideo.ImageIndex;
  itmPlay2.ImageIndex := itmPlay.ImageIndex;
  itmThemes2.ImageIndex := itmThemes.ImageIndex;
  itmEBooks2.ImageIndex := itmEBooks.ImageIndex;
  itmRecordings2.ImageIndex := itmRecordings.ImageIndex;
  itmPodcasts2.ImageIndex := itmPodcasts.ImageIndex;
  itmTags2.ImageIndex := itmTags.ImageIndex;
  itmContacts2.ImageIndex := itmContacts.ImageIndex;
  itmAbout3.ImageIndex := itmAbout.ImageIndex;

  imBackground.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\background.bmp');
  imBack.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\back.bmp');
  SBtnPlaylist.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\playlist.bmp');
  SBtnShuffle.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\shuffle.bmp');
  SBtnRepeat.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\repeat.bmp');
  SBtnStop.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\stop.bmp');
  SBtnPrev.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\prev.bmp');
  sBtnPause.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\pause.bmp');
  SBtnPlay.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\play.bmp');
  SBtnNext.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\next.bmp');
  SBtnSpeaker.Bitmap.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\speaker.bmp');
  imVolumeHandle.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\handle.bmp');
  imVolumeBar.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\bar.bmp');
  imProgressHandle.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\handle2.bmp');
  imProgressBar.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\player\bar.bmp');

  USB_U := TComponentUSB.Create(self);
  USB_U.OnUSBArrival := USBArriv;
  USB_U.OnUSBRemove := USBRemove;
  USBArriv(Sender);
end;

procedure TfMain.btnPhotosConvertClick(Sender: TObject);
var
  i: Integer;
  img: TMultiImage;
begin
  if lbPhotosList.Items.Count > 0 then
  begin
    if not SansaConnected then
    begin
      ShowMessage(MsgIni.GetMsg('ConnectSansa'));
      exit;
    end;

    pbPhotos.Show;
    pbPhotos.Max := lbPhotosList.Items.Count;

    for i := 0 to lbPhotosList.Items.Count -1 do
    begin
      img := TMultiImage.Create;
      img.LoadMultiFromFile(lbPhotosList.Items[i]);

      if cbPhotosResize.Checked then
      begin
        img.ResizeImages(StrToInt(edPhotosResizeW.Text), StrToInt(edPhotosResizeH.Text), rfNearest);
      end;

      img.SaveMultiToFile(ExtractFilePath(Application.ExeName) + 'temp.bmp');
      ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'SansaBMP.exe', '"' + ExtractFilePath(Application.ExeName) + 'temp.bmp" "' + ExtractFilePath(Application.ExeName) + 'temp2.bmp' + '" ' + IntToStr(sePhotosRotate.ValueAsInteger));

      if not DirectoryExists(Drive + 'PHOTO\') then
      begin
        ShowMessage(MsgIni.GetMsg('PhotosError'));
        exit;
      end;

      if not DirectoryExists(Drive + 'PHOTO\' + edPhotosAlbum.Text + '\') then
       CreateDir(Drive + 'PHOTO\' + edPhotosAlbum.Text + '\');

      FileSystemAction(FO_MOVE ,ExtractFilePath(Application.ExeName) + 'temp2.bmp', Drive + 'PHOTO\' + edPhotosAlbum.Text + '\' + ChangeFileExt(ExtractFileName(lbPhotosList.Items[i]), '.bmp'));

      DeleteFile(ExtractFilePath(Application.ExeName) + 'temp.bmp');
      DeleteFile(ExtractFilePath(Application.ExeName) + 'temp2.bmp');

      pbPhotos.Position := i+1;
      Application.ProcessMessages;
    end;

    tmrPhotosBar.Enabled := True;
  end else
    ShowMessage(MsgIni.GetMsg('NoImages'));
end;

procedure TfMain.tmrPhotosBarTimer(Sender: TObject);
begin
  tmrPhotosBar.Enabled := false;
  pbPhotos.Hide;
end;


procedure TfMain.FormShow(Sender: TObject);
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'settings.ini') then
    tbCustomizer.Load(ExtractFilePath(Application.ExeName) + 'settings.ini');
  LngINI.FileName := ExtractFilePath(Application.ExeName) + 'lang/' + ini.ReadString('App', 'lang', 'English') + '.lng';
  MsgINI.FileName := ExtractFilePath(Application.ExeName) + 'lang/' + ini.ReadString('App', 'lang', 'English') + '.lng';
  LngINI.Open;
  MsgIni.Open;

  if FileExists(ExtractFilePath(Application.ExeName) + 'lang/' + ini.ReadString('App', 'lang', 'english') + '.lng') then
  begin
    btnPhotosAdd.Hint := MsgIni.GetMsg('PhotosAdd');
    btnPhotosDel.Hint := MsgIni.GetMsg('PhotosDel');
    btnPhotosClear.Hint := MsgIni.GetMsg('PhotosClear');
  end;

  itmMusic2.Caption := itmMusic.Caption;
  itmPhotos2.Caption := itmPhotos.Caption;
  itmVideo2.Caption := itmVideo.Caption;
  itmPlay2.Caption := itmPlay.Caption;
  itmThemes2.Caption := itmThemes.Caption;
  itmEBooks2.Caption := itmEBooks.Caption;
  itmRecordings2.Caption := itmRecordings.Caption;
  itmPodcasts2.Caption := itmPodcasts.Caption;
  itmTags2.Caption := itmTags.Caption;
  itmContacts2.Caption := itmContacts.Caption;
  itmAbout3.Caption := itmAbout.Caption;

  pnMusicSansa.Height := ini.ReadInteger('View', 'pnMusicSansa', pnMusicSansa.Height);
  pnMusicCompLeft.Width := ini.ReadInteger('View', 'pnMusicCompLeft', pnMusicCompLeft.Width);
  pnMusicSansaLeft.Width := ini.ReadInteger('View', 'pnMusicSansaLeft', pnMusicSansaLeft.Width);
  lvPodcastsFeeds.Width :=  ini.ReadInteger('View', 'lvPodcastsFeeds', lvPodcastsFeeds.Width);
  lvPodcasts.Height := ini.ReadInteger('View', 'lvPodcasts', lvPodcasts.Height);
  lvPlayLists.Width := ini.ReadInteger('View', 'lvPlayLists', lvPlayLists.Width);
  lvPlayFiles.Width := ini.ReadInteger('View', 'lvPlayFiles', lvPlayFiles.Width);
  imgThemes.Width := ini.ReadInteger('View', 'imgThemes', imgThemes.Width);
  pnlMediaPlayer.Visible := ini.ReadBool('View', 'pnlMediaPlayer', pnlMediaPlayer.Visible);

  lvMusicTags.Column[0].Width := ini.ReadInteger('View', 'lvMusicTags[0]', lvMusicTags.Columns.Items[0].Width);
  lvMusicTags.Column[1].Width := ini.ReadInteger('View', 'lvMusicTags[1]', lvMusicTags.Columns.Items[1].Width);
  lvMusicTags.Column[2].Width := ini.ReadInteger('View', 'lvMusicTags[2]', lvMusicTags.Columns.Items[2].Width);
  lvMusicTags.Column[3].Width := ini.ReadInteger('View', 'lvMusicTags[3]', lvMusicTags.Columns.Items[3].Width);
  lvMusicTags.Column[4].Width := ini.ReadInteger('View', 'lvMusicTags[4]', lvMusicTags.Columns.Items[4].Width);
  lvMusicTags.Column[5].Width := ini.ReadInteger('View', 'lvMusicTags[5]', lvMusicTags.Columns.Items[5].Width);

  LoadListViewFromFile(lvPodcastsFeeds, ExtractFilePath(Application.ExeName) +  'data\podcasts.dat');
  LoadListViewFromFile(lvContacts, ExtractFilePath(Application.ExeName) +  'data\contacts.dat');

  lvMusicTags.Column[0].Caption := MSGIni.GetMsg('Artist');
  lvMusicTags.Column[1].Caption := MSGIni.GetMsg('Title');
  lvMusicTags.Column[2].Caption := MSGIni.GetMsg('Album');
  lvMusicTags.Column[3].Caption := MSGIni.GetMsg('Year');
  lvMusicTags.Column[4].Caption := MSGIni.GetMsg('Genre');
  lvMusicTags.Column[5].Caption := MSGIni.GetMsg('Filename');

  lvTags.Column[0].Caption := MSGIni.GetMsg('Artist');
  lvTags.Column[1].Caption := MSGIni.GetMsg('Title');
  lvTags.Column[2].Caption := MSGIni.GetMsg('Album');
  lvTags.Column[3].Caption := MSGIni.GetMsg('Year');
  lvTags.Column[4].Caption := MSGIni.GetMsg('Filename');

  lvContacts.Column[0].Caption := MSGIni.GetMsg('FirstName');
  lvContacts.Column[1].Caption := MSGIni.GetMsg('LastName');
  lvContacts.Column[2].Caption := MSGIni.GetMsg('Email');
  lvContacts.Column[3].Caption := MSGIni.GetMsg('HomePhone');
  lvContacts.Column[4].Caption := MSGIni.GetMsg('WorkPhone');
  lvContacts.Column[5].Caption := MSGIni.GetMsg('MobilePhone');
  lvContacts.Column[6].Caption := MSGIni.GetMsg('Address');
  lvContacts.Column[7].Caption := MSGIni.GetMsg('City');
  lvContacts.Column[8].Caption := MSGIni.GetMsg('Birthday');

  LoadPlugins;
  itmMusicClick(self);
end;

procedure TfMain.itmCompLevelUpClick(Sender: TObject);
begin
  lvMusicComp.BrowseToPrevLevel;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ini.WriteInteger('View', 'pnMusicSansa', pnMusicSansa.Height);
  ini.WriteInteger('View', 'pnMusicCompLeft', pnMusicCompLeft.Width);
  ini.WriteInteger('View', 'pnMusicSansaLeft', pnMusicSansaLeft.Width);
  ini.WriteInteger('View', 'lvPodcastsFeeds', lvPodcastsFeeds.Width);
  ini.WriteInteger('View', 'lvPodcasts', lvPodcasts.Height);
  ini.WriteInteger('View', 'lvPlayLists', lvPlayLists.Width);
  ini.WriteInteger('View', 'lvPlayFiles', lvPlayFiles.Width);
  ini.WriteInteger('View', 'imgThemes', imgThemes.Width);


  ini.WriteInteger('View', 'lvMusicTags[0]', lvMusicTags.Column[0].Width);
  ini.WriteInteger('View', 'lvMusicTags[1]', lvMusicTags.Column[1].Width);
  ini.WriteInteger('View', 'lvMusicTags[2]', lvMusicTags.Column[2].Width);
  ini.WriteInteger('View', 'lvMusicTags[3]', lvMusicTags.Column[3].Width);
  ini.WriteInteger('View', 'lvMusicTags[4]', lvMusicTags.Column[4].Width);
  ini.WriteInteger('View', 'lvMusicTags[5]', lvMusicTags.Column[5].Width);
  ini.WriteBool('View', 'pnlMediaPlayer', pnlMediaPlayer.Visible);


  tbCustomizer.Save(ExtractFilePath(Application.ExeName) + 'settings.ini');
  SaveListViewToFile(lvPodcastsFeeds, ExtractFilePath(Application.ExeName) +  'data\podcasts.dat');
  SaveListViewToFile(lvContacts, ExtractFilePath(Application.ExeName) +  'data\contacts.dat');
  if FileExists(ExtractFilePath(Application.ExeName) + 'temp.html') then
    DeleteFile(ExtractFilePath(Application.ExeName) + 'temp.html');
end;

function TreeItemSearch(TV: TTreeView; SucheItem: string): TTreeNode;
var
  i: Integer;
  iItem: string;
begin
  Result := nil;
  for i := 0 to TV.Items.Count - 1 do 
  begin
    iItem := TV.Items[i].Text;
    if SucheItem = iItem then 
    begin
      Result := TV.Items[i];
      Exit;
    end 
    else 
    begin
      Result := nil;
    end;
  end;
end;

procedure AddSongMusicTags(Artist, Title, Album, Year, Genre, Filename: String);
begin
  with fMain.lvMusicTags.Items.Add do
  begin
   ImageIndex := fMain.imsSystem.ImageIndexOf('any.mp3');
   Caption := Artist;
   SubItems.Add(Title);
   SubItems.Add(Album);
   SubItems.Add(Year);
   SubItems.Add(Genre);
   SubItems.Add(FileName);
  end;
end;

procedure TfMain.tabMusicTagsClick(Sender: TObject);
var
  i: Integer;
  path, Genre: String;
begin
  if not SansaConnected then
  begin
    tcMusic.ActiveTabIndex := 0;
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  lbMusicTags.Items.Clear;
  lvMusicTags.Items.Clear;
  path := Drive + 'MUSIC\';

  ProgressDialog.show;
  GetSubDirs(path, lbMusicTags.Items, '*.mp3');
  ProgressDialog.Max := lbMusicTags.Items.Count;

  for i := 0 to lbMusicTags.Items.Count -1 do
  begin
    FileTag1.FileName := lbMusicTags.Items[i];
    FileTag1.Active := True;
    FileTag2.FileName := lbMusicTags.Items[i];
    FileTag2.Active := True;
    if FileTag2.Texts.LeadArtist.Count > 0 then
    begin
      if FileTag2.Texts.ContentType.Count > 0 then
        Genre := GenreToNiceGenre(FileTag2.Texts.ContentType.Strings[0])
      else
        Genre := '';

      AddSongMusicTags(FileTag2.Texts.LeadArtist.Strings[0], FileTag2.Texts.Title, FileTag2.Texts.Album, IntToStr(FileTag2.Texts.Year), Genre, lbMusicTags.Items[i]);
    end else if FileTag1.Artist <> '' then
    begin
      AddSongMusicTags(FileTag1.Artist, FileTag1.SongName, FileTag1.Album, FileTag1.Year, FileTag1.GenreAsString, lbMusicTags.Items[i]);
    end else
    begin
      AddSongMusicTags('', '', '', '', '', lbMusicTags.Items[i]);
    end;

    FileTag1.Active := False;
    FileTag2.Active := False;

    ProgressDialog.Position := i +1;
    Application.ProcessMessages;
  end;

  ProgressDialog.Hide;
end;

procedure TfMain.cbToTrayClick(Sender: TObject);
begin
  CoolTrayIcon.HideMainForm;
end;

procedure TfMain.itmRecordingsClick(Sender: TObject);
var
  i: Integer;
begin
  if not SansaConnected then
  begin
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    itmRecordings.Checked := False;
    exit;
  end;

  chlbRecordings.Clear;
  GetSubDirs2(Drive + 'RECORD\FM\', chlbRecordings.Items.AnsiStrings, '*.wav', 'FM\');
  GetSubDirs2(Drive + 'RECORD\VOICE\', chlbRecordings.Items.AnsiStrings, '*.wav', 'VOICE\');

  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := True;
  itmPodcasts.Checked := False;
  tcMain.ActivePage := tsRecordings;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginRecordings(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnRecordings'))(fMain);
  end;
end;

procedure TfMain.itmPodcastsClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := True;
  tcMain.ActivePage := tsPodcasts;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginPodcasts(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnPodcasts'))(fMain);
  end;
end;

procedure TfMain.itmPodcastsRefreshClick(Sender: TObject);
var
  i: Integer;
begin
  if lvPodcastsFeeds.Items.Count > 0 then
  begin
    lvPodcasts.Clear;
    ProgressDialog.Show;
    ProgressDialog.Max := lvPodcastsFeeds.Items.Count;
    for i := 0 to lvPodcastsFeeds.Items.Count -1 do
    begin
      SimpleRSS.LoadFromHTTP(lvPodcastsFeeds.Items[i].SubItems[0]);
      SimpleRSS.SaveToFile(ExtractFilePath(Application.ExeName) + 'podcasts\' + SimpleRSS.Channel.Required.Title + '.xml');
      ProgressDialog.Position := i + 1;
    end;

    ProgressDialog.Hide;
  end;
end;

procedure TfMain.lvPodcastsFeedsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
 i: Integer;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'podcasts\' + Item.Caption + '.xml') then
  begin
    lvPodcasts.Items.Clear;

    SimpleRSS.LoadFromFile(ExtractFilePath(Application.ExeName) + 'podcasts\' + Item.Caption + '.xml');
    for i := 0 to SimpleRSS.Items.Count -1 do
    begin
      with lvPodcasts.Items.Add do
      begin
        Caption := SimpleRSS.Items[i].Title;
        ImageIndex := 5;
      end;
    end;
  end else
    ShowMessage(MsgINI.GetMsg('PodcastFileNotF'));
end;

procedure TfMain.itmPodcastsDelClick(Sender: TObject);
var
s: String;
begin
  if lvPodcastsFeeds.SelCount > 0 then
  begin
    s := ExtractFilePath(Application.ExeName) + 'podcasts\' + lvPodcastsFeeds.Selected.Caption + '.xml';
    lvPodcastsFeeds.DeleteSelected;
    DeleteFile(s);
    lvPodcasts.Clear;
    wbPodcasts.Navigate('about:blank');
  end;
end;

procedure TfMain.lvPodcastsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
 s: TStringList;
begin
  with SimpleRSS do
  begin
    s := TStringList.Create;
    s.Add('<link type="text/css" rel="stylesheet" href="' + ExtractFilePath(Application.Exename) + 'data\style.css">');
    s.Add('<div style="margin:5px; padding:5px;">');
    s.Add('<b>&raquo; ' + Items[Item.Index].Title +  '</b><br>');
    s.Add(Items[Item.Index].Description);
    s.Add('<br><br>');
    s.Add(Items[Item.Index].Enclosure.URL);
    s.Add('</div>');
    s.SaveToFile(fTags.GetTempDir + 'podcasts.html');
    wbPodcasts.Navigate(fTags.GetTempDir + 'podcasts.html');
    s.Free;
  end;
end;

procedure TfMain.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if (Msg.Message = WM_RBUTTONDOWN) or (Msg.Message = WM_RBUTTONDBLCLK) then
  begin
    if IsChild(wbPodcasts.Handle, Msg.hwnd) or IsChild(fAlbumArt.WebBrowser.Handle, Msg.hwnd) then
    begin
      Handled := True;
    end;
  end;
end;

procedure TfMain.itmPodcastsAddClick(Sender: TObject);
var
 url: String;
begin
  InputQuery(MsgIni.GetMsg('PodcastAddCapt'), MsgIni.GetMsg('PodcastAddTxt'), URL);
  if Length(URL) > 0 then
  begin
    ProgressDialog.Show;
    ProgressDialog.Max := 1;
    SimpleRSS.LoadFromHTTP(URL);
    SimpleRSS.SaveToFile(ExtractFilePath(Application.ExeName) + 'podcasts\' + SimpleRSS.Channel.Required.Title + '.xml');

    with lvPodcastsFeeds.Items.Add do
    begin
      Caption := SimpleRSS.Channel.Required.Title;
      SubItems.Add(URL);
      ImageIndex := 4;
    end;

    ProgressDialog.Position := 1;
    ProgressDialog.Hide;
  end;
end;

procedure TfMain.edbtnEBooksAddSubEditButton0Click(Sender: TObject);
begin
  dlgEBooksAdd.Filter := MSGIni.GetMsg('EBooksFilter');
  if dlgEBooksAdd.Execute then
  begin
    edbtnEBooksAdd.Text := dlgEBooksAdd.FileName;
  end;
end;

function RemoveTags(s: string): string;
var
 i: Integer;
 InTag: Boolean;
begin
 Result := '';
 InTag := False;
 s := StringReplace(s, '<br>', #13#10, [rfReplaceAll, rfIgnoreCase]);
 for i := 1 to Length(s) do begin
   if s[i] = '<' then
     inTag := True
   else if s[i] = '>' then
     inTag := False
   else if not InTag then
     Result := Result + s[i];
 end;

 repeat
   Result := StringReplace(Result, '  ', ' ', [rfReplaceAll, rfIgnoreCase]);
 until Pos('  ', Result) = 0;

 repeat
   Result := StringReplace(Result, #13#10#13#10, #13#10, [rfReplaceAll, rfIgnoreCase]);
 until Pos(#13#10#13#10, Result) = 0;
end;

procedure TfMain.btnEBooksConvertClick(Sender: TObject);
begin
  if not SansaConnected then
  begin
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  if not FileExists(edbtnEBooksAdd.Text) then
  begin
    ShowMessage(MsgIni.GetMsg('EBooksFileNotF'));
    exit;
  end;

  if ExtractFileExt(edbtnEBooksAdd.Text) = '.txt' then
  begin
    mmEBooks.Lines.LoadFromFile(edbtnEBooksAdd.Text);
  end else if ExtractFileExt(edbtnEBooksAdd.Text) = '.pdf' then
  begin
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'PDFToText.exe', '"' + edbtnEBooksAdd.Text + '" "' + ExtractFilePath(Application.ExeName) + 'ebook.txt"');
    mmEBooks.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'ebook.txt');
    mmEBooks.Text := StringReplace(mmEBooks.text, #12, '', [rfReplaceAll, rfIgnoreCase]);
  end else if (ExtractFileExt(edbtnEBooksAdd.Text) = '.htm') OR (ExtractFileExt(edbtnEBooksAdd.Text) = '.html') then
  begin
    mmEBooks.Lines.LoadFromFile(edbtnEBooksAdd.Text);
    mmEBooks.Text := RemoveTags(mmEBooks.Text);
  end;

  if not DirectoryExists(Drive + 'PHOTO\') then
  begin
    ShowMessage(MsgIni.GetMsg('PhotosError'));
    exit;
  end;

  if not DirectoryExists(Drive + 'PHOTO\' + edEBooksAlbum.Text + '\') then
    CreateDir(Drive + 'PHOTO\' + edEBooksAlbum.Text + '\');


  eBook(im32EBooks, mmEBooks, Drive + 'PHOTO\' + edEBooksAlbum.Text + '\', cpEBooksBG.Color, cpEBooksTxt.Color, cbEBooksAA.Checked, cbEBooksPgNb.Checked);
end;

procedure TfMain.cpEBooksTxtDblClick(Sender: TObject);
begin
  dlgEBooksColor.Color := cpEBooksTxt.Color;
  if dlgEBooksColor.Execute then
    cpEBooksTxt.Color := dlgEBooksColor.Color;
end;

procedure TfMain.cpEBooksBGDblClick(Sender: TObject);
begin
  dlgEBooksColor.Color := cpEBooksBG.Color;
  if dlgEBooksColor.Execute then
    cpEBooksBG.Color := dlgEBooksColor.Color;
end;

procedure TfMain.trmEBooksBarTimer(Sender: TObject);
begin
  pbEBooks.Hide;
  trmEBooksBar.Enabled := False;
end;

procedure TfMain.btnRecordingsConvertClick(Sender: TObject);
var
  i: Integer;
begin
  if chlbRecordings.Items.AnsiStrings.Count > 0 then
  begin
    pbRecordings.Max := chlbRecordings.Items.AnsiStrings.Count;
    pbRecordings.Position := 0;
    pbRecordings.Show;
    for i := 0 to chlbRecordings.Items.AnsiStrings.Count -1 do
    begin
      if chlbRecordings.Checked[i] then
      begin
        if rbRecordingsMP3.Checked then
        begin
          ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'lame.exe', '--add-id3v2 --tc "Converted with SansaManager" "' + Drive + 'RECORD\' + chlbRecordings.Items.AnsiStrings[i] + '" "' + btnedRecordingsOut.Text + ChangeFileExt(ExtractFilename(chlbRecordings.Items.AnsiStrings[i]), '.mp3') + '"');
        end else if rbRecordingsOGG.Checked then
        begin
          ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'oggenc2.exe', '"' + Drive + 'RECORD\' + chlbRecordings.Items.AnsiStrings[i] + '" -o "' + btnedRecordingsOut.Text + ChangeFileExt(ExtractFilename(chlbRecordings.Items.AnsiStrings[i]), '.ogg') + '"');
        end else if rbRecordingsWMA.Checked then
        begin
          ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'wm8util.exe', '-input "' + Drive + 'RECORD\' + chlbRecordings.Items.AnsiStrings[i] + '" -output "' + btnedRecordingsOut.Text + ChangeFileExt(ExtractFilename(chlbRecordings.Items.AnsiStrings[i]), '.wma') + '"');
        end else if rbRecordingsWAV.Checked then
        begin
          CopyFile(PChar(Drive + 'RECORD\' + chlbRecordings.Items.AnsiStrings[i]), PChar(btnedRecordingsOut.Text + ExtractFilename(chlbRecordings.Items.AnsiStrings[i])), False);
        end;
      end else
        pbRecordings.Max := pbRecordings.Max - 1;

      pbRecordings.Position := i + 1;
    end;
  end;
end;

procedure TfMain.btnedRecordingsOutSubEditButton0Click(Sender: TObject);
begin
  if dlgSelectDir.Execute then
    btnedRecordingsOut.Text := IncludeTrailingPathDelimiter(dlgSelectDir.Directory);
end;

procedure TfMain.tmrRecordingsBarTimer(Sender: TObject);
begin
  pbRecordings.Hide;
  tmrRecordingsBar.Enabled := False;
end;

procedure TfMain.lvMusicTagsDblClick(Sender: TObject);
begin
  if lvMusicTags.SelCount > 0 then
  begin
    fTags.ReadTags(lvMusicTags.Selected.SubItems[4], lvMusicTags.Selected.Index);
    fTags.ShowModal;
  end;
end;

procedure TfMain.itmMusicTagsSearchNextClick(Sender: TObject);
var
  item : TListItem;
begin
  item := FindItem(lvMusicTags, lvMusicTags.Items[IItem], [0, 1, 2], edMusicTagsSearch.Text, false, true, true);

  if item <> nil then
  begin
    IItem := item.Index;
    item.MakeVisible(true);    
    lvMusicTags.Refresh;
  end else
  begin
    IItem := -1;
    lvMusicTags.Refresh;
  end;
end;

procedure TfMain.itmMusicTagsSearchPrevClick(Sender: TObject);
var
  item : TListItem;
begin
  item := FindItem(lvMusicTags, lvMusicTags.Items[IItem], [0, 1, 2], edMusicTagsSearch.Text, false, false, true);

  if item <> nil then
  begin
    IItem := item.Index;
    item.MakeVisible(true);
    lvMusicTags.Repaint;
  end else
  begin
    IItem := -1;
    lvMusicTags.Repaint;
  end;
end;

procedure TfMain.lvMusicTagsCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index = IItem then
  begin
    lvMusicTags.Canvas.Brush.Color := clHighlight;
  end;
end;

procedure TfMain.edMusicTagsSearchAcceptText(Sender: TObject;
  var NewText: WideString; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TfMain.edMusicTagsSearchChange(Sender: TObject);
var
  item : TListItem;
begin
  item := FindItem(lvMusicTags, lvMusicTags.TopItem, [0, 1, 2], edMusicTagsSearch.Text, false, true, true);

  if item <> nil then
  begin
    IItem := item.Index;
    item.MakeVisible(true);
    lvMusicTags.Refresh;
  end else
  begin
    IItem := -1;
    lvMusicTags.Refresh;
  end;
end;

procedure TfMain.CoolTrayIconClick(Sender: TObject);
begin
  CoolTrayIcon.ShowMainForm;
end;

function FindAlbumGroup(Name: String; LV: TEasyListView): TEasyGroup;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to LV.Groups.Count -1 do
  begin
    if LV.Groups[i].Caption = Name then
    begin
      Result := LV.Groups[i];
    end;
  end;
end;

function FindAlbumItem(Name: String; LVG: TEasyGroup): TEasyItem;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to LVG.Items.Count -1 do
  begin
    if LVG.Items[i].Caption = Name then
    begin
      Result := LVG.Items[i];
    end;
  end;
end;

procedure TfMain.tabMusicAlbumClick(Sender: TObject);
var
  i: Integer;
  Group: TEasyGroup;
  EItem: TEasyItem;
  SearchRec: TSearchRec;
  cover: String;
  bmp: TBitmap;
  FImg: TMultiImage;
begin
  if not SansaConnected then
  begin
    tcMusic.ActiveTabIndex := 0;
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  if lvMusicTags.Items.Count = 0 then
  begin
    tabMusicTagsClick(Sender);
  end;

  ProgressDialog.Max := lvMusicTags.Items.Count;
  ProgressDialog.Position := 0;
  ProgressDialog.Show;

  for i := 0 to lvMusicTags.Items.Count -1 do
  begin
    if (FindFirst(ExtractFilePath(lvMusicTags.Items[i].SubItems[4]) + '*.jpg', faAnyFile, SearchRec) = 0) then
    begin
      cover := ExtractFilePath(lvMusicTags.Items[i].SubItems[4]) +  SearchRec.Name;
      FImg := TMultiImage.Create;
      FImg.LoadMultiFromFile(ExtractFilePath(lvMusicTags.Items[i].SubItems[4]) +  SearchRec.Name);
      FImg.ResizeImages(100, 100, rfNearest);
      FImg.SaveMultiToFile(fTags.GetTempDir + 'album.bmp');

      bmp := TBitmap.Create;
      bmp.LoadFromFile(fTags.GetTempDir + 'album.bmp');
      bmp.Width := 100;
      bmp.Height := 100;

      FindClose(SearchRec);
    end else
    begin
      bmp := TBitmap.Create;
      bmp.Assign(fTags.imAlbumNone.Picture);
      bmp.Width := 100;
      bmp.Height := 100;
    end;

    if Length(lvMusicTags.Items[i].SubItems[1]) > 0 then
    begin
      group := FindAlbumGroup(lvMusicTags.Items[i].Caption, elvMusicAlbums);

      if group = nil then
      begin
        group := elvMusicAlbums.Groups.Add;
        group.Bold := True;
        EItem := FindAlbumItem(lvMusicTags.Items[i].SubItems[1], group);

        with group do
        begin
          Caption := lvMusicTags.Items[i].Caption;
          if EItem = nil then
          begin
            with Items.Add do
            begin
              Caption := lvMusicTags.Items[i].SubItems[1];
              if fileExists (cover) then
                ImageIndex := imgMusicAlbums.AddMasked(bmp, clNone);
            end;
          end;
        end;
      end else
      begin
        with group do
        begin
          EItem := FindAlbumItem(lvMusicTags.Items[i].SubItems[1], group);

          if EItem = nil then
          begin
            with Items.Add do
            begin
              Caption := lvMusicTags.Items[i].SubItems[1];
              if fileExists (cover) then
               ImageIndex := imgMusicAlbums.AddMasked(bmp, clNone);
            end;
          end;
        end;
      end;
    end;
    ProgressDialog.Position := i +1;
  end;

  ProgressDialog.Hide;
end;

procedure TfMain.imAboutLogoClick(Sender: TObject);
begin
  fAbout.ShowModal;
end;

procedure TfMain.itmAboutClick(Sender: TObject);
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  tcMain.ActivePage := tsAbout;
end;

procedure TfMain.tabPlayClick(Sender: TObject);
var
  srSearch: TSearchRec;
begin
  lvPlayLists.Items.Clear;
  lvPlayFiles.Items.Clear;

  if FindFirst(Drive + 'PLAYLISTS\*.pla', faAnyFile or faHidden or faArchive, srSearch) = 0 then
  begin
    repeat
      with lvPlayLists.Items.Add do
      begin
        Caption := ChangeFileExt(ExtractFileName(srSearch.Name), '');
        ImageIndex := 4;
      end;
    until (FindNext(srSearch) <> 0);
  end;
end;

procedure TfMain.lvPlayListsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  i: Integer;
begin
  itmPlaySave.FontSettings.Color := clNone;
  ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'SansaPLP.exe', '"' + Drive + 'PLAYLISTS\' + Item.Caption + '.pla' + '" decode');
  mmPlayTemp.Lines.LoadFromFile(Drive + 'PLAYLISTS\' + Item.Caption + '.pla');

  mmPlayTemp.Lines.Delete(0);
  mmPlayTemp.Lines.Delete(0);
  mmPlayTemp.Lines.Delete(0);
  mmPlayTemp.Text := StringReplace(mmPlayTemp.Text, 'HARP, ', Drive, [rfReplaceAll, rfIgnoreCase]);
  lvPlayFiles.Items.Clear;

  ProgressDialog.Max := mmPlayTemp.Lines.Count;
  ProgressDialog.Position := 0;
  ProgressDialog.Show;

  for i := 0 to mmPlayTemp.Lines.Count -1 do
  begin
    if FileExists(mmPlayTemp.Lines[i]) then
    begin
      FileTag1.FileName := mmPlayTemp.Lines[i];
      FileTag1.Active := True;
      FileTag2.FileName := mmPlayTemp.Lines[i];
      FileTag2.Active := True;
    end;
    if FileTag2.Texts.LeadArtist.Count > 0 then
    begin
      with lvPlayFiles.Items.Add do
      begin
        Caption := FileTag2.Texts.LeadArtist.Strings[0];
        SubItems.Add(FileTag2.Texts.Title);
        SubItems.Add(mmPlayTemp.Lines[i]);
        ImageIndex := 5;
      end;
    end else if FileTag1.Artist <> '' then
    begin
      with lvPlayFiles.Items.Add do
      begin
        Caption := FileTag1.Artist;
        SubItems.Add(FileTag1.SongName);
        SubItems.Add(mmPlayTemp.Lines[i]);
        ImageIndex := 5;
      end;
    end else
    begin
      with lvPlayFiles.Items.Add do
      begin
        Caption := '';
        SubItems.Add('');
        SubItems.Add(mmPlayTemp.Lines[i]);
        ImageIndex := 5;
      end;
    end;

    ProgressDialog.Position := i + 1;
  end;

  ProgressDialog.Hide;
end;

procedure TfMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
i: Integer;
begin
  lvPlayLists.OnSelectItem := nil;
  CanClose := True;

  for i := 0 to lvPlayLists.Items.Count -1 do
  begin
    ShellExecute_AndWait(ExtractFilePath(Application.Exename) + 'SansaPLP.exe', '"' + Drive + 'PLAYLISTS\' + lvPlayLists.Items[i].Caption + '.pla" decode');
    ShellExecute_AndWait(ExtractFilePath(Application.Exename) + 'SansaPLP.exe', '"' + Drive + 'PLAYLISTS\' + lvPlayLists.Items[i].Caption + '.pla" encode');
  end;
end;

procedure TfMain.itmPlayDelFileClick(Sender: TObject);
begin
  if lvPlayFiles.SelCount > 0 then
  begin
    lvPlayFiles.DeleteSelected;
    itmPlaySave.FontSettings.Color := clRed;
  end;
end;

procedure TfMain.itmPlayAddClick(Sender: TObject);
var
  s: String;
  str: tStringList;
begin
  InputQuery(MsgINI.GetMsg('PlaylistAddCapt'), MsgINI.GetMsg('PlaylistAddTxt'), s);

  if Length(s) > 0 then
  begin
    str := TStringList.Create;
    str.Add('PLP PLAYLIST');
    str.Add('VERSION 1.20');
    str.Add('');
    str.SaveToFile(Drive + 'PLAYLISTS\' + s + '.pla');
    str.Free;
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'SansaPLP.exe', '"' + Drive + 'PLAYLISTS\' + s + '.pla" encode');
    tabPlayClick(sender);
  end;
end;

procedure TfMain.lvPlayFilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    itmPlayDelFile.Click;
end;

procedure TfMain.itmPlayDelClick(Sender: TObject);
begin
  if lvPlayLists.SelCount >0 then
  begin
    lvPlayLists.OnSelectItem := nil;
    DeleteFile(Drive + 'PLAYLISTS\' + lvPlayLists.Selected.Caption + '.pla');
    tabPlayClick(Sender);
    lvPlayLists.OnSelectItem := lvPlayListsSelectItem;
  end;
end;

procedure TfMain.lvPlayListsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    itmPlayDel.Click;
end;

procedure TfMain.itmPlaySaveClick(Sender: TObject);
var
  str: TStringList;
  i: Integer;
begin
  if (lvPlayLists.SelCount > 0) then
  begin
    str := TStringList.Create;
    str.Add('PLP PLAYLIST');
    str.Add('VERSION 1.20');
    str.Add('');

    for i := 0 to lvPlayFiles.Items.Count -1 do
    begin
      str.Add('HARP, ' + ExtractRelativePath(Drive, lvPlayFiles.Items[i].SubItems[1]));
    end;

    str.SaveToFile(Drive + 'PLAYLISTS\' + lvPlayLists.Selected.Caption + '.pla');
    str.Free;
      itmPlaySave.FontSettings.Color := clNone;
  end;
end;

procedure TfMain.lvPlayFilesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  DragItem, DropItem, CurrentItem, NextItem: TListItem;
begin
  if Sender = Source then
    with TListView(Sender) do
    begin
      DropItem    := GetItemAt(X, Y);
      CurrentItem := Selected;
      while CurrentItem <> nil do
      begin
        NextItem := GetNextItem(CurrentItem, SdAll, [IsSelected]);
        if DropItem = nil then DragItem := Items.Add
        else
          DragItem := Items.Insert(DropItem.Index);
        DragItem.Assign(CurrentItem);
        CurrentItem.Free;
        CurrentItem := NextItem;
      end;
    end;
end;

procedure TfMain.lvPlayFilesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Sender = lvPlayFiles;
  if Accept then
    itmPlaySave.FontSettings.Color := clRed;
end;

procedure TfMain.itmPlayAddFileClick(Sender: TObject);
var
  i: Integer;
begin
  if lvPlayLists.SelCount = 0 then exit;
  dlgPlayFiles.InitialDir := Drive + 'MUSIC\';
  if dlgPlayFiles.Execute then
  begin
    for i := 0 to dlgPlayFiles.Files.Count -1 do
    begin
      itmPlaySave.FontSettings.Color := clRed;

      if FileExists(dlgPlayFiles.Files[i]) then
      begin
        FileTag1.FileName := dlgPlayFiles.Files[i];
        FileTag1.Active := True;
        FileTag2.FileName := dlgPlayFiles.Files[i];
        FileTag2.Active := True;
      end;
      if FileTag2.Texts.LeadArtist.Count > 0 then
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := FileTag2.Texts.LeadArtist.Strings[0];
          SubItems.Add(FileTag2.Texts.Title);
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end else if  FileTag1.Artist <> '' then
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := FileTag1.Artist;
          SubItems.Add(FileTag1.SongName);
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end else
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := '';
          SubItems.Add('');
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end;
    end;
  end;
end;

procedure TfMain.LoadPlugins;
var
	Files: TStrings;
  i: Integer;
  Plugin : TPlugin;
begin
	Files := TStringList.Create;
  Plugins := TList.Create;
  GetSubDirs(ExtractFilepath(Application.Exename) + '\plugins\', Files, '*.dll');
	  for i := 0 to Files.Count -1 do
    begin
      Plugin := TPlugin.Create;
	   	Plugin.Address := LoadLibrary(PChar(Files[i]));
      Plugin.Name := PluginName(GetProcAddress(Plugin.Address, 'OnName'));

      PluginLoad(GetProcAddress(Plugin.Address, 'OnLoad'))(HInstance, fMain);
      Plugins.Add(Plugin);
    end;
  Files.Free;
end;

procedure TfMain.FreePlugins;
var
	i: Integer;
begin
	for i := 0 to Plugins.Count-1 do
  begin
   FreeLibrary(TPlugin(Plugins[i]).Address);
  end;

	Plugins.Free;
end;

procedure TfMain.itmPodcastsDownClick(Sender: TObject);
begin
  if lvPodcasts.SelCount > 0 then
  begin
    ShellExecute(0, 'open', PChar(SimpleRSS.Items[lvPodcasts.Selected.Index].Enclosure.URL), nil, nil, 1);
  end;
end;

procedure TfMain.itmPlayAddDirClick(Sender: TObject);
var
  str: TStringList;
  i: Integer;
begin
  if lvPlayLists.SelCount = 0 then exit;
  dlgSelectDir.InitialDir := Drive + 'MUSIC\';
  str := TStringList.Create;

  if dlgSelectDir.Execute then
  begin
    GetSubDirs(IncludeTrailingPathDelimiter(dlgSelectDir.Directory), str, '*.mp3');

    for i := 0 to str.Count -1 do
    begin
      itmPlaySave.FontSettings.Color := clRed;

      if FileExists(str.Strings[i]) then
      begin
        FileTag1.FileName := dlgPlayFiles.Files[i];
        FileTag1.Active := True;
        FileTag2.FileName := dlgPlayFiles.Files[i];
        FileTag2.Active := True;
      end;
      if FileTag2.Texts.LeadArtist.Count > 0 then
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := FileTag2.Texts.LeadArtist.Strings[0];
          SubItems.Add(FileTag2.Texts.Title);
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end else if FileTag1.Artist <> '' then
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := FileTag1.Artist;
          SubItems.Add(FileTag1.SongName);
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end else
      begin
        with lvPlayFiles.Items.Add do
        begin
          Caption := '';
          SubItems.Add('');
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end;
    end;
  end;
end;

procedure TfMain.itmTagsClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  itmTags.Checked := True;
  tcMain.ActivePage := tsTags;
  itmContacts.Checked := False;
  itmRockB.Checked := False;

  cbTagsRenFormat.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\formats.dat');

  for i := 0 to Plugins.Count -1 do
  begin
    PluginTags(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnTags'))(fMain);
  end;
end;

procedure TfMain.itmTagsAddClick(Sender: TObject);
var
  i: Integer;
begin
  if dlgPlayFiles.Execute then
  begin
    for i := 0 to dlgPlayFiles.Files.Count -1 do
    begin
      if FileExists(dlgPlayFiles.Files[i]) then
      begin
        FileTag1.FileName := dlgPlayFiles.Files[i];
        FileTag1.Active := True;
        FileTag2.FileName := dlgPlayFiles.Files[i];
        FileTag2.Active := True;
      end;
      if FileTag2.Texts.LeadArtist.Count > 0 then
      begin
        with lvTags.Items.Add do
        begin
          Caption := FileTag2.Texts.LeadArtist.Strings[0];
          SubItems.Add(FileTag2.Texts.Title);
          SubItems.Add(FileTag2.Texts.Album);
          SubItems.Add(IntToStr(FileTag2.Texts.Year));
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end else if FileTag1.Artist <> '' then
      begin
        with lvPlayFiles.Items.Add do
        with lvTags.Items.Add do
        begin
          Caption := FileTag1.Artist;
          SubItems.Add(FileTag1.SongName);
          SubItems.Add(FileTag1.Album);
          SubItems.Add(FileTag1.Year);
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end else
      begin
        with lvTags.Items.Add do
        begin
          Caption := '';
          SubItems.Add('');
          SubItems.Add('');
          SubItems.Add('');
          SubItems.Add(dlgPlayFiles.Files[i]);
          ImageIndex := 5;
        end;
      end;
    end;
  end;
end;

procedure TfMain.itmTagsAddDirClick(Sender: TObject);
var
  str: TStringList;
  i: Integer;
begin
  str := TStringList.Create;

  if dlgSelectDir.Execute then
  begin
    GetSubDirs(IncludeTrailingPathDelimiter(dlgSelectDir.Directory), str, '*.mp3');

    ProgressDialog.Max := str.Count;
    ProgressDialog.Position := 0;
    ProgressDialog.Show;

    for i := 0 to str.Count -1 do
    begin
      if FileExists(str.Strings[i]) then
      begin
        FileTag1.FileName := dlgPlayFiles.Files[i];
        FileTag1.Active := True;
        FileTag2.FileName := dlgPlayFiles.Files[i];
        FileTag2.Active := True;
      end;
      if FileTag2.Texts.LeadArtist.Count > 0 then
      begin
        with lvTags.Items.Add do
        begin
          Caption := FileTag2.Texts.LeadArtist.Strings[0];
          SubItems.Add(FileTag2.Texts.Title);
          SubItems.Add(FileTag2.Texts.Album);
          SubItems.Add(IntToStr(FileTag2.Texts.Year));
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end else if FileTag1.Artist <> '' then
      begin
        with lvPlayFiles.Items.Add do
        with lvTags.Items.Add do
        begin
          Caption := FileTag1.Artist;
          SubItems.Add(FileTag1.SongName);
          SubItems.Add(FileTag1.Album);
          SubItems.Add(FileTag1.Year);
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end else
      begin
        with lvTags.Items.Add do
        begin
          Caption := '';
          SubItems.Add('');
          SubItems.Add('');
          SubItems.Add('');
          SubItems.Add(str.Strings[i]);
          ImageIndex := 5;
        end;
      end;
      ProgressDialog.Position := i +1;
    end;
    ProgressDialog.Hide;
  end;
end;

procedure TfMain.itmTagsDelSelClick(Sender: TObject);
begin
  if lvTags.SelCount > 0 then
    lvTags.DeleteSelected;
end;

procedure TfMain.itmTagsClearClick(Sender: TObject);
begin
  lvTags.Items.Clear;
end;

procedure TfMain.btnTagsRenameFormatEditClick(Sender: TObject);
begin
  fFormat.ShowModal;
  cbTagsRenFormat.Items.LoadFromFile(ExtractFilePath(Application.ExeName) + 'data\formats.dat');
end;

procedure TfMain.btnTagsRenameGoClick(Sender: TObject);
var
  i: Integer;
  StrPath, StrFile: String;
  StrBAT: TStringList;
begin
  if lvTags.Items.Count > 0 then
  begin
    if (Length(cbTagsRenFormat.text) > 0) AND (DirectoryExists(btnedTagsRenDest.Text)) then
    begin
      ProgressDialog.Max := lvTags.Items.Count;
      ProgressDialog.Position := 0;
      ProgressDialog.Show;
      for i := 0 to lvTags.Items.Count -1 do
      begin
        if (lvTags.Items[i].Caption <> '') AND (lvTags.Items[i].SubItems[0] <> '') AND (lvTags.Items[i].SubItems[1] <> '') then
        begin
          StrPath := ExtractFilePath(cbTagsRenFormat.Text);
          StrPath :=  StringReplace(StrPath, '$artist', lvTags.Items[i].Caption, [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '$title', lvTags.Items[i].SubItems[0], [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '$album', lvTags.Items[i].SubItems[1], [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '$year', lvTags.Items[i].SubItems[2], [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '*', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '?', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '"', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '<', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '>', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, ':', '', [rfReplaceAll, rfIgnoreCase]);
          StrPath :=  StringReplace(StrPath, '|', '', [rfReplaceAll, rfIgnoreCase]);

          StrBAT := TStringList.Create;
          StrBAT.Add('md "' + btnedTagsRenDest.Text + StrPath + '"');
          StrBAT.SaveToFile(ftags.GetTempDir + 'SM.bat');
          ShellExecute_AndWait(ftags.GetTempDir + 'SM.bat', '');
          StrBAT.Free;

          StrFile := ExtractFileName(cbTagsRenFormat.Text);
          StrFile :=  StringReplace(StrFile, '$artist', lvTags.Items[i].Caption, [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '$title', lvTags.Items[i].SubItems[0], [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '$album', lvTags.Items[i].SubItems[1], [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '$year', lvTags.Items[i].SubItems[2], [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '*', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '?', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '"', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '<', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '>', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, ':', '', [rfReplaceAll, rfIgnoreCase]);
          StrFile :=  StringReplace(StrFile, '|', '', [rfReplaceAll, rfIgnoreCase]);

          FileSystemAction(FO_COPY, lvTags.Items[i].SubItems[3], btnedTagsRenDest.Text + StrPath + StrFile + '.mp3');
          lvTags.Items[i].Selected := True;
        end;
        ProgressDialog.Position := i + 1;
      end;
      ProgressDialog.Hide;
    end;
  end;
end;

procedure TfMain.btnedTagsRenDestSubEditButton0Click(Sender: TObject);
begin
  if dlgSelectDir.Execute then
  begin
    btnedTagsRenDest.Text := IncludeTrailingPathDelimiter(dlgSelectDir.Directory);
  end;
end;

procedure TfMain.lvTagsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    itmTagsDelSel.Click;
end;

procedure TfMain.itmContactsImportOutlookClick(Sender: TObject);
const
  olFolderContacts = $0000000A;
var
  outlook, NameSpace, Contacts, Contact: OleVariant;
  i: Integer;
begin
  Outlook := CreateOleObject('Outlook.Application');
  NameSpace := Outlook.GetNameSpace('MAPI');

  Contacts := NameSpace.GetDefaultFolder(olFolderContacts);
  for i := 1 to Contacts.Items.Count do
  begin
    Contact := Contacts.Items.Item(i);

    with lvContacts.Items.Add do
    begin
      Caption := Contact.FirstName ;
      SubItems.Add(Contact.LastName);
      SubItems.Add(Contact.Email1Address);
      SubItems.Add(Contact.HomeTelephoneNumber);
      SubItems.Add(Contact.BusinessTelephoneNumber);
      SubItems.Add(Contact.MobileTelephoneNumber);
      SubItems.Add(Contact.HomeAddressStreet);

      if Contact.HomeAddressState <> '' then
        SubItems.Add(Contact.HomeAddressPostalCode + ' ' + Contact.HomeAddressCity + ', ' + Contact.HomeAddressState)
      else
        SubItems.Add(Contact.HomeAddressPostalCode + ' ' + Contact.HomeAddressCity);

      if DateToStr(Contact.Birthday) <> '4501-01-01' then
        SubItems.Add(DateToStr(Contact.Birthday))
      else
        SubItems.Add('');
    end;
  end;

  Outlook := UnAssigned;
end;

procedure TfMain.itmContactsClick(Sender: TObject);
var
  i: Integer;
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  itmTags.Checked := False;
  itmContacts.Checked := True;
  tcMain.ActivePage := tsContacts;
  itmRockB.Checked := False;

  for i := 0 to Plugins.Count -1 do
  begin
    PluginContacts(GetProcAddress(TPlugin(Plugins[i]).Address, 'OnContacts'))(fMain);
  end;
end;

procedure TfMain.RenderContact(Contact: TListItem);
begin
  imContacts.SetupBitmap;
  imContacts.Bitmap.Clear($ffffffff);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 10, 0);
  imContacts.Bitmap.Textout(28, 11, Contact.Caption + ' ' + Contact.SubItems[0]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 30, 1);
  imContacts.Bitmap.Textout(28, 31, Contact.SubItems[1]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 50, 2);
  imContacts.Bitmap.Textout(28, 51, Contact.SubItems[2]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 70, 3);
  imContacts.Bitmap.Textout(28, 71, Contact.SubItems[3]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 90, 4);
  imContacts.Bitmap.Textout(28, 91, Contact.SubItems[4]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 110, 5);
  imContacts.Bitmap.Textout(28, 111, Contact.SubItems[5]);
  imContacts.Bitmap.Textout(28, 125, Contact.SubItems[6]);

  imgContacts.Draw(imContacts.Bitmap.Canvas, 8, 142, 6);
  imContacts.Bitmap.Textout(28, 143, Contact.SubItems[7]);
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

procedure TfMain.itmContactsSaveClick(Sender: TObject);
var
  i: Integer;
begin
  if not SansaConnected then
  begin
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  if DirectoryExists(Drive + 'PHOTO\Contacts\') then
    DelDir(Drive + 'PHOTO\Contacts\');

  CreateDir(Drive + 'PHOTO\Contacts\');

  ProgressDialog.Position := 0;
  ProgressDialog.Max := lvContacts.Items.Count;
  ProgressDialog.Show;

  for i := 0 to lvContacts.Items.Count -1 do
  begin
    RenderContact(lvContacts.Items[i]);
    imContacts.Bitmap.SaveToFile(ExtractFilePath(Application.ExeName) + 'contact.bmp');
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'SansaBMP.exe', '"' + ExtractFilePath(Application.ExeName) + 'contact.bmp" "' + ExtractFilePath(Application.ExeName) + lvContacts.Items[i].Caption + ' ' + lvContacts.Items[i].SubItems[0] + '.bmp' + '" 270');
    FileSystemAction(FO_MOVE , ExtractFilePath(Application.ExeName) + lvContacts.Items[i].Caption + ' ' + lvContacts.Items[i].SubItems[0] + '.bmp', Drive + 'PHOTO\Contacts\' + lvContacts.Items[i].Caption + ' ' + lvContacts.Items[i].SubItems[0] + '.bmp');
    ProgressDialog.Position := i + 1;
    Application.ProcessMessages;
  end;

  ProgressDialog.Hide;
  DeleteFile(ExtractFilePath(Application.ExeName) + 'contact.bmp');
end;

procedure TfMain.itmContactsDelClick(Sender: TObject);
begin
  if lvContacts.SelCount > 0 then
    lvContacts.DeleteSelected;
end;

procedure TfMain.lvContactsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    itmContactsDel.Click;
end;

procedure TfMain.pnlMediaPlayerResize(Sender: TObject);
begin
  SBtnPlaylist.Left := (pnlMediaPlayer.Width div 2) - 210;
  SBtnShuffle.Left := (pnlMediaPlayer.Width div 2) - 210 + (35 * 1);
  SBtnRepeat.Left := (pnlMediaPlayer.Width div 2) - 210 + (35 * 2);
  SBtnStop.Left := (pnlMediaPlayer.Width div 2) - 210 + (35 * 3);
  SBtnPrev.Left := (pnlMediaPlayer.Width div 2) - 208 + (35 * 4);

  sBtnPause.Left := (pnlMediaPlayer.Width div 2) - 17;
  SBtnPlay.Left := (pnlMediaPlayer.Width div 2) - 17;

  SBtnNext.Left := (pnlMediaPlayer.Width div 2) - 221 + (35 * 7);
  SBtnSpeaker.Left := (pnlMediaPlayer.Width div 2) - 220 + (35 * 9);

  imVolumeBar.Left := (pnlMediaPlayer.Width div 2) - 226 + (35 * 10);
  imVolumeHandle.Left := (pnlMediaPlayer.Width div 2) - 226 + (35 * 10) + imVolumeBar.Width - (imVolumeHandle.Width div 2);

  imProgressBar.Left := (pnlMediaPlayer.Width div 2) - 211;
  imProgressHandle.Left := (pnlMediaPlayer.Width div 2) - 211  + imProgressBar.Width - (imProgressHandle.Width div 2);
end;

procedure TfMain.sBtnPlayClick(Sender: TObject);
begin
  SBtnPlay.Visible := not SBtnPlay.Visible;
  SBtnPause.Visible := not SBtnPause.Visible;

  if SBtnPause.Visible then
  begin
    FilterGraph.Play;
  end else
  begin
    FilterGraph.Pause;
  end;
end;

procedure TfMain.imVolumeHandleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    DragVol := True;
    downX:= X;
  end;
end;

procedure TfMain.imVolumeHandleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if DragVol then
  begin
    if (X - downX + imVolumeHandle.Left) > ((pnlMediaPlayer.Width div 2) - 226 + (35 * 10) - (imVolumeHandle.Width div 2)) then
    begin
      if (X - downX + imVolumeHandle.Left) < ((pnlMediaPlayer.Width div 2) - 226 + (35 * 10) - (imVolumeHandle.Width div 2) + 66) then
      begin
         imVolumeHandle.Left := X - downX + imVolumeHandle.Left;
         imVolumeBar.Width := imVolumeHandle.Left - imVolumeBar.Left;
         FilterGraph.Volume := (imVolumeBar.Width + 41) * 100;
         SBtnSpeaker.Checked := False;
       end;
     end;
  end;
end;

procedure TfMain.imVolumeHandleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DragVol := False;
end;

procedure TfMain.LoadFile(Name: String);
begin
  FilterGraph.ClearGraph;
  FilterGraph.Active := False;
  FilterGraph.Active := True;
  FilterGraph.RenderFile(Name);
  FilterGraph.Volume := (imVolumeBar.Width + 41) * 100;
  FilterGraph.Play;
  SBtnPlay.Visible := False;
  SBtnPause.Visible := True;

  lvPlaylist.Repaint;
end;

procedure TfMain.imVolumeBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imVolumeBar.Width := X;
  imVolumeHandle.Left := (pnlMediaPlayer.Width div 2) - 226 + (35 * 10) + imVolumeBar.Width - (imVolumeHandle.Width div 2);
  FilterGraph.Volume := (imVolumeBar.Width + 41) * 100;
  SBtnSpeaker.Checked := False; 
end;

procedure TfMain.DSTrackBar1Change(Sender: TObject);
var
  Ext: Double;
  r: Integer;
begin
  Ext := DSTrackBar1.Position / DSTrackBar1.Max;
  imProgressBar.Width := Trunc(185 * Ext);
  imProgressHandle.Left := (pnlMediaPlayer.Width div 2) - 211  + imProgressBar.Width - (imProgressHandle.Width div 2);

  if Trunc(Ext) = 1 then
  begin
    SBtnStop.Click;
    if SBtnRepeat.Checked then
    begin
      SBtnPlayClick(Sender);
    end else if SBtnShuffle.Checked then
    begin
      Randomize;
      r := Random(lvPlaylist.Items.Count - 1);
      LoadFile(lvPlaylist.Items[r].SubItems[0]);
      lvPlaylist.Tag := r + 1;
    end;
  end;
end;

procedure TfMain.imProgressHandleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  begin
    DragVol := True;
    downX:= X;
  end;
end;

procedure TfMain.imProgressHandleMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Ext: Double;
  CurrentPosition, StopPosition: Int64;
begin
  if DragVol then
  begin
    if (X - downX + imProgressHandle.Left) > ((pnlMediaPlayer.Width div 2) - 211 - (imProgressHandle.Width div 2)) then
    begin
      if (X - downX + imProgressHandle.Left) < ((pnlMediaPlayer.Width div 2) - 211 - (imProgressHandle.Width div 2) + 185) then
      begin
        if FilterGraph.Active then
        begin
         imProgressHandle.Left := X - downX + imProgressHandle.Left;
         imProgressBar.Width := imProgressHandle.Left - imProgressBar.Left;
         Ext := imProgressBar.Width / 185;
         CurrentPosition := 11000000 * Trunc(Ext * DSTrackBar1.Max);
         DSTrackBar1.FMediaSeeking.GetStopPosition(StopPosition);
         DSTrackBar1.FMediaSeeking.SetPositions(CurrentPosition, AM_SEEKING_AbsolutePositioning, StopPosition, AM_SEEKING_NoPositioning);
        end;
      end;
    end;
  end;
end;

procedure TfMain.imProgressBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  CurrentPosition, StopPosition: Int64;
  Ext: Double;
begin
  if FilterGraph.Active then
  begin
    imProgressBar.Width := X;
    imProgressHandle.Left := (pnlMediaPlayer.Width div 2) - 211 + imProgressBar.Width - (imProgressHandle.Width div 2);
    Ext := imProgressBar.Width / 185;
    CurrentPosition := 11000000 * Trunc(Ext * DSTrackBar1.Max);
    DSTrackBar1.FMediaSeeking.GetStopPosition(StopPosition);
    DSTrackBar1.FMediaSeeking.SetPositions(CurrentPosition, AM_SEEKING_AbsolutePositioning, StopPosition   , AM_SEEKING_NoPositioning);
  end;
end;

procedure TfMain.SBtnSpeakerClick(Sender: TObject);
begin
  if SBtnSpeaker.Checked then
  begin
    FilterGraph.Volume := 0;
  end else
  begin
    FilterGraph.Volume := (imVolumeBar.Width + 41) * 100;
  end;
end;

procedure TfMain.SBtnStopClick(Sender: TObject);
var
  CurrentPosition, StopPosition: Int64;
begin
  FilterGraph.Stop;
  if FilterGraph.Active then
  begin
    CurrentPosition := 0;
    DSTrackBar1.FMediaSeeking.GetStopPosition(StopPosition);
    DSTrackBar1.FMediaSeeking.SetPositions(CurrentPosition, AM_SEEKING_AbsolutePositioning, StopPosition   , AM_SEEKING_NoPositioning);
  end;
  SBtnPause.Visible := False;
  SBtnPlay.Visible := True;
  imProgressBar.Width := 0;
  imProgressHandle.Left := (pnlMediaPlayer.Width div 2) - 211  + imProgressBar.Width - (imProgressHandle.Width div 2);
end;

procedure TfMain.imProgressHandleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DragVol := False;
end;

procedure TfMain.SBtnPlaylistClick(Sender: TObject);
begin
  dPnlPlaylist.Visible := SBtnPlaylist.Checked;
end;

procedure TfMain.lvPlaylistDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source.ClassName = 'TListView' then
  begin
    if (TListView(Source).Name = 'lvMusicTags') OR (TListView(Source).Name = 'lvPlayFiles') then
    begin
      Accept := True;
    end;
  end else if Source.ClassName = 'TSpTBXCheckListBox' then
  begin
    if TSpTBXCheckListBox(Source).Name = 'lvMusicTags' then
    begin
      Accept := True;
    end;
  end;
end;

procedure TfMain.lvPlaylistDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Integer;
begin
  if Source.ClassName = 'TListView' then
  begin
    if TListView(Source).Name = 'lvMusicTags' then
    begin
      with lvPlaylist.Items.Add do
      begin
        Caption := ChangeFileExt(ExtractFileName(TListView(Source).Selected.SubItems[4]), '');
        SubItems.Add(TListView(Source).Selected.SubItems[4]);
      end;
    end else if TListView(Source).Name = 'lvPlayFiles' then
    begin
      with lvPlaylist.Items.Add do
      begin
        Caption := ChangeFileExt(ExtractFileName(TListView(Source).Selected.SubItems[1]), '');
        SubItems.Add(TListView(Source).Selected.SubItems[1]);
      end;
    end;
  end else if Source.ClassName = 'TSpTBXCheckListBox' then
  begin
    if TSpTBXCheckListBox(Source).Name = 'chlbRecordings' then
    begin
      for i := 0 to TSpTBXCheckListBox(Source).Items.Count -1 do
      begin
        if TSpTBXCheckListBox(Source).Selected[i] then
        begin
          with lvPlaylist.Items.Add do
          begin
            Caption := ChangeFileExt(ExtractFileName(TSpTBXCheckListBox(Source).Items[i]), '');
            SubItems.Add(Drive + 'RECORD\' + TSpTBXCheckListBox(Source).Items[i]);
          end;
          exit;
        end;
      end;
    end;
  end;
end;

procedure TfMain.lvPlaylistKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if lvPlaylist.SelCount >0 then
  begin
    if Key = VK_DELETE then
      lvPlaylist.DeleteSelected;
  end;
end;

procedure TfMain.lvPlaylistDblClick(Sender: TObject);
begin
  if lvPlaylist.SelCount > 0 then
  begin
    LoadFile(lvPlaylist.Selected.SubItems[0]);
    lvPlaylist.Tag := lvPlaylist.Selected.Index + 1;
  end;
end;

procedure TfMain.SBtnNextClick(Sender: TObject);
begin
  if lvPlaylist.Items.Count > 0 then
  begin
    lvPlaylist.Tag := lvPlaylist.Tag + 1;
    if lvPlaylist.Tag > lvPlaylist.Items.Count then
      lvPlaylist.Tag := 1;

    LoadFile(lvPlaylist.Items[lvPlaylist.Tag-1].SubItems[0]);
  end;  
end;

procedure TfMain.imBackDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Source.ClassName = 'TListView' then
  begin
    if (TListView(Source).Name = 'lvMusicTags') OR (TListView(Source).Name = 'lvPlayFiles') then
    begin
      Accept := True;
    end;
  end else if Source.ClassName = 'TSpTBXCheckListBox' then
  begin
    if TSpTBXCheckListBox(Source).Name = 'lvMusicTags' then
    begin
      Accept := True;
    end;
  end;
end;

procedure TfMain.imBackDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  i: Integer;
begin
  if Source.ClassName = 'TListView' then
  begin
    if TListView(Source).Name = 'lvMusicTags' then
    begin
      LoadFile(TListView(Source).Selected.SubItems[4]);
    end else if TListView(Source).Name = 'lvPlayFiles' then
    begin
      LoadFile(TListView(Source).Selected.SubItems[1]);
    end;
  end else if Source.ClassName = 'TSpTBXCheckListBox' then
  begin
    if TSpTBXCheckListBox(Source).Name = 'chlbRecordings' then
    begin
      for i := 0 to TSpTBXCheckListBox(Source).Items.Count -1 do
      begin
        if TSpTBXCheckListBox(Source).Selected[i] then
        begin
          LoadFile(Drive + 'RECORD\' + TSpTBXCheckListBox(Source).Items[i]);
          exit;
        end;
      end;
    end;
  end;
end;

procedure TfMain.SBtnPrevClick(Sender: TObject);
begin
  if lvPlaylist.Items.Count > 0 then
  begin
    lvPlaylist.Tag := lvPlaylist.Tag - 1;
    if lvPlaylist.Tag < 1 then
      lvPlaylist.Tag := 1;

    LoadFile(lvPlaylist.Items[lvPlaylist.Tag-1].SubItems[0]);
  end;
end;

procedure TfMain.lvPlaylistCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Index = (lvPlaylist.Tag -1) then
  begin
    lvPlayList.Canvas.Brush.Color := clHighlight;
  end else
  begin
    lvPlayList.Canvas.Brush.Color := clWindow;
  end;
end;

procedure TfMain.fisHotKeyHotKey(Sender: TObject);
begin
  if (not SansaConnected) AND (not fDrop.Visible) then
  begin
    if not DropWnd then
    begin
      with CreateMessageDialog(MsgIni.GetMsg('ConnectSansa'), mtCustom, [mbOK]) do
      begin
        Position := poScreenCenter;
        DropWnd := True;
        ShowModal;
        DropWnd := False;
      end;
    end;
    exit;
  end;
  
  with fDrop do
  begin
    Left := Screen.WorkAreaWidth - Width;
    Top := Screen.WorkAreaHeight - Height;
    if Visible then Hide else Show;
  end;
end;

procedure TfMain.itmExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.itmDropAssClick(Sender: TObject);
begin
  fisHotKeyHotKey(Sender);
end;

procedure TfMain.itmMPlayerClick(Sender: TObject);
begin
  pnlMediaPlayer.Visible := not pnlMediaPlayer.Visible;
end;

procedure TfMain.itmAbout2Click(Sender: TObject);
begin
  fAbout.ShowModal;
end;

procedure TfMain.itmHelpTopicsClick(Sender: TObject);
begin
  ShowMessage('Soon...');
end;

procedure TfMain.USBArriv(Sender: TObject);
begin
  ConTries := 0;
  tmrConnected.Enabled := True;
end;

procedure TfMain.USBRemove(Sender: TObject);
begin
  ConTries := 0;
  tmrConnectedTimer(Sender);
  fDrop.Hide;
end;

procedure TfMain.tabMusicFoldersClick(Sender: TObject);
begin
  if DirectoryExists(Drive + 'MUSIC\') then
    tvMusicSansa.RootFolderCustomPath := Drive + 'MUSIC\'
  else
    tvMusicSansa.RootFolderCustomPath := Drive;
end;

procedure TfMain.itmTagsFilesRefreshClick(Sender: TObject);
begin
  if DirectoryExists(Drive + 'MUSIC\') then
    tvMusicSansa.RootFolderCustomPath := Drive + 'MUSIC\'
  else
    tvMusicSansa.RootFolderCustomPath := Drive;
end;

procedure TfMain.tabThemesClick(Sender: TObject);
var
  srSearch: TSearchRec;
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'h3mod\H3Mod.exe') then
  begin
    ShowMessage(MsgIni.GetMsg('H3modReq'));
    Exit;
  end;
  lvThemes.Items.Clear;

  if FindFirst(ExtractFilePath(Application.ExeName) + 'themes\*.h3Theme', faDirectory, srSearch) = 0 then
  begin
    repeat
      with lvThemes.Items.Add do
      begin
        ImageIndex := 17;
        Caption := ChangeFileExt(srSearch.Name, '');
      end;
    until (FindNext(srSearch) <> 0);
    FindClose(srSearch);
  end;
end;

procedure TfMain.itmThemesAddClick(Sender: TObject);
begin
  if not FileExists(ExtractFilePath(Application.ExeName) + 'h3mod\H3Mod.exe') then
  begin
    ShowMessage(MsgIni.GetMsg('H3modReq'));
    Exit;
  end;

  if dlgAddTheme.Execute then
  begin
    CopyFile(PChar(dlgAddTheme.FileName), PChar(ExtractFilePath(Application.ExeName) + 'themes\' + ExtractFilename(dlgAddTheme.FileName)), False);
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'h3mod\H3Mod.exe', '-f "' + ExtractFilePath(Application.ExeName) + 'h3mod\PP5022.mi4" -tp "' + ExtractFilePath(Application.ExeName) + 'themes\' + ExtractFilename(dlgAddTheme.FileName) + '" -p "' + ExtractFilePath(Application.ExeName) + 'themes\' + ChangeFileExt(ExtractFileName(dlgAddTheme.FileName), '.png') + '"');
    tabThemesClick(Sender);
  end;
end;

procedure TfMain.imgThemesClick(Sender: TObject);
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
        Picture := imgThemes.Picture;
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

procedure TfMain.lvThemesSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if lvThemes.SelCount > 0 then
  begin
    imgThemes.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.png');
  end;
end;

procedure TfMain.itmThemesDelClick(Sender: TObject);
begin
  if lvThemes.SelCount > 0 then
  begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.h3Theme') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.h3Theme');

    if FileExists(ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.png') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.png');

    tabThemesClick(Sender);
  end;
end;

procedure TfMain.itmThemesApplyClick(Sender: TObject);
begin
  if not SansaConnected then
  begin
    tcMusic.ActiveTabIndex := 0;
    ShowMessage(MsgIni.GetMsg('ConnectSansa'));
    exit;
  end;

  if lvThemes.SelCount > 0 then
  begin
    ShellExecute_AndWait(ExtractFilePath(Application.ExeName) + 'h3mod\H3Mod.exe', '-f "' + ExtractFilePath(Application.ExeName) + 'h3mod\PP5022.mi4" -tp "' + ExtractFilePath(Application.ExeName) + 'themes\' + lvThemes.Selected.Caption + '.h3Theme" -s "' + ExtractFilePath(Application.ExeName) + 'themed.mi4"');
    tmrThemeApply.Enabled := True;
  end;
end;

procedure TfMain.tmrThemeApplyTimer(Sender: TObject);
begin

  if FileExists(ExtractFilePath(Application.ExeName) + 'themed.mi4') then
  begin
    tmrThemeApply.Enabled := False;
    CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'themed.mi4'), PChar(Drive + 'PP5022.mi4'), True);
    DeleteFile(ExtractFilePath(Application.ExeName) + 'themed.mi4');
    ShowMessage(MsgIni.GetMsg('ThemeDone'));
  end;
end;

procedure TfMain.lvMusicTagsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  edMusicTagsSearch.Text := '';
  edMusicTagsSearchChange(Sender);
  LvSortStyle := cssAlphaNum;

  lvMusicTags.CustomSort(@CustomSortProc, Column.Index -1);
  LvSortOrder[Column.Index] := not LvSortOrder[Column.Index];
end;

procedure TfMain.itmRockBClick(Sender: TObject);
begin
  itmMusic.Checked := False;
  itmPhotos.Checked := False;
  itmVideo.Checked := False;
  itmPlay.Checked := False;
  itmThemes.Checked := False;
  itmEbooks.Checked := False;
  itmRecordings.Checked := False;
  itmPodcasts.Checked := False;
  itmTags.Checked := False;
  itmContacts.Checked := False;
  itmRockB.Checked := True;
  tcMain.ActivePage := tsRockB;  
end;

end.
