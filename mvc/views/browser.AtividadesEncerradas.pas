unit browser.AtividadesEncerradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  WLick.ConstrutorSQL, Vcl.ImgList, cxGraphics, cxClasses, dxBar, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ORM.Images, ORM.browserBase, ORM.DTOBase, DTO.Atividades, mapper.Atividades,
  ORM.fichaBase, ficha.Atividades, WLick.ClassHelper, enum.Atividades.Situacao,
  DMRelatorio, WLick.Types, cxBarEditItem, WLick.Sessao, WLick.Miscelania;


type
  TBrowserAtividadesEncerradas = class(TORMBrowserBase)
  private
    procedure EventImprimirClick(a_Sender: TObject);
    procedure EventDataChange(a_Sender: TObject);
    function GetDataFiltroBrowser: TDate;
  protected
    function GetSQLBrowser(): ISQLConstructor; override;
    procedure SetColumnsBrowser(); override;

    procedure CreateAllObjects(); override;

    function GetCaption: String; override;
    function ClassDTO(): TORMDTOBaseClass; override;
    function ClassFicha(): TORMFichaBaseClass; override;
    function GetIDSelecionado(): TGuid; override;
  public
    { Public declarations }
  end;

implementation

{ TBrowserAtividadesEncerradas }

function TBrowserAtividadesEncerradas.GetCaption: String;
begin
  Result := 'Atividades encerradas';
end;

function TBrowserAtividadesEncerradas.GetDataFiltroBrowser: TDate;
var
  vVar: Variant;
begin
  with GetEdit('Data') do
  begin
    vVar := EditValue;
    if vVar.IsNull then
    begin
      Result := WLick.Sessao.GetInstance.DataProcesso;
      EditValue := Result;
    end
    else
      Result := vVar.ToDate;
  end;
end;

function TBrowserAtividadesEncerradas.GetIDSelecionado: TGuid;
begin
  Result := uniBrowser.FieldByName(mapper.Atividades.field_ID).AsGuid;
end;

function TBrowserAtividadesEncerradas.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOAtividades;
end;

function TBrowserAtividadesEncerradas.ClassFicha: TORMFichaBaseClass;
begin
  Result := TFichaAtividades;
end;

procedure TBrowserAtividadesEncerradas.CreateAllObjects;
begin
  inherited CreateAllObjects;

  btnAdd.Visible := TdxBarItemVisible.ivNever;
  btnEdit.Visible := TdxBarItemVisible.ivNever;
  btnDelete.Visible := TdxBarItemVisible.ivNever;

  {Cria o bot�o de Impress�o}
  AddButton('imprimir', 'Imprimir', 7, EventImprimirClick);
  AddEdit('dataprocesso', 'Data', 'TcxDateEditProperties', EventDataChange);

end;

procedure TBrowserAtividadesEncerradas.EventDataChange(a_Sender: TObject);
begin
  Self.RefreshBrowser();
end;

procedure TBrowserAtividadesEncerradas.EventImprimirClick(a_Sender: TObject);
begin
  if not Self.GetIDSelecionado.IsNull then
    DMRelatorio.TDMReport.PrintReport(trtFichaAtividade,[Self.GetIDSelecionado.ToString]);
end;

function TBrowserAtividadesEncerradas.GetSQLBrowser: ISQLConstructor;
begin
  Result := Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_ID)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Obs)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada,'DATAENTRADA')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Valor)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Tempo)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada+'+ CAST('+mapper.Atividades.tableName+'.'+mapper.Atividades.field_Tempo+' AS INTERVAL)','PREVISAO')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Saida)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Saida+'- CAST('+mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada+' AS INTERVAL)','TEMPOSERVICO')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Criancanome)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Criancanascimento)
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Responsavelnome, 'RESPONSAVELNOME')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Responsaveldocumento, 'RESPONSAVELDOCUMENTO')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Responsavelcontato, 'RESPONSAVELCONTATO')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Responsavelemail, 'RESPONSAVELEMAIL')
    .From(mapper.Atividades.tableName)
    .Where(mapper.Atividades.field_Situacao, Integer(enum.Atividades.Situacao.tsFinalizado).ToString())
    .Where(mapper.Atividades.tableName+'.'+mapper.Atividades.field_DataInsert)
      .Equals(FormatDateTime('YYYY-MM-DD',GetDataFiltroBrowser).Quoted)
    .OrderBy(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada)
end;

procedure TBrowserAtividadesEncerradas.SetColumnsBrowser;
begin
  Self.ClearColumnsBrowser;

  Self.AddColumnBrowser(mapper.Atividades.field_ID, mapper.Atividades.field_ID_Caption).SetPK();
  Self.AddColumnBrowser(mapper.Atividades.field_CriancaNome, mapper.Atividades.field_CriancaNome_Caption);
  Self.AddColumnBrowser(mapper.Atividades.field_CriancaNascimento, mapper.Atividades.field_CriancaNascimento_Caption)
    .SetDataType(dtDate);
  Self.AddColumnBrowser(mapper.Atividades.field_Entrada, mapper.Atividades.field_Entrada_Caption)
    .SetDataType(dtTime);
  Self.AddColumnBrowser(mapper.Atividades.field_Saida, mapper.Atividades.field_Saida_Caption)
    .SetDataType(dtTime);
  Self.AddColumnBrowser('TEMPOSERVICO', 'Tempo')
    .SetDataType(dtTime);
  Self.AddColumnBrowser('RESPONSAVELNOME', 'Respons�vel');
  Self.AddColumnBrowser('RESPONSAVELDOCUMENTO', 'Documento');


end;

end.
