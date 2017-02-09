unit controller.Atividades;

interface

uses model.Atividades, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Atividades, dto.Atividades, assembler.Atividades, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase, dto.Criancas, dao.Criancas, dao.Responsaveis,
  dto.Responsaveis, dao.ValorTempo, dto.ValorTempo;

type
  TControllerAtividades = class(TORMControllerBase)
  private
    FDAOCriancas: TDAOCriancas;
    FDAOResponsaveis: TDAOResponsaveis;
    FDAOValoresTempo: TDAOValorTempo;
  protected
    function ClassDAO(): TORMDAOBaseClass; override;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

  public
    procedure GetAllCriancas(var aListaCriancas: TObjectList<TDTOCriancas>);
    procedure GetAllValoresTempo(var aListaValoresTempo: TObjectList<TDTOValorTempo>);
    procedure GetResponsaveisByCriancaID(const aIDCrianca: TGuid; var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
  end;

implementation

function TControllerAtividades.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOAtividades;
end;

procedure TControllerAtividades.CreateAllObjects;
begin
  inherited CreateAllObjects;
  FDAOCriancas := TDAOCriancas.Create;
  FDAOResponsaveis := TDAOResponsaveis.Create;
  FDAOValoresTempo := TDAOValorTempo.Create;
end;

procedure TControllerAtividades.DestroyAllObjects;
begin
  inherited DestroyAllObjects;
  FDAOCriancas.Free;
  FDAOResponsaveis.Free;
  FDAOValoresTempo.Free;
end;

procedure TControllerAtividades.GetAllCriancas(
  var aListaCriancas: TObjectList<TDTOCriancas>);
begin
  if assigned(aListaCriancas) then
  begin
    FDAOCriancas.GetAllCriancas(aListaCriancas);
  end
  else
    raise Exception.Create('aListaCriancas não foi instanciado!');
end;

procedure TControllerAtividades.GetAllValoresTempo(
  var aListaValoresTempo: TObjectList<TDTOValorTempo>);
begin
  FDAOValoresTempo.GetAllValoresTempo(aListaValoresTempo);
end;

procedure TControllerAtividades.GetResponsaveisByCriancaID(
  const aIDCrianca: TGuid;
  var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
begin
  FDAOResponsaveis.GetAllByCriancaID(aIDCrianca, aListaResponsaveis);
end;

end.
