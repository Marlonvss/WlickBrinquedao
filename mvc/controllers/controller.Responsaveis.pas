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
    function GetAllByCriancaID(const aCriancaID: TGUID): TObjectList<TDTOResponsaveis>;
  end;

implementation

function TControllerResponsaveis.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOResponsaveis;
end;

function TControllerResponsaveis.GetAllByCriancaID(
  const aCriancaID: TGUID): TObjectList<TDTOResponsaveis>;
begin
  Result := GetDAO().GetAllByCriancaID(aCriancaID);
end;

function TControllerResponsaveis.GetDAO: TDAOResponsaveis;
begin
  Result := (FDAO as TDAOResponsaveis);
end;

end.
