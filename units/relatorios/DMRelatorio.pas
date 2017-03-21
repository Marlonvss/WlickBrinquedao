unit DMRelatorio;

interface

uses
  System.SysUtils, System.Classes, ppDB, ppBands, ppCache, ppClass,
  ppDesignLayer, ppParameter, ppDBPipe, Data.DB, DBAccess, Uni, MemDS,
  UniProvider, PostgreSQLUniProvider, ppComm, ppRelatv, ppProd, ppReport,
  WLick.Types, Vcl.Forms, ppCtrls, ppPrnabl, ORM.Connection, ppStrtch, ppMemo,
  ppVar, raCodMod, ppModule, ppRichTx, viewMessageForm;

type
  TDMReport = class(TDataModule)
    qryFichaAtividade: TUniQuery;
    dsource: TUniDataSource;
    dbPipeline: TppDBPipeline;
    helpPG: TPostgreSQLUniProvider;
    reportFichaAtividade: TppReport;
    ppParameterList2: TppParameterList;
    ppDetailBand2: TppDetailBand;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBImage3: TppDBImage;
    ppDBImage4: TppDBImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBImage1: TppDBImage;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppVariable1: TppVariable;
    ppRichText1: TppRichText;
    ppRichText2: TppRichText;
    raCodeModule1: TraCodeModule;
    raProgramInfo1: TraProgramInfo;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    qryRelatorioGerencial: TUniQuery;
    reportRelatorioGerencial: TppReport;
    ppDetailBand1: TppDetailBand;
    ppDBImage6: TppDBImage;
    ppLine3: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBText3: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppRichText3: TppRichText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine4: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel10: TppLabel;
    ppLine5: TppLine;
  private
    { Private declarations }
    function PreparaQueryReport(aReportType: TReportType; aParametros: TArrayString): TppReport;
  public
    { Public declarations }
    class procedure PrintReport(aReportType: TReportType; aParametros: TArrayString);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDMReport.PreparaQueryReport(aReportType: TReportType; aParametros: TArrayString): TppReport;
var
  i: Integer;
begin
  case aReportType of
    trtFichaAtividade: begin
      dsource.DataSet := qryFichaAtividade;
      Result := reportFichaAtividade;
    end;
    trtRelatorioGerencial: begin
      dsource.DataSet := qryRelatorioGerencial;
      Result := reportRelatorioGerencial;
    end;
    else Result := nil;
  end;

  if Assigned(Result) then
  begin
    with TUniQuery(Self.dsource.DataSet) do
    begin
      Connection := ORM.Connection.GetInstance.DataBase;
      for i := Low(aParametros) to High(aParametros) do
        Params[i].AsString := aParametros[i];
    end;
  end;

end;

class procedure TDMReport.PrintReport(aReportType: TReportType; aParametros: TArrayString);
var
  vDMReport : TDMReport;
begin
  Application.CreateForm(TDMReport, vDMReport);
  try
    with vDMReport.PreparaQueryReport(aReportType, aParametros) do
    try
      Print;
    except
    end;
  finally
    vDMReport.Free;
  end;
end;

end.
