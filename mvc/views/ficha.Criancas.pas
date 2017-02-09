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
  ficha.Responsavel;

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
  end;

end;

procedure TFichaCriancas.SetIdadeLabel;
var
  vIdade: Integer;
begin
  (GetFrame as TframeCriancas).lblCaptionIdade.Visible := not (GetFrame as TframeCriancas).edtNascimento.Date.IsNull;
  (GetFrame as TframeCriancas).lblIdade.Visible := not (GetFrame as TframeCriancas).edtNascimento.Date.IsNull;

   vIdade := YearsBetween((GetFrame as TframeCriancas).edtNascimento.Date,Trunc(Now));
  if vIdade > 1
    then (GetFrame as TframeCriancas).lblIdade.Caption := Format('%d anos',[vIdade])
    else (GetFrame as TframeCriancas).lblIdade.Caption := Format('%d ano',[vIdade]);
end;

procedure TFichaCriancas.SetOnChange;
begin
  inherited;

  with MyFrame do
  begin
    edtCodigo.Properties.OnChange := OnChangeMethod;
    edtNome.Properties.OnChange := OnChangeMethod;
    edtNascimento.Properties.OnChange := OnChangeMethod;
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

procedure TFichaCriancas.btnDeletarEvent(Sender: TObject);
var
  vDTO: TDTOResponsaveis;
begin
  with MyFrame do
  begin
    if Assigned(treeListResponsaveis.FocusedNode) then
    begin
      vDTO := TDTOResponsaveis(treeListResponsaveis.FocusedNode.Data);

      if vDTO.StatusCrud = tscInsert
        then FListaResponsaveis.Extract(vDTO)
        else vDTO.StatusCrud := TStatusCRUD.tscDelete;

      Self.LoadTreeList;
      OnChangeMethod(Sender);
    end;
  end;
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
    edtCodigo.Text := MyDTO.Codigo;
    edtNome.Text := MyDTO.Nome;
    edtNascimento.Date := MyDTO.Nascimento;
    SetIdadeLabel();

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
    Codigo := (GetFrame as TframeCriancas).edtCodigo.Text;
    Nome := (GetFrame as TframeCriancas).edtNome.Text;
    Nascimento := (GetFrame as TframeCriancas).edtNascimento.Date;

    ListaResponsaveis.Clear;
    for vDTO in FListaResponsaveis do
    begin
      ListaResponsaveis.Add(vDTO);
    end;
  end;

end;

end.
