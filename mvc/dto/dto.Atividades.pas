unit dto.Atividades;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Atividades, Vcl.Graphics;

type
  TDTOAtividades = class(TORMdtoBase)
    private
      FCrianca_Nome: String;
      FCrianca_Nascimento: TDate;
      FCrianca_Foto: String;
      FResponsavel_Nome: String;
      FResponsavel_Documento: String;
      FResponsavel_Contato: String;
      FResponsavel_Email: String;
      FResponsavel_Foto: String;
      FId_Usuario: TGuid;
      FObs: String;
      FEntrada: TDateTime;
      FValor: Currency;
      FTempo: TTime;
      FSituacao: Integer;

      FSaida: TDateTime;
      FValorSaida: Currency;
      FDataInsert: TDate;
    published
      property Crianca_Nome: String read FCrianca_Nome write FCrianca_Nome;
      property Crianca_Nascimento: TDate read FCrianca_Nascimento write FCrianca_Nascimento;
      property Crianca_Foto: String read FCrianca_Foto write FCrianca_Foto;
      property Responsavel_Nome: String read FResponsavel_Nome write FResponsavel_Nome;
      property Responsavel_Documento: String read FResponsavel_Documento write FResponsavel_Documento;
      property Responsavel_Contato: String read FResponsavel_Contato write FResponsavel_Contato;
      property Responsavel_Email: String read FResponsavel_Email write FResponsavel_Email;
      property Responsavel_Foto: String read FResponsavel_Foto write FResponsavel_Foto;
      property Id_Usuario: TGuid read FId_Usuario write FId_Usuario;
      property Obs: String read FObs write FObs;
      property Entrada: TDateTime read FEntrada write FEntrada;
      property Valor: Currency read FValor write FValor;
      property Tempo: TTime read FTempo write FTempo;
      property Situacao: Integer read FSituacao write FSituacao;
      property Saida: TDateTime read FSaida write FSaida;
      property ValorSaida: Currency read FValorSaida write FValorSaida;
      property DataInsert: TDate read FDataInsert write FDataInsert;
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
