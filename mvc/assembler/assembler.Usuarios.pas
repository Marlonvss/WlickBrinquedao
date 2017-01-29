unit assembler.Usuarios;

interface

uses SysUtils, ORM.dtoBase, ORM.modelBase, model.Usuarios, Classes,
  mapper.Usuarios, Uni, ORM.AssemblerBase, dto.Usuarios, db, WLick.ClassHelper;

type
  TAssemblerUsuarios = class(TORMAssemblerBase)
  public
    class function GetClone(const aModel: TORMModelBase): TORMModelBase; Overload; Override;
    class function GetClone(const aDTO: TORMDTOBase): TORMDTOBase; Overload; Override;
    class function ModelToDTO(const aModel: TORMModelBase): TORMDTOBase; Override;
    class function DTOToModel(const aDTO: TORMDTOBase): TORMModelBase; Override;
    class function QueryToModel(const aQuery: TUniQuery): TORMModelBase; Override;
  end;

implementation

class function TAssemblerUsuarios.GetClone(const aModel: TORMModelBase): TORMModelBase;
begin
  Result := TUsuario.Create();
  TUsuario(Result).id := TUsuario(aModel).id;
  TUsuario(Result).login := TUsuario(aModel).login;
  TUsuario(Result).senha := TUsuario(aModel).senha;
end;

class function TAssemblerUsuarios.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOUsuario.Create();
  TDTOUsuario(Result).id := TDTOUsuario(aDTO).id;
  TDTOUsuario(Result).login := TDTOUsuario(aDTO).login;
  TDTOUsuario(Result).senha := TDTOUsuario(aDTO).senha;
end;

class function TAssemblerUsuarios.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOUsuario.Create();
  TDTOUsuario(Result).id := TUsuario(aModel).id;
  TDTOUsuario(Result).login := TUsuario(aModel).login;
  TDTOUsuario(Result).senha := TUsuario(aModel).senha;
end;

class function TAssemblerUsuarios.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TUsuario.Create();
  TUsuario(Result).id := TDTOUsuario(aDTO).id;
  TUsuario(Result).login := TDTOUsuario(aDTO).login;
  TUsuario(Result).senha := TDTOUsuario(aDTO).senha;
end;

class function TAssemblerUsuarios.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TUsuario.Create();

  if Assigned(aQuery.FindField(mapper.Usuarios.field_ID)) then
    TUsuario(Result).id := aQuery.FieldByName(mapper.Usuarios.field_ID).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.Usuarios.field_Login)) then
    TUsuario(Result).login := aQuery.FieldByName(mapper.Usuarios.field_Login).AsString;

  if Assigned(aQuery.FindField(mapper.Usuarios.field_Senha)) then
    TUsuario(Result).senha := aQuery.FieldByName(mapper.Usuarios.field_Senha).AsString;

end;

initialization
  RegisterClass(TAssemblerUsuarios);

end.
