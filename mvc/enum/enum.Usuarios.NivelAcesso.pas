unit enum.Usuarios.NivelAcesso;

interface

type
  TUsuarioNivelAcesso = (unaAdministrador, unaUsuario);

const
  NomeUsuarioNivelAcesso : Array [TUsuarioNivelAcesso] of String = (
    'Administrador',
    'Usu�rio'
  );

implementation

end.
