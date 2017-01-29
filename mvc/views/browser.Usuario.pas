unit browser.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  WLick.ConstrutorSQL, Vcl.ImgList, cxGraphics, cxClasses, dxBar, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ORM.Images, ORM.browserBase, ORM.DTOBase, DTO.Usuarios, mapper.Usuarios,
  ORM.fichaBase, ficha.Usuario, WLick.ClassHelper;

type
  TBrowserUsuario = class(TORMBrowserBase)
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

{ TBrowserUsuario }

function TBrowserUsuario.GetCaption: String;
begin
  Result := 'Browser de Usuários';
end;

function TBrowserUsuario.GetIDSelecionado: TGuid;
begin
  Result := uniBrowser.FieldByName(mapper.Usuarios.field_ID).AsGuid;
end;

function TBrowserUsuario.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOUsuario;
end;

function TBrowserUsuario.ClassFicha: TORMFichaBaseClass;
begin
  Result := TFichaUsuario;
end;

function TBrowserUsuario.GetSQLBrowser: ISQLConstructor;
begin
  Result := TSQLConstructor.Create;
  Result.Select(mapper.Usuarios.field_ID).Select(mapper.Usuarios.field_Login).Select(mapper.Usuarios.field_Senha).From(mapper.Usuarios.tableName);
end;

procedure TBrowserUsuario.SetColumnsBrowser;
begin
  Self.ClearColumnsBrowser;

  Self.AddColumnBrowser(mapper.Usuarios.field_ID, mapper.Usuarios.field_ID_Caption).SetPK();

  Self.AddColumnBrowser(mapper.Usuarios.field_Login, mapper.Usuarios.field_Login_Caption);

  Self.AddColumnBrowser(mapper.Usuarios.field_Senha, mapper.Usuarios.field_Senha_Caption);

end;

end.
