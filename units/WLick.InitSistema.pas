unit WLick.InitSistema;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms,
  ORM.Connection, model.Usuarios, dto.Usuarios,
  assembler.Usuarios, IniFiles, Dialogs, WLick.Constantes, viewLoginForm,
  WLick.Sessao, Controls;

Type
  TInitSistema = class
  private
    procedure ConectaBD;
    function LicencaValida: Boolean;
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
  Result := False;
  with TInitSistema.Create() do
  try
    if LicencaValida then
    try
      ConectaBD;

      with viewLoginForm.TfrmLogin.Create(nil) do
      try
        Result := Assigned(WLick.Sessao.GetInstance.Usuario);
        if not Result then
        begin
          Result := (ShowModal = mrOK);
        end;
      finally
        Free;
      end;

    except
      on e: exception do
        raise Exception.Create('Ocorreu um erro ao Iniciar o Sistema!'+#13+'Entre em contato com o Suporte WebLick:'+#13#13+e.Message);
    end else
    begin
      ShowMessage('Licença invalida! '+CRLF+'Vencimento até 01/04/2017.');
    end;
  finally
    Free;
  end;

end;

function TInitSistema.LicencaValida: Boolean;
begin
  Result := not (Trunc(Now) > StrToDate('01/04/2017'));
end;

end.