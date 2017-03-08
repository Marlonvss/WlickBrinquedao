unit browser.Criancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  WLick.ConstrutorSQL, Vcl.ImgList, cxGraphics, cxClasses, dxBar, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ORM.Images, ORM.browserBase, ORM.DTOBase, DTO.Criancas, mapper.Criancas,
  ORM.fichaBase, ficha.Criancas, WLick.ClassHelper, controller.Criancas,
  viewMessageForm;

type
  TBrowserCriancas = class(TORMBrowserBase)
  private
    FController : TControllerCriancas;
  protected
    function GetSQLBrowser(): ISQLConstructor; override;
    procedure SetColumnsBrowser(); override;

    function CanDelete(): Boolean; override;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

    function GetCaption: String; override;
    function ClassDTO(): TORMDTOBaseClass; override;
    function ClassFicha(): TORMFichaBaseClass; override;
    function GetIDSelecionado(): TGuid; override;
  public
    { Public declarations }
  end;

implementation

{ TBrowserCriancas }

function TBrowserCriancas.GetCaption: String;
begin
  Result := 'Listagem de Crianças';
end;

function TBrowserCriancas.GetIDSelecionado: TGuid;
begin
  Result := uniBrowser.FieldByName(mapper.Criancas.field_ID).AsGuid;
end;

function TBrowserCriancas.CanDelete: Boolean;
var
  vMsg: WideString;
begin
  Result := FController.PodeRemoverCrianca(GetIDSelecionado(), vMsg);
  if not Result then
    TviewMessage.Send_Information(vMsg);
end;

function TBrowserCriancas.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOCriancas;
end;

function TBrowserCriancas.ClassFicha: TORMFichaBaseClass;
begin
  Result := TFichaCriancas;
end;

procedure TBrowserCriancas.CreateAllObjects;
begin
  inherited CreateAllObjects;
  FController := TControllerCriancas.Create;
end;

procedure TBrowserCriancas.DestroyAllObjects;
begin
  inherited DestroyAllObjects;
  FController.Free;
end;

function TBrowserCriancas.GetSQLBrowser: ISQLConstructor;
begin
  Result := TSQLConstructor.Create;
  Result
    .Select(mapper.Criancas.field_id)
    .Select(mapper.Criancas.field_codigo)
    .Select(mapper.Criancas.field_nome)
    .Select(mapper.Criancas.field_nascimento)
    .Select(mapper.Criancas.field_foto)
    .From(mapper.Criancas.tableName);
end;

procedure TBrowserCriancas.SetColumnsBrowser;
begin
  Self.ClearColumnsBrowser;

  Self.AddColumnBrowser(mapper.Criancas.field_ID, mapper.Criancas.field_ID_Caption).SetPK();

  Self.AddColumnBrowser(mapper.Criancas.field_codigo, mapper.Criancas.field_codigo_Caption)
    .SetOrder(TColumnOrder.coAsc);

  Self.AddColumnBrowser(mapper.Criancas.field_nome, mapper.Criancas.field_nome_Caption);

  Self.AddColumnBrowser(mapper.Criancas.field_nascimento, mapper.Criancas.field_nascimento_Caption)
    .SetDataType(dtDate);

end;

end.
