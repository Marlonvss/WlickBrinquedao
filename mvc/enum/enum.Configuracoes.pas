unit enum.Configuracoes;

interface

type
  TNomeConfiguracoes = (
    tncNaoEncontrado,
    tncCotacaoMinuto,
    tncTempoTolerancia,
    tncLogotipo);


const
  NomeConfiguracoes : Array [TNomeConfiguracoes] of String = (
    '<Nothing>',
    'CotacaoMinuto',
    'TempoTolerancia',
    'Logotipo'
  );

  function LocateConfiguracaoByNome(aNome: String): TNomeConfiguracoes;

implementation

function LocateConfiguracaoByNome(aNome: String): TNomeConfiguracoes;
var
  I : TNomeConfiguracoes;
begin
  Result := tncNaoEncontrado;
  for I := Low(NomeConfiguracoes) to High(NomeConfiguracoes) do
  begin
    if NomeConfiguracoes[i] = aNome then
      Result := i;
  end;
end;

end.
