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
