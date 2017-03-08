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
  viewLoginForm, browser.Criancas, WLick.Sessao, viewAtividadesPrincipal, Vcl.ExtCtrls,
  brinquedao.Images, browser.ValorTempo, ficha.Configuracoes, MainCamera,
  ppComm, ppEndUsr, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppDesignLayer,
  ppParameter, ppRelatv, ppProd, ppReport, DMRelatorio, WLick.Types,
  browser.AtividadesEncerradas, cxImage, cxBarEditItem;

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
    RibbonTabConfigurações: TdxRibbonTab;
    barPrinciparBar1: TdxBar;
    appEvents: TApplicationEvents;
    dxBarLargeButton2: TdxBarLargeButton;
    actCriancas: TAction;
    actValores: TAction;
    actPreferencias: TAction;
    barPrinciparBar2: TdxBar;
    barPrinciparBar3: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    timerAtividades: TTimer;
    dxBarLargeButton6: TdxBarLargeButton;
    actAtividadesEncerradas: TAction;
    itemLogo: TcxBarEditItem;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    barPrinciparBar4: TdxBar;
    cxBarEditItem3: TcxBarEditItem;
    procedure actUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure appEventsException(Sender: TObject; E: Exception);
    procedure actCriancasExecute(Sender: TObject);
    procedure actValoresExecute(Sender: TObject);
    procedure timerAtividadesTimer(Sender: TObject);
    procedure actPreferenciasExecute(Sender: TObject);
    procedure actAtividadesEncerradasExecute(Sender: TObject);

  private
    FTelaAtividades: TfrmAtividades;

    procedure LoadBarManager();
    procedure LoadAtividadeMain();

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

procedure TfrmMain.actCriancasExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserCriancas);
end;

procedure TfrmMain.actPreferenciasExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreFicha(TFichaConfiguracoes, False);
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

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Ribbon.ActiveTab := RibbonTabPrincipal;
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
end;

procedure TfrmMain.timerAtividadesTimer(Sender: TObject);
begin
  { T - Ao exibir um FormChildren, esconder a tela de atividades para exibir as abas }
  if Assigned(FTelaAtividades) then
    FTelaAtividades.Visible := Self.MDIChildCount = 0;
end;

end.
