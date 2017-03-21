unit frame.AtividadesEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, brinquedao.Images, Vcl.Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit, cxImage;

type
  TframeAtividadesEntrada = class(TFrame)
    lblObs: TLabel;
    lblEntrada: TLabel;
    lblValor: TLabel;
    lblTempoDeServico: TLabel;
    lblPrevisaoDeSaida: TLabel;
    edtObs: TcxMemo;
    edtEntrada: TcxTimeEdit;
    edtPrevisaoSaida: TcxTimeEdit;
    edtValor: TcxComboBox;
    edtTempoServico: TcxComboBox;
    imgFotoCrianca: TcxImage;
    lblFotoCrianca: TLabel;
    lblFotoResponsavel: TLabel;
    imgFotoResponsavel: TcxImage;
    lblLogin: TLabel;
    lblNascimento: TLabel;
    lblResponsavel: TLabel;
    lblContato: TLabel;
    lblEmail: TLabel;
    lblDocumento: TLabel;
    edtNascimento: TcxDateEdit;
    edtContato: TcxTextEdit;
    edtEmail: TcxTextEdit;
    edtDocumento: TcxTextEdit;
    edtCrianca: TcxTextEdit;
    edtResponsavel: TcxTextEdit;
    btnFotoResponsavel: TcxButton;
    btnFotoCrianca: TcxButton;
    btnFotoCriancaClear: TcxButton;
    btnFotoResponsavelClear: TcxButton;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.

