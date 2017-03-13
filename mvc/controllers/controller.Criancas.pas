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
    function MyDAO(): TDAOCriancas;

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

function TControllerCriancas.MyDAO: TDAOCriancas;
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
  Result := MyDAO.GetSequenceCodigo;
end;

function TControllerCriancas.PodeRemoverCrianca(const aIDCrianca: TGuid;
  out aMsg: WideString): Boolean;
begin
  aMsg := EmptyWideStr;
  Result := True;

  if MyDAO.CriancaPossuiAtividade(aIDCrianca) then
  begin
    aMsg := 'Esta crian�a n�o pode ser exclu�da pois est� vinculada a uma atividade.'+CRLF;
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
    aMsg := 'Este respons�vel n�o pode ser exclu�do pois est� vinculado a uma atividade.'+CRLF;
    Result := False;
  end;

end;

end.
