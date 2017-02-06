unit model.ValorTempo;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.ValorTempo;

type

  [TORMTableName(mapper.ValorTempo.TableName)]
  TValorTempo = class(TORMModelBase)
  private

    FID: TGuid;
    FValor: Currency;
    FTempo: Integer;

  published

    [TORMFieldCRUD(mapper.ValorTempo.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.ValorTempo.field_Valor)]
    property Valor: Currency read FValor write FValor;

    [TORMFieldCRUD(mapper.ValorTempo.field_Tempo)]
    property Tempo: Integer read FTempo write FTempo;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TValorTempo }

function TValorTempo.AssemblerClass: String;
begin
  Result := 'TAssemblerValorTempo';
end;

end.
