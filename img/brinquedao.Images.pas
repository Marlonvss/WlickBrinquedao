unit brinquedao.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  cxGraphics;

type
  TDMImageBrinquedao = class(TDataModule)
    img16: TcxImageList;
    img32: TcxImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImageBrinquedao: TDMImageBrinquedao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
