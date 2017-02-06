unit browser.ValorTempo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  WLick.ConstrutorSQL, Vcl.ImgList, cxGraphics, cxClasses, dxBar, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ORM.Images, ORM.browserBase, ORM.DTOBase, DTO.ValorTempo, mapper.ValorTempo,
  ORM.fichaBase, ficha.ValorTempo, WLick.ClassHelper;


type
  TBrowserValorTempo = class(TORMBrowserBase)
  private
  protected
    function GetSQLBrowser(): ISQLConstructor; override;
    procedure SetColumnsBrowser(); override;

    function GetCaption: String; override;
    function ClassDTO(): TORMDTOBaseClass; override;
    function ClassFicha(): TORMFichaBaseClass; override;
    function GetIDSelecionado(): TGuid; override;
  public
    { Public declarations }
  end;

implementation

{ TBrowserValorTempo }

function TBrowserValorTempo.GetCaption: String;
begin
  Result := 'Valores x Tempo';
end;

function TBrowserValorTempo.GetIDSelecionado: TGuid;
begin
  Result := uniBrowser.FieldByName(mapper.ValorTempo.field_ID).AsGuid;
end;

function TBrowserValorTempo.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOValorTempo;
end;

function TBrowserValorTempo.ClassFicha: TORMFichaBaseClass;
begin
  Result := TFichaValorTempo;
end;

function TBrowserValorTempo.GetSQLBrowser: ISQLConstructor;
begin
  Result := Select(mapper.ValorTempo.field_ID)
    .Select(mapper.ValorTempo.field_Valor)
    .Select(mapper.ValorTempo.field_Tempo)
    .From(mapper.ValorTempo.tableName);
end;

procedure TBrowserValorTempo.SetColumnsBrowser;
begin
  Self.ClearColumnsBrowser;

  Self.AddColumnBrowser(mapper.ValorTempo.field_ID, mapper.ValorTempo.field_ID_Caption).SetPK();

  Self.AddColumnBrowser(mapper.ValorTempo.field_Valor, mapper.ValorTempo.field_Valor_Caption)
    .SetDataType(dtCurreny);

  Self.AddColumnBrowser(mapper.ValorTempo.field_Tempo, mapper.ValorTempo.field_Tempo_Caption)
    .SetDataType(dtInteger);

end;

end.
