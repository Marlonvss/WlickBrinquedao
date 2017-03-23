program ControleBrinquedoteca;

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
  WLick.Sessao in '..\units\WLick.Sessao.pas',
  viewAtividadesPrincipal in '..\views\viewAtividadesPrincipal.pas' {frmAtividades},
  brinquedao.Images in '..\img\brinquedao.Images.pas' {DMImageBrinquedao: TDataModule},
  assembler.ValorTempo in '..\mvc\assembler\assembler.ValorTempo.pas',
  dao.ValorTempo in '..\mvc\daos\dao.ValorTempo.pas',
  controller.ValorTempo in '..\mvc\controllers\controller.ValorTempo.pas',
  dto.ValorTempo in '..\mvc\dto\dto.ValorTempo.pas',
  model.ValorTempo in '..\mvc\models\model.ValorTempo.pas',
  mapper.ValorTempo in '..\mvc\mappers\mapper.ValorTempo.pas',
  ficha.ValorTempo in '..\mvc\views\ficha.ValorTempo.pas',
  frame.ValorTempo in '..\mvc\views\frame.ValorTempo.pas' {frameValorTempo: TFrame},
  browser.ValorTempo in '..\mvc\views\browser.ValorTempo.pas',
  ficha.Atividades in '..\mvc\views\ficha.Atividades.pas',
  dao.Atividades in '..\mvc\daos\dao.Atividades.pas',
  controller.Atividades in '..\mvc\controllers\controller.Atividades.pas',
  assembler.Atividades in '..\mvc\assembler\assembler.Atividades.pas',
  dto.Atividades in '..\mvc\dto\dto.Atividades.pas',
  mapper.Atividades in '..\mvc\mappers\mapper.Atividades.pas',
  model.Atividades in '..\mvc\models\model.Atividades.pas',
  frame.Atividades in '..\mvc\views\frame.Atividades.pas' {frameAtividades: TFrame},
  enum.Atividades.Situacao in '..\mvc\enum\enum.Atividades.Situacao.pas',
  assembler.Configuracoes in '..\mvc\assembler\assembler.Configuracoes.pas',
  model.Configuracoes in '..\mvc\models\model.Configuracoes.pas',
  mapper.Configuracoes in '..\mvc\mappers\mapper.Configuracoes.pas',
  frame.Configuracoes in '..\mvc\views\frame.Configuracoes.pas' {frameConfiguracoes: TFrame},
  dao.Configuracoes in '..\mvc\daos\dao.Configuracoes.pas',
  ficha.Configuracoes in '..\mvc\views\ficha.Configuracoes.pas',
  controller.Configuracoes in '..\mvc\controllers\controller.Configuracoes.pas',
  dto.Configuracoes in '..\mvc\dto\dto.Configuracoes.pas',
  enum.Configuracoes in '..\mvc\enum\enum.Configuracoes.pas',
  viewMessageForm in '..\views\viewMessageForm.pas' {viewMessage},
  VFrames in '..\units\Camera\VFrames.pas',
  VSample in '..\units\Camera\VSample.pas',
  MainCamera in '..\units\Camera\MainCamera.pas' {fichaMainCamera},
  Direct3D9 in '..\units\Camera\DirectX\Direct3D9.pas',
  DirectDraw in '..\units\Camera\DirectX\DirectDraw.pas',
  DirectShow9 in '..\units\Camera\DirectX\DirectShow9.pas',
  DirectSound in '..\units\Camera\DirectX\DirectSound.pas',
  DXTypes in '..\units\Camera\DirectX\DXTypes.pas',
  DMRelatorio in '..\units\relatorios\DMRelatorio.pas' {DMReport: TDataModule},
  browser.AtividadesEncerradas in '..\mvc\views\browser.AtividadesEncerradas.pas',
  frame.AtividadesEntrada in '..\mvc\views\frame.AtividadesEntrada.pas' {frameAtividadesEntrada: TFrame},
  ficha.AtividadesEntrada in '..\mvc\views\ficha.AtividadesEntrada.pas',
  ORM.DataBaseManager in '..\..\WlickORM\bases\ORM.DataBaseManager.pas',
  WLick.DataBaseManager in '..\units\WLick.DataBaseManager.pas',
  enum.Usuarios.NivelAcesso in '..\mvc\enum\enum.Usuarios.NivelAcesso.pas',
  Relatorio.Parametros.RelatorioGerencialFicha in '..\units\relatorios\Relatorio.Parametros.RelatorioGerencialFicha.pas' {fichaRelatorioGerencial},
  FichaToolBackupRestore in '..\..\WlickORM\bases\FichaToolBackupRestore.pas' {fichaBackupRestore};

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
