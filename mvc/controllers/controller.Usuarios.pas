unit controller.Usuarios;

interface

uses model.Usuarios, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Usuarios, dto.Usuarios, assembler.Usuarios, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerUsuario = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
  end;

implementation

function TControllerUsuario.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOUsuario;
end;

end.
