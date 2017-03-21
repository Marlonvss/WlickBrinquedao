object frameAtividadesEntrada: TframeAtividadesEntrada
  Left = 0
  Top = 0
  Width = 538
  Height = 299
  AutoSize = True
  TabOrder = 0
  object lblObs: TLabel
    Left = 0
    Top = 138
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object lblEntrada: TLabel
    Left = 263
    Top = 138
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lblValor: TLabel
    Left = 263
    Top = 222
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lblTempoDeServico: TLabel
    Left = 263
    Top = 180
    Width = 84
    Height = 13
    Caption = 'Tempo de servi'#231'o'
  end
  object lblPrevisaoDeSaida: TLabel
    Left = 263
    Top = 264
    Width = 84
    Height = 13
    Caption = 'Previs'#227'o de sa'#237'da'
  end
  object lblFotoCrianca: TLabel
    Left = 359
    Top = 6
    Width = 74
    Height = 13
    Caption = 'Foto da crian'#231'a'
    Transparent = True
  end
  object lblFotoResponsavel: TLabel
    Left = 360
    Top = 154
    Width = 98
    Height = 13
    Caption = 'Foto do respons'#225'vel'
    Transparent = True
  end
  object lblLogin: TLabel
    Left = 0
    Top = 6
    Width = 36
    Height = 13
    Caption = 'Crian'#231'a'
  end
  object lblNascimento: TLabel
    Left = 271
    Top = 6
    Width = 55
    Height = 13
    Caption = 'Nascimento'
  end
  object lblResponsavel: TLabel
    Left = 0
    Top = 49
    Width = 61
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object lblContato: TLabel
    Left = 223
    Top = 49
    Width = 39
    Height = 13
    Caption = 'Contato'
  end
  object lblEmail: TLabel
    Left = 0
    Top = 92
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblDocumento: TLabel
    Left = 181
    Top = 92
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object edtObs: TcxMemo
    Left = 0
    Top = 153
    TabOrder = 6
    Height = 146
    Width = 257
  end
  object edtEntrada: TcxTimeEdit
    Left = 263
    Top = 153
    EditValue = 0d
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 7
    Width = 90
  end
  object edtPrevisaoSaida: TcxTimeEdit
    Left = 263
    Top = 278
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 11
    Width = 90
  end
  object edtValor: TcxComboBox
    Left = 263
    Top = 237
    TabOrder = 9
    Width = 90
  end
  object edtTempoServico: TcxComboBox
    Left = 263
    Top = 195
    TabOrder = 8
    Width = 90
  end
  object imgFotoCrianca: TcxImage
    Left = 359
    Top = 22
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 10
    Height = 125
    Width = 179
  end
  object imgFotoResponsavel: TcxImage
    Left = 359
    Top = 170
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 12
    Height = 125
    Width = 179
  end
  object edtNascimento: TcxDateEdit
    Left = 271
    Top = 22
    TabOrder = 1
    Width = 82
  end
  object edtContato: TcxTextEdit
    Left = 223
    Top = 65
    TabOrder = 3
    Width = 130
  end
  object edtEmail: TcxTextEdit
    Left = 0
    Top = 107
    TabOrder = 4
    Width = 173
  end
  object edtDocumento: TcxTextEdit
    Left = 179
    Top = 107
    TabOrder = 5
    Width = 174
  end
  object edtCrianca: TcxTextEdit
    Left = 0
    Top = 22
    TabOrder = 0
    Width = 265
  end
  object edtResponsavel: TcxTextEdit
    Left = 0
    Top = 65
    TabOrder = 2
    Width = 217
  end
  object btnFotoResponsavel: TcxButton
    AlignWithMargins = True
    Left = 492
    Top = 148
    Width = 22
    Height = 22
    Hint = 'Abrir pela Webcam'
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    OptionsImage.ImageIndex = 1
    OptionsImage.Images = DMImageBrinquedao.img16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
  end
  object btnFotoCrianca: TcxButton
    AlignWithMargins = True
    Left = 492
    Top = 0
    Width = 22
    Height = 22
    Hint = 'Abrir pela Webcam'
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    OptionsImage.ImageIndex = 1
    OptionsImage.Images = DMImageBrinquedao.img16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
  end
  object btnFotoCriancaClear: TcxButton
    AlignWithMargins = True
    Left = 516
    Top = 0
    Width = 22
    Height = 22
    Hint = 'Limpar'
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    OptionsImage.ImageIndex = 2
    OptionsImage.Images = DMImageBrinquedao.img16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
  end
  object btnFotoResponsavelClear: TcxButton
    AlignWithMargins = True
    Left = 516
    Top = 148
    Width = 22
    Height = 22
    Hint = 'Limpar'
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    OptionsImage.ImageIndex = 2
    OptionsImage.Images = DMImageBrinquedao.img16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
  end
end
