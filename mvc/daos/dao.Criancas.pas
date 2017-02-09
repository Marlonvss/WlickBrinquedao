unit dao.Criancas;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Criancas,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Criancas, WLick.ConstrutorSQL, dto.Criancas,
  mapper.Criancas;

type
  TDAOCriancas = class(TORMDAOBase)
  private
    function GetSQLBase(): ISQLConstructor;
    function GetAssemblerDefault: String;
  public
    function GetSequenceCodigo: String;
    procedure GetAllCriancas(var aListaCriancas: TObjectList<TDTOCriancas>);
  end;

implementation

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
    Select(mapper.Criancas.field_id, mapper.Criancas.field_id)
   .Select(mapper.Criancas.field_codigo, mapper.Criancas.field_codigo)
   .Select(mapper.Criancas.field_nome, mapper.Criancas.field_nome)
   .Select(mapper.Criancas.field_nascimento, mapper.Criancas.field_nascimento)
   .Select(mapper.Criancas.field_foto, mapper.Criancas.field_foto)
   .From(mapper.Criancas.tableName);
end;

end.
