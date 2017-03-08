object frameAtividades: TframeAtividades
  Left = 0
  Top = 0
  Width = 538
  Height = 332
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
  object lblEntrada: TLabel
    Left = 263
    Top = 128
    Width = 38
    Height = 13
    Caption = 'Entrada'
  end
  object lblValor: TLabel
    Left = 263
    Top = 295
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lblTempoDeServico: TLabel
    Left = 263
    Top = 253
    Width = 84
    Height = 13
    Caption = 'Tempo de servi'#231'o'
  end
  object lblObs: TLabel
    Left = 0
    Top = 128
    Width = 19
    Height = 13
    Caption = 'Obs'
  end
  object lblPrevisaoDeSaida: TLabel
    Left = 263
    Top = 170
    Width = 84
    Height = 13
    Caption = 'Previs'#227'o de sa'#237'da'
  end
  object lblSaida: TLabel
    Left = 263
    Top = 211
    Width = 26
    Height = 13
    Caption = 'Sa'#237'da'
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
    Left = 359
    Top = 148
    Width = 98
    Height = 13
    Caption = 'Foto do respons'#225'vel'
    Transparent = True
  end
  object edtNascimento: TcxDateEdit
    Left = 271
    Top = 16
    Enabled = False
    TabOrder = 0
    Width = 82
  end
  object edtContato: TcxTextEdit
    Left = 223
    Top = 59
    Enabled = False
    TabOrder = 1
    Width = 130
  end
  object edtEmail: TcxTextEdit
    Left = 0
    Top = 101
    Enabled = False
    TabOrder = 2
    Width = 173
  end
  object edtDocumento: TcxTextEdit
    Left = 179
    Top = 101
    Enabled = False
    TabOrder = 3
    Width = 174
  end
  object edtObs: TcxMemo
    Left = 0
    Top = 143
    TabOrder = 4
    Height = 188
    Width = 257
  end
  object edtEntrada: TcxTimeEdit
    Left = 263
    Top = 143
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 5
    Width = 90
  end
  object edtValor: TcxCurrencyEdit
    Left = 263
    Top = 310
    EditValue = 50.000000000000000000
    Enabled = False
    Properties.ReadOnly = False
    TabOrder = 6
    Width = 67
  end
  object edtTempoServico: TcxTimeEdit
    Left = 263
    Top = 268
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 7
    Width = 90
  end
  object edtCrianca: TcxTextEdit
    Left = 0
    Top = 16
    Enabled = False
    TabOrder = 8
    Width = 265
  end
  object edtResponsavel: TcxTextEdit
    Left = 0
    Top = 59
    Enabled = False
    TabOrder = 9
    Width = 217
  end
  object edtPrevisaoSaida: TcxTimeEdit
    Left = 263
    Top = 184
    EditValue = 0d
    Enabled = False
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 10
    Width = 90
  end
  object edtSaida: TcxTimeEdit
    Left = 263
    Top = 226
    EditValue = 0d
    Properties.ImmediatePost = True
    Properties.TimeFormat = tfHourMin
    TabOrder = 11
    Width = 90
  end
  object btnDetalhes: TcxButton
    Left = 330
    Top = 309
    Width = 24
    Height = 23
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
    TabOrder = 12
  end
  object imgFotoCrianca: TcxImage
    Left = 359
    Top = 16
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 13
    Height = 125
    Width = 179
  end
  object imgFotoResponsavel: TcxImage
    Left = 359
    Top = 164
    TabStop = False
    Enabled = False
    Properties.PopupMenuLayout.MenuItems = []
    TabOrder = 14
    Height = 125
    Width = 179
  end
end
