unit viewErrorForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, dxGDIPlusClasses,
  cxImage, cxTextEdit, cxMemo, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TviewErro = class(TForm)
    lbl2: TLabel;
    mmoMsgErro: TcxMemo;
    pnlBotton: TPanel;
    Image1: TImage;
    chkGravaLog: TCheckBox;
    btnOk: TcxButton;
    procedure btnOkClick(Sender: TObject);
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

procedure TviewErro.btnOkClick(Sender: TObject);
var
  vLista: TStringList;
  vFilePath: String;
begin
  vFilePath := ExtractFilePath(Application.ExeName) + 'erros.log';
  if chkGravaLog.Checked then
  begin
    vLista := TStringList.Create;
    if FileExists(vFilePath)
      then vLista.LoadFromFile(vFilePath);

    vLista.Add('#########');
    vLista.Add(Format('Data/Hora: %s',[FormatDateTime('dd/MM/yyyy hh:mm',Now())]));
    vLista.Add(Format('Mensagem: %s',[mmoMsgErro.Text]));

    vLista.SaveToFile(vFilePath);
  end;
end;

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
