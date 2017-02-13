unit controller.Configuracoes;

interface

uses model.Configuracoes, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Configuracoes, dto.Configuracoes, assembler.Configuracoes, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase;

type
  TControllerConfiguracoes = class(TORMControllerBase)
  private
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function MyDAO: TDAOConfiguracoes;
  public
    procedure GetAllConfiguracoes(var aLista: TObjectList<TDTOConfiguracoes>);
  end;

implementation

function TControllerConfiguracoes.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOConfiguracoes;
end;


procedure TControllerConfiguracoes.GetAllConfiguracoes(
  var aLista: TObjectList<TDTOConfiguracoes>);
begin
  MyDAO.GetAllConfiguracoes(aLista);
end;

function TControllerConfiguracoes.MyDAO: TDAOConfiguracoes;
begin
  Result := (FDAO as TDAOConfiguracoes);
end;

end.
