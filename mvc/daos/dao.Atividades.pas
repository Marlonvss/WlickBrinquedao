unit dao.Atividades;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Atividades,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Atividades, WLick.ConstrutorSQL,
  mapper.Atividades, enum.Atividades.Situacao, dto.Atividades;

type
  TDAOAtividades = class(TORMDAOBase)
  public
    function CriancaEmAtividade(aDTO: TDTOAtividades): boolean;
  end;

implementation

{ TDAOAtividades }

function TDAOAtividades.CriancaEmAtividade(aDTO: TDTOAtividades): boolean;
var
  vQry: TUniQuery;
  vSQL: ISQLConstructor;
begin
  Result := False;
  vQry := TUniQuery.Create(nil);
  try

    vSQL := Select('1')
      .From(mapper.Atividades.tableName)
      .Where(mapper.Atividades.field_Situacao).Equals(IntToStr(Integer(enum.Atividades.Situacao.tsIniciado)))
      .Where(mapper.Atividades.field_Id_Crianca).Equals(aDTO.Id_Crianca.ToQuotedString)
      .Where(mapper.Atividades.field_Id).NotEqualTo(aDTO.ID.ToQuotedString);

    OpenSQL(vSQL, vQry);
    Result := not vQry.IsEmpty;

  finally
    vQry.Free;
  end;
end;

end.
