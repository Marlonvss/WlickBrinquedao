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
  cxGridCustomLayoutView, MemDS, ORM.Connection, cxLabel;

type
  TfrmAtividades = class(TForm)
    pnlTop: TPanel;
    Button1: TButton;
    ActManager: TActionManager;
    actNovo: TAction;
    actFinalizar: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1: TcxGrid;
    uniPrincipal: TUniQuery;
    dsPrincipal: TDataSource;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1DBCardViewRow1: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DBCardViewRow2: TcxGridDBCardViewRow;
    cxGrid1DBCardView2: TcxGridDBCardView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBCardView2DBCardViewRow5: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow7: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow4: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow2: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow1: TcxGridDBCardViewRow;
    cxGrid1DBCardView2DBCardViewRow3: TcxGridDBCardViewRow;
    menu: TPopupMenu;
    Finalizaratividade1: TMenuItem;
    Estenderatividade1: TMenuItem;
    TimerRefresh: TTimer;
    TimerHora: TTimer;
    lblHora: TLabel;
    UniConnection1: TUniConnection;
    cxGrid1DBCardView2DBCardViewRow6: TcxGridDBCardViewRow;
    pnlBusca: TPanel;
    edtBusca: TEdit;
    lblBusca: TLabel;
    procedure actFinalizarExecute(Sender: TObject);
    procedure TimerRefreshTimer(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure TimerHoraTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBCardView2DBCardViewRow4GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure edtBuscaChange(Sender: TObject);
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
    ShowMessage(FloatToStr(uniPrincipal.FieldByName('valor').AsCurrency));
  finally
    StartAutoRefresh;
  end;
end;

procedure TfrmAtividades.actNovoExecute(Sender: TObject);
begin
  StopAutoRefresh;
  try

  finally
    StartAutoRefresh;
  end;
end;

procedure TfrmAtividades.AtualizaHora;
begin
  lblHora.Caption := FormatDateTime('HH:MM:SS',Now);
end;

procedure TfrmAtividades.cxGrid1DBCardView2DBCardViewRow4GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := 'Em andamento';
end;

procedure TfrmAtividades.edtBuscaChange(Sender: TObject);
var
  vFind : String;
begin
  uniPrincipal.Filter := EmptyStr;
  vFind := '%' + LowerCase(edtBusca.Text) + '%';
  if (vFind <> EmptyStr) then
  begin
    uniPrincipal.Filter :=
      ' (lower(NOME) = ' + vFind.QuotedString + ')'+
      ' OR (lower(RESPONSAVELNOME) = ' + vFind.QuotedString + ')'+
      ' OR (lower(RESPONSAVELDOCUMENTO) = ' + vFind.QuotedString + ')';
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
