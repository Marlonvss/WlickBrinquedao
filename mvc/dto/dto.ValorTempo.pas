unit dto.ValorTempo;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.ValorTempo;

type
  TDTOValorTempo = class(TORMdtoBase)
    private
      FValor: Currency;
      FTempo: Integer;
    published
      property Valor: Currency read FValor write FValor;
      property Tempo: Integer read FTempo write FTempo;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOValorTempo }

function TDTOValorTempo.AssemblerClass: String;
begin
  Result := 'TAssemblerValorTempo';
end;

end.
