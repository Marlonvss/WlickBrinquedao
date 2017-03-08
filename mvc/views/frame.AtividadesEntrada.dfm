object frameAtividadesEntrada: TframeAtividadesEntrada
  Left = 0
  Top = 0
  Width = 538
  Height = 293
  AutoSize = True
  TabOrder = 0
  object lblLogin: TLabel
    Left = 0
    Top = 4
    Width = 36
    Height = 13
    Caption = 'Crian'#231'a'
  end
  object lblNascimento: TLabel
    Left = 271
    Top = 4
    Width = 55
    Height = 13
    Caption = 'Nascimento'
  end
  object lblResponsavel: TLabel
    Left = 0
    Top = 47
    Width = 61
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object lblContato: TLabel
    Left = 223
    Top = 47
    Width = 39
    Height = 13
    Caption = 'Contato'
  end
  object lblEmail: TLabel
    Left = 0
    Top = 90
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblDocumento: TLabel
    Left = 181
    Top = 90
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object lblObs: TLabel
    Left = 0
    Top = 132
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object lblEntrada: TLabel
    Left = 263
    Top = 132
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lblValor: TLabel
    Left = 263
    Top = 216
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lblTempoDeServico: TLabel
    Left = 263
    Top = 174
    Width = 84
    Height = 13
    Caption = 'Tempo de servi'#231'o'
  end
  object lblPrevisaoDeSaida: TLabel
    Left = 263
    Top = 258
    Width = 84
    Height = 13
    Caption = 'Previs'#227'o de sa'#237'da'
  end
  object lblFotoCrianca: TLabel
    Left = 359
    Top = 0
    Width = 74
    Height = 13
    Caption = 'Foto da crian'#231'a'
    Transparent = True
  end
  object lblFotoResponsavel: TLabel
    Left = 360
    Top = 148
    Width = 98
    Height = 13
    Caption = 'Foto do respons'#225'vel'
    Transparent = True
  end
  object edtCrianca: TcxComboBox
    Left = 0
    Top = 20
    TabOrder = 0
    Width = 240
  end
  object edtNascimento: TcxDateEdit
    Left = 271
    Top = 20
    Enabled = False
    TabOrder = 1
    Width = 82
  end
  object edtResponsavel: TcxComboBox
    Left = 0
    Top = 63
    TabOrder = 2
    Width = 217
  end
  object edtContato: TcxTextEdit
    Left = 223
    Top = 63
    Enabled = False
    TabOrder = 3
    Width = 130
  end
  object edtEmail: TcxTextEdit
    Left = 0
    Top = 105
    Enabled = False
    TabOrder = 4
    Width = 173
  end
  object edtDocumento: TcxTextEdit
    Left = 179
    Top = 105
    Enabled = False
    TabOrder = 5
    Width = 174
  end
  object edtObs: TcxMemo
    Left = 0
    Top = 147
    TabOrder = 6
    Height = 146
    Width = 257
  end
  object edtEntrada: TcxTimeEdit
    Left = 263
    Top = 147
    EditValue = 0d
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 7
    Width = 90
  end
  object edtPrevisaoSaida: TcxTimeEdit
    Left = 263
    Top = 272
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 8
    Width = 90
  end
  object btnAddCrianca: TcxButton
    Left = 242
    Top = 19
    Width = 23
    Height = 23
    Caption = 'btnAddCrianca'
    OptionsImage.ImageIndex = 3
    OptionsImage.Images = DMImageBrinquedao.img16
    PaintStyle = bpsGlyph
    TabOrder = 9
  end
  object edtValor: TcxComboBox
    Left = 263
    Top = 231
    TabOrder = 10
    Width = 90
  end
  object edtTempoServico: TcxComboBox
    Left = 263
    Top = 189
    TabOrder = 11
    Width = 90
  end
  object imgFotoCrianca: TcxImage
    Left = 359
    Top = 16
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 12
    Height = 125
    Width = 179
  end
  object imgFotoResponsavel: TcxImage
    Left = 359
    Top = 164
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 13
    Height = 125
    Width = 179
  end
end
