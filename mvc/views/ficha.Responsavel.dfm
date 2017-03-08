object fichaResponsaveis: TfichaResponsaveis
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Responsavel'
  ClientHeight = 349
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBody: TPanel
    AlignWithMargins = True
    Left = 8
    Top = 32
    Width = 337
    Height = 309
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object lblNome: TLabel
      Left = 0
      Top = 0
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblDocumento: TLabel
      Left = 0
      Top = 42
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object lblContato: TLabel
      Left = 171
      Top = 42
      Width = 39
      Height = 13
      Caption = 'Contato'
    end
    object lblEmail: TLabel
      Left = 0
      Top = 84
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object edtNome: TcxTextEdit
      Left = 0
      Top = 15
      Properties.MaxLength = 100
      TabOrder = 0
      Width = 337
    end
    object edtDocumento: TcxTextEdit
      Left = 0
      Top = 57
      Properties.MaxLength = 30
      TabOrder = 1
      Width = 166
    end
    object edtContato: TcxTextEdit
      Left = 171
      Top = 57
      Properties.MaxLength = 50
      TabOrder = 2
      Width = 165
    end
    object grpFoto: TcxGroupBox
      Left = 0
      Top = 126
      Align = alBottom
      Caption = ' Foto '
      TabOrder = 4
      Height = 183
      Width = 337
      object pnlCtrlImagem: TPanel
        Left = 2
        Top = 18
        Width = 333
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnLoad: TcxButton
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Carregar do computador'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnLoadClick
        end
        object btnWebCam: TcxButton
          AlignWithMargins = True
          Left = 33
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Abrir pela Webcam'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnWebCamClick
        end
        object btnClear: TcxButton
          AlignWithMargins = True
          Left = 63
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Limpar'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 2
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnClearClick
        end
      end
      object ImgFoto: TcxImage
        AlignWithMargins = True
        Left = 5
        Top = 48
        Align = alClient
        Properties.PopupMenuLayout.MenuItems = []
        TabOrder = 1
        Height = 130
        Width = 327
      end
    end
    object edtEmail: TcxTextEdit
      Left = 0
      Top = 99
      Properties.MaxLength = 100
      TabOrder = 3
      Width = 337
    end
  end
  object actFicha: TActionManager
    Images = DImages.img16
    Left = 261
    Top = 207
    StyleName = 'Platform Default'
    object actGravar: TAction
      Caption = 'Gravar'
      ImageIndex = 0
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 1
      OnExecute = actCancelarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = actSairExecute
    end
  end
  object menuFicha: TdxBarManager
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
    ImageOptions.Images = DImages.img16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 189
    Top = 207
    DockControlHeights = (
      0
      0
      24
      0)
    object menuBrowserBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Menu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 759
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnGravar'
        end
        item
          Visible = True
          ItemName = 'btnCancelar'
        end>
      OneOnRow = False
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object menuBrowserBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Menu 2'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 306
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 729
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object btnGravar: TdxBarButton
      Action = actGravar
      Category = 0
      CloseSubMenuOnClick = False
      PaintStyle = psCaptionGlyph
    end
    object btnCancelar: TdxBarButton
      Action = actCancelar
      Category = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton1: TdxBarButton
      Action = actSair
      Align = iaRight
      Category = 0
      DropDownEnabled = False
      PaintStyle = psCaptionGlyph
    end
  end
end
