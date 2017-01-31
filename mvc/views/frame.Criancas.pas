unit frame.Criancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxImage, cxGroupBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls;

type
  TframeCriancas = class(TFrame)
    lblCodigo: TLabel;
    lblNome: TLabel;
    edtNascimento: TcxDateEdit;
    edtCodigo: TcxTextEdit;
    edtNome: TcxTextEdit;
    lblNascimento: TLabel;
    grpResponsavel: TcxGroupBox;
    lblResponsavelNome: TLabel;
    edtResponsavelNome: TcxTextEdit;
    edtResponsavelEmail: TcxTextEdit;
    lblResponsavelEmail: TLabel;
    edtResponsavelContato: TcxTextEdit;
    lblResponsavelContato: TLabel;
    lblResponsavelDocumento: TLabel;
    edtResponsavelDocumento: TcxTextEdit;
    grpFotoCrianca: TcxGroupBox;
    grpFotoResponsavel: TcxGroupBox;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
