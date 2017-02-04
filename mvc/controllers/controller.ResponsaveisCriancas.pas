unit controller.ResponsaveisCriancas;

interface

uses model.ResponsaveisCriancas, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.ResponsaveisCriancas, dto.ResponsaveisCriancas, assembler.ResponsaveisCriancas, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerResponsaveisCriancas = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function GetDAO(): TDAOResponsaveisCriancas;
  public

  end;

implementation

function TControllerResponsaveisCriancas.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOResponsaveisCriancas;
end;

function TControllerResponsaveisCriancas.GetDAO: TDAOResponsaveisCriancas;
begin
  Result := (FDAO as TDAOResponsaveisCriancas);
end;

end.
