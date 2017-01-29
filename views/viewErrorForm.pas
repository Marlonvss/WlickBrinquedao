unit viewErrorForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, dxGDIPlusClasses,
  cxImage, cxTextEdit, cxMemo, Vcl.ExtCtrls;

type
  TviewErro = class(TForm)
    lbl2: TLabel;
    mmoMsgErro: TcxMemo;
    pnlBotton: TPanel;
    Image1: TImage;
    Button1: TButton;
    chkGravaLog: TCheckBox;
    chkEnviarPorEmail: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ExibeMensagem(const aException: Exception);
  end;

var
  viewErro: TviewErro;

implementation

{$R *.dfm}
{ TviewErro }

class procedure TviewErro.ExibeMensagem(const aException: Exception);
begin
  with TviewErro.Create(nil) do
    try
      mmoMsgErro.Clear;
      mmoMsgErro.Lines.Add(aException.Message);
      ShowModal;
    finally
      free;
    end;
end;

end.
