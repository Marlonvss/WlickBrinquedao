unit enum.Usuarios.NivelAcesso;

interface

type
  TUsuarioNivelAcesso = (unaAdministrador, unaUsuario);

const
  NomeUsuarioNivelAcesso : Array [TUsuarioNivelAcesso] of String = (
    'Administrador',
    'Usuário'
  );

implementation

end.
