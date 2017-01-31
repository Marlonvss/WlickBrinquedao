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
    function GetDAO(): TDAOUsuario;
  public
    procedure GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
  end;

implementation

function TControllerUsuario.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOUsuario;
end;

function TControllerUsuario.GetDAO: TDAOUsuario;
begin
  Result := (FDAO as TDAOUsuario);
end;

procedure TControllerUsuario.GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
begin
  if Assigned(aDTO) then
    GetDAO().GetUsuarioByLoginSenha(aDTO);
end;

end.
