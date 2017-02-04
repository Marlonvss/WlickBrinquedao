unit model.ResponsaveisCriancas;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.ResponsaveisCriancas;

type

  [TORMTableName(mapper.ResponsaveisCriancas.TableName)]
  TResponsaveisCriancas = class(TORMModelBase)
  private

    FId_Responsavel: TGuid;
    FId_Crianca: TGuid;

  published

    [TORMFieldCRUD(mapper.ResponsaveisCriancas.field_ID_Responsavel)]
    property Id_Responsavel: TGuid read FId_Responsavel write FId_Responsavel;

    [TORMFieldCRUD(mapper.ResponsaveisCriancas.field_ID_Crianca)]
    property Id_Crianca: TGuid read FId_Crianca write FId_Crianca;

    public
    function AssemblerClass: String; override;

  end;

implementation

{ TResponsaveisCriancas }

function TResponsaveisCriancas.AssemblerClass: String;
begin
  Result := 'TAssemblerResponsaveisCriancas';
end;

end.
