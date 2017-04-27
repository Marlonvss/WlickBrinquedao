unit controller.Atividades;

interface

uses model.Atividades, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Atividades, dto.Atividades, assembler.Atividades, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase, dao.ValorTempo, dto.ValorTempo, dao.Configuracoes,
  enum.Configuracoes;

type
  TControllerAtividades = class(TORMControllerBase)
  private
    FDAOValoresTempo: TDAOValorTempo;
    FDAOConfiguracoes: TDAOConfiguracoes;
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function MyDAO: TDAOAtividades;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

  public
    procedure GetAllValoresTempo(var aListaValoresTempo: TObjectList<TDTOValorTempo>);

    procedure CalcularValorDeSaida(var aDTO: TDTOAtividades; out aStrExplicacao: String);

    function GetConfiguracao(aConfiguracao: TNomeConfiguracoes): String;
    procedure ImprimirRelatorio(const aDTO: TDTOAtividades);
  end;

implementation

procedure TControllerAtividades.CalcularValorDeSaida(var aDTO: TDTOAtividades;
  out aStrExplicacao: String);
var
  FListaValorTempo: TObjectList<TDTOValorTempo>;

  vTempoAux,
  vTempoDeServico: TTime;
  vTempoDeServicoEmMinutos: Integer;
  vDTO: TDTOValorTempo;
  vTempoPacote: TTime;
  vValorPacote: Currency;

  MyHora, MyMinuto, MySegundo, MyMiliSegundo : Word;
  vCotacao: Currency;
  vTolerancia: TTime;
begin
  vCotacao := Self.GetConfiguracao(tncCotacaoMinuto).ToCurrency;
  vTolerancia := Self.GetConfiguracao(tncTempoTolerancia).ToTime;
  vTempoPacote := 0;
  vValorPacote := 0;

  if aDTO.Saida > aDTO.Entrada
    then vTempoDeServico := (aDTO.Saida - aDTO.Entrada)
    else vTempoDeServico := (aDTO.Entrada - aDTO.Saida);

  FListaValorTempo := TObjectList<TDTOValorTempo>.Create;
  try
    FDAOValoresTempo.GetAllValoresTempo(FListaValorTempo);

    { Localiza o pacote mais proximo pra cima }
    for vDTO in FListaValorTempo do
    begin
      if (vTempoDeServico <= vDTO.TempoCalculado) and ((vDTO.TempoCalculado < vTempoPacote) or (vTempoPacote = 0))then
      begin
        vTempoPacote := vDTO.TempoCalculado;
        vValorPacote := vDTO.Valor;
      end;
    end;

  finally
    FListaValorTempo.Free;
  end;

  {Calcula o tempo extra entre a tempo calculada e o tempo de serviço }
  vTempoAux := vTempoDeServico - vTempoPacote;

  {Valida se a diferença está na carência}
  if vTempoAux <= vTolerancia then
  begin
    vTempoAux := 0;
  end;

  {Converte a diferença em minutos para aplicar a cotação}
  DecodeTime(vTempoAux, MyHora, MyMinuto, MySegundo, MyMiliSegundo);
  vTempoDeServicoEmMinutos := (MyHora * 60) + MyMinuto;

  aDTO.ValorSaida := vValorPacote + (vTempoDeServicoEmMinutos * vCotacao);


  aStrExplicacao :=
    Format('Valor em pacote: %s',[FormatCurr('R$ ,0.00;-R$ ,0.00', vValorPacote)]) + CRLF +
    Format('Valor sobre tempo excedido: %s',[FormatCurr('R$ ,0.00;-R$ ,0.00', vTempoDeServicoEmMinutos * vCotacao)]);

end;

function TControllerAtividades.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOAtividades;
end;

procedure TControllerAtividades.CreateAllObjects;
begin
  inherited CreateAllObjects;
  FDAOValoresTempo := TDAOValorTempo.Create;
  FDAOConfiguracoes := TDAOConfiguracoes.Create;
end;

procedure TControllerAtividades.DestroyAllObjects;
begin
  inherited DestroyAllObjects;
  FDAOValoresTempo.Free;
  FDAOConfiguracoes.Free;
end;

procedure TControllerAtividades.GetAllValoresTempo(
  var aListaValoresTempo: TObjectList<TDTOValorTempo>);
begin
  FDAOValoresTempo.GetAllValoresTempo(aListaValoresTempo);
end;

function TControllerAtividades.GetConfiguracao(
  aConfiguracao: TNomeConfiguracoes): String;
begin
  Result := FDAOConfiguracoes.GetConfiguracao(aConfiguracao);
end;

procedure TControllerAtividades.ImprimirRelatorio(const aDTO: TDTOAtividades);
begin
//
end;

function TControllerAtividades.MyDAO: TDAOAtividades;
begin
  Result := (FDAO as TDAOAtividades);
end;

end.
