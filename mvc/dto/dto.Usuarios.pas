unit dto.Usuarios;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Usuarios;

type
  TDTOUsuario = class(TORMdtoBase)
    private
      FLogin: String;
      FSenha: String;
    published
      property Login: String read FLogin write FLogin;
      property Senha: String read FSenha write FSenha;
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
