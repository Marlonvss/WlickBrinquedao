unit viewMessageForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, dxGDIPlusClasses,
  cxImage, cxTextEdit, cxMemo, Vcl.ExtCtrls, Vcl.Menus, cxButtons;

type
  TviewMessage = class(TForm)
    lblTitulo: TLabel;
    pnlBotton: TPanel;
    imgQuestion: TImage;
    mmoMsg: TcxMemo;
    imgAlert: TImage;
    btn1: TcxButton;
    btn2: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Send_Information(const a_Msg: String);
    class procedure Send_Atencao(const a_Msg: String);
    class function Send_Question(const a_Msg: String): Boolean;
  end;

var
  viewMessage: TviewMessage;

implementation

{$R *.dfm}

{ TviewMessage }

class procedure TviewMessage.Send_Atencao(const a_Msg: String);
begin
  with TviewMessage.Create(nil) do
  try
    imgAlert.Visible := False;
    imgQuestion.Visible := True;
    lblTitulo.Caption := 'Atenção';
    btn1.Visible := False;
    btn2.Visible := True;
    btn2.Caption := 'OK';
    btn2.modalResult := mrOk;
    mmoMsg.Clear;
    mmoMsg.Lines.add(a_Msg);
    ShowModal;
  finally
    free;
  end;
end;

class procedure TviewMessage.Send_Information(const a_Msg: String);
begin
  with TviewMessage.Create(nil) do
  try
    imgAlert.Visible := True;
    imgQuestion.Visible := False;
    lblTitulo.Caption := 'Informação';
    btn1.Visible := False;
    btn2.Visible := True;
    btn2.Caption := 'OK';
    btn2.modalResult := mrOk;
    mmoMsg.Clear;
    mmoMsg.Lines.add(a_Msg);
    ShowModal;
  finally
    free;
  end;
end;

class function TviewMessage.Send_Question(const a_Msg: String): Boolean;
begin
 with TviewMessage.Create(nil) do
  try
    imgAlert.Visible := False;
    imgQuestion.Visible := True;
    lblTitulo.Caption := 'Confirmação';
    btn1.Visible := True;
    btn1.Caption := 'Sim';
    btn1.modalResult := mrYes;
    btn2.Visible := True;
    btn2.Caption := 'Não';
    btn2.modalResult := mrNo;
    mmoMsg.Clear;
    mmoMsg.Lines.add(a_Msg);
    Result := ShowModal = mrYes;
  finally
    free;
  end;
end;

end.
