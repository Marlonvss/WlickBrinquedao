unit viewLoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  cxButtons, controller.Usuarios, dto.Usuarios, WLick.Sessao;

type
  TfrmLogin = class(TForm)
    ActManager: TActionManager;
    actOK: TAction;
    actCancelar: TAction;
    Panel1: TPanel;
    Image1: TImage;
    lblLogin: TLabel;
    edtLogin: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    procedure actCancelarExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
    function ValidarLogin(): Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

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

function TfrmLogin.ValidarLogin: Boolean;
var
  vUsuario, vSenha: String;
  vDTO: TDTOUsuario;
begin
  Result := False;

  vDTO := TDTOUsuario.Create;
  vDTO.Login := edtLogin.Text;
  vDTO.Senha := edtSenha.Text;

  with TControllerUsuario.Create do
  try
    GetUsuarioByLoginSenha(vDTO);
    Result := Assigned(vDTO);
    if Result then
    begin
      WLick.Sessao.GetInstance().SetUsuario(vDTO);
    end else
    begin
      ShowMessage('Usuário ou senha informada não confere.');
    end;

  finally
    Free;
  end;

end;

end.



