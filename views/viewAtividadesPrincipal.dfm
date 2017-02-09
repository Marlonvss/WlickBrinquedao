object frmAtividades: TfrmAtividades
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Atividades'
  ClientHeight = 517
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 872
    Height = 52
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblHora: TLabel
      AlignWithMargins = True
      Left = 770
      Top = 3
      Width = 94
      Height = 46
      Margins.Right = 8
      Align = alRight
      Alignment = taRightJustify
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 25
    end
    object pnlBusca: TPanel
      Left = 100
      Top = 0
      Width = 356
      Height = 52
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object lblBusca: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 350
        Height = 22
        Margins.Bottom = 0
        Align = alClient
        Caption = 'Localizar [Nome, Respons'#225'vel ou Documento]:'
        Layout = tlBottom
        ExplicitWidth = 223
        ExplicitHeight = 13
      end
      object edtBusca: TcxTextEdit
        AlignWithMargins = True
        Left = 3
        Top = 28
        Align = alBottom
        TabOrder = 0
        Width = 350
      end
    end
    object cxButton1: TcxButton
      Left = 0
      Top = 0
      Width = 100
      Height = 52
      Align = alLeft
      Action = actNovo
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 872
    Height = 456
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.NoDataToDisplayInfoText = '<Nenhum registro a ser exibido>'
      OptionsView.ScrollBars = ssVertical
      OptionsView.GroupByBox = False
    end
    object cxGrid1DBCardView1: TcxGridDBCardView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = dsPrincipal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CardIndent = 7
      object cxGrid1DBCardView1DBCardViewRow1: TcxGridDBCardViewRow
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView1DBCardViewRow2: TcxGridDBCardViewRow
        Caption = 'Category'
        Kind = rkCategory
        Options.ShowData = False
        Position.BeginsLayer = True
      end
    end
    object cxGrid1DBCardView2: TcxGridDBCardView
      PopupMenu = menu
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      FilterBox.Visible = fvNever
      FindPanel.InfoText = 'Buscar'
      DataController.DataSource = dsPrincipal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.CardSizing = False
      OptionsCustomize.RowExpanding = False
      OptionsCustomize.RowFiltering = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsSelection.MultiSelect = True
      OptionsSelection.CardBorderSelection = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma atividade registrada at'#233' o momento>'
      OptionsView.CardAutoWidth = True
      OptionsView.CardIndent = 0
      OptionsView.CardWidth = 217
      OptionsView.CategorySeparatorWidth = 0
      OptionsView.CellAutoHeight = True
      OptionsView.SeparatorWidth = 0
      OptionsView.ShowRowFilterButtons = sfbAlways
      object cxGrid1DBCardView2DBCardViewRow1: TcxGridDBCardViewRow
        Caption = 'Crian'#231'a'
        DataBinding.FieldName = 'nome'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow3: TcxGridDBCardViewRow
        Caption = 'Nascimento'
        DataBinding.FieldName = 'nascimento'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow5: TcxGridDBCardViewRow
        Caption = 'Entrada'
        DataBinding.FieldName = 'entrada'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow7: TcxGridDBCardViewRow
        Caption = 'Tempo'
        DataBinding.FieldName = 'tempo'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow2: TcxGridDBCardViewRow
        Caption = 'Previs'#227'o'
        DataBinding.FieldName = 'previsao'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow4: TcxGridDBCardViewRow
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'situacao'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        OnGetDisplayText = cxGrid1DBCardView2DBCardViewRow4GetDisplayText
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cxGrid1DBCardView2DBCardViewRow6: TcxGridDBCardViewRow
        Caption = 'Obs'
        DataBinding.FieldName = 'obs'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'cxGrid1Level1'
      GridView = cxGrid1DBCardView2
    end
  end
  object ActManager: TActionManager
    LargeImages = DImages.img16
    Images = DImages.img16
    Left = 140
    Top = 72
    StyleName = 'Platform Default'
    object actNovo: TAction
      Caption = 'Registrar'
      ImageIndex = 4
      OnExecute = actNovoExecute
    end
    object actFinalizar: TAction
      Caption = 'Encerrar atividade'
      ImageIndex = 5
      OnExecute = actFinalizarExecute
    end
  end
  object uniPrincipal: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      
        'SELECT ATIVIDADES.ID, ATIVIDADES.OBS, ATIVIDADES.ENTRADA, ATIVID' +
        'ADES.VALOR, ATIVIDADES.TEMPO, ATIVIDADES.SITUACAO, ATIVIDADES.EN' +
        'TRADA + ATIVIDADES.TEMPO AS PREVISAO,'
      '       CRIANCAS.NOME, CRIANCAS.NASCIMENTO,'
      
        '       RESPONSAVEIS.NOME AS RESPONSAVELNOME, RESPONSAVEIS.DOCUME' +
        'NTO AS RESPONSAVELDOCUMENTO, RESPONSAVEIS.CONTATO AS RESPONSAVEL' +
        'CONTATO'
      '  FROM ATIVIDADES'
      '  JOIN CRIANCAS ON CRIANCAS.ID = ATIVIDADES.ID_CRIANCA'
      
        '  JOIN RESPONSAVEIS ON RESPONSAVEIS.ID = ATIVIDADES.ID_RESPONSAV' +
        'EL'
      ' WHERE ATIVIDADES.SITUACAO = 1'
      ' ORDER BY ATIVIDADES.ENTRADA + ATIVIDADES.TEMPO')
    Active = True
    Filtered = True
    Left = 80
    Top = 72
  end
  object dsPrincipal: TDataSource
    DataSet = uniPrincipal
    Left = 24
    Top = 72
  end
  object menu: TPopupMenu
    Images = DImages.img16
    Left = 112
    Top = 128
    object Finalizaratividade1: TMenuItem
      Action = actFinalizar
    end
    object Estenderatividade1: TMenuItem
      Caption = 'Estender atividade'
      Visible = False
    end
  end
  object TimerRefresh: TTimer
    Interval = 10000
    OnTimer = TimerRefreshTimer
    Left = 24
    Top = 128
  end
  object TimerHora: TTimer
    Interval = 100
    OnTimer = TimerHoraTimer
    Left = 24
    Top = 176
  end
  object UniConnection1: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'brinquedao'
    Username = 'postgres'
    Server = 'localhost'
    Connected = True
    Left = 328
    Top = 176
    EncryptedPassword = '8FFF90FF8CFF8BFF98FF8DFF9AFF8CFF'
  end
end
