object frameConfiguracoes: TframeConfiguracoes
  Left = 0
  Top = 0
  Width = 284
  Height = 312
  TabOrder = 0
  object pgConfiguracao: TcxPageControl
    Left = 0
    Top = 0
    Width = 284
    Height = 312
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsGeral
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 308
    ClientRectLeft = 4
    ClientRectRight = 280
    ClientRectTop = 24
    object tsGeral: TcxTabSheet
      Caption = 'Sistema'
      ImageIndex = 2
      object cxGroupBox1: TcxGroupBox
        Left = 2
        Top = 0
        Caption = ' Logotipo '
        TabOrder = 0
        Height = 212
        Width = 270
        object pnlCtrlImagem: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 260
          Height = 27
          Margins.Top = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object btnLoad: TcxButton
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 27
            Height = 27
            Hint = 'Carregar do computador'
            Margins.Left = 0
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            OptionsImage.ImageIndex = 0
            OptionsImage.Images = DMImageBrinquedao.img16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object btnClear: TcxButton
            AlignWithMargins = True
            Left = 30
            Top = 0
            Width = 27
            Height = 27
            Hint = 'Limpar'
            Margins.Left = 0
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            OptionsImage.ImageIndex = 2
            OptionsImage.Images = DMImageBrinquedao.img16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object ImgFoto: TcxImage
          AlignWithMargins = True
          Left = 5
          Top = 48
          Align = alClient
          Properties.PopupMenuLayout.MenuItems = []
          Style.Shadow = False
          TabOrder = 1
          Height = 159
          Width = 260
        end
      end
      object grpSenhaDefault: TcxGroupBox
        Left = 2
        Top = 213
        Caption = ' Login padr'#227'o '
        TabOrder = 1
        Height = 68
        Width = 270
        object lblLogin: TLabel
          Left = 5
          Top = 18
          Width = 29
          Height = 13
          Caption = 'Login:'
          Transparent = True
        end
        object lblSenha: TLabel
          Left = 3
          Top = 41
          Width = 34
          Height = 13
          Caption = 'Senha:'
          Transparent = True
        end
        object edtSenha: TcxTextEdit
          Left = 57
          Top = 38
          Properties.EchoMode = eemPassword
          TabOrder = 1
          Width = 208
        end
        object edtLogin: TcxTextEdit
          Left = 57
          Top = 15
          TabOrder = 0
          Width = 208
        end
      end
    end
    object tsAtividades: TcxTabSheet
      Caption = 'Atividades'
      ImageIndex = 1
      object lblValorPorMinuto: TLabel
        Left = 4
        Top = 5
        Width = 124
        Height = 13
        Caption = 'Valor do minuto excedido:'
        Transparent = True
      end
      object lblTolerancia: TLabel
        Left = 4
        Top = 35
        Width = 96
        Height = 13
        Caption = 'Toler'#226'ncia na sa'#237'da:'
        Transparent = True
      end
      object edtTolerancia: TcxTimeEdit
        Left = 132
        Top = 29
        EditValue = 0d
        Properties.ImmediatePost = True
        Properties.TimeFormat = tfHourMin
        TabOrder = 0
        Width = 137
      end
      object edtValorPorMinuto: TcxCurrencyEdit
        Left = 132
        Top = 2
        TabOrder = 1
        Width = 137
      end
    end
    object tsCamera: TcxTabSheet
      Caption = 'Camera'
      ImageIndex = 1
      object lblCameraDefault: TLabel
        Left = 2
        Top = 3
        Width = 74
        Height = 13
        Caption = 'Camera default'
        Transparent = True
      end
      object grpCameraDefault: TcxComboBox
        Left = 2
        Top = 18
        TabOrder = 0
        Text = 'Dispositivos:'
        Width = 271
      end
    end
  end
end
