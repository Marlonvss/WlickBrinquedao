object DMReport: TDMReport
  OldCreateOrder = False
  Height = 411
  Width = 529
  object qryFichaAtividade: TUniQuery
    SQL.Strings = (
      
        'SELECT (SELECT VALORBINARIO FROM CONFIGURACOES WHERE CONFIGURACA' +
        'O = '#39'Logotipo'#39' LIMIT 1) AS LOGOTIPO, '
      
        '       ATIVIDADES.ID, ATIVIDADES.OBS, ATIVIDADES.ENTRADA, ATIVID' +
        'ADES.VALOR, ATIVIDADES.TEMPO, ATIVIDADES.SAIDA, ATIVIDADES.DATAI' +
        'NSERT,'
      
        '       ATIVIDADES.CRIANCA_NOME, ATIVIDADES.CRIANCA_NASCIMENTO, A' +
        'TIVIDADES.CRIANCA_FOTO,'
      
        '       ATIVIDADES.RESPONSAVEL_NOME, ATIVIDADES.RESPONSAVEL_DOCUM' +
        'ENTO, ATIVIDADES.RESPONSAVEL_CONTATO, ATIVIDADES.RESPONSAVEL_EMA' +
        'IL, ATIVIDADES.RESPONSAVEL_FOTO'
      '  FROM ATIVIDADES'
      ' WHERE ATIVIDADES.ID = :ATIVIDADE_ID')
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
    DataSet = qryRelatorioGerencial
    Left = 12
    Top = 64
  end
  object dbPipeline: TppDBPipeline
    DataSource = dsource
    UserName = 'dbPipeline'
    Left = 12
    Top = 108
  end
  object helpPG: TPostgreSQLUniProvider
    Left = 12
    Top = 12
  end
  object reportFichaAtividade: TppReport
    AutoStop = False
    DataPipeline = dbPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relat'#243'rio'
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
    Template.FileName = 'C:\Users\marlo\Desktop\123.rtm'
    Template.Format = ftASCII
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ShowEmailDialog = True
    LanguageID = 'Portuguese (Brazil)'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.CacheImages = False
    PDFSettings.EmbedFontOptions = []
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
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowCancelDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 260
    Top = 16
    Version = '17.02'
    mmColumnWidth = 197300
    DataPipelineName = 'dbPipeline'
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 115623
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 31485
        mmWidth = 35190
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        DataField = 'crianca_nome'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 38100
        mmTop = 31486
        mmWidth = 104775
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 37304
        mmWidth = 25665
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 43127
        mmWidth = 28046
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 48948
        mmWidth = 19050
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 54769
        mmWidth = 12700
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
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 60590
        mmWidth = 57415
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Utilizado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 101068
        mmTop = 66411
        mmWidth = 19046
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        DataField = 'crianca_nascimento'
        DataPipeline = dbPipeline
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 29369
        mmTop = 37307
        mmWidth = 113506
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText10'
        DataField = 'responsavel_nome'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 31750
        mmTop = 43127
        mmWidth = 111125
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        DataField = 'responsavel_contato'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 23285
        mmTop = 48947
        mmWidth = 119591
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText12'
        DataField = 'responsavel_email'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 16933
        mmTop = 54769
        mmWidth = 125942
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        DataField = 'responsavel_documento'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 5028
        mmLeft = 61648
        mmTop = 60590
        mmWidth = 81227
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage3: TppDBImage
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage3'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
        Border.Visible = True
        DataField = 'crianca_foto'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 32808
        mmLeft = 145521
        mmTop = 35983
        mmWidth = 47625
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
        Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
        Border.Visible = True
        DataField = 'responsavel_foto'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 32808
        mmLeft = 145521
        mmTop = 75406
        mmWidth = 47625
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
        mmLeft = 145521
        mmTop = 70644
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
        mmLeft = 145521
        mmTop = 31485
        mmWidth = 11642
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage1: TppDBImage
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Transparent = True
        DataField = 'logotipo'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 3970
        mmWidth = 190236
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 260
        mmLeft = 2910
        mmTop = 29897
        mmWidth = 190236
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 792
        mmLeft = 2911
        mmTop = 109273
        mmWidth = 190236
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Entrada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 66411
        mmWidth = 17992
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'saida'
        DataPipeline = dbPipeline
        DisplayFormat = 'hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 78580
        mmTop = 66411
        mmWidth = 21418
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Sa'#237'da:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 64291
        mmTop = 66411
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground1
      end
      object ppVariable1: TppVariable
        DesignLayer = ppDesignLayer2
        UserName = 'Variable1'
        BlankWhenZero = False
        CalcOrder = 0
        DataType = dtDateTime
        DisplayFormat = 'hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 121177
        mmTop = 66411
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground1
      end
      object ppRichText1: TppRichText
        DesignLayer = ppDesignLayer2
        UserName = 'RichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Caption = 'RichText1'
        ExportRTFAsBitmap = False
        MailMerge = True
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil Arial;}}'#13#10'\viewkind4\uc1\pard\b\fs24 Obs\' +
          'b0 : <dbtext>obs</dbtext>\f1\par'#13#10'}'#13#10#0
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 35719
        mmLeft = 2910
        mmTop = 72496
        mmWidth = 139965
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
      object ppRichText2: TppRichText
        DesignLayer = ppDesignLayer2
        UserName = 'RichText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        Caption = 'RichText2'
        ExportRTFAsBitmap = False
        MailMerge = True
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil Aria' +
          'l;}}'#13#10'\viewkind4\uc1\pard\f0\fs26 <dbtext displayformat='#39'dd/mm/y' +
          'yyy'#39'>datainsert</dbtext> <dbtext displayformat='#39'hh:nn'#39'>entrada</' +
          'dbtext>\par'#13#10'}'#13#10#0
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 21960
        mmTop = 66411
        mmWidth = 42069
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
    end
    object raCodeModule1: TraCodeModule
      object raProgramInfo1: TraProgramInfo
        raClassName = 'TraEventHandler'
        raProgram.ProgramName = 'Variable1OnCalc'
        raProgram.ProgramType = ttProcedure
        raProgram.Source = 
          'procedure Variable1OnCalc(var Value: Variant);'#13#10'begin'#13#10#13#10'  Value' +
          ' := dbPipeline['#39'saida'#39'] - dbPipeline['#39'entrada'#39']; '#13#10#13#10'end;'#13#10
        raProgram.ComponentName = 'Variable1'
        raProgram.EventName = 'OnCalc'
        raProgram.EventID = 33
        raProgram.CaretPos = (
          0
          0)
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
  object qryRelatorioGerencial: TUniQuery
    SQL.Strings = (
      
        'SELECT (SELECT VALORBINARIO FROM CONFIGURACOES WHERE CONFIGURACA' +
        'O = '#39'Logotipo'#39' LIMIT 1) AS LOGOTIPO, '
      
        '       ATIVIDADES.ENTRADA, ATIVIDADES.SAIDA, ATIVIDADES.VALORSAI' +
        'DA, ATIVIDADES.DATAINSERT,'
      
        '       ATIVIDADES.CRIANCA_NOME AS NOME_CRIANCA, ATIVIDADES.CRIAN' +
        'CA_NASCIMENTO,'
      
        '       ATIVIDADES.RESPONSAVEL_NOME AS NOME_RESPONSAVEL, ATIVIDAD' +
        'ES.RESPONSAVEL_DOCUMENTO'
      '  FROM ATIVIDADES'
      ' WHERE ATIVIDADES.DATAINSERT = :DTAInsert'
      '   AND ATIVIDADES.SITUACAO = 1')
    Left = 164
    Top = 76
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DTAInsert'
        Value = nil
      end>
  end
  object reportRelatorioGerencial: TppReport
    AutoStop = False
    DataPipeline = dbPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relat'#243'rio'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Users\marlo\Desktop\123.rtm'
    Template.Format = ftASCII
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ShowEmailDialog = True
    LanguageID = 'Portuguese (Brazil)'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.CacheImages = False
    PDFSettings.EmbedFontOptions = []
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
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowCancelDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 260
    Top = 76
    Version = '17.02'
    mmColumnWidth = 197300
    DataPipelineName = 'dbPipeline'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 49742
      mmPrintPosition = 0
      object ppDBImage6: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Transparent = True
        DataField = 'logotipo'
        DataPipeline = dbPipeline
        GraphicType = 'AutoDetect'
        DataPipelineName = 'dbPipeline'
        mmHeight = 25135
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1060
        mmLeft = 0
        mmTop = 26721
        mmWidth = 284300
        BandType = 0
        LayerName = BandLayer2
      end
      object ppRichText3: TppRichText
        DesignLayer = ppDesignLayer1
        UserName = 'RichText3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Caption = 'RichText3'
        ExportRTFAsBitmap = False
        MailMerge = True
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil Arial;}}'#13#10'{\colortbl ;\red0\green0\blue0;' +
          '}'#13#10'\viewkind4\uc1\pard\qc\cf1\fs28 Relat\'#39'f3rio de atividades\pa' +
          'r'#13#10'\f1\fs24 <dbtext displayformat='#39'dd/mm/yyyy'#39'>datainsert</dbtex' +
          't>\fs28\par'#13#10'}'#13#10#0
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 12700
        mmLeft = 0
        mmTop = 28575
        mmWidth = 284692
        BandType = 0
        LayerName = BandLayer2
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Nome da crian'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 44186
        mmWidth = 31485
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Caption = 'Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 79904
        mmTop = 44186
        mmWidth = 21960
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Respons'#225'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 104511
        mmTop = 44186
        mmWidth = 23813
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 179123
        mmTop = 44186
        mmWidth = 21167
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 219340
        mmTop = 44186
        mmWidth = 14552
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        Caption = 'Sa'#237'da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 241830
        mmTop = 44186
        mmWidth = 10848
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = 'Valor total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4762
        mmLeft = 266171
        mmTop = 44186
        mmWidth = 18521
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 259
        mmLeft = 0
        mmTop = 49481
        mmWidth = 284300
        BandType = 0
        LayerName = BandLayer2
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Color = 15132390
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'nome_crianca'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 528
        mmWidth = 78317
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'nome_responsavel'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 104511
        mmTop = 528
        mmWidth = 74083
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'crianca_nascimento'
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
        mmLeft = 79904
        mmTop = 528
        mmWidth = 21960
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'responsavel_documento'
        DataPipeline = dbPipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 179123
        mmTop = 528
        mmWidth = 39423
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'entrada'
        DataPipeline = dbPipeline
        DisplayFormat = 'h:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 219340
        mmTop = 528
        mmWidth = 20902
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'saida'
        DataPipeline = dbPipeline
        DisplayFormat = 'h:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 241830
        mmTop = 528
        mmWidth = 18782
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText14'
        DataField = 'valorsaida'
        DataPipeline = dbPipeline
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4763
        mmLeft = 261409
        mmTop = 528
        mmWidth = 23283
        BandType = 4
        LayerName = BandLayer2
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        DataField = 'valorsaida'
        DataPipeline = dbPipeline
        DisplayFormat = '$#,0.00;-$#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbPipeline'
        mmHeight = 4498
        mmLeft = 261409
        mmTop = 1323
        mmWidth = 23283
        BandType = 7
        LayerName = BandLayer2
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Total geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4762
        mmLeft = 237857
        mmTop = 1323
        mmWidth = 20109
        BandType = 7
        LayerName = BandLayer2
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        LayerName = BandLayer2
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'BandLayer2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
