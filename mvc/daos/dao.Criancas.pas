unit dao.Criancas;

interface

uses Rtti, ORM.Attributes, system.SysUtils, Uni, model.Criancas,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections, ORM.daoBase,
  ORM.assemblerBase, assembler.Criancas, WLick.ConstrutorSQL;

type
  TDAOCriancas = class(TORMDAOBase)
  public
    function GetSequenceCodigo: String;
  end;

implementation

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

end.
