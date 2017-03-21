unit ficha.AtividadesEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Atividades,
  controller.Atividades, ORM.controllerBase, frame.Atividades, WLick.ClassHelper,
  Generics.collections, ORM.ViewManager, dto.ValorTempo,
  WLick.Sessao, enum.Atividades.Situacao, frame.AtividadesEntrada,
  WLick.Miscelania, WLick.Constantes, viewMessageForm, MainCamera;

type

  TFichaAtividadesEntrada = class(TORMFichaBase)

    private
      FListaValorTempo: TObjectList<TDTOValorTempo>;

      function MyController: TControllerAtividades;
      function MyFrame: TframeAtividadesEntrada;
      function MyDTO: TDTOAtividades;

      procedure LoadValoresTempoInComboBox;

      procedure OnChangeEdtValor(Sender: TObject);
      procedure OnChangeEdtTempoServico(Sender: TObject);
      procedure OnChangeEdtEntrada(Sender: TObject);

      procedure btnFotoCriancaEvent(Sender: TObject);
      procedure btnFotoCriancaClearEvent(Sender: TObject);
      procedure btnFotoResponsavelEvent(Sender: TObject);
      procedure btnFotoResponsavelClearEvent(Sender: TObject);

      procedure CalculaPrevisaoSaida();

    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;

      procedure SetOnChange(); override;
      procedure SetEvents(); override;

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

      procedure CreateAllObjects(); override;
      procedure DestroyAllObjects(); override;

      procedure OnCancel(); override;
      procedure BeforeSave(); override;
      procedure AfterSave(); override;

      procedure ViewToDTO(); override;
      procedure DTOToView(); override;
    public
  end;

implementation

{ TFichaAtividades }

function TFichaAtividadesEntrada.GetCaption: String;
begin
  Result := 'Atividade';
end;

function TFichaAtividadesEntrada.MyController: TControllerAtividades;
begin
  Result := (Self.FController as TControllerAtividades);
end;

function TFichaAtividadesEntrada.MyDTO: TDTOAtividades;
begin
  Result := (Self.FDTO as TDTOAtividades);
end;

function TFichaAtividadesEntrada.MyFrame: TframeAtividadesEntrada;
begin
  Result := (Self.FFrame as TframeAtividadesEntrada);
end;

procedure TFichaAtividadesEntrada.OnCancel;
begin
  inherited;
  if FAbort
    then Exit;
  ModalResult := mrCancel;
end;

procedure TFichaAtividadesEntrada.OnChangeEdtEntrada(Sender: TObject);
begin
  CalculaPrevisaoSaida();
end;

procedure TFichaAtividadesEntrada.OnChangeEdtTempoServico(Sender: TObject);
var
  vDTO: TDTOValorTempo;
begin
  vDTO := TDTOValorTempo(MyFrame.edtTempoServico.ItemObject);
  if Assigned(vDTO) then
  begin
    with MyFrame do
    begin
      edtValor.ItemObject := vDTO;
    end;
  end;
  CalculaPrevisaoSaida();
end;

procedure TFichaAtividadesEntrada.OnChangeEdtValor(Sender: TObject);
var
  vDTO: TDTOValorTempo;
begin
  vDTO := TDTOValorTempo(MyFrame.edtValor.ItemObject);
  if Assigned(vDTO) then
  begin
    with MyFrame do
    begin
      edtTempoServico.ItemObject := vDTO;
    end;
  end;
end;

function TFichaAtividadesEntrada.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeAtividadesEntrada.Create(Self);
  Result := FFrame;
end;

procedure TFichaAtividadesEntrada.LoadValoresTempoInComboBox;
var
  vDTO: TDTOValorTempo;
  vSelectedDTO: TDTOValorTempo;
begin
  vSelectedDTO := nil;
  MyController.GetAllValoresTempo(FListaValorTempo);
  if FListaValorTempo.Count > 0 then
  try
    MyFrame.edtValor.Properties.Items.BeginUpdate;
    MyFrame.edtValor.Properties.Items.Clear;

    for vDTO in FListaValorTempo do
    begin
      MyFrame.edtValor.Properties.Items.AddObject(FormatCurr('R$ ###,##0.00',vDTO.Valor), vDTO);
      MyFrame.edtTempoServico.Properties.Items.AddObject( FormatDateTime('HH:MM',vDTO.TempoCalculado) , vDTO);
      if (vDTO.Valor = MyDTO.Valor) and (vDTO.TempoCalculado = MyDTO.Tempo) then
        vSelectedDTO := vDTO;
    end;
  finally
    if Assigned(vSelectedDTO)
      then MyFrame.edtValor.ItemObject := vSelectedDTO
      else MyFrame.edtValor.ItemObject := FListaValorTempo.First;
    MyFrame.edtValor.Properties.Items.EndUpdate;
  end;
end;

procedure TFichaAtividadesEntrada.SetEvents;
begin
  inherited;

  with MyFrame do
  begin
    edtEntrada.Properties.OnEditValueChanged := OnChangeEdtEntrada;
    edtValor.Properties.OnEditValueChanged := OnChangeEdtValor;
    edtTempoServico.Properties.OnEditValueChanged := OnChangeEdtTempoServico;

    btnFotoCrianca.OnClick := btnFotoCriancaEvent;
    btnFotoCriancaClear.OnClick := btnFotoCriancaClearEvent;
    btnFotoResponsavel.OnClick := btnFotoResponsavelEvent;
    btnFotoResponsavelClear.OnClick := btnFotoResponsavelClearEvent;
  end;

end;

procedure TFichaAtividadesEntrada.SetOnChange;
begin
  inherited;

  with MyFrame do
  begin
    edtCrianca.Properties.OnChange := OnChangeMethod;
    edtResponsavel.Properties.OnChange := OnChangeMethod;
    edtObs.Properties.OnChange := OnChangeMethod;
    edtEntrada.Properties.OnChange := OnChangeMethod;
    edtTempoServico.Properties.OnChange := OnChangeMethod;
    edtValor.Properties.OnChange := OnChangeMethod;

    edtCrianca.Properties.OnChange := OnChangeMethod;
    edtNascimento.Properties.OnChange := OnChangeMethod;
    edtResponsavel.Properties.OnChange := OnChangeMethod;
    edtDocumento.Properties.OnChange := OnChangeMethod;
    edtEmail.Properties.OnChange := OnChangeMethod;
    edtContato.Properties.OnChange := OnChangeMethod;

    imgFotoCrianca.Properties.OnChange := OnChangeMethod;
    imgFotoResponsavel.Properties.OnChange := OnChangeMethod;
  end;
end;

procedure TFichaAtividadesEntrada.AfterSave;
begin
  if FAbort
    then Exit;
  inherited;
  ModalResult := mrOk;
end;

procedure TFichaAtividadesEntrada.BeforeSave;
var
  vStr: WideString;
begin
  inherited;
  vStr := EmptyWideStr;

  with MyDTO, MyFrame do
  begin
    if MyDTO.Crianca_Nome.IsNull then
    begin
      if vStr <> EmptyWideStr
        then vStr := vStr + CRLF;
      vStr := vStr + 'Favor informar a criança.';
    end;

    if MyDTO.Responsavel_Nome.IsNull then
    begin
      if vStr <> EmptyWideStr
        then vStr := vStr + CRLF;
      vStr := vStr + 'Favor informar o responsável.';
    end;

    if MyDTO.Valor = 0 then
    begin
      if vStr <> EmptyWideStr
        then vStr := vStr + CRLF;
      vStr := vStr + 'Favor informar o valor ou o tempo de serviço.';
    end;

    if vStr <> EmptyWideStr then
    begin
      viewMessageForm.TviewMessage.Send_Atencao(vStr);
      FAbort := True;
    end;
  end;
end;

procedure TFichaAtividadesEntrada.btnFotoCriancaClearEvent(Sender: TObject);
begin
  if TviewMessage.Send_Question('Deseja realmente remover esta imagem?')
    then MyFrame.imgFotoCrianca.Clear;
end;

procedure TFichaAtividadesEntrada.btnFotoCriancaEvent(Sender: TObject);
var
  vImg: String;
begin
  TfichaMainCamera.Init(vImg);
  MyFrame.imgFotoCrianca.Picture := TMisc.StringToPicture(vImg);
end;

procedure TFichaAtividadesEntrada.btnFotoResponsavelClearEvent(Sender: TObject);
begin
  if TviewMessage.Send_Question('Deseja realmente remover esta imagem?')
    then MyFrame.imgFotoResponsavel.Clear;
end;

procedure TFichaAtividadesEntrada.btnFotoResponsavelEvent(Sender: TObject);
var
  vImg: String;
begin
  TfichaMainCamera.Init(vImg);
  MyFrame.imgFotoResponsavel.Picture := TMisc.StringToPicture(vImg);
end;

procedure TFichaAtividadesEntrada.CalculaPrevisaoSaida;
var
  vDTO: TDTOValorTempo;
begin
  with MyFrame do
  begin
    vDTO := TDTOValorTempo(edtTempoServico.ItemObject);
    if Assigned(vDTO) then
    begin
      edtPrevisaoSaida.Time := edtEntrada.Time + vDTO.TempoCalculado;
    end;
  end;
end;

function TFichaAtividadesEntrada.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerAtividades;
end;

function TFichaAtividadesEntrada.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOAtividades;
end;

procedure TFichaAtividadesEntrada.CreateAllObjects;
begin
  inherited CreateAllObjects();
  Self.FListaValorTempo := TObjectList<TDTOValorTempo>.Create();
end;

procedure TFichaAtividadesEntrada.DestroyAllObjects;
begin
  Self.FListaValorTempo.Free;
  inherited DestroyAllObjects();
end;

procedure TFichaAtividadesEntrada.DTOToView;
begin
  LoadValoresTempoInComboBox;

  inherited;

  with MyFrame do
  begin
    if (FStatusFicha = sfInsert)
      then edtEntrada.Time := Time()
      else edtEntrada.Time := MyDTO.Entrada;
    edtObs.Text := MyDTO.Obs;

    edtCrianca.Text := MyDTO.Crianca_Nome;
    if (FStatusFicha = sfInsert)
      then edtNascimento.Date := StrToDate('01/01/1990')
      else edtNascimento.Date := MyDTO.Crianca_Nascimento;

    imgFotoCrianca.Clear;
    imgFotoCrianca.Picture := TMisc.StringToPicture( MyDTO.Crianca_Foto );

    edtResponsavel.Text := MyDTO.Responsavel_Nome;
    edtContato.Text := MyDTO.Responsavel_Contato;
    edtDocumento.Text := MyDTO.Responsavel_Documento;
    edtEmail.Text := MyDTO.Responsavel_Email;

    imgFotoResponsavel.Clear;
    imgFotoResponsavel.Picture := TMisc.StringToPicture( MyDTO.Responsavel_Foto );

  end;

end;

procedure TFichaAtividadesEntrada.ViewToDTO;
var
  vDTOValorTempo : TDTOValorTempo;
begin
  inherited;

  vDTOValorTempo := TDTOValorTempo(MyFrame.edtValor.ItemObject);

  with MyDTO do
  begin

    if Assigned(vDTOValorTempo) then
    begin
      Valor          := vDTOValorTempo.Valor;
      Tempo          := vDTOValorTempo.TempoCalculado;
    end;

    Id_Usuario     := WLick.Sessao.GetInstance.Usuario.ID;
    Obs            := MyFrame.edtObs.Text;
    Entrada        := Trunc(now) + MyFrame.edtEntrada.Time;
    Situacao       := Integer(tsIniciado);
    if (FStatusFicha = sfInsert)
      then DataInsert := WLick.Sessao.GetInstance.DataProcesso;

    Crianca_Nome := MyFrame.edtCrianca.Text;
    Crianca_Nascimento := MyFrame.edtNascimento.Date;
    Crianca_Foto := TMisc.PictureToString( MyFrame.imgFotoCrianca.Picture );

    Responsavel_Nome := MyFrame.edtResponsavel.Text;
    Responsavel_Documento := MyFrame.edtDocumento.Text;
    Responsavel_Contato := MyFrame.edtContato.Text;
    Responsavel_Email := MyFrame.edtEmail.Text;
    Responsavel_Foto := TMisc.PictureToString( MyFrame.imgFotoResponsavel.Picture );
  end;

end;

end.
