unit ficha.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Usuarios,
  controller.Usuarios, ORM.controllerBase, frame.Usuario,
  enum.Usuarios.NivelAcesso;

type

  TFichaUsuario = class(TORMFichaBase)
    private
      procedure LoadNivelAcessoInComboBox;
    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;

      function MyController: TControllerUsuario;
      function MyFrame: TframeUsuario;
      function MyDTO: TDTOUsuario;

      procedure SetOnChange(); override;

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

      procedure ViewToDTO(); override;
      procedure DTOToView(); override;
    public
  end;

implementation

{ TFichaUsuario }

function TFichaUsuario.GetCaption: String;
begin
  Result := 'Ficha de Usuário';
end;

function TFichaUsuario.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeUsuario.Create(Self);
  Result := FFrame;
end;

procedure TFichaUsuario.LoadNivelAcessoInComboBox;
var
  v_NivelAcesso: TUsuarioNivelAcesso;
begin
  for v_NivelAcesso := Low(NomeUsuarioNivelAcesso) to High(NomeUsuarioNivelAcesso) do
  begin
    MyFrame.cmbNivelAcesso.Properties.Items.Add(NomeUsuarioNivelAcesso[v_NivelAcesso]);
  end;
end;

function TFichaUsuario.MyController: TControllerUsuario;
begin
  Result := (Self.FController as TControllerUsuario);
end;

function TFichaUsuario.MyDTO: TDTOUsuario;
begin
  Result := (Self.FDTO as TDTOUsuario);
end;

function TFichaUsuario.MyFrame: TframeUsuario;
begin
  Result := (Self.FFrame as TframeUsuario);
end;

procedure TFichaUsuario.SetOnChange;
begin
  inherited;

  with MyFrame do
  begin
    edtLogin.Properties.OnChange := OnChangeMethod;
    edtSenha.Properties.OnChange := OnChangeMethod;
    cmbNivelAcesso.Properties.OnChange := OnChangeMethod;
  end;

end;

function TFichaUsuario.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerUsuario;
end;

function TFichaUsuario.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOUsuario;
end;

procedure TFichaUsuario.DTOToView;
begin
  inherited;
  LoadNivelAcessoInComboBox;

  with MyFrame do
  begin
    edtLogin.Text := MyDTO.Login;
    edtSenha.Text := MyDTO.Senha;
    cmbNivelAcesso.ItemIndex := MyDTO.NivelAcesso;
  end;

end;

procedure TFichaUsuario.ViewToDTO;
begin
  inherited;

  with MyDTO do
  begin
    Login := MyFrame.edtLogin.Text;
    Senha := MyFrame.edtSenha.Text;
    NivelAcesso := MyFrame.cmbNivelAcesso.ItemIndex;
  end;

end;

end.
