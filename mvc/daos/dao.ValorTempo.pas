unit dao.ValorTempo;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.ValorTempo,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.ValorTempo, dto.ValorTempo, WLick.ConstrutorSQL,
  mapper.ValorTempo;

type
  TDAOValorTempo = class(TORMDAOBase)
  private
    function GetSQLBase(): ISQLConstructor;
    function GetAssemblerDefault: String;
  public
    procedure GetAllValoresTempo(var aListaValoresTempo: TObjectList<TDTOValorTempo>);
  end;

implementation

{ TDAOValorTempo }

{ TDAOValorTempo }

procedure TDAOValorTempo.GetAllValoresTempo(
  var aListaValoresTempo: TObjectList<TDTOValorTempo>);
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
  vModel: TValorTempo;
begin
  if not Assigned(aListaValoresTempo) then
    raise Exception.Create('TDAOValorTempo.GetAllValoresTempo: aListaResponsaveis não foi instanciada!');

  aListaValoresTempo.Clear;
  vQry := TUniQuery.Create(nil);
  try
    vSQL := GetSQLBase;

    OpenSQL(vSQL, vQry);
    vQry.First;
    with ORM.assemblerBase.TORMAssemblerBase.GetAssembler(GetAssemblerDefault) do
    try
      while not vQry.Eof do
      begin
        vModel := TValorTempo(QueryToModel(vQry));
        aListaValoresTempo.Add(TDTOValorTempo(ModelToDTO(vModel)));
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

function TDAOValorTempo.GetAssemblerDefault: String;
begin
  Result := 'TAssemblerValorTempo';
end;

function TDAOValorTempo.GetSQLBase: ISQLConstructor;
begin
  Result :=
    Select(mapper.ValorTempo.field_id, mapper.ValorTempo.field_id)
   .Select(mapper.ValorTempo.field_Valor, mapper.ValorTempo.field_Valor)
   .Select(mapper.ValorTempo.field_Tempo, mapper.ValorTempo.field_Tempo)
   .From(mapper.ValorTempo.tableName);
end;

end.
