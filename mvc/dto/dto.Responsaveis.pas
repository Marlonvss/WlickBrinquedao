unit dto.Responsaveis;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Responsaveis, Vcl.Graphics;

type
  TDTOResponsaveis = class(TORMdtoBase)
    private
      FNome: String;
      FDocumento: String;
      FContato: String;
      FEmail: String;
      FFoto: String;
    published
      property Nome: String read FNome write FNome;
      property Documento: String read FDocumento write FDocumento;
      property Contato: String read FContato write FContato;
      property Email: String read FEmail write FEmail;
      property Foto: String read FFoto write FFoto;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOResponsaveis.AssemblerClass: String;
begin
  Result := 'TAssemblerResponsaveis';
end;

end.
