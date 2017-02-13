unit ficha.AtividadesSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCurrencyEdit, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dxBar, cxClasses, cxSpinEdit,
  cxTimeEdit, cxMemo, cxTextEdit, cxDropDownEdit, cxCalendar, cxMaskEdit,
  Vcl.StdCtrls, dto.Atividades, controller.Atividades, dto.Criancas,
  dto.Responsaveis, Generics.collections, dto.ValorTempo,
  enum.Atividades.Situacao, Vcl.Menus, cxButtons, viewMessageForm;

type
  TfichaAtividadesSaida = class(TForm)
    lblLogin: TLabel;
    lblNascimento: TLabel;
    lblResponsavel: TLabel;
    lblContato: TLabel;
    lblEmail: TLabel;
    lblDocumento: TLabel;
    lblEntrada: TLabel;
    lblValor: TLabel;
    lblTempoDeServico: TLabel;
    edtNascimento: TcxDateEdit;
    edtContato: TcxTextEdit;
    edtEmail: TcxTextEdit;
    edtDocumento: TcxTextEdit;
    edtObs: TcxMemo;
    edtEntrada: TcxTimeEdit;
    menuFicha: TdxBarManager;
    menuBrowserBar1: TdxBar;
    btnGravar: TdxBarButton;
    btnCancelar: TdxBarButton;
    dxBarButton1: TdxBarButton;
    actFicha: TActionManager;
    actGravar: TAction;
    actCancelar: TAction;
    edtValor: TcxCurrencyEdit;
    edtTempoServico: TcxTimeEdit;
    edtCrianca: TcxTextEdit;
    edtResponsavel: TcxTextEdit;
    lblObs: TLabel;
    lblPrevisaoDeSaida: TLabel;
    edtPrevisaoSaida: TcxTimeEdit;
    lblSaida: TLabel;
    edtSaida: TcxTimeEdit;
    btnDetalhes: TcxButton;
    actDetalhe: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSaidaPropertiesEditValueChanged(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actDetalheExecute(Sender: TObject);
  private
    FDTO : TDTOAtividades;
    FDTOCrianca : TDTOCriancas;
    FDTOResponsavel : TDTOResponsaveis;

    FController : TControllerAtividades;

    procedure ViewToDTO();
    procedure DTOToView();

    procedure AtualizaValor();
  public
    procedure Init(aIDAtividade: TGUID);
  end;

implementation

{$R *.dfm}

{ TfichaAtividadesSaida }

procedure TfichaAtividadesSaida.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfichaAtividadesSaida.actDetalheExecute(Sender: TObject);
begin
  TviewMessage.Send_Information(edtValor.Hint);
end;

procedure TfichaAtividadesSaida.actGravarExecute(Sender: TObject);
begin
  if TviewMessage.Send_Question('Confirma o encerramento desta atividade?') then
  begin
    ViewToDTO;
    if TviewMessage.Send_Question('Deseja imprimir o relatório de encerramento?') then
      FController.ImprimirRelatorio(FDTO);
    ModalResult := mrOk;
  end;
end;

procedure TfichaAtividadesSaida.AtualizaValor;
var
  vTextoRetorno: String;
begin
  Self.FController.CalcularValorDeSaida(FDTO, vTextoRetorno);
  edtValor.Value := Self.FDTO.ValorSaida;
  edtValor.Hint := vTextoRetorno;
  edtValor.ShowHint := True;
end;

procedure TfichaAtividadesSaida.DTOToView;
begin

  Self.FDTOCrianca.ID := Self.FDTO.Id_Crianca;
  Self.FController.Select(Self.FDTOCrianca);

  Self.FDTOResponsavel.ID := Self.FDTO.Id_Responsavel;
  Self.FController.Select(Self.FDTOResponsavel);

  { Atribui os dados da criança }
  edtCrianca.Text := FDTOCrianca.Nome;
  edtNascimento.Date := FDTOCrianca.Nascimento;
  { Atribui os dados do responsavel }
  edtResponsavel.Text := FDTOResponsavel.Nome;
  edtContato.Text := FDTOResponsavel.Contato;
  edtDocumento.Text := FDTOResponsavel.Documento;
  edtEmail.Text := FDTOResponsavel.Email;
  { Atribui os dados da atividade }
  edtObs.Text := FDTO.Obs;
  edtEntrada.Time := FDTO.Entrada;
  edtPrevisaoSaida.Time := FDTO.Entrada + FDTO.Tempo;
  edtSaida.Time := FDTO.TempoSaida;
  edtTempoServico.Time := FDTO.TempoSaida - FDTO.Entrada;
  AtualizaValor();

end;

procedure TfichaAtividadesSaida.edtSaidaPropertiesEditValueChanged(
  Sender: TObject);
begin
  FDTO.TempoSaida := edtSaida.Time;
  edtTempoServico.Time := FDTO.TempoSaida - FDTO.Entrada;
  AtualizaValor;
end;

procedure TfichaAtividadesSaida.FormCreate(Sender: TObject);
begin
  FController := TControllerAtividades.Create;
  FDTO := TDTOAtividades.Create;
  FDTOCrianca := TDTOCriancas.Create;
  FDTOResponsavel := TDTOResponsaveis.Create;
end;

procedure TfichaAtividadesSaida.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FDTO.Free;
  FDTOCrianca.Free;
  FDTOResponsavel.Free;
end;

procedure TfichaAtividadesSaida.Init(aIDAtividade: TGUID);
begin
  with TfichaAtividadesSaida.Create(nil) do
  try
    FDTO.ID := aIDAtividade;
    FController.Select(FDTO);

    {Atualiza DTO para encerramento}
    FDTO.TempoSaida := Time();
    FDTO.Situacao := Integer(tsFinalizado);

    DTOToView;
    ShowModal;

  finally
    Free;
  end;
end;

procedure TfichaAtividadesSaida.ViewToDTO;
begin
  Self.FDTO.Obs := edtObs.Text;
  FController.Update(Self.FDTO);
end;

end.
