unit ficha.Atividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Atividades,
  controller.Atividades, ORM.controllerBase, frame.Atividades, WLick.ClassHelper,
  Generics.collections, dto.Criancas, dto.Responsaveis, ORM.ViewManager,
  ficha.Criancas, dto.ValorTempo, WLick.Sessao, enum.Atividades.Situacao;

type

  TFichaAtividades = class(TORMFichaBase)

    private
      FListaCriancas: TObjectList<TDTOCriancas>;
      FListaResponsaveis: TObjectList<TDTOResponsaveis>;
      FListaValorTempo: TObjectList<TDTOValorTempo>;

      function MyController: TControllerAtividades;
      function MyFrame: TframeAtividades;
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

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

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
  Result := 'Nova atividade';
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

procedure TFichaAtividades.OnChangeComboCriancas(Sender: TObject);
var
  vDTOCrianca: TDTOCriancas;
begin
  vDTOCrianca := TDTOCriancas(MyFrame.edtCrianca.ItemObject);
  if Assigned(vDTOCrianca) then
  begin

    with MyFrame do
    begin
      edtNascimento.Date := vDTOCrianca.Nascimento;
    end;

    LoadResponsaveisInComboBox(vDTOCrianca);
  end;
end;

procedure TFichaAtividades.OnChangeComboResponsaveis(Sender: TObject);
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
    end;
  end;
end;

procedure TFichaAtividades.OnChangeEdtEntrada(Sender: TObject);
begin
  CalculaPrevisaoSaida();
end;

procedure TFichaAtividades.OnChangeEdtTempoServico(Sender: TObject);
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

procedure TFichaAtividades.OnChangeEdtValor(Sender: TObject);
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

procedure TFichaAtividades.OnClickBtnAddCrianca(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreFicha(TFichaCriancas);
  LoadCriancasInComboBox;
end;

function TFichaAtividades.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeAtividades.Create(Self);
  Result := FFrame;
end;

procedure TFichaAtividades.LoadCriancasInComboBox;
var
  vDTO: TDTOCriancas;
begin
  MyController.GetAllCriancas(FListaCriancas);
  if FListaCriancas.Count > 0 then
  try
    MyFrame.edtCrianca.Properties.Items.BeginUpdate;
    MyFrame.edtCrianca.Properties.Items.Clear;

    for vDTO in FListaCriancas do
      MyFrame.edtCrianca.Properties.Items.AddObject(vDTO.Nome, vDTO);

  finally
    MyFrame.edtCrianca.Properties.Items.EndUpdate;
  end;
end;

procedure TFichaAtividades.LoadResponsaveisInComboBox(const aDTOCrianca: TDTOCriancas);
var
  vDTO: TDTOResponsaveis;
begin
  if Assigned(aDTOCrianca) and (not aDTOCrianca.ID.IsNull) then
  begin
    MyController.GetResponsaveisByCriancaID(aDTOCrianca.ID, FListaResponsaveis);

    if FListaResponsaveis.Count > 0 then
    try
      MyFrame.edtResponsavel.Properties.Items.BeginUpdate;
      MyFrame.edtResponsavel.Properties.Items.Clear;

      for vDTO in FListaResponsaveis do
        MyFrame.edtResponsavel.Properties.Items.AddObject(vDTO.Nome, vDTO);

    finally
      MyFrame.edtResponsavel.ItemObject := FListaResponsaveis.First;
      MyFrame.edtResponsavel.Properties.Items.EndUpdate;
    end;
  end;
  MyFrame.edtResponsavel.Enabled := (FListaResponsaveis.Count > 0);
end;

procedure TFichaAtividades.LoadValoresTempoInComboBox;
var
  vDTO: TDTOValorTempo;
  vHora, vMinuto: Integer;
begin
  MyController.GetAllValoresTempo(FListaValorTempo);
  if FListaValorTempo.Count > 0 then
  try
    MyFrame.edtValor.Properties.Items.BeginUpdate;
    MyFrame.edtValor.Properties.Items.Clear;

    for vDTO in FListaValorTempo do
    begin
      MyFrame.edtValor.Properties.Items.AddObject(FormatCurr('R$ ###,##0.00',vDTO.Valor), vDTO);
      MyFrame.edtTempoServico.Properties.Items.AddObject( FormatDateTime('HH:MM',vDTO.TempoCalculado) , vDTO);
    end;
  finally
    MyFrame.edtValor.Properties.Items.EndUpdate;
  end;
end;

procedure TFichaAtividades.SetOnChange;
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

procedure TFichaAtividades.CalculaPrevisaoSaida;
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
  Self.FListaCriancas := TObjectList<TDTOCriancas>.Create();
  Self.FListaResponsaveis := TObjectList<TDTOResponsaveis>.Create();
  Self.FListaValorTempo := TObjectList<TDTOValorTempo>.Create();
end;

procedure TFichaAtividades.DestroyAllObjects;
begin
  Self.FListaCriancas.Free;
  Self.FListaResponsaveis.Free;
  Self.FListaValorTempo.Free;
  inherited DestroyAllObjects();
end;

procedure TFichaAtividades.DTOToView;
begin
  inherited;
  LoadCriancasInComboBox;
  LoadValoresTempoInComboBox;

  with MyFrame do
  begin
    edtEntrada.Time := Time();
    edtResponsavel.Enabled := (FListaResponsaveis.Count > 0);
  end;

end;

procedure TFichaAtividades.ViewToDTO;
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
      Entrada        := MyFrame.edtEntrada.Time;
      Valor          := vDTOValorTempo.Valor;
      Tempo          := vDTOValorTempo.TempoCalculado;
      Situacao       := Integer(tsIniciado);
    end;
  end;

end;

end.
