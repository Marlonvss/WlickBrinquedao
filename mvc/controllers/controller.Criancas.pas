unit controller.Criancas;

interface

uses model.Criancas, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Criancas, dto.Criancas, assembler.Criancas, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerCriancas = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
  end;

implementation

function TControllerCriancas.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOUsuario;
end;

end.
