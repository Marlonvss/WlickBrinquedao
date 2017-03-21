unit ficha.Atividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Atividades,
  controller.Atividades, ORM.controllerBase, frame.Atividades, WLick.ClassHelper,
  Generics.collections, ORM.ViewManager, dto.ValorTempo, WLick.Sessao,
  enum.Atividades.Situacao, viewMessageForm, WLick.Miscelania, DMRelatorio, WLick.Types;

type

  TFichaAtividades = class(TORMFichaBase)

    private

      FEncerrandoAtividade: Boolean;

      function MyController: TControllerAtividades;
      function MyFrame: TframeAtividades;
      function MyDTO: TDTOAtividades;

      procedure AtualizaValor;

      procedure OnEdtSaidaChange(Sender: TObject);
      procedure OnBtnDetalheClick(Sender: TObject);

    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

      procedure SetOnChange(); override;
      procedure SetEvents(); override;

      procedure BeforeCancel(); override;
      procedure AfterSave(); override;

      procedure CreateAllObjects(); override;
      procedure DestroyAllObjects(); override;

      procedure ViewToDTO(); override;
      procedure DTOToView(); override;
    public
  end;

implementation

{ TFichaAtividades }

function TFichaAtividades.GetCaption: String;
begin
  Result := 'Atividade';
end;

function TFichaAtividades.MyController: TControllerAtividades;
begin
  Result := (Self.FController as TControllerAtividades);
end;

function TFichaAtividades.MyDTO: TDTOAtividades;
begin
  Result := (Self.FDTO as TDTOAtividades);
end;

function TFichaAtividades.MyFrame: TframeAtividades;
begin
  Result := (Self.FFrame as TframeAtividades);
end;

procedure TFichaAtividades.SetEvents;
begin
  inherited;
  with MyFrame do
  begin
    edtSaida.Properties.OnEditValueChanged := OnEdtSaidaChange;
    btnDetalhes.OnClick := OnBtnDetalheClick;
  end;

end;

procedure TFichaAtividades.SetOnChange;
begin
  inherited;

end;

function TFichaAtividades.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeAtividades.Create(Self);
  Result := FFrame;
end;

procedure TFichaAtividades.BeforeCancel;
begin
  inherited;
  if FStatusFicha = sfEdit
    then FStatusFicha := sfView;
end;

procedure TFichaAtividades.OnBtnDetalheClick(Sender: TObject);
begin
  TviewMessage.Send_Information(MyFrame.edtValor.Hint);
end;

function TFichaAtividades.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerAtividades;
end;

function TFichaAtividades.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOAtividades;
end;

procedure TFichaAtividades.CreateAllObjects;
begin
  inherited CreateAllObjects();
end;

procedure TFichaAtividades.DestroyAllObjects;
begin
  inherited DestroyAllObjects();
end;

procedure TFichaAtividades.DTOToView;
begin
  {Atualiza DTO para encerramento}
  FEncerrandoAtividade := MyDTO.Situacao <> Integer(tsFinalizado);
  if FEncerrandoAtividade
    then MyDTO.Saida := Time();
  MyDTO.Situacao := Integer(tsFinalizado);

  inherited;
  { Atribui os dados da crian�a }
  MyFrame.edtCrianca.Text := MyDTO.Crianca_Nome;
  MyFrame.edtNascimento.Date := MyDTO.Crianca_Nascimento;
  MyFrame.imgFotoCrianca.Clear;
  MyFrame.imgFotoCrianca.Picture := TMisc.StringToPicture( MyDTO.Crianca_Foto );
  { Atribui os dados do responsavel }
  MyFrame.edtResponsavel.Text := MyDTO.Responsavel_Nome;
  MyFrame.edtContato.Text := MyDTO.Responsavel_Contato;
  MyFrame.edtDocumento.Text := MyDTO.Responsavel_Documento;
  MyFrame.edtEmail.Text := MyDTO.Responsavel_Email;
  MyFrame.imgFotoResponsavel.Clear;
  MyFrame.imgFotoResponsavel.Picture := TMisc.StringToPicture( MyDTO.Responsavel_Foto );
  { Atribui os dados da atividade }
  MyFrame.edtObs.Text := MyDTO.Obs;
  MyFrame.edtEntrada.Time := MyDTO.Entrada;
  MyFrame.edtPrevisaoSaida.Time := MyDTO.Entrada + MyDTO.Tempo;
  MyFrame.edtSaida.Time := MyDTO.Saida;
  MyFrame.edtTempoServico.Time := MyDTO.Saida - MyDTO.Entrada;
  AtualizaValor();

  MyFrame.edtObs.Enabled := FEncerrandoAtividade;
  MyFrame.edtSaida.Enabled := FEncerrandoAtividade;

  if FEncerrandoAtividade
    then FStatusFicha := sfEdit;

end;

procedure TFichaAtividades.OnEdtSaidaChange(Sender: TObject);
begin
  MyDTO.Saida := MyFrame.edtSaida.Time;
  MyFrame.edtTempoServico.Time := MyDTO.Saida - MyDTO.Entrada;
  AtualizaValor;
end;

procedure TFichaAtividades.ViewToDTO;
begin
  MyDTO.Obs := MyFrame.edtObs.Text;
  FController.Update(MyDTO);
end;

procedure TFichaAtividades.AfterSave;
begin
  inherited;
  if viewMessageForm.TviewMessage.Send_Question('Deseja imprimir o relat�rio?')
    then DMRelatorio.TDMReport.PrintReport(trtFichaAtividade,[MyDTO.ID.ToString]);
end;

procedure TfichaAtividades.AtualizaValor;
var
  vTextoRetorno: String;
begin
  MyController.CalcularValorDeSaida(TDTOAtividades(FDTO), vTextoRetorno);
  MyFrame.edtValor.Value := MyDTO.ValorSaida;
  MyFrame.edtValor.Hint := vTextoRetorno;
  MyFrame.edtValor.ShowHint := True;
end;

end.
