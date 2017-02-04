unit dto.Atividades;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Atividades, Vcl.Graphics;

type
  TDTOAtividades = class(TORMdtoBase)
    private
      FId: TGuid;
      FId_Crianca: TGuid;
      FId_Responsavel: TGuid;
      FId_Usuario: TGuid;
      FObs: String;
      FEntrada: TDateTime;
      FValor: Currency;
      FTempo: TDateTime;
      FSituacao: Integer;
    published
      property ID: TGuid read FID write FID;
      property Id_Crianca: TGuid read FId_Crianca write FId_Crianca;
      property Id_Responsavel: TGuid read FId_Responsavel write FId_Responsavel;
      property Id_Usuario: TGuid read FId_Usuario write FId_Usuario;
      property Obs: String read FObs write FObs;
      property Entrada: TDateTime read FEntrada write FEntrada;
      property Valor: Currency read FValor write FValor;
      property Tempo: TDateTime read FTempo write FTempo;
      property Situacao: Integer read FSituacao write FSituacao;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOAtividades.AssemblerClass: String;
begin
  Result := 'TAssemblerAtividades';
end;

end.
