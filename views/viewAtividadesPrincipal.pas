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
  cxButtonEdit;

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
    UniConnection1: TUniConnection;
    actVisualizar: TAction;
    Visualizar1: TMenuItem;
    pnlTop: TPanel;
    lblHora: TLabel;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    edtBusca: TcxTextEdit;
    cxButton1: TcxButton;
    grdAtividade: TcxGrid;
    grdAtividadeDBTableView1: TcxGridDBTableView;
    grdAtividadeDBCardView1: TcxGridDBCardView;
    grdAtividadeDBCardView2: TcxGridDBCardView;
    grdAtividadeDBCardView2DBCardViewRow1: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow3: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow5: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow7: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow2: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow4: TcxGridDBCardViewRow;
    grdAtividadeDBCardView2DBCardViewRow6: TcxGridDBCardViewRow;
    grdAtividadeDBLayoutView1: TcxGridDBLayoutView;
    grdAtividadeDBLayoutView1DBLayoutViewItem13: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem1: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem2: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem3: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem4: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem5: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem6: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem7: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem8: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem9: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem10: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1DBLayoutViewItem11: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView1Group_Root: TdxLayoutGroup;
    cxGridLayoutItem1: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem2: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem3: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem4: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem5: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem6: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem7: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem8: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem9: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem10: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem11: TcxGridLayoutItem;
    grdAtividadeDBLayoutView1LayoutItem12: TcxGridLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    grdAtividadeDBCardView: TcxGridDBCardView;
    grdAtividadeDBCardViewDBCardViewRow1: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow3: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow4: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow6: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow5: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow7: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow8: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow9: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow10: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow11: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRowobs: TcxGridDBCardViewRow;
    grdAtividadeDBCardViewDBCardViewRow12: TcxGridDBCardViewRow;
    grdAtividadeDBLayoutView2: TcxGridDBLayoutView;
    grdAtividadeDBLayoutView2DBLayoutViewItem1: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem2: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem3: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem4: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem5: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem6: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem7: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem8: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem9: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem10: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem11: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2DBLayoutViewItem12: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView2Group_Root: TdxLayoutGroup;
    cxGridLayoutItem2: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem2: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem3: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem4: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem5: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem6: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem7: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem8: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem9: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem10: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem11: TcxGridLayoutItem;
    grdAtividadeDBLayoutView2LayoutItem12: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3: TcxGridDBLayoutView;
    grdAtividadeDBLayoutView3DBLayoutViewItem2: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem3: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem4: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem5: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem6: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem7: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem14: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem8: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem9: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem10: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem11: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3Group_Root: TdxLayoutGroup;
    grdAtividadeLevel1: TcxGridLevel;
    grdAtividadeDBLayoutView3DBLayoutViewItem12: TcxGridDBLayoutViewItem;
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
    uniPrincipalnome: TStringField;
    uniPrincipalnascimento: TDateTimeField;
    uniPrincipalfoto: TBlobField;
    uniPrincipalresponsavelnome: TStringField;
    uniPrincipalresponsaveldocumento: TStringField;
    uniPrincipalresponsavelcontato: TStringField;
    uniPrincipalbotao: TMemoField;
    grdAtividadeDBLayoutView3DBLayoutViewItem13: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3LayoutItem1: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem2: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem3: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem4: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem5: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem6: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem7: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem8: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem9: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem10: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem11: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3Group1: TdxLayoutGroup;
    grdAtividadeDBLayoutView3LayoutItem12: TcxGridLayoutItem;
    grdAtividadeDBLayoutView3LayoutItem13: TcxGridLayoutItem;
    procedure actFinalizarExecute(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure TimerHoraTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grdAtividadeDBCardView2DBCardViewRow4GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure edtBuscaPropertiesChange(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
  private
    procedure StopAutoRefresh();
    procedure StartAutoRefresh();

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

procedure TfrmAtividades.grdAtividadeDBCardView2DBCardViewRow4GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := 'Em andamento';
end;

procedure TfrmAtividades.edtBuscaPropertiesChange(Sender: TObject);
var
  vFind : String;
begin
  uniPrincipal.Filter := EmptyStr;
  vFind := '%' + LowerCase(edtBusca.Text) + '%';
  if (vFind <> EmptyStr) then
  begin
    uniPrincipal.Filter :=
      ' (lower(NOME) = ' + vFind.Quoted + ')'+
      ' OR (lower(RESPONSAVELNOME) = ' + vFind.Quoted + ')'+
      ' OR (lower(RESPONSAVELDOCUMENTO) = ' + vFind.Quoted + ')';
  end;
  uniPrincipal.Filtered := (uniPrincipal.Filter <> EmptyStr);
end;

procedure TfrmAtividades.FormCreate(Sender: TObject);
begin
  Self.uniPrincipal.Connection := ORM.Connection.GetInstance.DataBase;
  Self.uniPrincipal.Active := True;

  //grdAtividadeDBLayoutView3DBLayoutViewItem7.Properties.Images.
end;

procedure TfrmAtividades.FormShow(Sender: TObject);
begin
  AtualizaHora;
end;

procedure TfrmAtividades.StartAutoRefresh;
begin
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
    if uniPrincipal.Active then
      uniPrincipal.Refresh;
  finally
    StartAutoRefresh;
  end;
end;

end.
