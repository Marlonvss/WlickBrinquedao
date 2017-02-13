unit dto.Configuracoes;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Configuracoes, Vcl.Graphics;

type
  TDTOConfiguracoes = class(TORMdtoBase)
    private
      FConfiguracao: String;
      FValor: String;
    published
      property Configuracao: String read FConfiguracao write FConfiguracao;
      property Valor: String read FValor write FValor;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOConfiguracoes.AssemblerClass: String;
begin
  Result := 'TAssemblerConfiguracoes';
end;

end.
