unit ficha.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Usuarios,
  controller.Usuarios, ORM.controllerBase, frame.Usuario;

type

  TFichaUsuario = class(TORMFichaBase)
  private
    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;

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

procedure TFichaUsuario.SetOnChange;
begin
  inherited;

  with (FFrame as TframeUsuario) do
  begin
    edtLogin.OnChange := OnChangeMethod;
    edtSenha.OnChange := OnChangeMethod;
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

  with (FFrame as TframeUsuario) do
  begin
    edtLogin.Text := TDTOUsuario(Self.FDTO).Login;
    edtSenha.Text := TDTOUsuario(Self.FDTO).Senha;
  end;

end;

procedure TFichaUsuario.ViewToDTO;
begin
  inherited;

  with TDTOUsuario(Self.FDTO) do
  begin
    Login := (GetFrame as TframeUsuario).edtLogin.Text;
    Senha := (GetFrame as TframeUsuario).edtSenha.Text;
  end;

end;

end.
