unit ficha.Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Configuracoes,
  controller.Configuracoes, ORM.controllerBase, frame.Configuracoes, WLick.ClassHelper,
  Generics.collections, WLick.Sessao, enum.Configuracoes,
  assembler.Configuracoes, IniFiles, VFrames, viewMessageForm, WLick.Miscelania;

type

  TFichaConfiguracoes = class(TORMFichaBase)

    private
      FListaConfiguracoes: TObjectList<TDTOConfiguracoes>;

      function MyController: TControllerConfiguracoes;
      function MyFrame: TframeConfiguracoes;
      function MyDTO: TDTOConfiguracoes;

      procedure LoadAllConfiguracoes();
      procedure LoadCamerasDevices();
      procedure SetEvents; override;

      procedure btnCarregarEvent(Sender: TObject);
      procedure btnLimparEvent(Sender: TObject);

    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;

      procedure SetOnChange(); override;

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

      procedure CreateAllObjects(); override;
      procedure DestroyAllObjects(); override;

      procedure ViewToDTO(); override;
      procedure DTOToView(); override;

      procedure InternalDTOToView(vDTO: TDTOConfiguracoes);
      procedure InternalViewToDTO(vConfig: TNomeConfiguracoes);
    public
  end;

implementation

{ TFichaConfiguracoes }

function TFichaConfiguracoes.GetCaption: String;
begin
  Result := 'Configurações';
end;

function TFichaConfiguracoes.MyController: TControllerConfiguracoes;
begin
  Result := (Self.FController as TControllerConfiguracoes);
end;

function TFichaConfiguracoes.MyDTO: TDTOConfiguracoes;
begin
  Result := (Self.FDTO as TDTOConfiguracoes);
end;

function TFichaConfiguracoes.MyFrame: TframeConfiguracoes;
begin
  Result := (Self.FFrame as TframeConfiguracoes);
end;

function TFichaConfiguracoes.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeConfiguracoes.Create(Self);
  Result := FFrame;
end;

procedure TFichaConfiguracoes.InternalDTOToView(vDTO: TDTOConfiguracoes);
var
  vConfig: TNomeConfiguracoes;
  vValorBinario, vValor: String;
begin
  vValor := vDTO.Valor;
  vValorBinario := vDTO.ValorBinario;
  vConfig := LocateConfiguracaoByNome(vDTO.Configuracao);
  case vConfig of
    tncNaoEncontrado: ;
    tncCotacaoMinuto: MyFrame.edtValorPorMinuto.Value := vValor.ToCurrency;
    tncTempoTolerancia: MyFrame.edtTolerancia.Time := vValor.ToTime;
    tncLogotipo: begin
      if vValorBinario <> EmptyStr then
        MyFrame.ImgFoto.Picture := TMisc.StringToPicture( vValorBinario );
    end;
  end;
end;

procedure TFichaConfiguracoes.InternalViewToDTO(vConfig: TNomeConfiguracoes);
var
  vDTO: TDTOConfiguracoes;
  vDTOPersist: TDTOConfiguracoes;
  vValorBinario, vValor: String;
begin
  vDTOPersist := nil;

  for vDTO in FListaConfiguracoes do
  begin
    if vDTO.Configuracao = NomeConfiguracoes[vConfig] then
    begin
      with TAssemblerConfiguracoes.GetAssembler(vDTO.AssemblerClass) do
      try
        vDTOPersist := TDTOConfiguracoes(GetClone(vDTO));
        Break
      finally
        Free;
      end;
    end;
  end;

  if not Assigned(vDTOPersist) then
  begin
    vDTOPersist := TDTOConfiguracoes.Create;
    vDTOPersist.Configuracao := NomeConfiguracoes[vConfig];
  end;

  vValor := EmptyStr;
  vValorBinario := EmptyStr;

  case vConfig of
    tncNaoEncontrado: ;
    tncCotacaoMinuto: vValor := MyFrame.edtValorPorMinuto.Value.ToString;
    tncTempoTolerancia: vValor := MyFrame.edtTolerancia.Time.ToString;
    tncLogotipo: vValorBinario :=  TMisc.PictureToString( MyFrame.ImgFoto.Picture );
  end;

  vDTOPersist.Valor := vValor;
  vDTOPersist.ValorBinario := vValorBinario;

  if vDTOPersist.ID.IsNull
    then MyController.Insert(vDTOPersist)
    else MyController.Update(vDTOPersist);

end;

procedure TFichaConfiguracoes.LoadAllConfiguracoes;
begin
  MyController.GetAllConfiguracoes(FListaConfiguracoes);
end;

procedure TFichaConfiguracoes.LoadCamerasDevices;
var
  vDeviceList: TStringList;
  vVideoImage: TVideoImage;
begin
  vVideoImage := TVideoImage.Create;
  try
    vDeviceList := TStringList.Create;
    try
      vVideoImage.GetListOfDevices(vDeviceList);
      MyFrame.grpCameraDefault.Properties.Items := vDeviceList;
    finally
      vDeviceList.Free;
    end;
  finally
    vVideoImage.Free;
  end;
end;

procedure TFichaConfiguracoes.SetEvents;
begin
  inherited;

  with MyFrame do
  begin
    btnLoad.OnClick := btnCarregarEvent;
    btnClear.OnClick := btnLimparEvent;
  end;

end;

procedure TFichaConfiguracoes.SetOnChange;
begin
  inherited;
  with MyFrame do
  begin
    edtValorPorMinuto.Properties.OnChange := OnChangeMethod;
    edtTolerancia.Properties.OnChange := OnChangeMethod;
    ImgFoto.Properties.OnChange := OnChangeMethod;
    grpCameraDefault.Properties.OnChange := OnChangeMethod;
    MyFrame.edtLogin.Properties.OnChange := OnChangeMethod;
    MyFrame.edtSenha.Properties.OnChange := OnChangeMethod;
  end;
end;

procedure TFichaConfiguracoes.btnCarregarEvent(Sender: TObject);
var
  vDlgImage: TOpenDialog;
begin
  vDlgImage := TOpenDialog.Create(nil);
  try
    vDlgImage.Filter := 'All(*.JPG;*.JPEG)|*.JPG;*.JPEG';

    if vDlgImage.Execute() then
    begin
      MyFrame.ImgFoto.Picture.LoadFromFile(vDlgImage.FileName);
    end;
  finally
    vDlgImage.Free;
  end;
end;

procedure TFichaConfiguracoes.btnLimparEvent(Sender: TObject);
begin
  if TviewMessage.Send_Question('Deseja realmente remover esta imagem?')
    then MyFrame.ImgFoto.Clear;
end;

function TFichaConfiguracoes.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerConfiguracoes;
end;

function TFichaConfiguracoes.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOConfiguracoes;
end;

procedure TFichaConfiguracoes.CreateAllObjects;
begin
  inherited CreateAllObjects();
  Self.FListaConfiguracoes := TObjectList<TDTOConfiguracoes>.Create();
end;

procedure TFichaConfiguracoes.DestroyAllObjects;
begin
  Self.FListaConfiguracoes.Free;
  inherited DestroyAllObjects();
end;

procedure TFichaConfiguracoes.DTOToView;
var
  vDTO: TDTOConfiguracoes;
  ArquivoINI: TIniFile;
const
  cTagName = 'Configuracao';
  cTagNameSessao = 'Sessao';
begin
  inherited;
  LoadAllConfiguracoes;
  LoadCamerasDevices;

  for vDTO in FListaConfiguracoes do
  begin
    InternalDTOToView(vDTO);
  end;

  ArquivoINI := TIniFile.Create( ExtractFilePath(Application.ExeName) + '\conexao.ini' );
  try
    MyFrame.grpCameraDefault.ItemIndex := MyFrame.grpCameraDefault.Properties.Items.IndexOf(ArquivoINI.ReadString(cTagName, 'CameraDefault',''));

    {Senha padrão}
    MyFrame.edtLogin.Text := ArquivoINI.ReadString(cTagNameSessao, 'usuario','');
    MyFrame.edtSenha.Text := TMisc.Decrypt(ArquivoINI.ReadString(cTagNameSessao, 'senha',''));
  finally
    ArquivoINI.Free;
  end;

  MyFrame.pgConfiguracao.ActivePageIndex := 0;

end;

procedure TFichaConfiguracoes.ViewToDTO;
var
  vConfig: TNomeConfiguracoes;
  ArquivoINI: TIniFile;
const
  cTagName = 'Configuracao';
  cTagNameSessao = 'Sessao';
begin
  inherited;

  for vConfig := Low(NomeConfiguracoes) to High(NomeConfiguracoes) do
  begin
    if vConfig <> tncNaoEncontrado then
      InternalViewToDTO(vConfig);
  end;

  ArquivoINI := TIniFile.Create( ExtractFilePath(Application.ExeName) + '\conexao.ini' );
  try
    ArquivoINI.WriteString(cTagName, 'CameraDefault',MyFrame.grpCameraDefault.Text);

    {Senha padrão}
    ArquivoINI.WriteString(cTagNameSessao, 'usuario',MyFrame.edtLogin.Text);
    ArquivoINI.WriteString(cTagNameSessao, 'senha', TMisc.Encrypt(MyFrame.edtSenha.Text));
  finally
    ArquivoINI.Free;
  end;

end;

end.
