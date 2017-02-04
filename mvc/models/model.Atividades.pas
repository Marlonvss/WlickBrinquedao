unit model.Atividades;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Atividades;

type

  [TORMTableName(mapper.Atividades.TableName)]
  TAtividades = class(TORMModelBase)
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

    [TORMFieldCRUD(mapper.Atividades.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Atividades.field_Id_Crianca)]
    property Id_Crianca: TGuid read FId_Crianca write FId_Crianca;

    [TORMFieldCRUD(mapper.Atividades.field_Id_Responsavel)]
    property Id_Responsavel: TGuid read FId_Responsavel write FId_Responsavel;

    [TORMFieldCRUD(mapper.Atividades.field_Id_Usuario)]
    property Id_Usuario: TGuid read FId_Usuario write FId_Usuario;

    [TORMFieldCRUD(mapper.Atividades.field_Obs)]
    property Obs: String read FObs write FObs;

    [TORMFieldCRUD(mapper.Atividades.field_Entrada)]
    property Entrada: TDateTime read FEntrada write FEntrada;

    [TORMFieldCRUD(mapper.Atividades.field_Valor)]
    property Valor: Currency read FValor write FValor;

    [TORMFieldCRUD(mapper.Atividades.field_Tempo)]
    property Tempo: TDateTime read FTempo write FTempo;

    [TORMFieldCRUD(mapper.Atividades.field_Situacao)]
    property Situacao: Integer read FSituacao write FSituacao;

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