object frameCriancas: TframeCriancas
  Left = 0
  Top = 0
  Width = 460
  Height = 353
  TabOrder = 0
  object lblCodigo: TLabel
    Left = 0
    Top = 0
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 95
    Top = 0
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblNascimento: TLabel
    Left = 347
    Top = 0
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object edtNascimento: TcxDateEdit
    Left = 347
    Top = 15
    EditValue = 33801d
    TabOrder = 2
    Width = 109
  end
  object edtCodigo: TcxTextEdit
    Left = 0
    Top = 15
    TabOrder = 0
    Text = 'edtCodigo'
    Width = 89
  end
  object edtNome: TcxTextEdit
    Left = 95
    Top = 15
    TabOrder = 1
    Text = 'cxTextEdit1'
    Width = 246
  end
  object grpResponsavel: TcxGroupBox
    Left = 0
    Top = 42
    Caption = ' Dados do respons'#225'vel '
    TabOrder = 3
    Height = 103
    Width = 456
    object lblResponsavelNome: TLabel
      Left = 8
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Nome do Respons'#225'vel'
    end
    object lblResponsavelEmail: TLabel
      Left = 8
      Top = 58
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object lblResponsavelContato: TLabel
      Left = 268
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Contato'
    end
    object lblResponsavelDocumento: TLabel
      Left = 268
      Top = 58
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object edtResponsavelNome: TcxTextEdit
      Left = 8
      Top = 31
      TabOrder = 0
      Text = 'edtCodigo'
      Width = 254
    end
    object edtResponsavelEmail: TcxTextEdit
      Left = 8
      Top = 73
      TabOrder = 2
      Text = 'edtCodigo'
      Width = 254
    end
    object edtResponsavelContato: TcxTextEdit
      Left = 268
      Top = 31
      TabOrder = 1
      Text = 'edtCodigo'
      Width = 179
    end
    object edtResponsavelDocumento: TcxTextEdit
      Left = 268
      Top = 73
      TabOrder = 3
      Text = 'edtCodigo'
      Width = 179
    end
  end
  object grpFotoCrianca: TcxGroupBox
    Left = 0
    Top = 151
    Caption = ' Foto da crian'#231'a '
    TabOrder = 4
    Height = 166
    Width = 225
    object cxImage1: TcxImage
      Left = 2
      Top = 18
      Align = alClient
      TabOrder = 0
      Height = 146
      Width = 221
    end
  end
  object grpFotoResponsavel: TcxGroupBox
    Left = 231
    Top = 151
    Caption = ' Foto do respons'#225'vel '
    TabOrder = 5
    Height = 166
    Width = 225
    object cxImage2: TcxImage
      Left = 2
      Top = 18
      Align = alClient
      TabOrder = 0
      Height = 146
      Width = 221
    end
  end
end
