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
    function GetDAO(): TDAOCriancas;

  protected
    function ClassDAO(): TORMDAOBaseClass; override;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

  public
    function GetSequenceCodigo: String;
    procedure GetResponsaveisByCriancaID(const aIDCrianca: TGuid; var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
    function PodeRemoverCrianca(const aIDCrianca: TGuid; out aMsg: WideString): Boolean;
    function PodeRemoverResponsavel(const aIDResponsavel: TGuid; out aMsg: WideString): Boolean;
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

function TControllerCriancas.GetDAO: TDAOCriancas;
begin
  Result := (FDAO as TDAOCriancas);
end;

procedure TControllerCriancas.GetResponsaveisByCriancaID(
  const aIDCrianca: TGuid;
  var aListaResponsaveis: TObjectList<TDTOResponsaveis>);
begin
  FDAOResponsaveis.GetAllByCriancaID(aIDCrianca, aListaResponsaveis);
end;

function TControllerCriancas.GetSequenceCodigo: String;
begin
  Result := GetDAO.GetSequenceCodigo;
end;

function TControllerCriancas.PodeRemoverCrianca(const aIDCrianca: TGuid;
  out aMsg: WideString): Boolean;
begin
  aMsg := EmptyWideStr;
  Result := True;

  if GetDAO.CriancaPossuiAtividade(aIDCrianca) then
  begin
    aMsg := 'Esta criança não pode ser excluída pois está vinculada a uma atividade.'+CRLF;
    Result := False;
  end;
  
end;

function TControllerCriancas.PodeRemoverResponsavel(const aIDResponsavel: TGuid;
  out aMsg: WideString): Boolean;
begin
  aMsg := EmptyWideStr;
  Result := True;

  if FDAOResponsaveis.ResponsavelPossuiAtividade(aIDResponsavel) then
  begin
    aMsg := 'Este responsável não pode ser excluído pois está vinculado a uma atividade.'+CRLF;
    Result := False;
  end;

end;

end.
