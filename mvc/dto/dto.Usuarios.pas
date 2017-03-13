unit dto.Usuarios;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Usuarios;

type
  TDTOUsuario = class(TORMdtoBase)
    private
      FLogin: String;
      FSenha: String;
      FNivelAcesso: Integer;
    published
      property Login: String read FLogin write FLogin;
      property Senha: String read FSenha write FSenha;
      property NivelAcesso: Integer read FNivelAcesso write FNivelAcesso;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOUsuario.AssemblerClass: String;
begin
  Result := 'TAssemblerUsuarios';
end;

end.
