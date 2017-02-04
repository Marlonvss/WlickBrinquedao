program WLickBrinquedao;


uses
  Vcl.Forms,
  DMConnection in '..\..\WlickORM\connection\DMConnection.pas' {DModule: TDataModule},
  controller.Usuarios in '..\mvc\controllers\controller.Usuarios.pas',
  dao.Usuarios in '..\mvc\daos\dao.Usuarios.pas',
  dto.Usuarios in '..\mvc\dto\dto.Usuarios.pas',
  mapper.Usuarios in '..\mvc\mappers\mapper.Usuarios.pas',
  model.Usuarios in '..\mvc\models\model.Usuarios.pas',
  browser.Usuario in '..\mvc\views\browser.Usuario.pas',
  ficha.Usuario in '..\mvc\views\ficha.Usuario.pas',
  frame.Usuario in '..\mvc\views\frame.Usuario.pas' {frameUsuario: TFrame},
  WLick.ClassHelper in '..\const\WLick.ClassHelper.pas',
  WLick.Constantes in '..\const\WLick.Constantes.pas',
  WLick.ConstrutorSQL in '..\const\WLick.ConstrutorSQL.pas',
  WLick.Miscelania in '..\const\WLick.Miscelania.pas',
  WLick.Types in '..\const\WLick.Types.pas',
  viewErrorForm in '..\views\viewErrorForm.pas' {viewErro},
  viewMainForm in '..\views\viewMainForm.pas' {frmMain},
  viewLoginForm in '..\views\viewLoginForm.pas' {frmLogin},
  ORM.assemblerBase in '..\..\WlickORM\bases\assembler\ORM.assemblerBase.pas',
  ORM.browserBase in '..\..\WlickORM\bases\browser\ORM.browserBase.pas' {ORMBrowserBase},
  ORM.controllerBase in '..\..\WlickORM\bases\controller\ORM.controllerBase.pas',
  ORM.daoBase in '..\..\WlickORM\bases\dao\ORM.daoBase.pas',
  ORM.dtoBase in '..\..\WlickORM\bases\dto\ORM.dtoBase.pas',
  ORM.fichaBase in '..\..\WlickORM\bases\ficha\ORM.fichaBase.pas' {ORMfichaBase},
  ORM.modelBase in '..\..\WlickORM\bases\model\ORM.modelBase.pas',
  ORM.attributes in '..\..\WlickORM\bases\ORM.attributes.pas',
  ORM.ViewManager in '..\..\WlickORM\bases\ORM.ViewManager.pas',
  ORM.Connection in '..\..\WlickORM\connection\ORM.Connection.pas',
  assembler.Usuarios in '..\mvc\assembler\assembler.Usuarios.pas',
  ORM.images in '..\..\WlickORM\images\ORM.images.pas' {DImages: TDataModule},
  WLick.InitSistema in '..\units\WLick.InitSistema.pas',
  browser.Criancas in '..\mvc\views\browser.Criancas.pas',
  ficha.Criancas in '..\mvc\views\ficha.Criancas.pas',
  assembler.Criancas in '..\mvc\assembler\assembler.Criancas.pas',
  controller.Criancas in '..\mvc\controllers\controller.Criancas.pas',
  dao.Criancas in '..\mvc\daos\dao.Criancas.pas',
  dto.Criancas in '..\mvc\dto\dto.Criancas.pas',
  mapper.Criancas in '..\mvc\mappers\mapper.Criancas.pas',
  model.Criancas in '..\mvc\models\model.Criancas.pas',
  frame.Criancas in '..\mvc\views\frame.Criancas.pas' {frameCriancas: TFrame},
  WLick.Sessao in '..\units\WLick.Sessao.pas',
  viewAtividadesPrincipal in '..\views\viewAtividadesPrincipal.pas' {frmAtividades},
  brinquedao.Images in '..\img\brinquedao.Images.pas' {DMImageBrinquedao: TDataModule},
  model.Responsaveis in '..\mvc\models\model.Responsaveis.pas',
  mapper.Responsaveis in '..\mvc\mappers\mapper.Responsaveis.pas',
  dto.Responsaveis in '..\mvc\dto\dto.Responsaveis.pas',
  assembler.Responsaveis in '..\mvc\assembler\assembler.Responsaveis.pas',
  controller.Responsaveis in '..\mvc\controllers\controller.Responsaveis.pas',
  dao.Responsaveis in '..\mvc\daos\dao.Responsaveis.pas',
  mapper.ResponsaveisCriancas in '..\mvc\mappers\mapper.ResponsaveisCriancas.pas',
  assembler.ResponsaveisCriancas in '..\mvc\assembler\assembler.ResponsaveisCriancas.pas',
  model.ResponsaveisCriancas in '..\mvc\models\model.ResponsaveisCriancas.pas',
  dto.ResponsaveisCriancas in '..\mvc\dto\dto.ResponsaveisCriancas.pas',
  dao.ResponsaveisCriancas in '..\mvc\daos\dao.ResponsaveisCriancas.pas',
  controller.ResponsaveisCriancas in '..\mvc\controllers\controller.ResponsaveisCriancas.pas',
  ficha.Responsavel in '..\mvc\views\ficha.Responsavel.pas' {fichaResponsaveis};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDModule, DModule);
  Application.CreateForm(TDImages, DImages);
  Application.CreateForm(TDMImageBrinquedao, DMImageBrinquedao);
  if TInitSistema.IniciarSistema then
  begin
    Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  end;

end.

