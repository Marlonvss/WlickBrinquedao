unit dao.Responsaveis;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Responsaveis,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Responsaveis, dto.Responsaveis,
  WLick.ConstrutorSQL, mapper.Responsaveis, mapper.Criancas,
  mapper.ResponsaveisCriancas;

type
  TDAOResponsaveis = class(TORMDAOBase)
  private
    function GetSQLBase(): ISQLConstructor;
  public
    function GetAllByCriancaID(const aCriancaID: TGUID): TObjectList<TDTOResponsaveis>;
  end;

implementation

{ TDAOResponsaveis }

function TDAOResponsaveis.GetAllByCriancaID(
  const aCriancaID: TGUID): TObjectList<TDTOResponsaveis>;
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TResponsaveis;
begin
  Result := TObjectList<TDTOResponsaveis>.Create();

  vQry := TUniQuery.Create(nil);
  try
    vSQL :=
      Select(mapper.Responsaveis.field_id, mapper.Responsaveis.field_id)
     .Select(mapper.Responsaveis.field_nome, mapper.Responsaveis.field_nome)
     .Select(mapper.Responsaveis.field_documento, mapper.Responsaveis.field_documento)
     .Select(mapper.Responsaveis.field_contato, mapper.Responsaveis.field_contato)
     .Select(mapper.Responsaveis.field_email, mapper.Responsaveis.field_email)
     .Select(mapper.Responsaveis.field_foto, mapper.Responsaveis.field_foto)
     .From(mapper.Responsaveis.tableName)
     .Join(mapper.ResponsaveisCriancas.tableName)
     .&On(mapper.ResponsaveisCriancas.field_id_responsavel, mapper.Responsaveis.field_id)
     .Where(mapper.ResponsaveisCriancas.field_id_crianca, aCriancaID.ToQuotedString);

    OpenSQL(vSQL, vQry);
    vQry.First;
    with ORM.assemblerBase.TORMAssemblerBase.GetAssembler('TAssemblerResponsaveis') do
    try
      while not vQry.Eof do
      begin
        vModel := TResponsaveis(QueryToModel(vQry));
        Result.Add(TDTOResponsaveis(ModelToDTO(vModel)));
        vQry.Next;
      end;
    finally
      Free;
    end;

  finally
    vQry.Free;
  end;
end;

function TDAOResponsaveis.GetSQLBase: ISQLConstructor;
begin

end;

end.
