unit dao.ValorTempo;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.ValorTempo,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.ValorTempo, dto.ValorTempo, WLick.ConstrutorSQL,
  mapper.ValorTempo;

type
  TDAOValorTempo = class(TORMDAOBase)
  public
  end;

implementation

{ TDAOValorTempo }

end.
