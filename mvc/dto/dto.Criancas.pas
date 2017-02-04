unit dto.Criancas;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.Criancas,
  Vcl.Graphics, generics.collections, WLick.Types, dto.Responsaveis;

type
  TDTOCriancas = class(TORMdtoBase)
    private
      FCodigo: String;
      FNome: String;
      FNascimento: TDateTime;
      FFoto: TBitmap;
      FListaResponsaveis: TObjectList<TDTOResponsaveis>;
    published
      property Codigo: String read FCodigo write FCodigo;
      property Nome: String read FNome write FNome;
      property Nascimento: TDateTime read FNascimento write FNascimento;
      property Foto: TBitmap read FFoto write FFoto;
      property ListaResponsaveis: TObjectList<TDTOResponsaveis> read FListaResponsaveis write FListaResponsaveis;
    public
      function AssemblerClass: String; override;

      constructor Create();
      destructor Destroy(); Override;
  end;

implementation

{ TDTOUsuario }

function TDTOCriancas.AssemblerClass: String;
begin
  Result := 'TAssemblerCriancas';
end;

constructor TDTOCriancas.Create;
begin
  inherited;
  Self.FListaResponsaveis := TObjectList<TDTOResponsaveis>.Create();
end;

destructor TDTOCriancas.Destroy;
begin
  Self.FListaResponsaveis.Free;
  inherited;
end;

end.
