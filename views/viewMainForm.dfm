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
    Contexts = <>
    TabOrder = 4
    TabStop = False
    object RibbonTabPrincipal: TdxRibbonTab
      Active = True
      Caption = 'Principal'
      Groups = <
        item
          Caption = ''
          ToolbarName = 'barPrinciparBar1'
        end>
      Index = 0
    end
    object RibbonTabConfigurações: TdxRibbonTab
      Caption = 'Outros'
      Groups = <
        item
          Caption = 'Cadastros'
          ToolbarName = 'barPrinciparBar2'
        end
        item
          Caption = 'Config.'
          ToolbarName = 'barPrinciparBar3'
        end>
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
    Left = 104
    Top = 144
    StyleName = 'Platform Default'
    object actUsuarios: TAction
      Category = 'Outros'
      Caption = 'Usu'#225'rios do sistema'
      OnExecute = actUsuariosExecute
    end
    object actCriancas: TAction
      Category = 'Principal'
      Caption = 'Listagem de crian'#231'as'
      OnExecute = actCriancasExecute
    end
    object actValores: TAction
      Category = 'Outros'
      Caption = 'Valores'
      OnExecute = actValoresExecute
    end
    object actPreferencias: TAction
      Category = 'Outros'
      Caption = 'Prefer'#234'ncias'
      OnExecute = actPreferenciasExecute
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
    ImageOptions.LargeImages = DMImageBrinquedao.img32
    ImageOptions.LargeIcons = True
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
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barPrinciparBar2: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 766
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton4'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barPrinciparBar3: TdxBar
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockedLeft = 135
      DockedTop = 0
      FloatLeft = 766
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton5'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actCriancas
      Category = 0
      LargeImageIndex = 0
      SyncImageIndex = False
      ImageIndex = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = actUsuarios
      Category = 0
      LargeImageIndex = 2
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = actValores
      Category = 0
      LargeImageIndex = 1
    end
    object dxBarLargeButton5: TdxBarLargeButton
      Action = actPreferencias
      Category = 0
      LargeImageIndex = 3
    end
  end
  object tabMDIManager: TdxTabbedMDIManager
    Active = True
    LookAndFeel.Kind = lfUltraFlat
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
  object timerAtividades: TTimer
    Interval = 100
    OnTimer = timerAtividadesTimer
    Left = 176
    Top = 144
  end
end
