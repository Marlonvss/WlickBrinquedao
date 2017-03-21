unit assembler.Atividades;

interface

uses SysUtils, ORM.dtoBase, ORM.modelBase, model.Atividades, Classes,
  mapper.Atividades, Uni, ORM.AssemblerBase, dto.Atividades, db, WLick.ClassHelper,
  WLick.Miscelania;

type
  TAssemblerAtividades = class(TORMAssemblerBase)
  public
    class function GetClone(const aModel: TORMModelBase): TORMModelBase; Overload; Override;
    class function GetClone(const aDTO: TORMDTOBase): TORMDTOBase; Overload; Override;
    class function ModelToDTO(const aModel: TORMModelBase): TORMDTOBase; Override;
    class function DTOToModel(const aDTO: TORMDTOBase): TORMModelBase; Override;
    class function QueryToModel(const aQuery: TUniQuery): TORMModelBase; Override;
  end;

implementation

class function TAssemblerAtividades.GetClone(const aModel: TORMModelBase): TORMModelBase;
begin
  Result := TAtividades.Create();
  TAtividades(Result).id := TAtividades(aModel).id;
  TAtividades(Result).Crianca_Nome := TAtividades(aModel).Crianca_Nome;
  TAtividades(Result).Crianca_Nascimento := TAtividades(aModel).Crianca_Nascimento;
  TAtividades(Result).Crianca_Foto := TAtividades(aModel).Crianca_Foto;
  TAtividades(Result).Responsavel_Nome := TAtividades(aModel).Responsavel_Nome;
  TAtividades(Result).Responsavel_Documento := TAtividades(aModel).Responsavel_Documento;
  TAtividades(Result).Responsavel_Contato := TAtividades(aModel).Responsavel_Contato;
  TAtividades(Result).Responsavel_Email := TAtividades(aModel).Responsavel_Email;
  TAtividades(Result).Responsavel_Foto := TAtividades(aModel).Responsavel_Foto;
  TAtividades(Result).Id_Usuario := TAtividades(aModel).Id_Usuario;
  TAtividades(Result).Obs := TAtividades(aModel).Obs;
  TAtividades(Result).Entrada := TAtividades(aModel).Entrada;
  TAtividades(Result).Valor := TAtividades(aModel).Valor;
  TAtividades(Result).Tempo := TAtividades(aModel).Tempo;
  TAtividades(Result).Situacao := TAtividades(aModel).Situacao;
  TAtividades(Result).Saida := TAtividades(aModel).Saida;
  TAtividades(Result).ValorSaida := TAtividades(aModel).ValorSaida;
  TAtividades(Result).DataInsert := TAtividades(aModel).DataInsert;
end;

class function TAssemblerAtividades.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOAtividades.Create();
  TDTOAtividades(Result).id := TDTOAtividades(aDTO).id;
  TDTOAtividades(Result).Crianca_Nome := TDTOAtividades(aDTO).Crianca_Nome;
  TDTOAtividades(Result).Crianca_Nascimento := TDTOAtividades(aDTO).Crianca_Nascimento;
  TDTOAtividades(Result).Crianca_Foto := TDTOAtividades(aDTO).Crianca_Foto;
  TDTOAtividades(Result).Responsavel_Nome := TDTOAtividades(aDTO).Responsavel_Nome;
  TDTOAtividades(Result).Responsavel_Documento := TDTOAtividades(aDTO).Responsavel_Documento;
  TDTOAtividades(Result).Responsavel_Contato := TDTOAtividades(aDTO).Responsavel_Contato;
  TDTOAtividades(Result).Responsavel_Email := TDTOAtividades(aDTO).Responsavel_Email;
  TDTOAtividades(Result).Responsavel_Foto := TDTOAtividades(aDTO).Responsavel_Foto;
  TDTOAtividades(Result).Id_Usuario := TDTOAtividades(aDTO).Id_Usuario;
  TDTOAtividades(Result).Obs := TDTOAtividades(aDTO).Obs;
  TDTOAtividades(Result).Entrada := TDTOAtividades(aDTO).Entrada;
  TDTOAtividades(Result).Valor := TDTOAtividades(aDTO).Valor;
  TDTOAtividades(Result).Tempo := TDTOAtividades(aDTO).Tempo;
  TDTOAtividades(Result).Situacao := TDTOAtividades(aDTO).Situacao;
  TDTOAtividades(Result).Saida := TDTOAtividades(aDTO).Saida;
  TDTOAtividades(Result).ValorSaida := TDTOAtividades(aDTO).ValorSaida;
  TDTOAtividades(Result).DataInsert := TDTOAtividades(aDTO).DataInsert;
end;

class function TAssemblerAtividades.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOAtividades.Create();
  TDTOAtividades(Result).id := TAtividades(aModel).id;
  TDTOAtividades(Result).Crianca_Nome := TAtividades(aModel).Crianca_Nome;
  TDTOAtividades(Result).Crianca_Nascimento := TAtividades(aModel).Crianca_Nascimento;
  TDTOAtividades(Result).Crianca_Foto := TAtividades(aModel).Crianca_Foto;
  TDTOAtividades(Result).Responsavel_Nome := TAtividades(aModel).Responsavel_Nome;
  TDTOAtividades(Result).Responsavel_Documento := TAtividades(aModel).Responsavel_Documento;
  TDTOAtividades(Result).Responsavel_Contato := TAtividades(aModel).Responsavel_Contato;
  TDTOAtividades(Result).Responsavel_Email := TAtividades(aModel).Responsavel_Email;
  TDTOAtividades(Result).Responsavel_Foto := TAtividades(aModel).Responsavel_Foto;
  TDTOAtividades(Result).Id_Usuario := TAtividades(aModel).Id_Usuario;
  TDTOAtividades(Result).Obs := TAtividades(aModel).Obs;
  TDTOAtividades(Result).Entrada := TAtividades(aModel).Entrada;
  TDTOAtividades(Result).Valor := TAtividades(aModel).Valor;
  TDTOAtividades(Result).Tempo := TAtividades(aModel).Tempo;
  TDTOAtividades(Result).Situacao := TAtividades(aModel).Situacao;
  TDTOAtividades(Result).Saida := TAtividades(aModel).Saida;
  TDTOAtividades(Result).ValorSaida := TAtividades(aModel).ValorSaida;
  TDTOAtividades(Result).DataInsert := TAtividades(aModel).DataInsert;
end;

class function TAssemblerAtividades.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TAtividades.Create();
  TAtividades(Result).id := TDTOAtividades(aDTO).id;
  TAtividades(Result).Crianca_Nome := TDTOAtividades(aDTO).Crianca_Nome;
  TAtividades(Result).Crianca_Nascimento := TDTOAtividades(aDTO).Crianca_Nascimento;
  TAtividades(Result).Crianca_Foto := TDTOAtividades(aDTO).Crianca_Foto;
  TAtividades(Result).Responsavel_Nome := TDTOAtividades(aDTO).Responsavel_Nome;
  TAtividades(Result).Responsavel_Documento := TDTOAtividades(aDTO).Responsavel_Documento;
  TAtividades(Result).Responsavel_Contato := TDTOAtividades(aDTO).Responsavel_Contato;
  TAtividades(Result).Responsavel_Email := TDTOAtividades(aDTO).Responsavel_Email;
  TAtividades(Result).Responsavel_Foto := TDTOAtividades(aDTO).Responsavel_Foto;
  TAtividades(Result).Id_Usuario := TDTOAtividades(aDTO).Id_Usuario;
  TAtividades(Result).Obs := TDTOAtividades(aDTO).Obs;
  TAtividades(Result).Entrada:= TDTOAtividades(aDTO).Entrada;
  TAtividades(Result).Valor := TDTOAtividades(aDTO).Valor;
  TAtividades(Result).Tempo := TDTOAtividades(aDTO).Tempo;
  TAtividades(Result).Situacao := TDTOAtividades(aDTO).Situacao;
  TAtividades(Result).Saida := TDTOAtividades(aDTO).Saida;
  TAtividades(Result).ValorSaida := TDTOAtividades(aDTO).ValorSaida;
  TAtividades(Result).DataInsert := TDTOAtividades(aDTO).DataInsert;
end;

class function TAssemblerAtividades.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TAtividades.Create();

  if Assigned(aQuery.FindField(mapper.Atividades.field_ID)) then
    TAtividades(Result).id := aQuery.FieldByName(mapper.Atividades.field_ID).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.Atividades.field_CriancaNome)) then
    TAtividades(Result).Crianca_Nome := aQuery.FieldByName(mapper.Atividades.field_CriancaNome).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_CriancaNascimento)) then
    TAtividades(Result).Crianca_Nascimento := aQuery.FieldByName(mapper.Atividades.field_CriancaNascimento).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Atividades.field_CriancaFoto)) then
    TAtividades(Result).Crianca_Foto := aQuery.FieldByName(mapper.Atividades.field_CriancaFoto).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ResponsavelNome)) then
    TAtividades(Result).Responsavel_Nome := aQuery.FieldByName(mapper.Atividades.field_ResponsavelNome).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ResponsavelDocumento)) then
    TAtividades(Result).Responsavel_Documento := aQuery.FieldByName(mapper.Atividades.field_ResponsavelDocumento).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ResponsavelContato)) then
    TAtividades(Result).Responsavel_Contato := aQuery.FieldByName(mapper.Atividades.field_ResponsavelContato).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ResponsavelEmail)) then
    TAtividades(Result).Responsavel_Email := aQuery.FieldByName(mapper.Atividades.field_ResponsavelEmail).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ResponsavelFoto)) then
    TAtividades(Result).Responsavel_Foto := aQuery.FieldByName(mapper.Atividades.field_ResponsavelFoto).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Id_Usuario)) then
    TAtividades(Result).Id_Usuario := aQuery.FieldByName(mapper.Atividades.field_Id_Usuario).AsString.ToGUID;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Obs)) then
    TAtividades(Result).Obs := aQuery.FieldByName(mapper.Atividades.field_Obs).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Entrada)) then
    TAtividades(Result).Entrada:= aQuery.FieldByName(mapper.Atividades.field_Entrada).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Valor)) then
    TAtividades(Result).Valor := aQuery.FieldByName(mapper.Atividades.field_Valor).AsCurrency;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Tempo)) then
    TAtividades(Result).Tempo := aQuery.FieldByName(mapper.Atividades.field_Tempo).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Situacao)) then
    TAtividades(Result).Situacao := aQuery.FieldByName(mapper.Atividades.field_Situacao).AsInteger;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Saida)) then
    TAtividades(Result).Saida := aQuery.FieldByName(mapper.Atividades.field_Saida).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Atividades.field_ValorSaida)) then
    TAtividades(Result).ValorSaida := aQuery.FieldByName(mapper.Atividades.field_ValorSaida).AsCurrency;

  if Assigned(aQuery.FindField(mapper.Atividades.field_DataInsert)) then
    TAtividades(Result).DataInsert := aQuery.FieldByName(mapper.Atividades.field_DataInsert).AsDateTime;

end;

initialization
  RegisterClass(TAssemblerAtividades);

end.
