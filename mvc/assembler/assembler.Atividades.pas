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
  TAtividades(Result).Id_Crianca := TAtividades(aModel).Id_Crianca;
  TAtividades(Result).Id_Responsavel := TAtividades(aModel).Id_Responsavel;
  TAtividades(Result).Id_Usuario := TAtividades(aModel).Id_Usuario;
  TAtividades(Result).Obs := TAtividades(aModel).Obs;
  TAtividades(Result).Entrada := TAtividades(aModel).Entrada;
  TAtividades(Result).Valor := TAtividades(aModel).Valor;
  TAtividades(Result).Tempo := TAtividades(aModel).Tempo;
  TAtividades(Result).Situacao := TAtividades(aModel).Situacao;
end;

class function TAssemblerAtividades.GetClone(const aDTO: TORMDTOBase): TORMDTOBase;
begin
  Result := TDTOAtividades.Create();
  TDTOAtividades(Result).id := TDTOAtividades(aDTO).id;
  TDTOAtividades(Result).Id_Crianca := TDTOAtividades(aDTO).Id_Crianca;
  TDTOAtividades(Result).Id_Responsavel := TDTOAtividades(aDTO).Id_Responsavel;
  TDTOAtividades(Result).Id_Usuario := TDTOAtividades(aDTO).Id_Usuario;
  TDTOAtividades(Result).Obs := TDTOAtividades(aDTO).Obs;
  TDTOAtividades(Result).Entrada := TDTOAtividades(aDTO).Entrada;
  TDTOAtividades(Result).Valor := TDTOAtividades(aDTO).Valor;
  TDTOAtividades(Result).Tempo := TDTOAtividades(aDTO).Tempo;
  TDTOAtividades(Result).Situacao := TDTOAtividades(aDTO).Situacao;
end;

class function TAssemblerAtividades.ModelToDTO(const aModel: TORMModelBase): TORMDTOBase;
begin
  Result := TDTOAtividades.Create();
  TDTOAtividades(Result).id := TAtividades(aModel).id;
  TDTOAtividades(Result).Id_Crianca := TAtividades(aModel).Id_Crianca;
  TDTOAtividades(Result).Id_Responsavel := TAtividades(aModel).Id_Responsavel;
  TDTOAtividades(Result).Id_Usuario := TAtividades(aModel).Id_Usuario;
  TDTOAtividades(Result).Obs := TMisc.BitmapFromBase64( TAtividades(aModel).Obs );
  TDTOAtividades(Result).Entrada := TAtividades(aModel).responsavelNome;
  TDTOAtividades(Result).Valor := TAtividades(aModel).Valor;
  TDTOAtividades(Result).Tempo := TAtividades(aModel).Tempo;
  TDTOAtividades(Result).Situacao := TAtividades(aModel).Situacao;
end;

class function TAssemblerAtividades.DTOToModel(const aDTO: TORMDTOBase): TORMModelBase;
begin
  Result := TAtividades.Create();
  TAtividades(Result).id := TDTOAtividades(aDTO).id;
  TAtividades(Result).Id_Crianca := TDTOAtividades(aDTO).Id_Crianca;
  TAtividades(Result).Id_Responsavel := TDTOAtividades(aDTO).Id_Responsavel;
  TAtividades(Result).Id_Usuario := TDTOAtividades(aDTO).Id_Usuario;
  TAtividades(Result).Obs := TMisc.Base64FromBitmap( TDTOAtividades(aDTO).Obs );
  TAtividades(Result).Entrada:= TDTOAtividades(aDTO).responsavelNome;
  TAtividades(Result).Valor := TDTOAtividades(aDTO).Valor;
  TAtividades(Result).Tempo := TDTOAtividades(aDTO).Tempo;
  TAtividades(Result).Situacao := TDTOAtividades(aDTO).Situacao;
end;

class function TAssemblerAtividades.QueryToModel(const aQuery: TUniQuery): TORMModelBase;
begin
  Result := TAtividades.Create();

  if Assigned(aQuery.FindField(mapper.Atividades.field_ID)) then
    TAtividades(Result).id := aQuery.FieldByName(mapper.Atividades.field_ID).AsString.ToGUID();

  if Assigned(aQuery.FindField(mapper.Atividades.field_Id_Crianca)) then
    TAtividades(Result).Id_Crianca := aQuery.FieldByName(mapper.Atividades.field_Id_Crianca).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Id_Responsavel)) then
    TAtividades(Result).Id_Responsavel := aQuery.FieldByName(mapper.Atividades.field_Id_Responsavel).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Id_Usuario)) then
    TAtividades(Result).Id_Usuario := aQuery.FieldByName(mapper.Atividades.field_Id_Usuario).AsDateTime;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Obs)) then
    TAtividades(Result).Obs := aQuery.FieldByName(mapper.Atividades.field_Obs).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Entrada)) then
    TAtividades(Result).Entrada:= aQuery.FieldByName(mapper.Atividades.field_Entrada).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Valor)) then
    TAtividades(Result).Valor := aQuery.FieldByName(mapper.Atividades.field_Valor).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Tempo)) then
    TAtividades(Result).Tempo := aQuery.FieldByName(mapper.Atividades.field_Tempo).AsString;

  if Assigned(aQuery.FindField(mapper.Atividades.field_Situacao)) then
    TAtividades(Result).Situacao := aQuery.FieldByName(mapper.Atividades.field_Situacao).AsString;

end;

initialization
  RegisterClass(TAssemblerAtividades);

end.
