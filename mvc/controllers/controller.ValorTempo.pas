unit controller.ValorTempo;

interface

uses model.ValorTempo, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.ValorTempo, dto.ValorTempo, assembler.ValorTempo, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerValorTempo = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function MyDAO(): TDAOValorTempo;
  public
  end;

implementation

function TControllerValorTempo.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOValorTempo;
end;

function TControllerValorTempo.MyDAO: TDAOValorTempo;
begin
  Result := (FDAO as TDAOValorTempo);
end;

end.
