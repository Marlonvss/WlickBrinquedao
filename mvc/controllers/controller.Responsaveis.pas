unit controller.Responsaveis;

interface

uses model.Responsaveis, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Responsaveis, dto.Responsaveis, assembler.Responsaveis, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerResponsaveis = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function GetDAO(): TDAOResponsaveis;
  public
    procedure GetResponsaveisByCriancaID(const aIDCrianca: TGuid; var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
  end;

implementation

function TControllerResponsaveis.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOResponsaveis;
end;


function TControllerResponsaveis.GetDAO: TDAOResponsaveis;
begin
  Result := (FDAO as TDAOResponsaveis);
end;

procedure TControllerResponsaveis.GetResponsaveisByCriancaID(
  const aIDCrianca: TGuid;
  var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
begin
  GetDAO().GetAllByCriancaID(aIDCrianca, aListaResponsaveis);
end;

end.
