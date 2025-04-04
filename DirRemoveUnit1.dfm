object Form1: TForm1
  Left = 1080
  Top = 156
  Width = 501
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edt_Path: TEdit
    Left = 24
    Top = 80
    Width = 249
    Height = 21
    TabOrder = 0
    Text = 'D:\Work\*'
  end
  object btn_Remove: TButton
    Left = 288
    Top = 80
    Width = 75
    Height = 25
    Caption = #49325#51228' '#53580#49828#53944
    TabOrder = 1
    OnClick = btn_RemoveClick
  end
  object mmo1: TMemo
    Left = 8
    Top = 128
    Width = 465
    Height = 497
    Lines.Strings = (
      'mmo1')
    TabOrder = 2
  end
end
