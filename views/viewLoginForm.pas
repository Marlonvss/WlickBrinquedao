unit viewLoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  cxButtons;

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
  Self.ModalResult := mrOK;
end;

end.



