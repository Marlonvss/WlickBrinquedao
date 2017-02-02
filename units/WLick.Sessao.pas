unit WLick.Sessao;

interface

uses Uni, SysUtils, dto.Usuarios, ORM.assemblerBase, System.Classes;

type
  TSessao = class
    private
      FUsuario  : TDTOUsuario;
      FDataHora : TDateTime;

    published
      property Usuario  : TDTOUsuario read FUsuario;
      property DataHora : TDateTime read FDataHora;

    public
      procedure SetUsuario( aUsuario: TDTOUsuario);

  end;

function GetInstance(): TSessao;

var
  FSingletonSessao: TSessao = nil;

implementation

{ TSessao }

uses DMConnection;

function GetInstance: TSessao;
begin
  if not Assigned(FSingletonSessao)
  then
    FSingletonSessao := TSessao.Create();
  Result := FSingletonSessao;
end;

{ TSessao }

procedure TSessao.SetUsuario(aUsuario: TDTOUsuario);
begin
  if Assigned(aUsuario) then
  begin
    with TORMAssemblerBaseClass(FindClass(aUsuario.AssemblerClass)) do
    begin
      Self.FUsuario := TDTOUsuario(GetClone(aUsuario));
    end;
  end;
end;

initialization

finalization

FreeAndNil(FSingletonSessao);

end.
