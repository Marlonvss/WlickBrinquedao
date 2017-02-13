unit assembler.Criancas;

interface

uses SysUtils, ORM.dtoBase, ORM.modelBase, model.Criancas, Classes,
  mapper.Criancas, Uni, ORM.AssemblerBase, dto.Criancas, db, WLick.ClassHelper,
  WLick.Miscelania;

type
  TAssemblerCriancas = class(TORMAssemblerBase)
  public
    class function GetClone(const aModel: TORMModelBase): TORMModelBase; Overload; Override;
    class function GetClone(const aDTO: TORMDTOBase): TORMDTOBase; Overload; Override;
    class function ModelToDTO(const aModel: TORMModelBase): TORMDTOBase; Override;
    class function DTOToModel(const aDTO: TORMDTOBase): TORMModelBase; Override;
    class function QueryToModel(const aQuery: TUniQuery): TORMModelBase; Override;
  end;

implementation

class function TAssemblerCriancas.GetClone(const aModel: TORMModelBase): TORMModelBase;
begin
  Result := TCriancas.Create();
  TCriancas(Result).id := TCriancas(aModel).id;
  TCriancas(Result).codigo := TCriancas(aModel).codigo;
  TCriancas(Result).nome := TCriancas(aModel).nome;
  TCriancas(Result).nascimento := TCriancas(aModel).nascimento;
  TCriancas(Result).foto := TCriancas(aModel).foto;
end;

class function TAssemblerCriancas.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOCriancas.Create();
  TDTOCriancas(Result).id := TDTOCriancas(aDTO).id;
  TDTOCriancas(Result).codigo := TDTOCriancas(aDTO).codigo;
  TDTOCriancas(Result).nome := TDTOCriancas(aDTO).nome;
  TDTOCriancas(Result).nascimento := TDTOCriancas(aDTO).nascimento;
  TDTOCriancas(Result).foto := TDTOCriancas(aDTO).foto;
end;

class function TAssemblerCriancas.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOCriancas.Create();
  TDTOCriancas(Result).id := TCriancas(aModel).id;
  TDTOCriancas(Result).codigo := TCriancas(aModel).codigo;
  TDTOCriancas(Result).nome := TCriancas(aModel).nome;
  TDTOCriancas(Result).nascimento := TCriancas(aModel).nascimento;
  TDTOCriancas(Result).foto := TCriancas(aModel).Foto;
end;

class function TAssemblerCriancas.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TCriancas.Create();
  TCriancas(Result).id := TDTOCriancas(aDTO).id;
  TCriancas(Result).codigo := TDTOCriancas(aDTO).codigo;
  TCriancas(Result).nome := TDTOCriancas(aDTO).nome;
  TCriancas(Result).nascimento := TDTOCriancas(aDTO).nascimento;
  TCriancas(Result).foto := TDTOCriancas(aDTO).foto;
end;

class function TAssemblerCriancas.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TCriancas.Create();

  if Assigned(aQuery.FindField(mapper.Criancas.field_ID)) then
    TCriancas(Result).id := aQuery.FieldByName(mapper.Criancas.field_ID).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.Criancas.field_Codigo)) then
    TCriancas(Result).codigo := aQuery.FieldByName(mapper.Criancas.field_Codigo).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_Nome)) then
    TCriancas(Result).nome := aQuery.FieldByName(mapper.Criancas.field_Nome).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_Nascimento)) then
    TCriancas(Result).nascimento := aQuery.FieldByName(mapper.Criancas.field_Nascimento).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Criancas.field_Foto)) then
    TCriancas(Result).foto := aQuery.FieldByName(mapper.Criancas.field_Foto).AsString;

end;

initialization
  RegisterClass(TAssemblerCriancas);

end.
