unit dao.Configuracoes;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Configuracoes,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Configuracoes, WLick.ConstrutorSQL,
  dto.Configuracoes, mapper.Configuracoes, enum.Configuracoes;

type
  TDAOConfiguracoes = class(TORMDAOBase)
  private
    function GetSQLBase(): ISQLConstructor;
    function GetAssemblerDefault: String;
  public
    procedure GetAllConfiguracoes(var aLista: TObjectList<TDTOConfiguracoes>);
    function GetConfiguracao(aConfiguracao: TNomeConfiguracoes): String;
  end;

implementation

{ TDAOConfiguracoes }

procedure TDAOConfiguracoes.GetAllConfiguracoes(
  var aLista: TObjectList<TDTOConfiguracoes>);
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TConfiguracoes;
begin
  if not Assigned(aLista) then
    raise Exception.Create('TDAOCriancas.GetAllCriancas: aListaResponsaveis não foi instanciada!');

  aLista.Clear;
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase;

    OpenSQL(vSQL, vQry);
    vQry.First;
    with ORM.assemblerBase.TORMAssemblerBase.GetAssembler(GetAssemblerDefault) do
    try
      while not vQry.Eof do
      begin
        vModel := TConfiguracoes(QueryToModel(vQry));
        aLista.Add(TDTOConfiguracoes(ModelToDTO(vModel)));
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

function TDAOConfiguracoes.GetAssemblerDefault: String;
begin
  Result := 'TAssemblerConfiguracoes';
end;

function TDAOConfiguracoes.GetConfiguracao(
  aConfiguracao: TNomeConfiguracoes): String;
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TConfiguracoes;
begin
  Result := EmptyStr;
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase
      .Where(mapper.Configuracoes.field_Configuracao, NomeConfiguracoes[aConfiguracao].Quoted);

    OpenSQL(vSQL, vQry);
    vQry.First;
    Result := vQry.FieldByName(mapper.Configuracoes.field_Valor).AsString;

  finally
    vQry.Free;
  end;
end;

function TDAOConfiguracoes.GetSQLBase: ISQLConstructor;
begin
  Result :=
    Select(mapper.Configuracoes.field_id, mapper.Configuracoes.field_id)
   .Select(mapper.Configuracoes.field_configuracao, mapper.Configuracoes.field_configuracao)
   .Select(mapper.Configuracoes.field_valor, mapper.Configuracoes.field_valor)
   .Select(mapper.Configuracoes.field_ValorBinario, mapper.Configuracoes.field_ValorBinario)
   .From(mapper.Configuracoes.tableName);
end;

end.
