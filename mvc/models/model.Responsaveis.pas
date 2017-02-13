unit model.Responsaveis;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Responsaveis;

type

  [TORMTableName(mapper.Responsaveis.TableName)]
  TResponsaveis = class(TORMModelBase)
  private

    FId: TGuid;
    FNome: String;
    FDocumento: String;
    FContato: String;
    FEmail: String;
    FFoto: String;

  published

    [TORMFieldCRUD(mapper.Responsaveis.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Responsaveis.field_nome)]
    property Nome: String read FNome write FNome;

    [TORMFieldCRUD(mapper.Responsaveis.field_Documento)]
    property Documento: String read FDocumento write FDocumento;

    [TORMFieldCRUD(mapper.Responsaveis.field_Contato)]
    property Contato: String read FContato write FContato;

    [TORMFieldCRUD(mapper.Responsaveis.field_Email)]
    property Email: String read FEmail write FEmail;

    [TORMFieldCRUD(mapper.Responsaveis.field_foto)]
    property Foto: String read FFoto write FFoto;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TResponsaveis }

function TResponsaveis.AssemblerClass: String;
begin
  Result := 'TAssemblerResponsaveis';
end;

end.
