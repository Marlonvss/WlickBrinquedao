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
  cxCurrencyEdit, ficha.AtividadesSaida, cxMemo;

type
  TfrmAtividades = class(TForm)
    pnlTop: TPanel;
    ActManager: TActionManager;
    actNovo: TAction;
    actFinalizar: TAction;
    uniPrincipal: TUniQuery;
    dsPrincipal: TDataSource;
    menu: TPopupMenu;
    Finalizaratividade1: TMenuItem;
    TimerRefresh: TTimer;
    TimerHora: TTimer;
    lblHora: TLabel;
    UniConnection1: TUniConnection;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    cxButton1: TcxButton;
    edtBusca: TcxTextEdit;
    grdAtividade: TcxGrid;
    grdAtividadeLevel1: TcxGridLevel;
    grdAtividadeDBLayoutView3DBLayoutViewItem2: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem3: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem4: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem5: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem6: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem7: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem8: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem9: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem10: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem11: TcxGridDBLayoutViewItem;
    grdAtividadeDBLayoutView3DBLayoutViewItem12: TcxGridDBLayoutViewItem;
    actVisualizar: TAction;
    Visualizar1: TMenuItem;
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
  StopAutoRefresh;
  try
    with TfichaAtividadesSaida.Create(nil) do
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

procedure TfrmAtividades.actNovoExecute(Sender: TObject);
begin
  StopAutoRefresh;
  try
    with TFichaAtividades.Create(nil) do
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
  StopAutoRefresh;
  try
    with TFichaAtividades.Create(nil) do
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
