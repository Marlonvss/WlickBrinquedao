unit controller.Usuarios;

interface

uses model.Usuarios, Rtti, ORM.attributes, system.SysUtils, Uni,
  WLick.Constantes, TypInfo, WLick.ClassHelper, Generics.Collections,
  dao.Usuarios, dto.Usuarios, assembler.Usuarios, ORM.controllerBase,
  ORM.assemblerBase, ORM.daoBase, dao.Configuracoes, enum.Configuracoes;

type
  TControllerUsuario = class(TORMControllerBase)
  private
    FDAOConfiguracoes: TDAOConfiguracoes;
  protected
    function ClassDAO(): TORMDAOBaseClass; override;
    function MyDAO(): TDAOUsuario;

    procedure CreateAllObjects(); override;
    procedure DestroyAllObjects(); override;

  public
    procedure GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
    procedure GetDataProcesso(out aData: TDateTime);
    procedure AtualizaDataProcesso();
  end;

implementation

procedure TControllerUsuario.AtualizaDataProcesso;
begin
  MyDAO.ExecutaSQL('select Func_Encerrar_Dia()');
end;

function TControllerUsuario.ClassDAO: TORMDAOBaseClass;
begin
  Result := TDAOUsuario;
end;

function TControllerUsuario.MyDAO: TDAOUsuario;
begin
  Result := (FDAO as TDAOUsuario);
end;

procedure TControllerUsuario.CreateAllObjects;
begin
  inherited CreateAllObjects;
  FDAOConfiguracoes := TDAOConfiguracoes.Create;
end;

procedure TControllerUsuario.DestroyAllObjects;
begin
  inherited DestroyAllObjects;
  FDAOConfiguracoes.Free;
end;

procedure TControllerUsuario.GetDataProcesso(out aData: TDateTime);
var
  vStr: String;
begin
  aData := FDAOConfiguracoes.GetConfiguracao(TNomeConfiguracoes.tncDataOperacao).ToDateFormat('YYYY-MM-DD');
end;

procedure TControllerUsuario.GetUsuarioByLoginSenha(var aDTO: TDTOUsuario);
begin
  if Assigned(aDTO) then
    MyDAO().GetUsuarioByLoginSenha(aDTO);
end;

end.
