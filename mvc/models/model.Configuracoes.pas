unit model.Configuracoes;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Configuracoes;

type

  [TORMTableName(mapper.Configuracoes.TableName)]
  TConfiguracoes = class(TORMModelBase)
  private

    FId: TGuid;
    FConfiguracao: String;
    FValor: String;
    FValorBinario: String;

  published

    [TORMFieldCRUD(mapper.Configuracoes.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Configuracoes.field_Configuracao)]
    property Configuracao: String read FConfiguracao write FConfiguracao;

    [TORMFieldCRUD(mapper.Configuracoes.field_Valor)]
    property Valor: String read FValor write FValor;

    [TORMFieldCRUD(mapper.Configuracoes.field_ValorBinario)]
    property ValorBinario: String read FValorBinario write FValorBinario;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TConfiguracoes }

function TConfiguracoes.AssemblerClass: String;
begin
  Result := 'TAssemblerConfiguracoes';
end;

end.
