unit dao.Usuarios;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Usuarios,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Usuarios, dto.Usuarios, WLick.ConstrutorSQL,
  mapper.Usuarios;

type
  TDAOUsuario = class(TORMDAOBase)
  public
    procedure GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
  end;

implementation

{ TDAOUsuario }

procedure TDAOUsuario.GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
var
  vSQL: ISQLConstructor;
  vModel: TUsuario;
  vQry: TUniQuery;
begin
  with ORM.assemblerBase.TORMAssemblerBase.GetAssembler(aDTO.AssemblerClass) do
  try

    { Monta o SQL }
    vModel := TUsuario(DTOToModel(aDTO));
    vSQL := Select('*')
      .From(mapper.Usuarios.tableName)
      .Where(mapper.Usuarios.field_Login, vModel.Login.Quoted)
      .Where(mapper.Usuarios.field_Senha, vModel.Senha.Quoted);
    FreeAndNil(vModel);

    vQry := TUniQuery.Create(nil);
    try
      OpenSQL(vSQL,vQry);

      FreeAndNil(aDTO);
      if not vQry.IsEmpty then
      begin
        vModel := TUsuario(QueryToModel(vQry));
        aDTO := TDTOUsuario(ModelToDTO(vModel));
        vModel.Free;
      end;
    finally
      vQry.Free;
    end;
  finally
    Free;
  end;
end;

end.
