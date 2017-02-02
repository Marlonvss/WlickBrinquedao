unit viewMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, WLick.Constantes,
  Data.FMTBcd, Data.DB, Data.SqlExpr,
  controller.Usuarios, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxRibbonSkins, cxClasses, dxRibbon, cxPC,
  cxPCdxBarPopupMenu, dxBar, dxTabbedMDI, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ORM.images, browser.Usuario,
  dxStatusBar, WLick.Miscelania, dxRibbonStatusBar, dxSkinsForm, dxRibbonCustomizationForm,
  dxBarBuiltInMenu, Vcl.AppEvnts, WLick.ClassHelper, ORM.ViewManager,
  viewLoginForm, browser.Criancas, WLick.Sessao, viewAtividadesPrincipal;

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
    procedure actUsuariosExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure appEventsException(Sender: TObject; E: Exception);
    procedure actCriancasExecute(Sender: TObject);
    procedure actValoresExecute(Sender: TObject);

  private
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

procedure TfrmMain.actCriancasExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserCriancas);
end;

procedure TfrmMain.actUsuariosExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserUsuario);
end;

procedure TfrmMain.actValoresExecute(Sender: TObject);
begin
  ORM.ViewManager.TORMViewManager.AbreBrowser(TBrowserCriancas);
end;

procedure TfrmMain.appEventsException(Sender: TObject; E: Exception);
begin
  TviewErro.ExibeMensagem(E);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

  with viewLoginForm.TfrmLogin.Create(self) do
  try
    if ShowModal = mrCancel then
      Application.Terminate;
  finally
    Free;
  end;

  LoadAtividadeMain();
  LoadBarManager();
end;

procedure TfrmMain.LoadAtividadeMain;
begin
  with TfrmAtividades.Create(self) do
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

end.
