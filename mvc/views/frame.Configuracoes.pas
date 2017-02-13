unit frame.Configuracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, brinquedao.Images, Vcl.Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit, dxBarBuiltInMenu, dxColorEdit,
  cxGroupBox, cxPC;

type
  TframeConfiguracoes = class(TFrame)
    pgConfiguracao: TcxPageControl;
    tsAtividades: TcxTabSheet;
    lblValorPorMinuto: TLabel;
    lblTolerancia: TLabel;
    edtTolerancia: TcxTimeEdit;
    edtValorPorMinuto: TcxCurrencyEdit;
    tsCamera: TcxTabSheet;
    lblCameraDefault: TLabel;
    grpCameraDefault: TcxComboBox;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.
