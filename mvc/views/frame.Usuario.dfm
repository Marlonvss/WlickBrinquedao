object frameUsuario: TframeUsuario
  Left = 0
  Top = 0
  Width = 248
  Height = 36
  AutoSize = True
  TabOrder = 0
  object lblLogin: TLabel
    Left = 0
    Top = 0
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object lblSenha: TLabel
    Left = 127
    Top = 0
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtLogin: TcxTextEdit
    Left = 0
    Top = 15
    TabOrder = 0
    Width = 121
  end
  object edtSenha: TcxTextEdit
    Left = 127
    Top = 15
    Properties.EchoMode = eemPassword
    TabOrder = 1
    Width = 121
  end
end
