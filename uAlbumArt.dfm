object fAlbumArt: TfAlbumArt
  Left = 253
  Top = 284
  BorderStyle = bsDialog
  ClientHeight = 297
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox: TSpTBXComboBox
    Left = 8
    Top = 7
    Width = 521
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBoxChange
  end
  object WebBrowser: TWebBrowser
    Left = 8
    Top = 32
    Width = 601
    Height = 257
    TabOrder = 1
    ControlData = {
      4C0000001D3E0000901A00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126202000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object btnAlbumArtUse: TSpTBXButton
    Left = 536
    Top = 6
    Width = 75
    Height = 22
    Caption = 'Use this one'
    TabOrder = 2
    OnClick = btnAlbumArtUseClick
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object HTTPGet: THTTPGet
    AcceptTypes = '*/*'
    Agent = 'UtilMind HTTPGet'
    BinaryData = False
    UseCache = False
    WaitThread = False
    OnDoneString = HTTPGetDoneString
    Left = 16
    Top = 256
  end
  object XMLDocument: TXMLDocument
    Left = 48
    Top = 256
    DOMVendorDesc = 'MSXML'
  end
  object HTTPGet2: THTTPGet
    AcceptTypes = '*/*'
    Agent = 'UtilMind HTTPGet'
    BinaryData = False
    UseCache = False
    WaitThread = False
    OnDoneFile = HTTPGet2DoneFile
    Left = 80
    Top = 256
  end
end
