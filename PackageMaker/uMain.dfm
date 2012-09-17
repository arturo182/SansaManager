object Form1: TForm1
  Left = 228
  Top = 270
  Width = 546
  Height = 354
  Caption = 'PackageMaker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Shell Dlg 2'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpTBXGroupBox1: TSpTBXGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 249
    Caption = 'Update hosts'
    Color = clNone
    ParentColor = False
    TabOrder = 0
    object lvHosts: TListView
      Left = 8
      Top = 16
      Width = 273
      Height = 225
      Columns = <
        item
          Caption = 'URL'
          Width = 260
        end>
      Items.Data = {
        7B0000000200000000000000FFFFFFFFFFFFFFFF000000000000000025687474
        703A2F2F7777772E74686573616E73612E636F6D2F73616E73616D616E616765
        722F00000000FFFFFFFFFFFFFFFF000000000000000024687474703A2F2F7361
        6E73616D616E616765722E622D69782E636F6D2F7570646174652F}
      MultiSelect = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object SpTBXGroupBox2: TSpTBXGroupBox
    Left = 8
    Top = 264
    Width = 177
    Height = 49
    Caption = 'Version'
    Color = clNone
    ParentColor = False
    TabOrder = 1
    object Edit1: TSpTBXSpinEdit
      Left = 12
      Top = 20
      Width = 37
      Height = 21
      TabOrder = 0
      SpinButton.Left = 18
      SpinButton.Top = 0
      SpinButton.Width = 15
      SpinButton.Height = 17
      SpinButton.Align = alRight
      SpinButton.LinkFont.Charset = DEFAULT_CHARSET
      SpinButton.LinkFont.Color = clBlue
      SpinButton.LinkFont.Height = -11
      SpinButton.LinkFont.Name = 'MS Shell Dlg 2'
      SpinButton.LinkFont.Style = [fsUnderline]
    end
    object Edit2: TSpTBXSpinEdit
      Left = 52
      Top = 20
      Width = 37
      Height = 21
      TabOrder = 1
      SpinButton.Left = 18
      SpinButton.Top = 0
      SpinButton.Width = 15
      SpinButton.Height = 17
      SpinButton.Align = alRight
      SpinButton.LinkFont.Charset = DEFAULT_CHARSET
      SpinButton.LinkFont.Color = clBlue
      SpinButton.LinkFont.Height = -11
      SpinButton.LinkFont.Name = 'MS Shell Dlg 2'
      SpinButton.LinkFont.Style = [fsUnderline]
    end
    object Edit3: TSpTBXSpinEdit
      Left = 92
      Top = 20
      Width = 37
      Height = 21
      TabOrder = 2
      SpinButton.Left = 18
      SpinButton.Top = 0
      SpinButton.Width = 15
      SpinButton.Height = 17
      SpinButton.Align = alRight
      SpinButton.LinkFont.Charset = DEFAULT_CHARSET
      SpinButton.LinkFont.Color = clBlue
      SpinButton.LinkFont.Height = -11
      SpinButton.LinkFont.Name = 'MS Shell Dlg 2'
      SpinButton.LinkFont.Style = [fsUnderline]
    end
    object Edit4: TSpTBXSpinEdit
      Left = 132
      Top = 20
      Width = 37
      Height = 21
      TabOrder = 3
      SpinButton.Left = 18
      SpinButton.Top = 0
      SpinButton.Width = 15
      SpinButton.Height = 17
      SpinButton.Align = alRight
      SpinButton.LinkFont.Charset = DEFAULT_CHARSET
      SpinButton.LinkFont.Color = clBlue
      SpinButton.LinkFont.Height = -11
      SpinButton.LinkFont.Name = 'MS Shell Dlg 2'
      SpinButton.LinkFont.Style = [fsUnderline]
    end
  end
  object SpTBXButton1: TSpTBXButton
    Left = 448
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Go!'
    TabOrder = 2
    OnClick = Button1Click
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -11
    LinkFont.Name = 'MS Shell Dlg 2'
    LinkFont.Style = [fsUnderline]
  end
  object SpTBXGroupBox3: TSpTBXGroupBox
    Left = 304
    Top = 8
    Width = 225
    Height = 273
    Caption = 'Translations'
    Color = clNone
    ParentColor = False
    TabOrder = 3
    object lvTransl: TListView
      Left = 8
      Top = 16
      Width = 217
      Height = 225
      Columns = <
        item
          Caption = 'Name'
          Width = 90
        end
        item
          Alignment = taCenter
          Caption = 'Short'
        end
        item
          Alignment = taCenter
          Caption = 'Update'
          Width = 70
        end>
      MultiSelect = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
    object SpTBXButton2: TSpTBXButton
      Left = 144
      Top = 244
      Width = 75
      Height = 25
      Caption = 'Set today'
      TabOrder = 1
      OnClick = SpTBXButton2Click
      LinkFont.Charset = DEFAULT_CHARSET
      LinkFont.Color = clBlue
      LinkFont.Height = -11
      LinkFont.Name = 'MS Shell Dlg 2'
      LinkFont.Style = [fsUnderline]
    end
    object SpTBXButton3: TSpTBXButton
      Left = 8
      Top = 244
      Width = 49
      Height = 25
      Caption = 'Add'
      TabOrder = 2
      OnClick = SpTBXButton3Click
      LinkFont.Charset = DEFAULT_CHARSET
      LinkFont.Color = clBlue
      LinkFont.Height = -11
      LinkFont.Name = 'MS Shell Dlg 2'
      LinkFont.Style = [fsUnderline]
    end
  end
  object STCabWriter: TSTCabWriter
    CompressionType = cctMsZip
    Left = 24
    Top = 216
  end
end
