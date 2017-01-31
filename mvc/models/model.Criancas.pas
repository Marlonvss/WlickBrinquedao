unit model.Criancas;

interface

uses Rtti, ORM.attributes, ORM.modelBase, Classes, mapper.Criancas;

type

  [TORMTableName(mapper.Criancas.TableName)]
  TCriancas = class(TORMModelBase)
  private

    FId: TGuid;
    FCodigo: String;
    FNome: String;
    FNascimento: TDateTime;
    FFoto: String;
    FResponsavelNome: String;
    FResponsavelDocumento: String;
    FResponsavelContato: String;
    FResponsavelEmail: String;
    FResponsavelFoto: String;

  published

    [TORMFieldCRUD(mapper.Criancas.field_ID, True)]
    property ID: TGuid read FID write FID;

    [TORMFieldCRUD(mapper.Criancas.field_codigo)]
    property Codigo: String read FCodigo write FCodigo;

    [TORMFieldCRUD(mapper.Criancas.field_nome)]
    property Nome: String read FNome write FNome;

    [TORMFieldCRUD(mapper.Criancas.field_nascimento)]
    property Nascimento: TDateTime read FNascimento write FNascimento;

    [TORMFieldCRUD(mapper.Criancas.field_foto)]
    property Foto: String read FFoto write FFoto;

    [TORMFieldCRUD(mapper.Criancas.field_responsavelNome)]
    property ResponsavelNome: String read FResponsavelNome write FResponsavelNome;

    [TORMFieldCRUD(mapper.Criancas.field_responsavelDocumento)]
    property ResponsavelDocumento: String read FResponsavelDocumento write FResponsavelDocumento;

    [TORMFieldCRUD(mapper.Criancas.field_responsavelContato)]
    property ResponsavelContato: String read FResponsavelContato write FResponsavelContato;

    [TORMFieldCRUD(mapper.Criancas.field_responsavelEmail)]
    property ResponsavelEmail: String read FResponsavelEmail write FResponsavelEmail;

    [TORMFieldCRUD(mapper.Criancas.field_responsavelFoto)]
    property ResponsavelFoto: String read FResponsavelFoto write FResponsavelFoto;

  public
    function AssemblerClass: String; override;

  end;

implementation

{ TCriancas }

function TCriancas.AssemblerClass: String;
begin
  Result := 'TAssemblerCriancas';
end;

end.
