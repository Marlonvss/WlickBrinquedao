unit assembler.Responsaveis;

interface

uses SysUtils, ORM.dtoBase, ORM.modelBase, model.Responsaveis, Classes,
  mapper.Responsaveis, Uni, ORM.AssemblerBase, dto.Responsaveis, db, WLick.ClassHelper,
  WLick.Miscelania;

type
  TAssemblerResponsaveis = class(TORMAssemblerBase)
  public
    class function GetClone(const aModel: TORMModelBase): TORMModelBase; Overload; Override;
    class function GetClone(const aDTO: TORMDTOBase): TORMDTOBase; Overload; Override;
    class function ModelToDTO(const aModel: TORMModelBase): TORMDTOBase; Override;
    class function DTOToModel(const aDTO: TORMDTOBase): TORMModelBase; Override;
    class function QueryToModel(const aQuery: TUniQuery): TORMModelBase; Override;
  end;

implementation

class function TAssemblerResponsaveis.GetClone(const aModel: TORMModelBase): TORMModelBase;
begin
  Result := TResponsaveis.Create();
  TResponsaveis(Result).id := TResponsaveis(aModel).id;
  TResponsaveis(Result).documento := TResponsaveis(aModel).documento;
  TResponsaveis(Result).nome := TResponsaveis(aModel).nome;
  TResponsaveis(Result).contato := TResponsaveis(aModel).contato;
//  TResponsaveis(Result).foto := TResponsaveis(aModel).foto;
end;

class function TAssemblerResponsaveis.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOResponsaveis.Create();
  TDTOResponsaveis(Result).id := TDTOResponsaveis(aDTO).id;
  TDTOResponsaveis(Result).documento := TDTOResponsaveis(aDTO).documento;
  TDTOResponsaveis(Result).nome := TDTOResponsaveis(aDTO).nome;
  TDTOResponsaveis(Result).contato := TDTOResponsaveis(aDTO).contato;
//  TDTOResponsaveis(Result).foto := TDTOResponsaveis(aDTO).foto;
end;

class function TAssemblerResponsaveis.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOResponsaveis.Create();
  TDTOResponsaveis(Result).id := TResponsaveis(aModel).id;
  TDTOResponsaveis(Result).documento := TResponsaveis(aModel).documento;
  TDTOResponsaveis(Result).nome := TResponsaveis(aModel).nome;
  TDTOResponsaveis(Result).contato := TResponsaveis(aModel).contato;
//  TDTOResponsaveis(Result).foto := TMisc.BitmapFromBase64( TResponsaveis(aModel).Foto );
end;

class function TAssemblerResponsaveis.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TResponsaveis.Create();
  TResponsaveis(Result).id := TDTOResponsaveis(aDTO).id;
  TResponsaveis(Result).documento := TDTOResponsaveis(aDTO).documento;
  TResponsaveis(Result).nome := TDTOResponsaveis(aDTO).nome;
  TResponsaveis(Result).contato := TDTOResponsaveis(aDTO).contato;
//  TResponsaveis(Result).foto := TMisc.Base64FromBitmap( TDTOResponsaveis(aDTO).foto );
end;

class function TAssemblerResponsaveis.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TResponsaveis.Create();

  if Assigned(aQuery.FindField(mapper.Responsaveis.field_ID)) then
    TResponsaveis(Result).id := aQuery.FieldByName(mapper.Responsaveis.field_ID).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.Responsaveis.field_Documento)) then
    TResponsaveis(Result).documento := aQuery.FieldByName(mapper.Responsaveis.field_Documento).AsString;

  if Assigned(aQuery.FindField(mapper.Responsaveis.field_Nome)) then
    TResponsaveis(Result).nome := aQuery.FieldByName(mapper.Responsaveis.field_Nome).AsString;

  if Assigned(aQuery.FindField(mapper.Responsaveis.field_Contato)) then
    TResponsaveis(Result).contato := aQuery.FieldByName(mapper.Responsaveis.field_Contato).AsString;

//  if Assigned(aQuery.FindField(mapper.Responsaveis.field_Foto)) then
//    TResponsaveis(Result).foto := aQuery.FieldByName(mapper.Responsaveis.field_Foto).AsString;

end;

initialization
  RegisterClass(TAssemblerResponsaveis);

end.
