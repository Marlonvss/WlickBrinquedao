unit dto.ValorTempo;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.ValorTempo, System.SysUtils;

type
  TDTOValorTempo = class(TORMdtoBase)
    private
      FValor: Currency;
      FTempo: Integer;
      function GetTempoCalculado: TTime;
    published
      property Valor: Currency read FValor write FValor;
      property Tempo: Integer read FTempo write FTempo;

      property TempoCalculado: TTime read GetTempoCalculado;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOValorTempo }

function TDTOValorTempo.AssemblerClass: String;
begin
  Result := 'TAssemblerValorTempo';
end;

function TDTOValorTempo.GetTempoCalculado: TTime;
var
  vHora, vMinuto: Integer;
begin
  vHora := Trunc(Self.FTempo / 60);
  vMinuto := Self.Tempo - Trunc(vHora * 60);

  Result := StrToTime(IntToStr(vHora) + ':' + IntToStr(vMinuto) + ':00');
end;

end.
