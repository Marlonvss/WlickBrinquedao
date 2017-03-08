unit frame.Criancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxImage, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, dxBarBuiltInMenu, cxPC, Vcl.Buttons,
  Vcl.ExtCtrls, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, brinquedao.Images, Vcl.Menus, cxButtons;

type
  TframeCriancas = class(TFrame)
    lblCodigo: TLabel;
    lblNome: TLabel;
    edtNascimento: TcxDateEdit;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    lblNascimento: TLabel;
    pgControl: TcxPageControl;
    tsFoto: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    lblCaptionIdade: TLabel;
    lblIdade: TLabel;
    pnlCtrlResponsavel: TPanel;
    treeListResponsaveis: TcxTreeList;
    treeListColumn_Nome: TcxTreeListColumn;
    treeListColumn_Documento: TcxTreeListColumn;
    btnNovo: TcxButton;
    btnDeletar: TcxButton;
    pnlCtrlImagem: TPanel;
    btnLoad: TcxButton;
    btnWebCam: TcxButton;
    btnClear: TcxButton;
    ImgFoto: TcxImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


{ TframeCriancas }

end.
