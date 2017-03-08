unit WLick.Miscelania;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms,
  ExtCtrls, Vcl.Graphics, JPEG, dto.Usuarios, generics.collections,
  ORM.dtoBase, EncdDecd,
  cxDBLookupComboBox,
  cxMaskEdit,
  cxLookupDBGrid,
  cxTextEdit,
  cxDropDownEdit,
  cxButtonEdit,
  cxCurrencyEdit,
  cxMemo,
  cxCalendar,
  cxTL,
  cxButtons,
  cxCheckBox,
  dximctrl,
  cxImageComboBox,
  cxTLData,
  cxTimeEdit,
  cxCalc;

Type
  TMisc = class
    class function Encrypt(const S: String): String;
    class function Decrypt(const S: String): String;

    class procedure PostAllEditValues(const a_Form: TForm); overload;
    class procedure PostAllEditValues(const a_Frame: TFrame); overload;

    class function GetVersaoSistema(): String;

    class function PictureToString(const pValor : TPicture) : string;
    class function StringToPicture(const pValor : String) : TPicture;
  end;

var
  CryptStartKey: Word = $2000;
  CryptNum1: Word = $34;
  CryptNum2: Word = $218;

implementation


{ TMisc }

class function TMisc.GetVersaoSistema: String;
var
  VerInfoSize   : DWORD;
  VerInfo       : Pointer;
  VerValueSize  : DWORD;
  VerValue      : PVSFixedFileInfo;
  Dummy         : DWORD;
  V1, V2, V3, V4: Word;
  Prog, ultimo  : string;
begin
  Prog := Application.Exename;
  VerInfoSize := GetFileVersionInfoSize(PChar(Prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(Prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    V1 := dwFileVersionMS shr 16;
    V2 := dwFileVersionMS and $FFFF;
    V3 := dwFileVersionLS shr 16;
    V4 := dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  ultimo := Copy('100' + IntToStr(V4), 4, 2);

  result := Copy('100' + IntToStr(V1), 4, 2) + '.' +
    Copy('100' + IntToStr(V2), 4, 2) + '.' +
    Copy('100' + IntToStr(V3), 4, 2) + '.' +
    Copy('100' + IntToStr(V4), 4, 2);
end;


class function TMisc.PictureToString(const pValor : TPicture) : string;
var
  StreamImagem : TStringStream;
  objJPEG : TJPEGImage;
begin
  Result := '';
  if Assigned(pValor) and Assigned(pValor.Graphic) then
  begin
    try
      StreamImagem := TStringStream.Create;

      objJPEG := TJPEGImage.Create;

      objJPEG.Assign(pValor.Graphic);

      objJPEG.SaveToStream(StreamImagem);
      StreamImagem.Position := 0;

      Result := StreamImagem.ReadString(StreamImagem.Size);
    finally
      objJPEG.Free;
      StreamImagem.Free;
    end;
  end;
end;

class procedure TMisc.PostAllEditValues(const a_Form: TForm);
var
  i: Integer;
begin
  for i := 0 to a_Form.ComponentCount - 1 do
  begin
    if a_Form.Components[i] is TcxTextEdit then
      TcxTextEdit(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxMaskEdit then
      TcxMaskEdit(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxCurrencyEdit then
      TcxTextEdit(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxComboBox then
      TcxComboBox(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxMemo then
      TcxMemo(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxCheckBox then
      TcxCheckBox(a_Form.Components[i]).PostEditValue
    else if a_Form.Components[i] is TcxDateEdit then
      TcxDateEdit(a_Form.Components[i]).PostEditValue
    else if (a_Form.Components[i] is TcxTreeList) then
    begin
      TcxTreeList(a_Form.Components[i]).Post;

      if (Assigned(TcxTreeList(a_Form.Components[i]).InplaceEditor)) then
        TcxTreeList(a_Form.Components[i]).InplaceEditor.PostEditValue
    end
    else if (a_Form.Components[i] is TcxVirtualTreeList) and (Assigned(TcxVirtualTreeList(a_Form.Components[i]).InplaceEditor)) then
      TcxVirtualTreeList(a_Form.Components[i]).InplaceEditor.PostEditValue
    else if (a_Form.Components[i] is TcxCalcEdit) then
      TcxCalcEdit(a_Form.Components[i]).PostEditValue;
  end;
end;

class procedure TMisc.PostAllEditValues(const a_Frame: TFrame);
var
  i: Integer;
begin
  for i := 0 to a_Frame.ComponentCount - 1 do
  begin
    if a_Frame.Components[i] is TcxTextEdit then
      TcxTextEdit(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxMaskEdit then
      TcxMaskEdit(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxCurrencyEdit then
      TcxTextEdit(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxComboBox then
      TcxComboBox(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxMemo then
      TcxMemo(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxCheckBox then
      TcxCheckBox(a_Frame.Components[i]).PostEditValue
    else if a_Frame.Components[i] is TcxDateEdit then
      TcxDateEdit(a_Frame.Components[i]).PostEditValue
    else if (a_Frame.Components[i] is TcxTreeList) then
    begin
      TcxTreeList(a_Frame.Components[i]).Post;

      if (Assigned(TcxTreeList(a_Frame.Components[i]).InplaceEditor)) then
        TcxTreeList(a_Frame.Components[i]).InplaceEditor.PostEditValue
    end
    else if (a_Frame.Components[i] is TcxVirtualTreeList) and (Assigned(TcxVirtualTreeList(a_Frame.Components[i]).InplaceEditor)) then
      TcxVirtualTreeList(a_Frame.Components[i]).InplaceEditor.PostEditValue
    else if (a_Frame.Components[i] is TcxCalcEdit) then
      TcxCalcEdit(a_Frame.Components[i]).PostEditValue;
  end;
end;

class function TMisc.StringToPicture(const pValor : String): TPicture;
var
  StreamImagem : TStringStream;
  objJPEG : TJPEGImage;
begin
  if (pValor <> '') then
  begin
    StreamImagem := TStringStream.Create;
    objJPEG := TJPEGImage.Create;
    try
      StreamImagem.WriteString(pValor);
      StreamImagem.Position := 0;

      objJPEG.LoadFromStream(StreamImagem);

      Result := TPicture.Create;
      Result.Assign(objJPEG);
    finally
      objJPEG.Create;
      StreamImagem.Free;
    end;
  end;
end;


class function TMisc.Encrypt(const S: String): String;
var
  b: Byte;
  i: Integer;
  Key: Word;
begin
  Key := CryptStartKey;
  Result := '';
  for i := 1 to Length(S) do
  begin
    b := Byte(S[i]) xor (Key shr 8);
    Key := (b + Key) * CryptNum1 + CryptNum2;
    Result := Result + IntToHex(b, 2)
  end
end;

class function TMisc.Decrypt(const S: String): String;
var
  b: Byte;
  i: Integer;
  Key: Word;
begin
  b := 0;
  Key := CryptStartKey;
  Result := '';
  for i := 1 to Length(S) div 2 do
  begin
    try
      b := StrToInt('$' + Copy(S, 2 * i - 1, 2));
    except
      on EConvertError do b := 0
    end;
    Result := Result + Char(b xor (Key shr 8));
    Key := (b + Key) * CryptNum1 + CryptNum2;
  end;
end;

end.
