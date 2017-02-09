unit frame.Atividades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, brinquedao.Images, Vcl.Menus, cxButtons, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxMemo,
  cxCurrencyEdit, cxSpinEdit, cxTimeEdit;

type
  TframeAtividades = class(TFrame)
    lblLogin: TLabel;
    lblNascimento: TLabel;
    edtCrianca: TcxComboBox;
    edtNascimento: TcxDateEdit;
    lblResponsavel: TLabel;
    lblContato: TLabel;
    edtResponsavel: TcxComboBox;
    edtContato: TcxTextEdit;
    lblEmail: TLabel;
    edtEmail: TcxTextEdit;
    edtDocumento: TcxTextEdit;
    lblDocumento: TLabel;
    edtObs: TcxMemo;
    lblObs: TLabel;
    lblEntrada: TLabel;
    lblValor: TLabel;
    lblTempoDeServico: TLabel;
    lblPrevisaoDeSaida: TLabel;
    edtEntrada: TcxTimeEdit;
    edtTempoDeServico: TcxTimeEdit;
    edtPrevisaoSaida: TcxTimeEdit;
    btnAddCrianca: TcxButton;
    edtValor: TcxComboBox;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.
