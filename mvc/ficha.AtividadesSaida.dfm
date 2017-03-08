object fichaAtividadesSaida: TfichaAtividadesSaida
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Encerramento de atividades'
  ClientHeight = 365
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 4
    Top = 28
    Width = 36
    Height = 13
    Caption = 'Crian'#231'a'
  end
  object lblNascimento: TLabel
    Left = 275
    Top = 28
    Width = 55
    Height = 13
    Caption = 'Nascimento'
  end
  object lblResponsavel: TLabel
    Left = 4
    Top = 71
    Width = 61
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object lblContato: TLabel
    Left = 227
    Top = 71
    Width = 39
    Height = 13
    Caption = 'Contato'
  end
  object lblEmail: TLabel
    Left = 4
    Top = 114
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblDocumento: TLabel
    Left = 185
    Top = 114
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object lblEntrada: TLabel
    Left = 267
    Top = 156
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lblValor: TLabel
    Left = 267
    Top = 323
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lblTempoDeServico: TLabel
    Left = 267
    Top = 281
    Width = 84
    Height = 13
    Caption = 'Tempo de servi'#231'o'
  end
  object lblObs: TLabel
    Left = 4
    Top = 156
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object lblPrevisaoDeSaida: TLabel
    Left = 267
    Top = 198
    Width = 84
    Height = 13
    Caption = 'Previs'#227'o de sa'#237'da'
  end
  object lblSaida: TLabel
    Left = 267
    Top = 239
    Width = 26
    Height = 13
    Caption = 'Sa'#237'da'
  end
  object edtNascimento: TcxDateEdit
    Left = 275
    Top = 44
    Enabled = False
    TabOrder = 0
    Width = 82
  end
  object edtContato: TcxTextEdit
    Left = 227
    Top = 87
    Enabled = False
    TabOrder = 1
    Width = 130
  end
  object edtEmail: TcxTextEdit
    Left = 4
    Top = 129
    Enabled = False
    TabOrder = 2
    Width = 173
  end
  object edtDocumento: TcxTextEdit
    Left = 183
    Top = 129
    Enabled = False
    TabOrder = 3
    Width = 174
  end
  object edtObs: TcxMemo
    Left = 4
    Top = 171
    TabOrder = 4
    Height = 188
    Width = 257
  end
  object edtEntrada: TcxTimeEdit
    Left = 267
    Top = 171
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 5
    Width = 90
  end
  object edtValor: TcxCurrencyEdit
    Left = 267
    Top = 338
    EditValue = 50.000000000000000000
    Enabled = False
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 67
  end
  object edtTempoServico: TcxTimeEdit
    Left = 267
    Top = 296
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 7
    Width = 90
  end
  object edtCrianca: TcxTextEdit
    Left = 4
    Top = 44
    Enabled = False
    TabOrder = 8
    Width = 265
  end
  object edtResponsavel: TcxTextEdit
    Left = 4
    Top = 87
    Enabled = False
    TabOrder = 9
    Width = 217
  end
  object edtPrevisaoSaida: TcxTimeEdit
    Left = 267
    Top = 212
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 10
    Width = 90
  end
  object edtSaida: TcxTimeEdit
    Left = 267
    Top = 254
    EditValue = 0d
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    Properties.OnEditValueChanged = edtSaidaPropertiesEditValueChanged
    TabOrder = 14
    Width = 90
  end
  object btnDetalhes: TcxButton
    Left = 334
    Top = 337
    Width = 24
    Height = 23
    Action = actDetalhe
    OptionsImage.Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      00002B2B2BB73C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF2B2B2BB70000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0707071C0202020A3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0707071C0202020A3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0707071C010101053C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A3000000010404
      04123C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF343434DE0101
      01050A0A0A293C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF1616165C00000000202020893C3C3CFF0101
      01050A0A0A293C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0D0D0D3800000000000000000404
      0412343434DE3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF00000000000000000000000000000000000000000000
      000000000000000000003C3C3CFF3C3C3CFF0000000000000000000000000000
      00003C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF0000000000000000000000000000
      00002C2C2CBD3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF3C3C3CFF000000003C3C3CFF2C2C2CBD0000000000000000000000000000
      0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
      3CFF000000000000000000000000000000000000000000000000}
    PaintStyle = bpsGlyph
    TabOrder = 16
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
    Left = 33
    Top = 211
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
      OneOnRow = True
      RotateWhenVertical = False
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
      Align = iaRight
      Caption = 'Sair'
      Category = 0
      Visible = ivAlways
      DropDownEnabled = False
      ImageIndex = 5
      PaintStyle = psCaptionGlyph
      ShortCut = 27
    end
  end
  object actFicha: TActionManager
    Images = DImages.img16
    Left = 113
    Top = 219
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
    object actDetalhe: TAction
      Caption = 'actDetalhe'
      OnExecute = actDetalheExecute
    end
  end
end
