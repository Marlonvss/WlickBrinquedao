object DMReport: TDMReport
  OldCreateOrder = False
  Height = 411
  Width = 529
  object help: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'brinquedao'
    Username = 'postgres'
    Server = '127.0.0.1'
    Connected = True
    Left = 48
    Top = 12
    EncryptedPassword = '8FFF90FF8CFF8BFF98FF8DFF9AFF8CFF'
  end
  object qryFichaAtividade: TUniQuery
    Connection = help
    SQL.Strings = (
      
        'SELECT ATIVIDADES.ID, ATIVIDADES.OBS, ATIVIDADES.ENTRADA, ATIVID' +
        'ADES.VALOR, ATIVIDADES.TEMPO, ATIVIDADES.SITUACAO, ATIVIDADES.EN' +
        'TRADA + ATIVIDADES.TEMPO AS PREVISAO,'
      '       CRIANCAS.NOME, CRIANCAS.NASCIMENTO, CRIANCAS.FOTO,'
      
        '       RESPONSAVEIS.NOME AS RESPONSAVELNOME, RESPONSAVEIS.DOCUME' +
        'NTO AS RESPONSAVELDOCUMENTO, RESPONSAVEIS.CONTATO AS RESPONSAVEL' +
        'CONTATO, RESPONSAVEIS.EMAIL AS RESPONSAVELEMAIL, RESPONSAVEIS.FO' +
        'TO AS RESPONSAVELFOTO'
      '  FROM ATIVIDADES'
      '  JOIN CRIANCAS ON CRIANCAS.ID = ATIVIDADES.ID_CRIANCA'
      
        '  JOIN RESPONSAVEIS ON RESPONSAVEIS.ID = ATIVIDADES.ID_RESPONSAV' +
        'EL'
      ' WHERE ATIVIDADES.ID = :ATIVIDADE_ID')
    Active = True
    Left = 164
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ATIVIDADE_ID'
        Value = nil
      end>
  end
  object dsource: TUniDataSource
    DataSet = qryFichaAtividade
    Left = 12
    Top = 64
  end
  object dbPipeline: TppDBPipeline
    DataSource = dsource
    UserName = 'dbPipeline'
    Left = 12
    Top = 108
    object dbPipelineppField1: TppField
      FieldAlias = 'id'
      FieldName = 'id'
      FieldLength = 38
      DataType = dtGUID
      DisplayWidth = 38
      Position = 0
    end
    object dbPipelineppField2: TppField
      FieldAlias = 'obs'
      FieldName = 'obs'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 1
    end
    object dbPipelineppField3: TppField
      FieldAlias = 'entrada'
      FieldName = 'entrada'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object dbPipelineppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'valor'
      FieldName = 'valor'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object dbPipelineppField5: TppField
      FieldAlias = 'tempo'
      FieldName = 'tempo'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 4
    end
    object dbPipelineppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'situacao'
      FieldName = 'situacao'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object dbPipelineppField7: TppField
      FieldAlias = 'previsao'
      FieldName = 'previsao'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object dbPipelineppField8: TppField
      FieldAlias = 'nome'
      FieldName = 'nome'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object dbPipelineppField9: TppField
      FieldAlias = 'nascimento'
      FieldName = 'nascimento'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object dbPipelineppField10: TppField
      FieldAlias = 'foto'
      FieldName = 'foto'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbPipelineppField11: TppField
      FieldAlias = 'responsavelnome'
      FieldName = 'responsavelnome'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object dbPipelineppField12: TppField
      FieldAlias = 'responsaveldocumento'
      FieldName = 'responsaveldocumento'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object dbPipelineppField13: TppField
      FieldAlias = 'responsavelcontato'
      FieldName = 'responsavelcontato'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object dbPipelineppField14: TppField
      FieldAlias = 'responsavelemail'
      FieldName = 'responsavelemail'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object dbPipelineppField15: TppField
      FieldAlias = 'responsavelfoto'
      FieldName = 'responsavelfoto'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 14
      Searchable = False
      Sortable = False
    end
  end
  object helpPG: TPostgreSQLUniProvider
    Left = 12
    Top = 12
  end
  object reportFichaAtividade: TppReport
    AutoStop = False
    DataPipeline = dbPipeline
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 212
    Top = 16
    Version = '17.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbPipeline'
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 92340
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Nome do cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 2910
        mmTop = 23548
        mmWidth = 35190
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        DataField = 'nome'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 39952
        mmTop = 23548
        mmWidth = 113256
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 28840
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Respons'#225'vel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 34131
        mmWidth = 28840
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 2910
        mmTop = 39423
        mmWidth = 21167
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 44715
        mmWidth = 15081
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Documento do respons'#225'vel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 50006
        mmWidth = 54769
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Tempo utilizado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 2910
        mmTop = 55298
        mmWidth = 35190
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Observa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 2910
        mmTop = 60590
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        DataField = 'nascimento'
        DataPipeline = dbPipeline
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 32279
        mmTop = 28840
        mmWidth = 120907
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText10'
        DataField = 'responsavelnome'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 33867
        mmTop = 34131
        mmWidth = 119342
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        DataField = 'responsavelcontato'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 25665
        mmTop = 39423
        mmWidth = 127544
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText12'
        DataField = 'responsavelemail'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 21167
        mmTop = 44715
        mmWidth = 132042
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        DataField = 'responsaveldocumento'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 60590
        mmTop = 50006
        mmWidth = 92619
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        DataField = 'entrada'
        DataPipeline = dbPipeline
        DisplayFormat = 'h:nn:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 60590
        mmTop = 55298
        mmWidth = 92596
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBMemo2: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'obs'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 23548
        mmLeft = 2910
        mmTop = 65881
        mmWidth = 150307
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBImage3: TppDBImage
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage3'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'foto'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 32808
        mmLeft = 156104
        mmTop = 16669
        mmWidth = 35190
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage4: TppDBImage
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage4'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'responsavelfoto'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 32808
        mmLeft = 156104
        mmTop = 56621
        mmWidth = 35190
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label20'
        Caption = 'Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 52123
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label101'
        Caption = 'Crian'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 12171
        mmWidth = 11642
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label22'
        Caption = 'ESPACO PARA LOGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 36
        Font.Style = []
        Transparent = True
        mmHeight = 14553
        mmLeft = 4763
        mmTop = 2910
        mmWidth = 130969
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
