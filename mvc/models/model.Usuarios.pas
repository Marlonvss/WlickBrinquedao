unit model.Usuarios;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Usuarios;

type

  [TORMTableName(mapper.Usuarios.TableName)]
  TUsuario = class(TORMModelBase)
  private

    FID: TGuid;
    FLogin: String;
    FSenha: String;

  published

    [TORMFieldCRUD(mapper.Usuarios.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Usuarios.field_Login)]
    property Login: String read FLogin write FLogin;

    [TORMFieldCRUD(mapper.Usuarios.field_Senha)]
    property Senha: String read FSenha write FSenha;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TUsuario }

function TUsuario.AssemblerClass: String;
begin
  Result := 'TAssemblerUsuarios';
end;

end.
