unit ficha.ValorTempo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.ValorTempo,
  controller.ValorTempo, ORM.controllerBase, frame.ValorTempo, WLick.ClassHelper;

type

  TFichaValorTempo = class(TORMFichaBase)
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

{ TFichaValorTempo }

function TFichaValorTempo.GetCaption: String;
begin
  Result := 'Ficha de Usuário';
end;

function TFichaValorTempo.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeValorTempo.Create(Self);
  Result := FFrame;
end;

procedure TFichaValorTempo.SetOnChange;
begin
  inherited;

  with (FFrame as TframeValorTempo) do
  begin
    edtValor.Properties.OnChange := OnChangeMethod;
    edtTempo.Properties.OnChange := OnChangeMethod;
  end;

end;

function TFichaValorTempo.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerValorTempo;
end;

function TFichaValorTempo.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOValorTempo;
end;

procedure TFichaValorTempo.DTOToView;
begin
  inherited;

  with (FFrame as TframeValorTempo) do
  begin
    edtValor.Value := TDTOValorTempo(Self.FDTO).Valor;
    edtTempo.Value := TDTOValorTempo(Self.FDTO).Tempo;
  end;

end;

procedure TFichaValorTempo.ViewToDTO;
begin
  inherited;

  with TDTOValorTempo(Self.FDTO) do
  begin
    Valor := (GetFrame as TframeValorTempo).edtValor.Value;
    Tempo := (GetFrame as TframeValorTempo).edtTempo.Value;
  end;

end;

end.
