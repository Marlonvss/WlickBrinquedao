unit frame.Atividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, brinquedao.Images, Vcl.Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit, cxImage;

type
  TframeAtividades = class(TFrame)
    lblLogin: TLabel;
    lblNascimento: TLabel;
    lblResponsavel: TLabel;
    lblContato: TLabel;
    lblEmail: TLabel;
    lblDocumento: TLabel;
    lblEntrada: TLabel;
    lblValor: TLabel;
    lblTempoDeServico: TLabel;
    lblObs: TLabel;
    lblPrevisaoDeSaida: TLabel;
    lblSaida: TLabel;
    edtNascimento: TcxDateEdit;
    edtContato: TcxTextEdit;
    edtEmail: TcxTextEdit;
    edtDocumento: TcxTextEdit;
    edtObs: TcxMemo;
    edtEntrada: TcxTimeEdit;
    edtValor: TcxCurrencyEdit;
    edtTempoServico: TcxTimeEdit;
    edtCrianca: TcxTextEdit;
    edtResponsavel: TcxTextEdit;
    edtPrevisaoSaida: TcxTimeEdit;
    edtSaida: TcxTimeEdit;
    btnDetalhes: TcxButton;
    lblFotoCrianca: TLabel;
    imgFotoCrianca: TcxImage;
    lblFotoResponsavel: TLabel;
    imgFotoResponsavel: TcxImage;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.
