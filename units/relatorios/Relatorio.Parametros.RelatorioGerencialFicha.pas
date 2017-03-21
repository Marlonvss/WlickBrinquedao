unit Relatorio.Parametros.RelatorioGerencialFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan, dxBar, cxClasses, WLick.Sessao, WLick.Miscelania, DMRelatorio,
  WLick.Types, WLick.ClassHelper;

type
  TfichaRelatorioGerencial = class(TForm)
    menuFicha: TdxBarManager;
    menuBrowserBar1: TdxBar;
    menuBrowserBar2: TdxBar;
    btnGravar: TdxBarButton;
    btnCancelar: TdxBarButton;
    dxBarButton1: TdxBarButton;
    actFicha: TActionManager;
    actVisualizar: TAction;
    actSair: TAction;
    pnlPrincipal: TPanel;
    Label1: TLabel;
    edtData: TcxDateEdit;
    procedure actSairExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
  private
  public
    class procedure CallFicha();
  end;

implementation

{$R *.dfm}

{ TfichaRelatorioGerencial }

procedure TfichaRelatorioGerencial.actSairExecute(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfichaRelatorioGerencial.actVisualizarExecute(Sender: TObject);
begin
  WLick.Miscelania.TMisc.PostAllEditValues(Self);
  DMRelatorio.TDMReport.PrintReport(trtRelatorioGerencial, [FormatDateTime('YYYY-MM-DD',edtData.Date)]);
end;

class procedure TfichaRelatorioGerencial.CallFicha;
begin
  with TfichaRelatorioGerencial.Create(nil) do
  try
    edtData.Date := WLick.Sessao.GetInstance.DataProcesso;
    ShowModal;
  finally
    Free;
  end;
end;


end.
