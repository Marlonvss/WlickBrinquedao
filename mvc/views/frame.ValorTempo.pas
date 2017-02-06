unit frame.ValorTempo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxMaskEdit, cxSpinEdit, cxTextEdit, cxCurrencyEdit;

type
  TframeValorTempo = class(TFrame)
    lblValor: TLabel;
    lblTempo: TLabel;
    edtValor: TcxCurrencyEdit;
    edtTempo: TcxSpinEdit;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.
