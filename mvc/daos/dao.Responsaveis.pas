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
    function GetAssemblerDefault: String;
  public
    procedure GetAllByCriancaID(const aIDCrianca: TGuid; var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
  end;

implementation

{ TDAOResponsaveis }

procedure TDAOResponsaveis.GetAllByCriancaID(
  const aIDCrianca: TGuid;
  var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TResponsaveis;
begin
  if not Assigned(aListaResponsaveis) then
    raise Exception.Create('TDAOResponsaveis.GetAllByCriancaID: aListaResponsaveis não foi instanciada!');

  aListaResponsaveis.Clear;
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase
     .Join(mapper.ResponsaveisCriancas.tableName)
     .&On(mapper.ResponsaveisCriancas.field_id_responsavel, mapper.Responsaveis.field_id)
     .Where(mapper.ResponsaveisCriancas.field_id_crianca, aIDCrianca.ToQuotedString);

    OpenSQL(vSQL, vQry);
    vQry.First;
    with ORM.assemblerBase.TORMAssemblerBase.GetAssembler(GetAssemblerDefault) do
    try
      while not vQry.Eof do
      begin
        vModel := TResponsaveis(QueryToModel(vQry));
        aListaResponsaveis.Add(TDTOResponsaveis(ModelToDTO(vModel)));
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

function TDAOResponsaveis.GetAssemblerDefault: String;
begin
  Result := 'TAssemblerResponsaveis';
end;

function TDAOResponsaveis.GetSQLBase: ISQLConstructor;
begin
  Result :=
    Select(mapper.Responsaveis.field_id, mapper.Responsaveis.field_id)
    .Select(mapper.Responsaveis.field_nome, mapper.Responsaveis.field_nome)
    .Select(mapper.Responsaveis.field_documento, mapper.Responsaveis.field_documento)
    .Select(mapper.Responsaveis.field_contato, mapper.Responsaveis.field_contato)
    .Select(mapper.Responsaveis.field_email, mapper.Responsaveis.field_email)
    .Select(mapper.Responsaveis.field_foto, mapper.Responsaveis.field_foto)
    .From(mapper.Responsaveis.tableName);
end;

end.
