unit frame.Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TframeUsuario = class(TFrame)
    lblLogin: TLabel;
    lblSenha: TLabel;
    edtLogin: TcxTextEdit;
    edtSenha: TcxTextEdit;
    cmbNivelAcesso: TcxComboBox;
    lblNivelUsuario: TLabel;
    private
      { Private declarations }
    public
      { Public declarations }
  end;

implementation

{$R *.dfm}

end.
