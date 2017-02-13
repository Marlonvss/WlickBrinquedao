object frameConfiguracoes: TframeConfiguracoes
  Left = 0
  Top = 0
  Width = 284
  Height = 88
  TabOrder = 0
  object pgConfiguracao: TcxPageControl
    Left = 0
    Top = 0
    Width = 284
    Height = 88
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsAtividades
    Properties.CustomButtons.Buttons = <>
    ExplicitHeight = 157
    ClientRectBottom = 84
    ClientRectLeft = 4
    ClientRectRight = 280
    ClientRectTop = 24
    object tsAtividades: TcxTabSheet
      Caption = 'Atividades'
      ImageIndex = 1
      ExplicitHeight = 129
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
      ExplicitLeft = 5
      ExplicitTop = 28
      ExplicitHeight = 129
      object lblCameraDefault: TLabel
        Left = 0
        Top = 3
        Width = 74
        Height = 13
        Caption = 'Camera default'
        Transparent = True
      end
      object grpCameraDefault: TcxComboBox
        Left = 0
        Top = 18
        TabOrder = 0
        Text = 'Dispositivos:'
        Width = 273
      end
    end
  end
end
