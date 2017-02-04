unit assembler.ResponsaveisCriancas;

interface

uses SysUtils, ORM.dtoBase, ORM.modelBase, model.ResponsaveisCriancas, Classes,
  mapper.ResponsaveisCriancas, Uni, ORM.AssemblerBase, dto.ResponsaveisCriancas, db, WLick.ClassHelper,
  WLick.Miscelania;

type
  TAssemblerResponsaveisCriancas = class(TORMAssemblerBase)
  public
    class function GetClone(const aModel: TORMModelBase): TORMModelBase; Overload; Override;
    class function GetClone(const aDTO: TORMDTOBase): TORMDTOBase; Overload; Override;
    class function ModelToDTO(const aModel: TORMModelBase): TORMDTOBase; Override;
    class function DTOToModel(const aDTO: TORMDTOBase): TORMModelBase; Override;
    class function QueryToModel(const aQuery: TUniQuery): TORMModelBase; Override;
  end;

implementation

class function TAssemblerResponsaveisCriancas.GetClone(const aModel: TORMModelBase): TORMModelBase;
begin
  Result := TResponsaveisCriancas.Create();
  TResponsaveisCriancas(Result).id_responsavel := TResponsaveisCriancas(aModel).id_responsavel;
  TResponsaveisCriancas(Result).id_crianca := TResponsaveisCriancas(aModel).id_crianca;
end;

class function TAssemblerResponsaveisCriancas.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOResponsaveisCriancas.Create();
  TDTOResponsaveisCriancas(Result).id_responsavel := TDTOResponsaveisCriancas(aDTO).id_responsavel;
  TDTOResponsaveisCriancas(Result).id_crianca := TDTOResponsaveisCriancas(aDTO).id_crianca;
end;

class function TAssemblerResponsaveisCriancas.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOResponsaveisCriancas.Create();
  TDTOResponsaveisCriancas(Result).id_responsavel := TResponsaveisCriancas(aModel).id_responsavel;
  TDTOResponsaveisCriancas(Result).id_crianca := TResponsaveisCriancas(aModel).id_crianca;
end;

class function TAssemblerResponsaveisCriancas.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TResponsaveisCriancas.Create();
  TResponsaveisCriancas(Result).id_responsavel := TDTOResponsaveisCriancas(aDTO).id_responsavel;
  TResponsaveisCriancas(Result).id_crianca := TDTOResponsaveisCriancas(aDTO).id_crianca;
end;

class function TAssemblerResponsaveisCriancas.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TResponsaveisCriancas.Create();

  if Assigned(aQuery.FindField(mapper.ResponsaveisCriancas.field_ID_responsavel)) then
    TResponsaveisCriancas(Result).id_responsavel := aQuery.FieldByName(mapper.ResponsaveisCriancas.field_id_responsavel).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.ResponsaveisCriancas.field_ID_Crianca)) then
    TResponsaveisCriancas(Result).id_crianca := aQuery.FieldByName(mapper.ResponsaveisCriancas.field_id_crianca).AsString.ToGUID();

end;

initialization
  RegisterClass(TAssemblerResponsaveisCriancas);

end.
