unit dto.Criancas;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Criancas, Vcl.Graphics;

type
  TDTOCriancas = class(TORMdtoBase)
    private
      FCodigo: String;
      FNome: String;
      FNascimento: TDateTime;
      FFoto: TBitmap;
      FResponsavelNome: String;
      FResponsavelDocumento: String;
      FResponsavelContato: String;
      FResponsavelEmail: String;
      FResponsavelFoto: TBitmap;
    published
      property Codigo: String read FCodigo write FCodigo;
      property Nome: String read FNome write FNome;
      property Nascimento: TDateTime read FNascimento write FNascimento;
      property Foto: TBitmap read FFoto write FFoto;
      property ResponsavelNome: String read FResponsavelNome write FResponsavelNome;
      property ResponsavelDocumento: String read FResponsavelDocumento write FResponsavelDocumento;
      property ResponsavelContato: String read FResponsavelContato write FResponsavelContato;
      property ResponsavelEmail: String read FResponsavelEmail write FResponsavelEmail;
      property ResponsavelFoto: TBitmap read FResponsavelFoto write FResponsavelFoto;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOCriancas.AssemblerClass: String;
begin
  Result := 'TAssemblerCriancas';
end;

end.
