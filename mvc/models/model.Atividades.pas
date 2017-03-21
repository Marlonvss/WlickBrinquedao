unit model.Atividades;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Atividades;

type

  [TORMTableName(mapper.Atividades.TableName)]
  TAtividades = class(TORMModelBase)
  private

    FId: TGuid;
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
    FEntrada: TTime;
    FValor: Currency;
    FTempo: TTime;
    FSituacao: Integer;
    FSaida: TTime;
    FValorSaida: Currency;
    FDataInsert: TDate;

  published

    [TORMFieldCRUD(mapper.Atividades.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Atividades.field_CriancaNome)]
    property Crianca_Nome: String read FCrianca_Nome write FCrianca_Nome;

    [TORMFieldCRUD(mapper.Atividades.field_CriancaNascimento)]
    property Crianca_Nascimento: TDate read FCrianca_Nascimento write FCrianca_Nascimento;

    [TORMFieldCRUD(mapper.Atividades.field_CriancaFoto)]
    property Crianca_Foto: String read FCrianca_Foto write FCrianca_Foto;

    [TORMFieldCRUD(mapper.Atividades.field_ResponsavelNome)]
    property Responsavel_Nome: String read FResponsavel_Nome write FResponsavel_Nome;

    [TORMFieldCRUD(mapper.Atividades.field_ResponsavelDocumento)]
    property Responsavel_Documento: String read FResponsavel_Documento write FResponsavel_Documento;

    [TORMFieldCRUD(mapper.Atividades.field_ResponsavelContato)]
    property Responsavel_Contato: String read FResponsavel_Contato write FResponsavel_Contato;

    [TORMFieldCRUD(mapper.Atividades.field_ResponsavelEmail)]
    property Responsavel_Email: String read FResponsavel_Email write FResponsavel_Email;

    [TORMFieldCRUD(mapper.Atividades.field_ResponsavelFoto)]
    property Responsavel_Foto: String read FResponsavel_Foto write FResponsavel_Foto;

    [TORMFieldCRUD(mapper.Atividades.field_Id_Usuario)]
    property Id_Usuario: TGuid read FId_Usuario write FId_Usuario;

    [TORMFieldCRUD(mapper.Atividades.field_Obs)]
    property Obs: String read FObs write FObs;

    [TORMFieldCRUD(mapper.Atividades.field_Entrada)]
    property Entrada: TTime read FEntrada write FEntrada;

    [TORMFieldCRUD(mapper.Atividades.field_Valor)]
    property Valor: Currency read FValor write FValor;

    [TORMFieldCRUD(mapper.Atividades.field_Tempo)]
    property Tempo: TTime read FTempo write FTempo;

    [TORMFieldCRUD(mapper.Atividades.field_Situacao)]
    property Situacao: Integer read FSituacao write FSituacao;

    [TORMFieldCRUD(mapper.Atividades.field_Saida)]
    property Saida: TTime read FSaida write FSaida;

    [TORMFieldCRUD(mapper.Atividades.field_valorSaida)]
    property ValorSaida: Currency read FValorSaida write FValorSaida;

    [TORMFieldCRUD(mapper.Atividades.field_DataInsert)]
    property DataInsert: TDate read FDataInsert write FDataInsert;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TAtividades }

function TAtividades.AssemblerClass: String;
begin
  Result := 'TAssemblerAtividades';
end;

end.
