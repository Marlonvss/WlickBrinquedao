unit dao.Criancas;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Criancas,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Criancas, WLick.ConstrutorSQL, dto.Criancas,
  mapper.Criancas, mapper.Atividades, WLick.Sessao;

type
  TDAOCriancas = class(TORMDAOBase)
  private
    function GetSQLBase(): ISQLConstructor;
    function GetAssemblerDefault: String;
  public
    function GetSequenceCodigo: String;
    procedure GetAllCriancas(var aListaCriancas: TObjectList<TDTOCriancas>);
    function CriancaPossuiAtividade(const aIDCrianca: TGuid): Boolean;
  end;

implementation

function TDAOCriancas.CriancaPossuiAtividade(const aIDCrianca: TGuid): Boolean;
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
begin
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase
      .Join(mapper.Atividades.tableName)
      .&On(mapper.Atividades.tableName+'.'+mapper.Atividades.field_Id_Crianca,mapper.Criancas.tableName+'.'+mapper.Criancas.field_id)
      .Where(mapper.Criancas.tableName+'.'+mapper.Criancas.field_id, aIDCrianca.ToQuotedString);

    OpenSQL(vSQL, vQry);
    Result := not vQry.IsEmpty;

  finally
    vQry.Free;
  end;
end;

procedure TDAOCriancas.GetAllCriancas(
  var aListaCriancas: TObjectList<TDTOCriancas>);
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TCriancas;
begin
  if not Assigned(aListaCriancas) then
    raise Exception.Create('TDAOCriancas.GetAllCriancas: aListaResponsaveis não foi instanciada!');

  aListaCriancas.Clear;
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase;

    OpenSQL(vSQL, vQry);
    vQry.First;
    with ORM.assemblerBase.TORMAssemblerBase.GetAssembler(GetAssemblerDefault) do
    try
      while not vQry.Eof do
      begin
        vModel := TCriancas(QueryToModel(vQry));
        aListaCriancas.Add(TDTOCriancas(ModelToDTO(vModel)));
        vModel.Free;
        vQry.Next;
      end;
    finally
      Free;
    end;

  finally
    vQry.Free;
  end;
end;

function TDAOCriancas.GetAssemblerDefault: String;
begin
  Result := 'TAssemblerCriancas';
end;

function TDAOCriancas.GetSequenceCodigo: String;
var
  vSQL: ISQLConstructor;
  vQry: TUniQuery;
begin
  vSQL := Select('LPAD(CAST(NEXTVAL(''CODIGOCRIANCA'') AS VARCHAR),6,''0'')','Codigo');

  vQry := TUniQuery.Create(nil);
  try
    Self.OpenSQL(vSQL, vQry);
    Result := vQry.FieldByName('Codigo').AsString;
  finally
    vQry.Free;
  end;
end;

function TDAOCriancas.GetSQLBase: ISQLConstructor;
begin
  Result :=
    Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_id)
   .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_codigo)
   .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_nome)
   .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_nascimento)
   .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_foto)
   .Select(mapper.Criancas.tableName+'.'+mapper.Criancas.field_datainsert)
   .From(mapper.Criancas.tableName)
end;

end.
