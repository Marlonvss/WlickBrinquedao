object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 471
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = True
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Ribbon: TdxRibbon
    Left = 0
    Top = 0
    Width = 732
    Height = 122
    BarManager = barPrincipar
    Style = rs2013
    ColorSchemeName = 'White'
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 4
    TabStop = False
    object RibbonTabPrincipal: TdxRibbonTab
      Active = True
      Caption = 'Principal'
      Groups = <
        item
          Caption = 'Principal'
          ToolbarName = 'barPrinciparBar1'
        end>
      Index = 0
    end
    object RibbonTabConfigurações: TdxRibbonTab
      Caption = 'Configura'#231#245'es'
      Groups = <>
      Index = 1
    end
  end
  object Bar: TdxRibbonStatusBar
    Left = 0
    Top = 448
    Width = 732
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 200
      end>
    Ribbon = Ribbon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object actManager: TActionManager
    LargeImages = DImages.img32
    Images = DImages.img16
    Left = 104
    Top = 144
    StyleName = 'Platform Default'
    object Action1: TAction
      Caption = 'Usu'#225'rios'
      ImageIndex = 217
      OnExecute = Action1Execute
    end
  end
  object barPrincipar: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = DImages.img16
    ImageOptions.LargeImages = DImages.img32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 32
    Top = 144
    DockControlHeights = (
      0
      0
      0
      0)
    object barPrinciparBar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 681
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = Action1
      Category = 0
      SyncImageIndex = False
      ImageIndex = 248
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
    end
  end
  object tabMDIManager: TdxTabbedMDIManager
    Active = True
    TabProperties.CloseButtonMode = cbmEveryTab
    TabProperties.CloseTabWithMiddleClick = True
    TabProperties.CustomButtons.Buttons = <>
    TabProperties.Style = 11
    Left = 32
    Top = 192
  end
  object appEvents: TApplicationEvents
    OnException = appEventsException
    Left = 104
    Top = 192
  end
end
