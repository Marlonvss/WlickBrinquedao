unit ficha.Responsavel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxImage, Vcl.StdCtrls, cxGroupBox,
  cxTextEdit, Vcl.ExtCtrls, dxBar, cxClasses, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, dto.Responsaveis,
  brinquedao.Images, Vcl.Menus, cxButtons, viewMessageForm, WLick.Miscelania,
  MainCamera;

type
  TfichaResponsaveis = class(TForm)
    actFicha: TActionManager;
    actGravar: TAction;
    actCancelar: TAction;
    actSair: TAction;
    menuFicha: TdxBarManager;
    menuBrowserBar1: TdxBar;
    menuBrowserBar2: TdxBar;
    btnGravar: TdxBarButton;
    btnCancelar: TdxBarButton;
    dxBarButton1: TdxBarButton;
    pnlBody: TPanel;
    lblNome: TLabel;
    edtNome: TcxTextEdit;
    lblDocumento: TLabel;
    edtDocumento: TcxTextEdit;
    lblContato: TLabel;
    edtContato: TcxTextEdit;
    grpFoto: TcxGroupBox;
    pnlCtrlImagem: TPanel;
    btnLoad: TcxButton;
    btnWebCam: TcxButton;
    btnClear: TcxButton;
    lblEmail: TLabel;
    edtEmail: TcxTextEdit;
    ImgFoto: TcxImage;
    procedure actSairExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnWebCamClick(Sender: TObject);
  private
    FDTO : TDTOResponsaveis;

    procedure ViewToDTO();
    procedure DTOToView();
  public
    class function Init(var aDTO: TDTOResponsaveis; const aInserindo: Boolean = False): Boolean;
  end;

implementation

{$R *.dfm}

procedure TfichaResponsaveis.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfichaResponsaveis.actGravarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfichaResponsaveis.actSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfichaResponsaveis.btnClearClick(Sender: TObject);
begin
  if TviewMessage.Send_Question('Deseja realmente remover esta image?')
    then ImgFoto.Clear;
end;

procedure TfichaResponsaveis.btnLoadClick(Sender: TObject);
var
  vDlgImage: TOpenDialog;
begin
  vDlgImage := TOpenDialog.Create(nil);
  try
    vDlgImage.Filter := 'All(*.JPG;*.JPEG)|*.JPG;*.JPEG';

    if vDlgImage.Execute() then
    begin
      ImgFoto.Picture.LoadFromFile(vDlgImage.FileName);
    end;
  finally
    vDlgImage.Free;
  end;
end;

procedure TfichaResponsaveis.btnWebCamClick(Sender: TObject);
var
  vImg: String;
begin
  TfichaMainCamera.Init(vImg);
  if (vImg <> EmptyStr) then
    ImgFoto.Picture := TMisc.StringToPicture(vImg);
end;

procedure TfichaResponsaveis.DTOToView;
begin
  edtNome.Text := FDTO.Nome;
  edtDocumento.Text := FDTO.Documento;
  edtContato.Text := FDTO.Contato;
  edtEmail.Text := FDTO.Email;
  if FDTO.Foto <> EmptyStr then
    ImgFoto.Picture := TMisc.StringToPicture(FDTO.Foto);
end;

class function TfichaResponsaveis.Init(var aDTO: TDTOResponsaveis;
  const aInserindo: Boolean): Boolean;
begin
  Result := False;
  with TfichaResponsaveis.Create(nil) do
  try
    FDTO := aDTO;
    DTOToView;

    Result := ShowModal = mrOk;
    if Result then
    begin
      ViewToDTO;
      aDTO := FDTO;
    end;
  finally
    Free;
  end;
end;

procedure TfichaResponsaveis.ViewToDTO;
begin
  FDTO.Nome := edtNome.Text;
  FDTO.Documento := edtDocumento.Text;
  FDTO.Contato := edtContato.Text;
  FDTO.Email := edtEmail.Text;
  FDTO.Foto := TMisc.PictureToString( ImgFoto.Picture );
end;

end.
