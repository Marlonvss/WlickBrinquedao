unit controller.Atividades;

interface

uses model.Atividades, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Atividades, dto.Atividades, assembler.Atividades, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerAtividades = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
  end;

implementation

function TControllerAtividades.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOUsuario;
end;

end.
