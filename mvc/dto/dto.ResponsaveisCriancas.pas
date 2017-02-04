unit dto.ResponsaveisCriancas;

interface

uses Rtti, ORM.attributes, ORM.dtoBase, Classes, mapper.ResponsaveisCriancas, Vcl.Graphics;

type
  TDTOResponsaveisCriancas = class(TORMdtoBase)
    private
      FID_Responsavel: TGuid;
      FID_Crianca: TGuid;
    published
      property ID_Responsavel: TGuid read FID_Responsavel write FID_Responsavel;
      property ID_Crianca: TGuid read FID_Crianca write FID_Crianca;
    public
      function AssemblerClass: String; override;
  end;

implementation

{ TDTOUsuario }

function TDTOResponsaveisCriancas.AssemblerClass: String;
begin
  Result := 'TAssemblerResponsaveisCriancas';
end;

end.
