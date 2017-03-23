object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Controle Brinquedoteca'
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
  OnClose = FormClose
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
    TabAreaToolbar.Visible = False
    ShowMinimizeButton = False
    Contexts = <>
    TabOrder = 4
    TabStop = False
    object RibbonTabPrincipal: TdxRibbonTab
      Caption = 'Principal'
      Groups = <
        item
          Caption = 'Atividades'
          ToolbarName = 'barPrinciparBar1'
        end
        item
          Caption = 'Relat'#243'rios'
          ToolbarName = 'barOutrosRelatorios'
        end>
      Index = 0
    end
    object RibbonTabOutros: TdxRibbonTab
      Active = True
      Caption = 'Outros'
      Groups = <
        item
          Caption = 'Cadastros'
          ToolbarName = 'barOutrosCadastros'
        end
        item
          Caption = 'Config.'
          ToolbarName = 'barOutrosConfig'
        end
        item
          Caption = 'Banco de dados'
          ToolbarName = 'barPrinciparBar2'
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
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
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
    object actAtividadesEncerradas: TAction
      Category = 'Principal'
      Caption = 'Atividades encerradas'
      OnExecute = actAtividadesEncerradasExecute
    end
    object actRelatorioGerencial: TAction
      Category = 'Outros'
      Caption = 'Relat'#243'rio Gerencial'
      OnExecute = actRelatorioGerencialExecute
    end
    object actBackup: TAction
      Category = 'Outros'
      Caption = 'Backup'
      OnExecute = actBackupExecute
    end
    object actRestore: TAction
      Category = 'Outros'
      Caption = 'Restaurar'
      OnExecute = actRestoreExecute
    end
  end
  object barPrincipar: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = DMImageBrinquedao.img16
    ImageOptions.LargeImages = DMImageBrinquedao.img32
    ImageOptions.LargeIcons = True
    MenuAnimations = maFade
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
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
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
          ItemName = 'dxBarLargeButton6'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barOutrosCadastros: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
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
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barOutrosRelatorios: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockedLeft = 82
      DockedTop = 0
      FloatLeft = 766
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarLargeButton7'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barOutrosConfig: TdxBar
      Caption = 'Custom 4'
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
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barPrinciparBar2: TdxBar
      Caption = 'Custom 5'
      CaptionButtons = <>
      DockedLeft = 224
      DockedTop = 0
      FloatLeft = 766
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end>
      OneOnRow = True
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
    object dxBarLargeButton6: TdxBarLargeButton
      Action = actAtividadesEncerradas
      Category = 0
      LargeImageIndex = 5
      SyncImageIndex = False
      ImageIndex = -1
    end
    object dxBarLargeButton7: TdxBarLargeButton
      Action = actRelatorioGerencial
      Category = 0
      LargeImageIndex = 6
    end
    object dxBarLargeButton8: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Action = actBackup
      Category = 0
      ImageIndex = 8
    end
    object dxBarButton2: TdxBarButton
      Action = actRestore
      Category = 0
      ImageIndex = 9
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
