unit WLick.Message;

interface

uses Uni, SysUtils, dto.Usuarios, ORM.assemblerBase, System.Classes, DMConnection,
  viewMessageForm, Forms;

type
  TpTipoMsg = (
    tmsgNaoDefinido,
    tmsgErro,
    tmsgConfirmacao,
    tmsgAtencao);

procedure Send_Information(const a_Msg: String);
procedure Send_Atencao(const a_Msg: String);
function Send_Question(const a_Msg: String): Boolean;

implementation

procedure Send_Information(const a_Msg: String);
begin

end;

procedure Send_Atencao(const a_Msg: String);
begin

end;

function Send_Question(const a_Msg: String): Boolean;
begin

end;

initialization

finalization

end.
