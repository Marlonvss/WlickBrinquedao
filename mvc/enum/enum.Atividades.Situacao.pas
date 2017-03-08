unit enum.Atividades.Situacao;

interface

type
  TSituacoes = (tsIniciado, tsFinalizado);

const
  NomeSituacoes : Array [TSituacoes] of String = (
    'Iniciado',
    'Finalizado'
  );

implementation

end.
