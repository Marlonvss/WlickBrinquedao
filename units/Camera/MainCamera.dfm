object fichaMainCamera: TfichaMainCamera
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Imagem'
  ClientHeight = 290
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 5
    Top = 39
    Width = 346
    Height = 245
    Brush.Color = clWindowFrame
  end
  object imgCapturar: TImage
    Left = 13
    Top = 47
    Width = 330
    Height = 229
    Center = True
    Proportional = True
    Stretch = True
  end
  object cxButton1: TcxButton
    Left = 5
    Top = 8
    Width = 170
    Height = 25
    Action = actCapturar
    TabOrder = 0
  end
  object cxButton2: TcxButton
    Left = 181
    Top = 8
    Width = 170
    Height = 25
    Action = actFinalizar
    TabOrder = 1
  end
  object actImagem: TActionManager
    Images = DMImageBrinquedao.img16
    Left = 236
    Top = 72
    StyleName = 'Platform Default'
    object actCapturar: TAction
      Caption = 'Capturar'
      ImageIndex = 6
      OnExecute = actCapturarExecute
    end
    object actFinalizar: TAction
      Caption = 'Finalizar'
      ImageIndex = 7
      OnExecute = actFinalizarExecute
    end
  end
end
