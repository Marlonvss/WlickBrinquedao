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
        Caption = 'Filtrar atividades por Nome/Respons'#225'vel/Documento:'
        Layout = tlBottom
        ExplicitWidth = 256
        ExplicitHeight = 13
      end
      object edtBusca: TcxTextEdit
        AlignWithMargins = True
        Left = 3
        Top = 28
        Align = alBottom
        Properties.OnChange = edtBuscaPropertiesChange
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
  object grdAtividade: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 58
    Width = 872
    Height = 456
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -2
    object grdAtividadeDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.NoDataToDisplayInfoText = '<Nenhum registro a ser exibido>'
      OptionsView.ScrollBars = ssVertical
      OptionsView.GroupByBox = False
    end
    object grdAtividadeDBCardView1: TcxGridDBCardView
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
    end
    object grdAtividadeDBCardView2: TcxGridDBCardView
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
      object grdAtividadeDBCardView2DBCardViewRow1: TcxGridDBCardViewRow
        Caption = 'Crian'#231'a'
        DataBinding.FieldName = 'nome'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow3: TcxGridDBCardViewRow
        Caption = 'Nascimento'
        DataBinding.FieldName = 'nascimento'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow5: TcxGridDBCardViewRow
        Caption = 'Entrada'
        DataBinding.FieldName = 'entrada'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow7: TcxGridDBCardViewRow
        Caption = 'Tempo'
        DataBinding.FieldName = 'tempo'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow2: TcxGridDBCardViewRow
        Caption = 'Previs'#227'o'
        DataBinding.FieldName = 'previsao'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow4: TcxGridDBCardViewRow
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'situacao'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        OnGetDisplayText = grdAtividadeDBCardView2DBCardViewRow4GetDisplayText
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardView2DBCardViewRow6: TcxGridDBCardViewRow
        Caption = 'Obs'
        DataBinding.FieldName = 'obs'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
    end
    object grdAtividadeDBLayoutView1: TcxGridDBLayoutView
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
      FilterBox.Visible = fvNever
      DataController.DataSource = dsPrincipal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ItemFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.RecordCaption.Visible = False
      OptionsView.ViewMode = lvvmMultiRow
      object grdAtividadeDBLayoutView1DBLayoutViewItem13: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'id'
        LayoutItem = cxGridLayoutItem1
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem1: TcxGridDBLayoutViewItem
        Caption = 'Obs'
        DataBinding.FieldName = 'obs'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem2
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem2: TcxGridDBLayoutViewItem
        Caption = 'Entrada'
        DataBinding.FieldName = 'entrada'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem3
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem3: TcxGridDBLayoutViewItem
        Caption = 'Valor'
        DataBinding.FieldName = 'valor'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem4
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem4: TcxGridDBLayoutViewItem
        Caption = 'Tempo'
        DataBinding.FieldName = 'tempo'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem5
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem5: TcxGridDBLayoutViewItem
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'situacao'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem6
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem6: TcxGridDBLayoutViewItem
        Caption = 'Previs'#227'o'
        DataBinding.FieldName = 'previsao'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem7
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem7: TcxGridDBLayoutViewItem
        Caption = 'Nome'
        DataBinding.FieldName = 'nome'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem8
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem8: TcxGridDBLayoutViewItem
        Caption = 'Nascimento'
        DataBinding.FieldName = 'nascimento'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem9
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem9: TcxGridDBLayoutViewItem
        Caption = 'Nome'
        DataBinding.FieldName = 'responsavelnome'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem10
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem10: TcxGridDBLayoutViewItem
        Caption = 'Documento'
        DataBinding.FieldName = 'responsaveldocumento'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem11
      end
      object grdAtividadeDBLayoutView1DBLayoutViewItem11: TcxGridDBLayoutViewItem
        Caption = 'Contato'
        DataBinding.FieldName = 'responsavelcontato'
        LayoutItem = grdAtividadeDBLayoutView1LayoutItem12
      end
      object grdAtividadeDBLayoutView1Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = 'Template Card'
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object cxGridLayoutItem1: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 0
      end
      object grdAtividadeDBLayoutView1LayoutItem2: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        CaptionOptions.Layout = clTop
        Index = 9
      end
      object grdAtividadeDBLayoutView1LayoutItem3: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 1
      end
      object grdAtividadeDBLayoutView1LayoutItem4: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 2
      end
      object grdAtividadeDBLayoutView1LayoutItem5: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 3
      end
      object grdAtividadeDBLayoutView1LayoutItem6: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 4
      end
      object grdAtividadeDBLayoutView1LayoutItem7: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 5
      end
      object grdAtividadeDBLayoutView1LayoutItem8: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 6
      end
      object grdAtividadeDBLayoutView1LayoutItem9: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView1Group_Root
        Index = 7
      end
      object grdAtividadeDBLayoutView1LayoutItem10: TcxGridLayoutItem
        Parent = dxLayoutGroup1
        Index = 0
      end
      object grdAtividadeDBLayoutView1LayoutItem11: TcxGridLayoutItem
        Parent = dxLayoutGroup1
        Index = 1
      end
      object grdAtividadeDBLayoutView1LayoutItem12: TcxGridLayoutItem
        Parent = dxLayoutGroup1
        Index = 2
      end
      object dxLayoutGroup1: TdxLayoutGroup
        Parent = grdAtividadeDBLayoutView1Group_Root
        CaptionOptions.Text = 'Respons'#225'vel'
        ButtonOptions.Buttons = <>
        Index = 8
      end
    end
    object grdAtividadeDBCardView: TcxGridDBCardView
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
      FilterBox.Visible = fvNever
      DataController.DataSource = dsPrincipal
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.RowFiltering = False
      OptionsCustomize.RowMoving = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CardIndent = 7
      OptionsView.CellAutoHeight = True
      OptionsView.ShowRowFilterButtons = sfbAlways
      object grdAtividadeDBCardViewDBCardViewRow1: TcxGridDBCardViewRow
        DataBinding.FieldName = 'id'
        Visible = False
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow3: TcxGridDBCardViewRow
        DataBinding.FieldName = 'entrada'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow4: TcxGridDBCardViewRow
        DataBinding.FieldName = 'valor'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow6: TcxGridDBCardViewRow
        DataBinding.FieldName = 'situacao'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow5: TcxGridDBCardViewRow
        DataBinding.FieldName = 'tempo'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow7: TcxGridDBCardViewRow
        DataBinding.FieldName = 'previsao'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow8: TcxGridDBCardViewRow
        DataBinding.FieldName = 'nome'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow9: TcxGridDBCardViewRow
        DataBinding.FieldName = 'nascimento'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow10: TcxGridDBCardViewRow
        DataBinding.FieldName = 'responsavelnome'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow11: TcxGridDBCardViewRow
        DataBinding.FieldName = 'responsaveldocumento'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRowobs: TcxGridDBCardViewRow
        DataBinding.FieldName = 'obs'
        Position.BeginsLayer = True
      end
      object grdAtividadeDBCardViewDBCardViewRow12: TcxGridDBCardViewRow
        DataBinding.FieldName = 'responsavelcontato'
        Position.BeginsLayer = False
      end
    end
    object grdAtividadeDBLayoutView2: TcxGridDBLayoutView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsPrincipal
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object grdAtividadeDBLayoutView2DBLayoutViewItem1: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'id'
        LayoutItem = cxGridLayoutItem2
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem2: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'obs'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem2
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem3: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'entrada'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem3
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem4: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'valor'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem4
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem5: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'tempo'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem5
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem6: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'situacao'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem6
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem7: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'previsao'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem7
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem8: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'nome'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem8
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem9: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'nascimento'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem9
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem10: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'responsavelnome'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem10
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem11: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'responsaveldocumento'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem11
      end
      object grdAtividadeDBLayoutView2DBLayoutViewItem12: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'responsavelcontato'
        LayoutItem = grdAtividadeDBLayoutView2LayoutItem12
      end
      object grdAtividadeDBLayoutView2Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object cxGridLayoutItem2: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 0
      end
      object grdAtividadeDBLayoutView2LayoutItem2: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 1
      end
      object grdAtividadeDBLayoutView2LayoutItem3: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 2
      end
      object grdAtividadeDBLayoutView2LayoutItem4: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 3
      end
      object grdAtividadeDBLayoutView2LayoutItem5: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 4
      end
      object grdAtividadeDBLayoutView2LayoutItem6: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 5
      end
      object grdAtividadeDBLayoutView2LayoutItem7: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 6
      end
      object grdAtividadeDBLayoutView2LayoutItem8: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 7
      end
      object grdAtividadeDBLayoutView2LayoutItem9: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 8
      end
      object grdAtividadeDBLayoutView2LayoutItem10: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 9
      end
      object grdAtividadeDBLayoutView2LayoutItem11: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 10
      end
      object grdAtividadeDBLayoutView2LayoutItem12: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView2Group_Root
        Index = 11
      end
    end
    object grdAtividadeDBLayoutView3: TcxGridDBLayoutView
      PopupMenu = menu
      OnDblClick = actVisualizarExecute
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
      FilterBox.Visible = fvNever
      DataController.DataSource = dsPrincipal
      DataController.KeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ExpandRecordOnDblClick = False
      OptionsBehavior.ItemHotTrack = False
      OptionsCustomize.ItemFiltering = False
      OptionsCustomize.RecordExpanding = True
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma atividade>'
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.CenterRecords = False
      OptionsView.RecordCaption.Visible = False
      OptionsView.RecordIndent = 5
      OptionsView.SeparatorWidth = 0
      OptionsView.SingleRecordStretch = srsClient
      OptionsView.ViewMode = lvvmSingleRow
      object grdAtividadeDBLayoutView3DBLayoutViewItem2: TcxGridDBLayoutViewItem
        Caption = 'Obs'
        DataBinding.FieldName = 'obs'
        PropertiesClassName = 'TcxMemoProperties'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem1
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem3: TcxGridDBLayoutViewItem
        Caption = 'Entrada'
        DataBinding.FieldName = 'entrada'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem2
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem4: TcxGridDBLayoutViewItem
        Caption = 'Valor'
        DataBinding.FieldName = 'valor'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem3
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem5: TcxGridDBLayoutViewItem
        Caption = 'Tempo'
        DataBinding.FieldName = 'tempo'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem4
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem6: TcxGridDBLayoutViewItem
        Caption = 'Situa'#231#227'o'
        DataBinding.FieldName = 'situacao'
        Visible = False
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem5
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem7: TcxGridDBLayoutViewItem
        Caption = 'Previs'#227'o'
        DataBinding.FieldName = 'previsao'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem6
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem14: TcxGridDBLayoutViewItem
        Caption = 'Nome'
        DataBinding.FieldName = 'nome'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem7
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem8: TcxGridDBLayoutViewItem
        Caption = 'Nascimento'
        DataBinding.FieldName = 'nascimento'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem8
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem9: TcxGridDBLayoutViewItem
        Caption = 'Nome'
        DataBinding.FieldName = 'responsavelnome'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem9
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem10: TcxGridDBLayoutViewItem
        Caption = 'Documento'
        DataBinding.FieldName = 'responsaveldocumento'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem10
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem11: TcxGridDBLayoutViewItem
        Caption = 'Contato'
        DataBinding.FieldName = 'responsavelcontato'
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem11
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringAddValueItems = False
        Options.FilteringFilteredItemsList = False
        Options.FilteringMRUItemsList = False
        Options.FilteringPopup = False
        Options.FilteringPopupMultiSelect = False
        Options.FilteringWithFindPanel = False
        Options.Focusing = False
        Options.ShowEditButtons = isebNever
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem12: TcxGridDBLayoutViewItem
        DataBinding.FieldName = 'foto'
        Visible = False
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem12
      end
      object grdAtividadeDBLayoutView3DBLayoutViewItem13: TcxGridDBLayoutViewItem
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Action = actFinalizar
            Default = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000F0F0F41000000000000000000000000000000000000
              0000000000000F0F0F4100000000000000000000000000000000000000000000
              0000000000001E1E1E813C3C3CFF1E1E1E810000000000000000000000000000
              00001E1E1E813C3C3CFF1E1E1E81000000000000000000000000000000000000
              00000F0F0F403C3C3CFF3C3C3CFF3C3C3CFF1E1E1E8100000000000000001E1E
              1E813C3C3CFF3C3C3CFF3C3C3CFF0F0F0F400000000000000000000000000000
              0000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E811E1E1E813C3C
              3CFF3C3C3CFF3C3C3CFF1E1E1E7E000000000000000000000000000000000000
              000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
              3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
              00000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C
              3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
              00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
              3CFF1E1E1E810000000000000000000000000000000000000000000000000000
              000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
              3CFF3C3C3CFF1E1E1E8100000000000000000000000000000000000000000000
              0000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E1E1E1E7E3C3C
              3CFF3C3C3CFF3C3C3CFF1E1E1E81000000000000000000000000000000000000
              00000F0F0F403C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E00000000000000001E1E
              1E7E3C3C3CFF3C3C3CFF3C3C3CFF0F0F0F400000000000000000000000000000
              0000000000001E1E1E7E3C3C3CFF1E1E1E7E0000000000000000000000000000
              00001E1E1E7E3C3C3CFF1E1E1E7E000000000000000000000000000000000000
              000000000000000000000F0F0F3E000000000000000000000000000000000000
              0000000000000F0F0F3E00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            Kind = bkGlyph
          end>
        LayoutItem = grdAtividadeDBLayoutView3LayoutItem13
        Options.ShowEditButtons = isebAlways
        IsCaptionAssigned = True
      end
      object grdAtividadeDBLayoutView3Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = 'Template Card'
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object grdAtividadeDBLayoutView3LayoutItem1: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        CaptionOptions.Layout = clTop
        SizeOptions.Height = 100
        SizeOptions.Width = 202
        Index = 8
      end
      object grdAtividadeDBLayoutView3LayoutItem2: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 3
      end
      object grdAtividadeDBLayoutView3LayoutItem3: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 4
      end
      object grdAtividadeDBLayoutView3LayoutItem4: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 5
      end
      object grdAtividadeDBLayoutView3LayoutItem5: TcxGridLayoutItem
        Index = -1
      end
      object grdAtividadeDBLayoutView3LayoutItem6: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 6
      end
      object grdAtividadeDBLayoutView3LayoutItem7: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 1
      end
      object grdAtividadeDBLayoutView3LayoutItem8: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        Index = 2
      end
      object grdAtividadeDBLayoutView3LayoutItem9: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group1
        Index = 0
      end
      object grdAtividadeDBLayoutView3LayoutItem10: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group1
        Index = 1
      end
      object grdAtividadeDBLayoutView3LayoutItem11: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group1
        Index = 2
      end
      object grdAtividadeDBLayoutView3Group1: TdxLayoutGroup
        Parent = grdAtividadeDBLayoutView3Group_Root
        CaptionOptions.Text = 'Respons'#225'vel'
        ButtonOptions.Buttons = <>
        Index = 7
      end
      object grdAtividadeDBLayoutView3LayoutItem12: TcxGridLayoutItem
        AlignHorz = ahClient
        CaptionOptions.AlignHorz = taCenter
        CaptionOptions.Visible = False
        SizeOptions.Height = 71
        Index = -1
      end
      object grdAtividadeDBLayoutView3LayoutItem13: TcxGridLayoutItem
        Parent = grdAtividadeDBLayoutView3Group_Root
        CaptionOptions.Visible = False
        SizeOptions.Height = 2
        SizeOptions.Width = 136
        Index = 0
      end
    end
    object grdAtividadeLevel1: TcxGridLevel
      Caption = 'grdAtividadeLevel1'
      GridView = grdAtividadeDBLayoutView3
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
      ImageIndex = 3
      OnExecute = actNovoExecute
    end
    object actFinalizar: TAction
      Caption = 'Encerrar atividade'
      ImageIndex = 5
      OnExecute = actFinalizarExecute
    end
    object actVisualizar: TAction
      Caption = 'Visualizar'
      ImageIndex = 4
      OnExecute = actVisualizarExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      ImageIndex = 7
      OnExecute = actImprimirExecute
    end
  end
  object uniPrincipal: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      
        'SELECT ATIVIDADES.ID, ATIVIDADES.OBS, ATIVIDADES.ENTRADA, ATIVID' +
        'ADES.VALOR, ATIVIDADES.TEMPO, ATIVIDADES.SITUACAO, ATIVIDADES.EN' +
        'TRADA + CAST(ATIVIDADES.TEMPO as INTERVAL) AS PREVISAO,'
      '       CRIANCAS.NOME, CRIANCAS.NASCIMENTO, CRIANCAS.FOTO,'
      
        '       RESPONSAVEIS.NOME AS RESPONSAVELNOME, RESPONSAVEIS.DOCUME' +
        'NTO AS RESPONSAVELDOCUMENTO, RESPONSAVEIS.CONTATO AS RESPONSAVEL' +
        'CONTATO,'
      '       '#39'X'#39' as BOTAO'
      '  FROM ATIVIDADES'
      '  JOIN CRIANCAS ON CRIANCAS.ID = ATIVIDADES.ID_CRIANCA'
      
        '  JOIN RESPONSAVEIS ON RESPONSAVEIS.ID = ATIVIDADES.ID_RESPONSAV' +
        'EL'
      ' WHERE ATIVIDADES.SITUACAO = 0'
      
        ' ORDER BY ATIVIDADES.ENTRADA + CAST(ATIVIDADES.TEMPO as INTERVAL' +
        ')')
    Active = True
    Filtered = True
    Left = 80
    Top = 72
    object uniPrincipalid: TGuidField
      FieldName = 'id'
      Required = True
      Size = 38
    end
    object uniPrincipalobs: TStringField
      FieldName = 'obs'
      Size = 1000
    end
    object uniPrincipalentrada: TTimeField
      FieldName = 'entrada'
    end
    object uniPrincipalvalor: TFloatField
      FieldName = 'valor'
    end
    object uniPrincipaltempo: TTimeField
      FieldName = 'tempo'
    end
    object uniPrincipalsituacao: TSmallintField
      FieldName = 'situacao'
    end
    object uniPrincipalprevisao: TTimeField
      FieldName = 'previsao'
      ReadOnly = True
    end
    object uniPrincipalnome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 100
    end
    object uniPrincipalnascimento: TDateTimeField
      FieldName = 'nascimento'
      ReadOnly = True
    end
    object uniPrincipalfoto: TBlobField
      FieldName = 'foto'
      ReadOnly = True
    end
    object uniPrincipalresponsavelnome: TStringField
      FieldName = 'responsavelnome'
      ReadOnly = True
      Size = 100
    end
    object uniPrincipalresponsaveldocumento: TStringField
      FieldName = 'responsaveldocumento'
      ReadOnly = True
      Size = 30
    end
    object uniPrincipalresponsavelcontato: TStringField
      FieldName = 'responsavelcontato'
      ReadOnly = True
      Size = 50
    end
    object uniPrincipalbotao: TMemoField
      FieldName = 'botao'
      ReadOnly = True
      BlobType = ftMemo
    end
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
    object Visualizar1: TMenuItem
      Action = actVisualizar
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Imprimir1: TMenuItem
      Action = actImprimir
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
    LoginPrompt = False
    Left = 304
    Top = 128
    EncryptedPassword = '8FFF90FF8CFF8BFF98FF8DFF9AFF8CFF'
  end
end
