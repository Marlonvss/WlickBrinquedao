object viewErro: TviewErro
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Aten'#231#227'o'
  ClientHeight = 257
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    378
    257)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 46
    Top = 15
    Width = 166
    Height = 16
    Caption = 'Ocorreu um erro no sistema.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 32
    Height = 32
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
      1974455874536F6674776172650041646F626520496D616765526561647971C9
      653C0000001D744558745469746C6500436C6F73653B457869743B426172733B
      526962626F6E3B4603B9E800000176494441545847ED96414EC3301045BBEA7D
      402050C5929B703D2AD12E380B8700C105C0CC47F323DBF976C6201424BA78AD
      EAF9E3794993B49B94D2AA7CBD3CDDDDA6353809FC0B8177B136111178336E8C
      C76C2DCAD1D819AFD95AC19200865F7A7D6B8C4860F8D67B2F0C29D113C0A9DB
      A146EC7354621A9EF5E24C7C787D02B59600B8378A8D3CDB9350C321FEE0F502
      D4199A159DBDA1365412C73C9765E570800C8332E0ECB921B1B55A62E8C80972
      0CCB4046EF4CCC867BBD3B1C20C7B00C54B424868F9C203F2200661239A819A1
      E1003D6C94810652026B46783840DF77045ADF39AF09D52341DFA8801C4E5033
      C212E861A30C54B46E35B51692403E2AD0BBCF5BD7C4A204720CCB801379C2F5
      9E13F95E05C8312C0346EFC8EB6CE48959800C832AD0BADA0F59A666E84CA0CE
      505DC44FE73537F10C36EA0D274AE2CA18FE397E31CEBD1E1D4E26097B3F339E
      7DBD6049004002F623C30924D02B87838800E8FEB15CE0C77F4A7F9593C0DF11
      588FB4F904DD7B20108EEFC7170000000049454E44AE426082}
    Transparent = True
  end
  object mmoMsgErro: TcxMemo
    Left = 8
    Top = 46
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'mmoMsgErro')
    Properties.ReadOnly = True
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 162
    Width = 362
  end
  object pnlBotton: TPanel
    Left = 0
    Top = 221
    Width = 378
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    Color = 4105706
    ParentBackground = False
    TabOrder = 1
    object chkGravaLog: TCheckBox
      Left = 8
      Top = 11
      Width = 291
      Height = 13
      Caption = 'Gravar no arquivo de log?'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object btnOk: TcxButton
      AlignWithMargins = True
      Left = 300
      Top = 3
      Width = 75
      Height = 30
      Align = alRight
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
