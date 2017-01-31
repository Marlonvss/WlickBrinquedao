unit ficha.Criancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Criancas,
  controller.Criancas, ORM.controllerBase, frame.Criancas;

type

  TFichaCriancas = class(TORMFichaBase)
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

{ TFichaCriancas }

function TFichaCriancas.GetCaption: String;
begin
  Result := 'Ficha de Usuário';
end;

function TFichaCriancas.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeCriancas.Create(Self);
  Result := FFrame;
end;

procedure TFichaCriancas.SetOnChange;
begin
  inherited;

  with (FFrame as TframeCriancas) do
  begin
    edtCodigo.Properties.OnChange := OnChangeMethod;
    edtNome.Properties.OnChange := OnChangeMethod;
    edtNascimento.Properties.OnChange := OnChangeMethod;
    edtResponsavelNome.Properties.OnChange := OnChangeMethod;
    edtResponsavelEmail.Properties.OnChange := OnChangeMethod;
    edtResponsavelContato.Properties.OnChange := OnChangeMethod;
    edtResponsavelDocumento.Properties.OnChange := OnChangeMethod;
  end;

end;

function TFichaCriancas.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerCriancas;
end;

function TFichaCriancas.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOCriancas;
end;

procedure TFichaCriancas.DTOToView;
begin
  inherited;

  with (FFrame as TframeCriancas) do
  begin
    edtCodigo.Text := TDTOCriancas(Self.FDTO).Codigo;
    edtNome.Text := TDTOCriancas(Self.FDTO).Nome;
    edtNascimento.Date := TDTOCriancas(Self.FDTO).Nascimento;
    edtResponsavelNome.Text := TDTOCriancas(Self.FDTO).ResponsavelNome;
    edtResponsavelEmail.Text := TDTOCriancas(Self.FDTO).ResponsavelEmail;
    edtResponsavelContato.Text := TDTOCriancas(Self.FDTO).ResponsavelContato;
    edtResponsavelDocumento.Text := TDTOCriancas(Self.FDTO).ResponsavelDocumento;
  end;

end;

procedure TFichaCriancas.ViewToDTO;
begin
  inherited;

  with TDTOCriancas(Self.FDTO) do
  begin
    Codigo := (GetFrame as TframeCriancas).edtCodigo.Text;
    Nome := (GetFrame as TframeCriancas).edtNome.Text;
    Nascimento := (GetFrame as TframeCriancas).edtNascimento.Date;
    ResponsavelNome := (GetFrame as TframeCriancas).edtResponsavelNome.Text;
    ResponsavelEmail := (GetFrame as TframeCriancas).edtResponsavelEmail.Text;
    ResponsavelContato := (GetFrame as TframeCriancas).edtResponsavelContato.Text;
    ResponsavelDocumento := (GetFrame as TframeCriancas).edtResponsavelDocumento.Text;
  end;

end;

end.
