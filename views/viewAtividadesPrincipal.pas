unit viewAtividadesPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ORM.images,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxGroupBox, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  cxTimeEdit, Vcl.Menus, DBAccess, Uni, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, MemDS, ORM.Connection, cxLabel, cxButtons, cxTextEdit,
  ORM.ViewManager, ficha.Atividades, WLick.ClassHelper, dxLayoutContainer,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxCurrencyEdit, ficha.AtividadesEntrada, cxMemo, DMRelatorio, WLick.Types,
  dxBarBuiltInMenu, cxPC, WLick.Miscelania, enum.Atividades.Situacao, cxImage,
  cxButtonEdit, brinquedao.Images, dxGDIPlusClasses, UniProvider, Jpeg,
  PostgreSQLUniProvider, dto.Configuracoes, controller.Configuracoes;

type
  TfrmAtividades = class(TForm)
    ActManager: TActionManager;
    actNovo: TAction;
    actFinalizar: TAction;
    uniPrincipal: TUniQuery;
    dsPrincipal: TDataSource;
    menu: TPopupMenu;
    Finalizaratividade1: TMenuItem;
    TimerRefresh: TTimer;
    TimerHora: TTimer;
    actVisualizar: TAction;
    Visualizar1: TMenuItem;
    pnlTop: TPanel;
    lblHora: TLabel;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    edtBusca: TcxTextEdit;
    cxButton1: TcxButton;
    grdAtividade: TcxGrid;
    grdAtividadeDBLayoutView3DBLayoutViewItem1: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem2: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem3: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem4: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem5: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem6: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem7: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem8: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem10: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem11: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem12: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem13: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem14: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3Group_Root: TdxLayoutGroup;
    grdAtividadeLevel1: TcxGridLevel;
    N1: TMenuItem;
    actImprimir: TAction;
    Imprimir1: TMenuItem;
    uniPrincipalid: TGuidField;
    uniPrincipalobs: TStringField;
    uniPrincipalentrada: TTimeField;
    uniPrincipalvalor: TFloatField;
    uniPrincipaltempo: TTimeField;
    uniPrincipalsituacao: TSmallintField;
    uniPrincipalprevisao: TTimeField;
    uniPrincipalcrianca_nome: TStringField;
    uniPrincipalcrianca_nascimento: TDateTimeField;
    uniPrincipalcrianca_foto: TBlobField;
    uniPrincipalresponsavel_nome: TStringField;
    uniPrincipalresponsavel_documento: TStringField;
    uniPrincipalresponsavel_contato: TStringField;
    imgLupa: TImage;
    imgBotao: TcxImage;
    uniPrincipalbotao: TBlobField;
    procedure actFinalizarExecute(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure TimerHoraTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaPropertiesChange(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure grdAtividadeDBLayoutView3CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    procedure StopAutoRefresh();
    procedure StartAutoRefresh();

    procedure AtualizaImagem;

    procedure AtualizaHora();
  public
  end;

implementation

{$R *.dfm}

procedure TfrmAtividades.actFinalizarExecute(Sender: TObject);
begin
  if not uniPrincipal.FieldByName('id').AsGuid.IsNull then
  try
    StopAutoRefresh;
    with TFichaAtividades.Create(nil) do
    try
      Init(uniPrincipal.FieldByName('id').AsGuid);
      TimerRefreshTimer(Sender);
    finally
      Free;
    end;
  finally
    StartAutoRefresh;
  end;
end;

procedure TfrmAtividades.actImprimirExecute(Sender: TObject);
begin
  if not uniPrincipal.FieldByName('id').AsGuid.IsNull then
    DMRelatorio.TDMReport.PrintReport(trtFichaAtividade,[uniPrincipal.FieldByName('id').AsGuid.ToString]);
end;

procedure TfrmAtividades.actNovoExecute(Sender: TObject);
begin
  StopAutoRefresh;
  try
    with TFichaAtividadesEntrada.Create(nil) do
    try
      Init(TFuncoesGUID.NullGUID, True);
      TimerRefreshTimer(Sender)
    finally
      Free;
    end;
  finally
    StartAutoRefresh;
  end;
end;

procedure TfrmAtividades.actVisualizarExecute(Sender: TObject);
begin
  if not uniPrincipal.FieldByName('id').AsGuid.IsNull then
  try
    StopAutoRefresh;
    with TFichaAtividadesEntrada.Create(nil) do
    try
      Init(uniPrincipal.FieldByName('id').AsGuid, false);
      TimerRefreshTimer(Sender);
    finally
      Free;
    end;
  finally
    StartAutoRefresh;
  end;
end;

procedure TfrmAtividades.AtualizaHora;
begin
  lblHora.Caption := FormatDateTime('HH:MM:SS',Now);
end;

procedure TfrmAtividades.AtualizaImagem;
var
  Str: String;
  Config: TDTOConfiguracoes;
begin
  Str := 'DELETE FROM CONFIGURACOES WHERE CONFIGURACAO = ''Atividade''';
  ORM.Connection.GetInstance.DataBase.ExecSQL(Str);

  With TControllerConfiguracoes.Create do
  try
    Config := TDTOConfiguracoes.Create;
    Config.Configuracao := 'Atividade';
    Config.ValorBinario := TMisc.PictureToString(imgBotao.Picture);
    Insert(Config);
  finally
    Config.Free;
    Free;
  end;
end;

procedure TfrmAtividades.grdAtividadeDBLayoutView3CellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if grdAtividadeDBLayoutView3DBLayoutViewItem10.Focused then
  begin
    actFinalizarExecute(Sender);
    Abort; {T - Abortar para não continuar com os processos internos do componente evitando assim o AcessViolation}
  end;
end;

procedure TfrmAtividades.edtBuscaPropertiesChange(Sender: TObject);
var
  vFind : String;
begin
  vFind := edtBusca.Text;
  if (vFind <> EmptyStr) then
  begin
    vFind := '%' + LowerCase(vFind) + '%';
    uniPrincipal.Filter :=
      ' (lower(CRIANCA_NOME) = ' + vFind.Quoted + ')'+
      ' OR (lower(RESPONSAVEL_NOME) = ' + vFind.Quoted + ')'+
      ' OR (lower(RESPONSAVEL_DOCUMENTO) = ' + vFind.Quoted + ')';
  end;
  uniPrincipal.Filtered := (vFind <> EmptyStr);
end;

procedure TfrmAtividades.FormCreate(Sender: TObject);
begin
  Self.uniPrincipal.Connection := ORM.Connection.GetInstance.DataBase;
  AtualizaImagem;
  Self.uniPrincipal.Active := True;
end;

procedure TfrmAtividades.FormDestroy(Sender: TObject);
begin
  StopAutoRefresh;
end;

procedure TfrmAtividades.FormShow(Sender: TObject);
begin
  AtualizaHora;
end;

procedure TfrmAtividades.StartAutoRefresh;
begin
  edtBusca.Text := EmptyStr;
  TimerRefresh.Enabled := True;
end;

procedure TfrmAtividades.StopAutoRefresh;
begin
  TimerRefresh.Enabled := False;
end;

procedure TfrmAtividades.TimerHoraTimer(Sender: TObject);
begin
  AtualizaHora;
end;

procedure TfrmAtividades.TimerRefreshTimer(Sender: TObject);
begin
  StopAutoRefresh;
  try
    if not uniPrincipal.Active then
      Self.uniPrincipal.Active := True;
    uniPrincipal.Refresh;
  finally
    StartAutoRefresh;
  end;
end;

end.
