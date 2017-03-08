unit ficha.AtividadesEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Atividades,
  controller.Atividades, ORM.controllerBase, frame.Atividades, WLick.ClassHelper,
  Generics.collections, dto.Criancas, dto.Responsaveis, ORM.ViewManager,
  ficha.Criancas, dto.ValorTempo, WLick.Sessao, enum.Atividades.Situacao,
  frame.AtividadesEntrada, WLick.Miscelania, WLick.Constantes, viewMessageForm;

type

  TFichaAtividadesEntrada = class(TORMFichaBase)

    private
      FListaCriancas: TObjectList<TDTOCriancas>;
      FListaResponsaveis: TObjectList<TDTOResponsaveis>;
      FListaValorTempo: TObjectList<TDTOValorTempo>;

      function MyController: TControllerAtividades;
      function MyFrame: TframeAtividadesEntrada;
      function MyDTO: TDTOAtividades;

      procedure LoadCriancasInComboBox;
      procedure LoadResponsaveisInComboBox(const aDTOCrianca: TDTOCriancas);
      procedure LoadValoresTempoInComboBox;

      procedure OnChangeComboCriancas(Sender: TObject);
      procedure OnChangeComboResponsaveis(Sender: TObject);
      procedure OnClickBtnAddCrianca(Sender: TObject);
      procedure OnChangeEdtValor(Sender: TObject);
      procedure OnChangeEdtTempoServico(Sender: TObject);
      procedure OnChangeEdtEntrada(Sender: TObject);

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

procedure TFichaAtividadesEntrada.OnChangeComboCriancas(Sender: TObject);
var
  vDTOCrianca: TDTOCriancas;
begin
  vDTOCrianca := TDTOCriancas(MyFrame.edtCrianca.ItemObject);
  if Assigned(vDTOCrianca) then
  begin

    with MyFrame do
    begin
      edtNascimento.Date := vDTOCrianca.Nascimento;
      imgFotoCrianca.Clear;
      imgFotoCrianca.Picture := TMisc.StringToPicture( vDTOCrianca.Foto );
    end;

    LoadResponsaveisInComboBox(vDTOCrianca);
  end;
end;

procedure TFichaAtividadesEntrada.OnChangeComboResponsaveis(Sender: TObject);
var
  vDTOResponsaveis: TDTOResponsaveis;
begin
  vDTOResponsaveis := TDTOResponsaveis(MyFrame.edtResponsavel.ItemObject);
  if Assigned(vDTOResponsaveis) then
  begin
    with MyFrame do
    begin
      edtContato.Text := vDTOResponsaveis.Contato;
      edtDocumento.Text := vDTOResponsaveis.Documento;
      edtEmail.Text := vDTOResponsaveis.Email;
      imgFotoResponsavel.Clear;
      imgFotoResponsavel.Picture := TMisc.StringToPicture( vDTOResponsaveis.Foto );
    end;
  end;
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

procedure TFichaAtividadesEntrada.OnClickBtnAddCrianca(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreFicha(TFichaCriancas);
  LoadCriancasInComboBox;
end;

function TFichaAtividadesEntrada.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeAtividadesEntrada.Create(Self);
  Result := FFrame;
end;

procedure TFichaAtividadesEntrada.LoadCriancasInComboBox;
var
  vDTO: TDTOCriancas;
  vSelectedDTO: TDTOCriancas;
begin
  vSelectedDTO := nil;
  
  MyController.GetAllCriancas(FListaCriancas);
  if FListaCriancas.Count > 0 then
  try
    MyFrame.edtCrianca.Properties.Items.BeginUpdate;
    MyFrame.edtCrianca.Properties.Items.Clear;

    for vDTO in FListaCriancas do
    begin
      MyFrame.edtCrianca.Properties.Items.AddObject(vDTO.Nome, vDTO);
      if (vDTO.ID = MyDTO.Id_Crianca) then
        vSelectedDTO := vDTO;
    end;

  finally
    if Assigned(vSelectedDTO)
      then MyFrame.edtCrianca.ItemObject := vSelectedDTO;
    MyFrame.edtCrianca.Properties.Items.EndUpdate;
  end;
end;

procedure TFichaAtividadesEntrada.LoadResponsaveisInComboBox(const aDTOCrianca: TDTOCriancas);
var
  vDTO: TDTOResponsaveis;
  vSelectedDTO: TDTOResponsaveis;
begin
  vSelectedDTO := nil;
  if Assigned(aDTOCrianca) and (not aDTOCrianca.ID.IsNull) then
  begin
    MyController.GetResponsaveisByCriancaID(aDTOCrianca.ID, FListaResponsaveis);

    if FListaResponsaveis.Count > 0 then
    try
      MyFrame.edtResponsavel.Properties.Items.BeginUpdate;
      MyFrame.edtResponsavel.Properties.Items.Clear;

      for vDTO in FListaResponsaveis do
      begin
        MyFrame.edtResponsavel.Properties.Items.AddObject(vDTO.Nome, vDTO);
        if (vDTO.ID = MyDTO.Id_Responsavel) then
          vSelectedDTO := vDTO;
      end;

    finally
      if Assigned(vSelectedDTO)
        then MyFrame.edtResponsavel.ItemObject := vSelectedDTO
        else MyFrame.edtResponsavel.ItemObject := FListaResponsaveis.First;
      MyFrame.edtResponsavel.Properties.Items.EndUpdate;
    end;
  end;
  MyFrame.edtResponsavel.Enabled := (FListaResponsaveis.Count > 0);
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
    edtCrianca.Properties.OnEditValueChanged := OnChangeComboCriancas;
    btnAddCrianca.OnClick := OnClickBtnAddCrianca;
    edtResponsavel.Properties.OnEditValueChanged := OnChangeComboResponsaveis;
    edtEntrada.Properties.OnEditValueChanged := OnChangeEdtEntrada;
    edtValor.Properties.OnEditValueChanged := OnChangeEdtValor;
    edtTempoServico.Properties.OnEditValueChanged := OnChangeEdtTempoServico;
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
    if MyDTO.Id_Crianca.IsNull then
    begin
      if vStr <> EmptyWideStr
        then vStr := vStr + CRLF;
      vStr := vStr + 'Informe a criança!';
    end;

    if MyDTO.Id_Responsavel.IsNull then
    begin
      if vStr <> EmptyWideStr
        then vStr := vStr + CRLF;
      vStr := vStr + 'Informe o responsável!';
    end;


    if vStr <> EmptyWideStr then
    begin
      viewMessageForm.TviewMessage.Send_Atencao(vStr);
      FAbort := True;
    end;
  end;
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
  Self.FListaCriancas := TObjectList<TDTOCriancas>.Create();
  Self.FListaResponsaveis := TObjectList<TDTOResponsaveis>.Create();
  Self.FListaValorTempo := TObjectList<TDTOValorTempo>.Create();
end;

procedure TFichaAtividadesEntrada.DestroyAllObjects;
begin
  Self.FListaCriancas.Free;
  Self.FListaResponsaveis.Free;
  Self.FListaValorTempo.Free;
  inherited DestroyAllObjects();
end;

procedure TFichaAtividadesEntrada.DTOToView;
begin
  inherited;
  LoadCriancasInComboBox;
  LoadValoresTempoInComboBox;

  with MyFrame do
  begin
    if (FStatusFicha = sfInsert) 
      then edtEntrada.Time := Time()
      else edtEntrada.Time := MyDTO.Entrada;
    edtObs.Text := MyDTO.Obs;

    edtResponsavel.Enabled := (FListaResponsaveis.Count > 0);
  end;

end;

procedure TFichaAtividadesEntrada.ViewToDTO;
var
  vDTOCrianca : TDTOCriancas;
  vDTOResponsavel : TDTOResponsaveis;
  vDTOValorTempo : TDTOValorTempo;
begin
  inherited;

  vDTOCrianca := TDTOCriancas(MyFrame.edtCrianca.ItemObject);
  vDTOResponsavel := TDTOResponsaveis(MyFrame.edtResponsavel.ItemObject);
  vDTOValorTempo := TDTOValorTempo(MyFrame.edtValor.ItemObject);

  if Assigned(vDTOCrianca) and Assigned(vDTOResponsavel) and Assigned(vDTOValorTempo) then
  begin
    with MyDTO do
    begin
      Id_Crianca     := vDTOCrianca.ID;
      Id_Responsavel := vDTOResponsavel.ID;
      Id_Usuario     := WLick.Sessao.GetInstance.Usuario.ID;
      Obs            := MyFrame.edtObs.Text;
      Entrada        := Trunc(now) + MyFrame.edtEntrada.Time;
      Valor          := vDTOValorTempo.Valor;
      Tempo          := vDTOValorTempo.TempoCalculado;
      Situacao       := Integer(tsIniciado);
    end;
  end;

end;

end.
