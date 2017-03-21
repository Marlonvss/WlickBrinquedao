unit dao.Atividades;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Atividades,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Atividades, WLick.ConstrutorSQL,
  mapper.Atividades, enum.Atividades.Situacao, dto.Atividades;

type
  TDAOAtividades = class(TORMDAOBase)
  public
  end;

implementation

{ TDAOAtividades }

end.
