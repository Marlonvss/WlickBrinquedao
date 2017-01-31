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
  TCriancas(Result).responsavelNome := TCriancas(aModel).responsavelNome;
  TCriancas(Result).responsavelDocumento := TCriancas(aModel).responsavelDocumento;
  TCriancas(Result).responsavelContato := TCriancas(aModel).responsavelContato;
  TCriancas(Result).ResponsavelEmail := TCriancas(aModel).ResponsavelEmail;
  TCriancas(Result).responsavelFoto := TCriancas(aModel).responsavelFoto;
end;

class function TAssemblerCriancas.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOCriancas.Create();
  TDTOCriancas(Result).id := TDTOCriancas(aDTO).id;
  TDTOCriancas(Result).codigo := TDTOCriancas(aDTO).codigo;
  TDTOCriancas(Result).nome := TDTOCriancas(aDTO).nome;
  TDTOCriancas(Result).nascimento := TDTOCriancas(aDTO).nascimento;
  TDTOCriancas(Result).foto := TDTOCriancas(aDTO).foto;
  TDTOCriancas(Result).responsavelNome := TDTOCriancas(aDTO).responsavelNome;
  TDTOCriancas(Result).responsavelDocumento := TDTOCriancas(aDTO).responsavelDocumento;
  TDTOCriancas(Result).responsavelContato := TDTOCriancas(aDTO).responsavelContato;
  TDTOCriancas(Result).ResponsavelEmail := TDTOCriancas(aDTO).ResponsavelEmail;
  TDTOCriancas(Result).responsavelFoto := TDTOCriancas(aDTO).responsavelFoto;
end;

class function TAssemblerCriancas.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOCriancas.Create();
  TDTOCriancas(Result).id := TCriancas(aModel).id;
  TDTOCriancas(Result).codigo := TCriancas(aModel).codigo;
  TDTOCriancas(Result).nome := TCriancas(aModel).nome;
  TDTOCriancas(Result).nascimento := TCriancas(aModel).nascimento;
  TDTOCriancas(Result).foto := TMisc.BitmapFromBase64( TCriancas(aModel).Foto );
  TDTOCriancas(Result).responsavelNome := TCriancas(aModel).responsavelNome;
  TDTOCriancas(Result).responsavelDocumento := TCriancas(aModel).responsavelDocumento;
  TDTOCriancas(Result).responsavelContato := TCriancas(aModel).responsavelContato;
  TDTOCriancas(Result).ResponsavelEmail := TCriancas(aModel).ResponsavelEmail;
  TDTOCriancas(Result).responsavelFoto := TMisc.BitmapFromBase64( TCriancas(aModel).ResponsavelFoto );
end;

class function TAssemblerCriancas.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TCriancas.Create();
  TCriancas(Result).id := TDTOCriancas(aDTO).id;
  TCriancas(Result).codigo := TDTOCriancas(aDTO).codigo;
  TCriancas(Result).nome := TDTOCriancas(aDTO).nome;
  TCriancas(Result).nascimento := TDTOCriancas(aDTO).nascimento;
  TCriancas(Result).foto := TMisc.Base64FromBitmap( TDTOCriancas(aDTO).foto );
  TCriancas(Result).responsavelNome := TDTOCriancas(aDTO).responsavelNome;
  TCriancas(Result).responsavelDocumento := TDTOCriancas(aDTO).responsavelDocumento;
  TCriancas(Result).responsavelContato := TDTOCriancas(aDTO).responsavelContato;
  TCriancas(Result).ResponsavelEmail := TDTOCriancas(aDTO).ResponsavelEmail;
  TCriancas(Result).responsavelFoto := TMisc.Base64FromBitmap( TDTOCriancas(aDTO).responsavelFoto );
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

  if Assigned(aQuery.FindField(mapper.Criancas.field_ResponsavelNome)) then
    TCriancas(Result).responsavelNome := aQuery.FieldByName(mapper.Criancas.field_ResponsavelNome).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_ResponsavelDocumento)) then
    TCriancas(Result).responsavelDocumento := aQuery.FieldByName(mapper.Criancas.field_ResponsavelDocumento).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_ResponsavelContato)) then
    TCriancas(Result).responsavelContato := aQuery.FieldByName(mapper.Criancas.field_ResponsavelContato).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_responsavelEmail)) then
    TCriancas(Result).ResponsavelEmail := aQuery.FieldByName(mapper.Criancas.field_responsavelEmail).AsString;

  if Assigned(aQuery.FindField(mapper.Criancas.field_ResponsavelFoto)) then
    TCriancas(Result).responsavelFoto := aQuery.FieldByName(mapper.Criancas.field_ResponsavelFoto).AsString;
end;

initialization
  RegisterClass(TAssemblerCriancas);

end.
