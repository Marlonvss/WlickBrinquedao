unit ficha.Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Configuracoes,
  controller.Configuracoes, ORM.controllerBase, frame.Configuracoes, WLick.ClassHelper,
  Generics.collections, WLick.Sessao, enum.Configuracoes,
  assembler.Configuracoes, IniFiles, VFrames;

type

  TFichaConfiguracoes = class(TORMFichaBase)

    private
      FListaConfiguracoes: TObjectList<TDTOConfiguracoes>;

      function MyController: TControllerConfiguracoes;
      function MyFrame: TframeConfiguracoes;
      function MyDTO: TDTOConfiguracoes;

      procedure LoadAllConfiguracoes();
      procedure LoadCamerasDevices();
      procedure SetEvents;

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
  vValor: String;
begin
  vValor := vDTO.Valor;
  vConfig := LocateConfiguracaoByNome(vDTO.Configuracao);
  case vConfig of
    tncNaoEncontrado: ;
    tncCotacaoMinuto: MyFrame.edtValorPorMinuto.Value := vValor.ToCurrency;
    tncTempoTolerancia: MyFrame.edtTolerancia.Time := vValor.ToTime;
  end;
end;

procedure TFichaConfiguracoes.InternalViewToDTO(vConfig: TNomeConfiguracoes);
var
  vDTO: TDTOConfiguracoes;
  vDTOPersist: TDTOConfiguracoes;
  vValor: String;
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

  case vConfig of
    tncNaoEncontrado: ;
    tncCotacaoMinuto: vValor := MyFrame.edtValorPorMinuto.Value.ToString;
    tncTempoTolerancia: vValor := MyFrame.edtTolerancia.Time.ToString;
  end;

  vDTOPersist.Valor := vValor;
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
  end;

end;

procedure TFichaConfiguracoes.SetOnChange;
begin
  inherited;
  with MyFrame do
  begin
    edtValorPorMinuto.Properties.OnChange := OnChangeMethod;
    edtTolerancia.Properties.OnChange := OnChangeMethod;
    grpCameraDefault.Properties.OnChange := OnChangeMethod;
  end;
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
  finally
    ArquivoINI.Free;
  end;

  MyFrame.pgConfiguracao.ActivePage := MyFrame.tsAtividades;

end;

procedure TFichaConfiguracoes.ViewToDTO;
var
  vConfig: TNomeConfiguracoes;
  ArquivoINI: TIniFile;
const
  cTagName = 'Configuracao';
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
  finally
    ArquivoINI.Free;
  end;

end;

end.
