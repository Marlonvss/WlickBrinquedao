object frameAtividades: TframeAtividades
  Left = 0
  Top = 0
  Width = 353
  Height = 289
  AutoSize = True
  TabOrder = 0
  object lblLogin: TLabel
    Left = 0
    Top = 0
    Width = 36
    Height = 13
    Caption = 'Crian'#231'a'
  end
  object lblNascimento: TLabel
    Left = 271
    Top = 0
    Width = 55
    Height = 13
    Caption = 'Nascimento'
  end
  object lblResponsavel: TLabel
    Left = 0
    Top = 43
    Width = 61
    Height = 13
    Caption = 'Respons'#225'vel'
  end
  object lblContato: TLabel
    Left = 223
    Top = 43
    Width = 39
    Height = 13
    Caption = 'Contato'
  end
  object lblEmail: TLabel
    Left = 0
    Top = 86
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object lblDocumento: TLabel
    Left = 181
    Top = 86
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object lblObs: TLabel
    Left = 0
    Top = 128
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object lblEntrada: TLabel
    Left = 263
    Top = 128
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lblValor: TLabel
    Left = 263
    Top = 212
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lblTempoDeServico: TLabel
    Left = 263
    Top = 170
    Width = 84
    Height = 13
    Caption = 'Tempo de servi'#231'o'
  end
  object lblPrevisaoDeSaida: TLabel
    Left = 263
    Top = 252
    Width = 84
    Height = 13
    Caption = 'Previs'#227'o de sa'#237'da'
  end
  object edtCrianca: TcxComboBox
    Left = 0
    Top = 16
    TabOrder = 0
    Width = 240
  end
  object edtNascimento: TcxDateEdit
    Left = 271
    Top = 16
    Enabled = False
    TabOrder = 1
    Width = 82
  end
  object edtResponsavel: TcxComboBox
    Left = 0
    Top = 59
    TabOrder = 2
    Width = 217
  end
  object edtContato: TcxTextEdit
    Left = 223
    Top = 59
    Enabled = False
    TabOrder = 3
    Width = 130
  end
  object edtEmail: TcxTextEdit
    Left = 0
    Top = 101
    Enabled = False
    TabOrder = 4
    Width = 173
  end
  object edtDocumento: TcxTextEdit
    Left = 179
    Top = 101
    Enabled = False
    TabOrder = 10
    Width = 174
  end
  object edtObs: TcxMemo
    Left = 0
    Top = 143
    TabOrder = 5
    Height = 146
    Width = 257
  end
  object edtEntrada: TcxTimeEdit
    Left = 263
    Top = 143
    EditValue = 0d
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 6
    Width = 90
  end
  object edtPrevisaoSaida: TcxTimeEdit
    Left = 263
    Top = 268
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 9
    Width = 90
  end
  object btnAddCrianca: TcxButton
    Left = 242
    Top = 15
    Width = 23
    Height = 23
    Caption = 'btnAddCrianca'
    OptionsImage.ImageIndex = 3
    OptionsImage.Images = DMImageBrinquedao.img16
    PaintStyle = bpsGlyph
    TabOrder = 11
  end
  object edtValor: TcxComboBox
    Left = 263
    Top = 227
    TabOrder = 8
    Width = 90
  end
  object edtTempoServico: TcxComboBox
    Left = 263
    Top = 185
    TabOrder = 7
    Width = 90
  end
end
