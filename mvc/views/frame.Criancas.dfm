object frameCriancas: TframeCriancas
  Left = 0
  Top = 0
  Width = 337
  Height = 333
  AutoSize = True
  TabOrder = 0
  object lblCodigo: TLabel
    Left = 0
    Top = 0
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lblNome: TLabel
    Left = 0
    Top = 40
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lblNascimento: TLabel
    Left = 128
    Top = 0
    Width = 75
    Height = 13
    Caption = 'Dta Nascimento'
  end
  object lblCaptionIdade: TLabel
    Left = 241
    Top = 18
    Width = 36
    Height = 13
    Caption = 'Idade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblIdade: TLabel
    Left = 280
    Top = 18
    Width = 57
    Height = 13
    AutoSize = False
    Caption = 'Label1'
  end
  object edtNascimento: TcxDateEdit
    Left = 128
    Top = 15
    EditValue = 0d
    Properties.AssignedValues.DisplayFormat = True
    TabOrder = 1
    Width = 109
  end
  object edtCodigo: TcxTextEdit
    Left = 0
    Top = 15
    Properties.MaxLength = 10
    TabOrder = 0
    Text = 'edtCodigo'
    Width = 122
  end
  object edtNome: TcxTextEdit
    Left = 0
    Top = 55
    Properties.MaxLength = 100
    TabOrder = 2
    Text = 'cxTextEdit1'
    Width = 337
  end
  object pgControl: TcxPageControl
    Left = 3
    Top = 84
    Width = 334
    Height = 249
    TabOrder = 3
    Properties.ActivePage = tsFoto
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 245
    ClientRectLeft = 4
    ClientRectRight = 330
    ClientRectTop = 24
    object tsFoto: TcxTabSheet
      Caption = 'Foto'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ImgFoto: TcxImage
        AlignWithMargins = True
        Left = 3
        Top = 30
        Align = alClient
        TabOrder = 0
        Height = 188
        Width = 320
      end
      object pnlCtrlImagem: TPanel
        Left = 0
        Top = 0
        Width = 326
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnLoad: TcxButton
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Carregar do computador'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 0
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object btnWebCam: TcxButton
          AlignWithMargins = True
          Left = 33
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Abrir pela Webcam'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object btnClear: TcxButton
          AlignWithMargins = True
          Left = 63
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Limpar'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 2
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Respons'#225'veis'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlCtrlResponsavel: TPanel
        Left = 0
        Top = 0
        Width = 326
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnNovo: TcxButton
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Incluir'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 3
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object btnDeletar: TcxButton
          AlignWithMargins = True
          Left = 33
          Top = 0
          Width = 27
          Height = 27
          Hint = 'Excluir'
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          OptionsImage.ImageIndex = 4
          OptionsImage.Images = DMImageBrinquedao.img16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object treeListResponsaveis: TcxTreeList
        AlignWithMargins = True
        Left = 3
        Top = 30
        Width = 320
        Height = 188
        Align = alClient
        Bands = <
          item
          end>
        Navigator.Buttons.CustomButtons = <>
        OptionsCustomizing.ColumnMoving = False
        OptionsData.CancelOnExit = False
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsData.MultiThreadedSorting = bFalse
        OptionsSelection.CellSelect = False
        OptionsView.Buttons = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.ShowRoot = False
        TabOrder = 1
        Data = {
          00000500030100000F00000044617461436F6E74726F6C6C6572310200000012
          000000546378537472696E6756616C7565547970651200000054637853747269
          6E6756616C75655479706502000000445855464D540000060000004D00610072
          006C006F006E00000E0000003100300030002E003100320031002E0033003100
          32002D0031003200445855464D54000008000000520061006600610065006C00
          6C006500000E0000003100300030002E003100320031002E003300310032002D
          0031003200020000000000000008080000000000000000FFFFFFFFFFFFFFFFFF
          FFFFFF0100000008080000000000000000FFFFFFFFFFFFFFFFFFFFFFFF1A0802
          000000}
        object treeListColumn_Nome: TcxTreeListColumn
          Caption.Text = 'Nome'
          DataBinding.ValueType = 'String'
          Width = 200
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object treeListColumn_Documento: TcxTreeListColumn
          Caption.Text = 'Documento'
          DataBinding.ValueType = 'String'
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
end
