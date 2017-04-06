unit viewMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, WLick.Constantes,
  Data.FMTBcd, Data.DB, Data.SqlExpr,
  controller.Usuarios, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, cxClasses, dxRibbon, cxPC,
  cxPCdxBarPopupMenu, dxBar, dxTabbedMDI, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, browser.Usuario,
  dxStatusBar, WLick.Miscelania, dxRibbonStatusBar, dxSkinsForm, dxRibbonCustomizationForm,
  dxBarBuiltInMenu, Vcl.AppEvnts, WLick.ClassHelper, ORM.ViewManager,
  viewLoginForm, WLick.Sessao, viewAtividadesPrincipal, Vcl.ExtCtrls,
  brinquedao.Images, browser.ValorTempo, ficha.Configuracoes, MainCamera,
  ppComm, ppEndUsr, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDesignLayer,
  ppParameter, ppRelatv, ppProd, ppReport, DMRelatorio, WLick.Types,
  browser.AtividadesEncerradas, viewMessageForm,
  Relatorio.Parametros.RelatorioGerencialFicha, enum.Usuarios.NivelAcesso,
  DMConnection, Winapi.ShellAPI, System.IOUtils, cxImage, cxBarEditItem,
  cxRichEdit, dxBarExtItems, Vcl.Menus ;

type
  TfrmMain = class(TForm)
    actManager: TActionManager;
    actUsuarios: TAction;
    barPrincipar: TdxBarManager;
    tabMDIManager: TdxTabbedMDIManager;
    dxBarLargeButton1: TdxBarLargeButton;
    Ribbon: TdxRibbon;
    RibbonTabPrincipal: TdxRibbonTab;
    Bar: TdxRibbonStatusBar;
    barPrinciparBar1: TdxBar;
    appEvents: TApplicationEvents;
    dxBarLargeButton2: TdxBarLargeButton;
    actCriancas: TAction;
    actValores: TAction;
    actPreferencias: TAction;
    barOutrosCadastros: TdxBar;
    btnUsuariosDoSistema: TdxBarLargeButton;
    btnValores: TdxBarLargeButton;
    btnPreferencias: TdxBarLargeButton;
    timerAtividades: TTimer;
    btnAtividadesEncerradas: TdxBarLargeButton;
    actAtividadesEncerradas: TAction;
    barOutrosConfig: TdxBar;
    actRelatorioGerencial: TAction;
    btnRelatorioGerencial: TdxBarLargeButton;
    actBackup: TAction;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    btnCopiaSeguranca: TdxBarLargeButton;
    procedure actUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure appEventsException(Sender: TObject; E: Exception);
    procedure actValoresExecute(Sender: TObject);
    procedure timerAtividadesTimer(Sender: TObject);
    procedure actPreferenciasExecute(Sender: TObject);
    procedure actAtividadesEncerradasExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRelatorioGerencialExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);

  private
    FTelaAtividades: TfrmAtividades;

    procedure LoadBarManager();
    procedure LoadAtividadeMain();
    procedure RefreshByNivelAcesso();

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses viewErrorForm, ORM.Connection;

procedure TfrmMain.actAtividadesEncerradasExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserAtividadesEncerradas);
end;

procedure TfrmMain.actBackupExecute(Sender: TObject);
var
  aBackupExe: String;
begin
  aBackupExe := ExtractFilePath(Application.ExeName)+'WLickBackupManager.exe';
  ShellExecute(Handle,'open',pchar(aBackupExe),nil,nil, sw_show)
end;

procedure TfrmMain.actPreferenciasExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreFicha(TFichaConfiguracoes, False);
end;

procedure TfrmMain.actRelatorioGerencialExecute(Sender: TObject);
begin
  Relatorio.Parametros.RelatorioGerencialFicha.TfichaRelatorioGerencial.CallFicha;
end;

procedure TfrmMain.actUsuariosExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserUsuario);
end;

procedure TfrmMain.actValoresExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserValorTempo);
end;

procedure TfrmMain.appEventsException(Sender: TObject; E: Exception);
begin
  TviewErro.ExibeMensagem(E);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FTelaAtividades) then
  begin
    FTelaAtividades.uniPrincipal.Filtered := False;
    if FTelaAtividades.uniPrincipal.RecordCount > 0 then
    begin
      if not viewMessageForm.TviewMessage.Send_Question(Format('Atenção: existe(m) %d atividades abertas.'+CRLF+'Deseja realmente sair?',[FTelaAtividades.uniPrincipal.RecordCount])) then
        Action := TCloseAction.caNone;
    end;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Ribbon.ActiveTab := RibbonTabPrincipal;
  RefreshByNivelAcesso;
  LoadAtividadeMain();
  LoadBarManager();
end;

procedure TfrmMain.LoadAtividadeMain;
begin
  FTelaAtividades := TfrmAtividades.Create(nil);
  with FTelaAtividades do
  begin
    Parent := Self;
    Align := alClient;
    Show;
  end;
end;

procedure TfrmMain.LoadBarManager;
begin
  Bar.Panels.Items[0].Text := ' Versão: ' + TMisc.GetVersaoSistema();
  Bar.Panels.Items[1].Text := ' Usuário: '+ WLick.Sessao.GetInstance.Usuario.Login;
  Bar.Panels.Items[2].Text := ' Data: '+ WLick.Sessao.GetInstance.DataProcesso.ToFormatString();
end;

procedure TfrmMain.RefreshByNivelAcesso;
var
  vNivel: TUsuarioNivelAcesso;
begin
  vNivel := TUsuarioNivelAcesso(WLick.Sessao.GetInstance.Usuario.NivelAcesso);

  actRelatorioGerencial.Visible := vNivel = enum.Usuarios.NivelAcesso.unaAdministrador;
  barOutrosCadastros.Visible := vNivel = enum.Usuarios.NivelAcesso.unaAdministrador;
  barOutrosConfig.Visible := vNivel = enum.Usuarios.NivelAcesso.unaAdministrador;
end;

procedure TfrmMain.timerAtividadesTimer(Sender: TObject);
begin
  { T - Ao exibir um FormChildren, esconder a tela de atividades para exibir as abas }
  if Assigned(FTelaAtividades) then
    FTelaAtividades.Visible := Self.MDIChildCount = 0;
end;

end.
