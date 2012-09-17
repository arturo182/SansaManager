object fDrop: TfDrop
  Left = 716
  Top = 581
  AutoSize = True
  BorderStyle = bsNone
  ClientHeight = 121
  ClientWidth = 177
  Color = clFuchsia
  TransparentColor = True
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape: TShape
    Left = 0
    Top = 0
    Width = 177
    Height = 121
    Brush.Color = clBtnFace
    ParentShowHint = False
    Pen.Color = clActiveCaption
    Pen.Width = 2
    ShowHint = True
  end
  object btnVideo: TSpTBXSpeedButton
    Left = 8
    Top = 8
    Width = 49
    Height = 49
    ParentShowHint = False
    ShowHint = False
    OnClick = btnVideoClick
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object btnMusic: TSpTBXSpeedButton
    Left = 64
    Top = 8
    Width = 48
    Height = 48
    ParentShowHint = False
    ShowHint = False
    OnClick = btnMusicClick
    DrawPushedCaption = False
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object btnRoot: TSpTBXSpeedButton
    Left = 120
    Top = 8
    Width = 48
    Height = 48
    ParentShowHint = False
    ShowHint = False
    OnClick = btnRootClick
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object btnPlaylist: TSpTBXSpeedButton
    Left = 8
    Top = 64
    Width = 48
    Height = 48
    ParentShowHint = False
    ShowHint = False
    OnClick = btnPlaylistClick
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object btnPhotos: TSpTBXSpeedButton
    Left = 64
    Top = 64
    Width = 48
    Height = 48
    ParentShowHint = False
    ShowHint = False
    OnClick = btnPhotosClick
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object btnCustom: TSpTBXSpeedButton
    Left = 120
    Top = 64
    Width = 48
    Height = 48
    ParentShowHint = False
    ShowHint = False
    Images = fMain.imsSystem24
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object ExplorerDrop: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnMusic
    OnDropped = ExplorerDropDropped
    Left = 18
    Top = 18
  end
  object ExplorerDrop1: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnVideo
    OnDropped = ExplorerDrop1Dropped
    Left = 74
    Top = 18
  end
  object ExplorerDrop2: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnRoot
    OnDropped = ExplorerDrop2Dropped
    Left = 130
    Top = 18
  end
  object ExplorerDrop3: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnPlaylist
    OnDropped = ExplorerDrop3Dropped
    Left = 18
    Top = 74
  end
  object ExplorerDrop4: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnPhotos
    OnDropped = ExplorerDrop4Dropped
    Left = 74
    Top = 74
  end
  object ExplorerDrop5: TExplorerDrop
    Enabled = True
    AllowFolders = True
    DestinationControl = btnCustom
    OnDropped = ExplorerDrop5Dropped
    Left = 130
    Top = 74
  end
  object JvSelectDirectory: TJvSelectDirectory
    InitialDir = 'E:\'
    ClassicDialog = False
    Options = [sdPerformCreate, sdPrompt]
    Left = 130
    Top = 48
  end
end
