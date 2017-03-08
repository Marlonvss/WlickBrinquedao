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
  ORM.fichaBase, ficha.Atividades, WLick.ClassHelper, mapper.Criancas,
  mapper.Responsaveis, enum.Atividades.Situacao, DMRelatorio, WLick.Types;


type
  TBrowserAtividadesEncerradas = class(TORMBrowserBase)
  private
    procedure EventImprimirClick(a_Sender: TObject);
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
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada+'+'+mapper.Atividades.tableName+'.'+mapper.Atividades.field_Tempo,'PREVISAO')
    .Select(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Saida)
    .Select('cast('+mapper.Atividades.tableName+'.'+mapper.Atividades.field_Saida+'-'+mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada+' as time)','TEMPOSERVICO')
    .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_nome)
    .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_nascimento)
    .Select(mapper.Responsaveis.tableName+'.'+mapper.Responsaveis.field_nome, 'RESPONSAVELNOME')
    .Select(mapper.Responsaveis.tableName+'.'+mapper.Responsaveis.field_documento, 'RESPONSAVELDOCUMENTO')
    .Select(mapper.Responsaveis.tableName+'.'+mapper.Responsaveis.field_contato, 'RESPONSAVELCONTATO')
    .Select(mapper.Responsaveis.tableName+'.'+mapper.Responsaveis.field_email, 'RESPONSAVELEMAIL')
    .From(mapper.Atividades.tableName)
    .Join(mapper.Criancas.tableName).&On(mapper.Criancas.tableName+'.'+mapper.Criancas.field_id, mapper.Atividades.tableName+'.'+mapper.Atividades.field_Id_Crianca)
    .Join(mapper.Responsaveis.tableName).&On(mapper.Responsaveis.tableName+'.'+mapper.Responsaveis.field_id, mapper.Atividades.tableName+'.'+mapper.Atividades.field_Id_Responsavel)
    .Where(mapper.Atividades.field_Situacao, Integer(enum.Atividades.Situacao.tsFinalizado).ToString())
    .OrderBy(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Entrada)
end;

procedure TBrowserAtividadesEncerradas.SetColumnsBrowser;
begin
  Self.ClearColumnsBrowser;

  Self.AddColumnBrowser(mapper.Atividades.field_ID, mapper.Atividades.field_ID_Caption).SetPK();
  Self.AddColumnBrowser(mapper.Criancas.field_nome, mapper.Criancas.field_nome_Caption);
  Self.AddColumnBrowser(mapper.Criancas.field_nascimento, mapper.Criancas.field_nascimento_Caption)
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
