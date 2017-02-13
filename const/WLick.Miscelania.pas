unit WLick.Miscelania;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms,
  ExtCtrls, Vcl.Graphics, JPEG, dto.Usuarios, generics.collections,
  ORM.dtoBase, cxDropDownEdit, EncdDecd;

Type
  TMisc = class
    class function GetVersaoSistema(): String;

    class function PictureToString(const pValor : TPicture) : string;
    class function StringToPicture(const pValor : String) : TPicture;
  end;

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

  StreamImagem := TStringStream.Create;
  objJPEG := TJPEGImage.Create;
  try
    if Assigned(pValor) and Assigned(pValor.Graphic) then
    begin
      objJPEG.Assign(pValor.Graphic);
      //objJPEG.CompressionQuality := 100;
      //objJPEG.Compress;

      objJPEG.SaveToStream(StreamImagem);
      StreamImagem.Position := 0;

      Result := StreamImagem.ReadString(StreamImagem.Size);
    end;
  finally
    objJPEG.Free;
    StreamImagem.Free;
  end;
end;

class function TMisc.StringToPicture(const pValor : String): TPicture;
var
  StreamImagem : TStringStream;
  objJPEG : TJPEGImage;
begin
  StreamImagem := TStringStream.Create;
  objJPEG := TJPEGImage.Create;
  try
    if (pValor <> '') then
    begin
      StreamImagem.WriteString(pValor);
      StreamImagem.Position := 0;

      objJPEG.LoadFromStream(StreamImagem);

      Result := TPicture.Create;
      Result.Assign(objJPEG);
    end;
  finally
    objJPEG.Create;
    StreamImagem.Free;
  end;
end;

end.
