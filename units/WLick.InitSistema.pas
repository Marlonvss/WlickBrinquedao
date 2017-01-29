unit WLick.InitSistema;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms,
  ORM.Connection, model.Usuarios, dto.Usuarios,
  assembler.Usuarios, IniFiles;

Type
  TInitSistema = class
  private
    procedure ConectaBD;
  public
    class function IniciarSistema(): Boolean;
  end;


implementation


{ TInitSistema }

procedure TInitSistema.ConectaBD;
var
  ArquivoINI: TIniFile;

  vHost, vDataBaseName, vUser, vPassword : string;
  vPort : Integer;
const
  cTagName = 'WLick';
begin

  ArquivoINI := TIniFile.Create( ExtractFilePath(Application.ExeName) + '\conexao.ini' );
  try
    vHost         := ArquivoINI.ReadString(cTagName, 'Host','');
    vDataBaseName := ArquivoINI.ReadString(cTagName, 'Database','');
    vUser         := ArquivoINI.ReadString(cTagName, 'User','');
    vPassword     := ArquivoINI.ReadString(cTagName, 'Password','');
    vPort         := ArquivoINI.ReadInteger(cTagName, 'Port',0);
  finally
    ArquivoINI.Free;
  end;

 { Conecta com Postgres }
  with ORM.Connection.GetInstance() do
  begin
    Host := vHost;
    Port := vPort;
    DataBaseName := vDataBaseName;
    User := vUser;
    Password := vPassword;
    DataBaseType := dbPostgres;
  end;
end;

class function TInitSistema.IniciarSistema: Boolean;
begin
  Result := True;
  with TInitSistema.Create() do
  try
    try
      ConectaBD;
    except
      on e: exception do
      begin
        Result := False;
        raise Exception.Create('Ocorreu um erro ao Iniciar o Sistema!'+#13+'Entre em contato com o Suporte WebLick.'+#13+e.Message);
      end;
    end;
  finally
    Free;
  end;

end;

end.