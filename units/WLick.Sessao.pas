unit WLick.Sessao;

interface

uses Uni, SysUtils, dto.Usuarios, ORM.assemblerBase, System.Classes;

type
  TSessao = class
    private
      FUsuario  : TDTOUsuario;
      FDataProcesso : TDateTime;

    published
      property Usuario  : TDTOUsuario read FUsuario;
      property DataProcesso : TDateTime read FDataProcesso;

    public
      procedure SetUsuario( aUsuario: TDTOUsuario);
      procedure SetDataProcesso( aData: TDateTime);

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

procedure TSessao.SetDataProcesso(aData: TDateTime);
begin
  Self.FDataProcesso := aData;
end;

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
