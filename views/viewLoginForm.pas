unit viewLoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  cxButtons, controller.Usuarios, dto.Usuarios, WLick.Sessao, IniFiles,
  cxControls, cxContainer, cxEdit, cxTextEdit, WLick.Miscelania;

type
  TfrmLogin = class(TForm)
    ActManager: TActionManager;
    actOK: TAction;
    actCancelar: TAction;
    Panel1: TPanel;
    Image1: TImage;
    lblLogin: TLabel;
    lblSenha: TLabel;
    cxButton1: TcxButton;
    edtSenha: TcxTextEdit;
    cxButton2: TcxButton;
    edtLogin: TcxTextEdit;
    procedure actCancelarExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
    function ValidarLogin(): Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function SilentLogin(aUser, aPassword: String): Boolean;
  end;

implementation

{$R *.dfm}

procedure TfrmLogin.actCancelarExecute(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmLogin.actOKExecute(Sender: TObject);
begin
  if ValidarLogin() then
    Self.ModalResult := mrOK;
end;

constructor TfrmLogin.Create(AOwner: TComponent);
var
  ArquivoINI: TIniFile;

  vUsuario, vSenha : string;
const
  cTagName = 'Sessao';
begin
  inherited Create(AOwner);

  ArquivoINI := TIniFile.Create( ExtractFilePath(Application.ExeName) + '\conexao.ini' );
  try
    edtLogin.Text := ArquivoINI.ReadString(cTagName, 'Usuario','');
    edtSenha.Text := TMisc.Decrypt(ArquivoINI.ReadString(cTagName, 'Senha',''));

    if ((edtLogin.Text <> EmptyStr) and (edtSenha.Text <> EmptyStr)) then
      ValidarLogin();
  finally
    ArquivoINI.Free;
  end;

end;

function TfrmLogin.SilentLogin(aUser, aPassword: String): Boolean;
begin
  edtLogin.Text := aUser;
  edtSenha.Text := aPassword;

end;

function TfrmLogin.ValidarLogin: Boolean;
var
  vUsuario, vSenha: String;
  vDTO: TDTOUsuario;
  vDataProcesso: TDateTime;
begin
  Result := False;

  vDTO := TDTOUsuario.Create;
  vDTO.Login := edtLogin.Text;
  vDTO.Senha := edtSenha.Text;

  with TControllerUsuario.Create do
  try
    AtualizaDataProcesso();
    GetUsuarioByLoginSenha(vDTO);
    GetDataProcesso(vDataProcesso);

    Result := Assigned(vDTO);
    if Result then
    begin
      with WLick.Sessao.GetInstance() do
      begin
        SetUsuario(vDTO);
        SetDataProcesso(vDataProcesso);
      end;
    end else
    begin
      ShowMessage('Usu�rio ou senha informada n�o confere.');
    end;

  finally
    Free;
  end;

end;

end.



