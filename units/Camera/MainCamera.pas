unit MainCamera;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles, JPEG,
  VFrames, VSample, Direct3D9, DirectDraw, DirectShow9, DirectSound, DXTypes,
  Vcl.ComCtrls, brinquedao.Images, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxButtons, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, WLick.Miscelania;

type
  TfichaMainCamera = class(TForm)
    imgCapturar: TImage;
    shp1: TShape;
    actImagem: TActionManager;
    actCapturar: TAction;
    actFinalizar: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actCapturarExecute(Sender: TObject);
    procedure actFinalizarExecute(Sender: TObject);
  private
    { Private declarations }
    FVideoImage: TVideoImage;
    FVideoBitmap: TBitmap;
    procedure OnNewVideoFrame(Sender: TObject; Width, Height: integer; DataPtr: pointer);

    procedure IniciaCamera;
    procedure DesligaCamera;
  public
    { Public declarations }
    class procedure Init(out aImg: String);
  end;

implementation

{$R *.dfm}
{ FORM }

procedure TfichaMainCamera.OnNewVideoFrame(Sender: TObject; Width, Height: integer; DataPtr: pointer);
begin
  FVideoImage.GetBitmap(FVideoBitmap); // Pega apenas o frame atual do vídeo.
end;

procedure TfichaMainCamera.FormCreate(Sender: TObject);
begin
  FVideoImage := TVideoImage.Create;
  FVideoBitmap := TBitmap.Create;
end;

procedure TfichaMainCamera.FormDestroy(Sender: TObject);
begin
  DesligaCamera;
end;

procedure TfichaMainCamera.IniciaCamera;
var
  ArquivoINI: TIniFile;
  Device: string;
const
  cTagName = 'Configuracao';
begin

  ArquivoINI := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\conexao.ini');
  try
    Device := ArquivoINI.ReadString(cTagName, 'CameraDefault', '');
  finally
    ArquivoINI.Free;
  end;

  if Device = EmptyStr then
    raise Exception.Create('Nenhuma camera foi definida nas preferências.');

  // Inicia a webcam
  FVideoImage.VideoStart(Device);

  // Pega o primeiro frame que provavelmente estará vazio.
  FVideoImage.OnNewVideoFrame := OnNewVideoFrame;

end;

class procedure TfichaMainCamera.Init(out aImg: String);
begin
  with TfichaMainCamera.Create(nil) do
  try
    IniciaCamera;
    if ShowModal = mrOk then
    begin
      aImg := TMisc.PictureToString(imgCapturar.Picture);
    end;
  finally
    Free;
  end;
end;

procedure TfichaMainCamera.actCapturarExecute(Sender: TObject);
begin
  FVideoImage.OnNewVideoFrame := OnNewVideoFrame;
  imgCapturar.Picture.Bitmap.Assign(FVideoBitmap);
end;

procedure TfichaMainCamera.actFinalizarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfichaMainCamera.DesligaCamera;
begin
  FVideoImage.VideoStop;
end;

end.
