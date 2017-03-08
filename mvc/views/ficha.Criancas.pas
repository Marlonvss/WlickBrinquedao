unit ficha.Criancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxCheckBox, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  dxBar, cxBarEditItem, cxClasses, ORM.DTOBase, ORM.FichaBase, DTO.Criancas,
  controller.Criancas, ORM.controllerBase, frame.Criancas, WLick.ClassHelper,
  DateUtils, Generics.collections, dto.Responsaveis, WLick.Types,
  assembler.Responsaveis, ORM.assemblerBase, dto.ResponsaveisCriancas,
  ficha.Responsavel, viewMessageForm, WLick.Miscelania, MainCamera;

type

  TFichaCriancas = class(TORMFichaBase)
    private
      FListaResponsaveis: TObjectList<TDTOResponsaveis>;

      function MyController: TControllerCriancas;
      function MyFrame: TframeCriancas;
      function MyDTO: TDTOCriancas;

      procedure edtNascimentoChanged(Sender: TObject);
      procedure SetIdadeLabel();
      procedure LoadTreeList();

      procedure btnCarregarEvent(Sender: TObject);
      procedure btnWebCanEvent(Sender: TObject);
      procedure btnLimparEvent(Sender: TObject);

      procedure btnDeletarEvent(Sender: TObject);
      procedure btnNovoEvent(Sender: TObject);
      procedure treeListResponsaveisEvent(Sender: TObject);

    protected
      function GetCaption: String; override;
      function GetFrame: TFrame; override;
      procedure LoadComplementos; override;

      procedure SetOnChange(); override;
      procedure SetEvents(); override;

      function ClassController: TORMControllerBaseClass; override;
      function ClassDTO: TORMDTOBaseClass; override;

      procedure AfterSave(); override;

      procedure CreateAllObjects(); override;
      procedure DestroyAllObjects(); override;

      procedure ViewToDTO(); override;
      procedure DTOToView(); override;
    public

  end;

implementation

{ TFichaCriancas }

function TFichaCriancas.GetCaption: String;
begin
  Result := 'Ficha de Crianças';
end;

function TFichaCriancas.GetFrame: TFrame;
begin
  if not Assigned(FFrame) then
    FFrame := TframeCriancas.Create(Self);
  Result := FFrame;
end;

procedure TFichaCriancas.LoadComplementos;
begin
  inherited;
  if Assigned(FDTO) then
  begin
    MyController.GetResponsaveisByCriancaID(MyDTO.ID, FListaResponsaveis);
  end;
end;

procedure TFichaCriancas.LoadTreeList;
var
  vDTO: TDTOResponsaveis;
begin
  with MyFrame do
  begin
    treeListResponsaveis.Clear;
    for vDTO in FListaResponsaveis do
    begin
      if vDTO.StatusCrud <> tscDelete then
      begin
        with treeListResponsaveis.Add do
        begin
          Data := Pointer(vDTO);
          Values[treeListColumn_Nome.ItemIndex] := vDTO.Nome;
          Values[treeListColumn_Documento.ItemIndex] := vDTO.Documento;
        end;
      end;
    end;
  end;
end;

function TFichaCriancas.MyController: TControllerCriancas;
begin
  Result := (Self.FController as TControllerCriancas);
end;

function TFichaCriancas.MyDTO: TDTOCriancas;
begin
  Result := (Self.FDTO as TDTOCriancas);
end;

function TFichaCriancas.MyFrame: TframeCriancas;
begin
  Result := (Self.FFrame as TframeCriancas);
end;

procedure TFichaCriancas.SetEvents;
begin
  inherited;

  with MyFrame do
  begin
    edtNascimento.Properties.OnEditValueChanged := edtNascimentoChanged;
    btnNovo.OnClick := btnNovoEvent;
    btnDeletar.OnClick := btnDeletarEvent;
    treeListResponsaveis.OnDblClick := treeListResponsaveisEvent;

    btnLoad.OnClick := btnCarregarEvent;
    btnWebCam.OnClick := btnWebCanEvent;
    btnClear.OnClick := btnLimparEvent;
  end;

end;

procedure TFichaCriancas.SetIdadeLabel;
var
  vIdade: Integer;
begin
  MyFrame.lblCaptionIdade.Visible := not (GetFrame as TframeCriancas).edtNascimento.Date.IsNull;
  MyFrame.lblIdade.Visible := not (GetFrame as TframeCriancas).edtNascimento.Date.IsNull;

   vIdade := YearsBetween((GetFrame as TframeCriancas).edtNascimento.Date,Trunc(Now));
  if vIdade > 1
    then MyFrame.lblIdade.Caption := Format('%d anos',[vIdade])
    else MyFrame.lblIdade.Caption := Format('%d ano',[vIdade]);
end;

procedure TFichaCriancas.SetOnChange;
begin
  inherited;

  with MyFrame do
  begin
    edtCodigo.Properties.OnChange := OnChangeMethod;
    edtNome.Properties.OnChange := OnChangeMethod;
    edtNascimento.Properties.OnChange := OnChangeMethod;
    ImgFoto.Properties.OnChange := OnChangeMethod;
  end;

end;

procedure TFichaCriancas.treeListResponsaveisEvent(Sender: TObject);
var
  vDTO: TDTOResponsaveis;
begin
  with MyFrame do
  begin
    if Assigned(treeListResponsaveis.FocusedNode) then
    begin
      vDTO := TDTOResponsaveis(treeListResponsaveis.FocusedNode.Data);

      if ficha.Responsavel.TfichaResponsaveis.Init(vDTO, False) then
      begin
        if vDTO.StatusCrud <> tscInsert then
          vDTO.StatusCrud := TStatusCRUD.tscUpdate;

        Self.LoadTreeList;
        OnChangeMethod(Sender);
      end;
    end;
  end;
end;

procedure TFichaCriancas.AfterSave;
var
  vDTO: TDTOResponsaveis;
  vDTOResponsaveisCriancas: TDTOResponsaveisCriancas;
begin
  inherited;
  for vDTO in TDTOCriancas(Self.FDTO).ListaResponsaveis do
  begin
    vDTOResponsaveisCriancas := TDTOResponsaveisCriancas.Create;
    try
      vDTOResponsaveisCriancas.ID_Crianca := TDTOCriancas(Self.FDTO).ID;

      case vDTO.StatusCrud of
        tscNone: ;
        tscUpdate: MyController.Update(vDTO);
        tscDelete: MyController.Delete(vDTO);
        tscInsert: begin
                     MyController.Insert(vDTO);

                     vDTOResponsaveisCriancas.ID_Responsavel := vDTO.ID;
                     MyController.Insert(vDTOResponsaveisCriancas);
                   end;
      end;
    finally
      vDTOResponsaveisCriancas.Free;
    end;
  end;
end;

procedure TFichaCriancas.btnCarregarEvent(Sender: TObject);
var
  vDlgImage: TOpenDialog;
begin
  vDlgImage := TOpenDialog.Create(nil);
  try
    vDlgImage.Filter := 'All(*.JPG;*.JPEG)|*.JPG;*.JPEG';

    if vDlgImage.Execute() then
    begin
      MyFrame.ImgFoto.Picture.LoadFromFile(vDlgImage.FileName);
    end;
  finally
    vDlgImage.Free;
  end;
end;

procedure TFichaCriancas.btnDeletarEvent(Sender: TObject);
var
  vDTO: TDTOResponsaveis;
  vPodeRemover: Boolean;
  vMsg: WideString;
begin
  with MyFrame do
  begin
    if Assigned(treeListResponsaveis.FocusedNode) then
    begin
      vDTO := TDTOResponsaveis(treeListResponsaveis.FocusedNode.Data);

      if vDTO.StatusCrud = tscInsert
        then FListaResponsaveis.Extract(vDTO)
        else begin
          vPodeRemover := MyController.PodeRemoverResponsavel(vDTO.ID, vMsg);
          if vPodeRemover
            then vDTO.StatusCrud := TStatusCRUD.tscDelete
            else TviewMessage.Send_Information(vMsg);
        end;

      Self.LoadTreeList;
      OnChangeMethod(Sender);
    end;
  end;
end;

procedure TFichaCriancas.btnLimparEvent(Sender: TObject);
begin
  if TviewMessage.Send_Question('Deseja realmente remover esta imagem?')
    then MyFrame.ImgFoto.Clear;
end;

procedure TFichaCriancas.btnNovoEvent(Sender: TObject);
var
  vDTO: TDTOResponsaveis;
begin
  with MyFrame do
  begin
    vDTO := TDTOResponsaveis.Create;
    vDTO.StatusCrud := TStatusCRUD.tscInsert;

    if ficha.Responsavel.TfichaResponsaveis.Init(vDTO,True) then
    begin
      FListaResponsaveis.Add(vDTO);
      Self.LoadTreeList;
      OnChangeMethod(Sender);
    end;
  end;
end;

procedure TFichaCriancas.btnWebCanEvent(Sender: TObject);
var
  vImg: String;
begin
  TfichaMainCamera.Init(vImg);
  if (vImg <> EmptyStr) then
    MyFrame.ImgFoto.Picture := TMisc.StringToPicture(vImg);
end;

function TFichaCriancas.ClassController: TORMControllerBaseClass;
begin
  Result := TControllerCriancas;
end;

function TFichaCriancas.ClassDTO: TORMDTOBaseClass;
begin
  Result := TDTOCriancas;
end;

procedure TFichaCriancas.CreateAllObjects;
begin
  inherited CreateAllObjects();
  Self.FListaResponsaveis := TObjectList<TDTOResponsaveis>.Create();
end;

procedure TFichaCriancas.DestroyAllObjects;
begin
  Self.FListaResponsaveis.Free;
  inherited DestroyAllObjects();
end;

procedure TFichaCriancas.DTOToView;
begin
  inherited;

  with MyFrame do
  begin

    if FStatusFicha = sfInsert then
    begin
      edtCodigo.Text := MyController.GetSequenceCodigo;
      edtNascimento.Date := StrToDate('01/01/1999');
    end
    else
    begin
      edtCodigo.Text := MyDTO.Codigo;
      edtNascimento.Date := MyDTO.Nascimento;
    end;

    edtNome.Text := MyDTO.Nome;
    SetIdadeLabel();
    if MyDTO.Foto <> EmptyStr then
      ImgFoto.Picture := TMisc.StringToPicture( MyDTO.Foto );

    {Responsaveis}
    Self.LoadTreeList;

    {Seta para primeira página}
    pgControl.ActivePage := tsFoto;

  end;

end;

procedure TFichaCriancas.edtNascimentoChanged(Sender: TObject);
begin
  inherited OnChangeMethod(Sender);
  SetIdadeLabel();
end;

procedure TFichaCriancas.ViewToDTO;
var
  vDTO: TDTOResponsaveis;
  I: Integer;
begin
  inherited;

  with MyDTO do
  begin
    Codigo := MyFrame.edtCodigo.Text;
    Nome := MyFrame.edtNome.Text;
    Nascimento := MyFrame.edtNascimento.Date;
    Foto := TMisc.PictureToString( MyFrame.ImgFoto.Picture );

    ListaResponsaveis.Clear;
    for vDTO in FListaResponsaveis do
    begin
      ListaResponsaveis.Add(vDTO);
    end;
  end;

end;

end.
