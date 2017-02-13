unit controller.Criancas;

interface

uses model.Criancas, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Criancas, dto.Criancas, assembler.Criancas, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase, dao.Responsaveis, dto.Responsaveis;

type
  TControllerCriancas = class(TORMControllerBase)
  private
    FDAOResponsaveis: TDAOResponsaveis;

  protected
    function ClassDAO(): TORMDAOBaseClass; override;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

  public
    function GetSequenceCodigo: String;
    procedure GetResponsaveisByCriancaID(const aIDCrianca: TGuid; var aListaResponsaveis: TObjectList<TDTOResponsaveis>);

  end;

implementation

function TControllerCriancas.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOCriancas;
end;

procedure TControllerCriancas.CreateAllObjects;
begin
  inherited CreateAllObjects;
  FDAOResponsaveis := TDAOResponsaveis.Create;
end;

procedure TControllerCriancas.DestroyAllObjects;
begin
  inherited DestroyAllObjects;
  FDAOResponsaveis.Free;
end;

procedure TControllerCriancas.GetResponsaveisByCriancaID(
  const aIDCrianca: TGuid;
  var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
begin
  FDAOResponsaveis.GetAllByCriancaID(aIDCrianca, aListaResponsaveis);
end;

function TControllerCriancas.GetSequenceCodigo: String;
begin
  Result := (FDAO as TDAOCriancas).GetSequenceCodigo;
end;

end.
