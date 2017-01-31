unit WLick.Miscelania;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms,
  ExtCtrls, Vcl.Graphics, JPEG, dto.Usuarios, Soap.EncdDecd;

Type
  TMisc = class
    class function GetVersaoSistema(): String;
    class function PictureToString(const pValor : TPicture) : string;
    class function StringToPicture(const pValor : String) : TPicture;

    class function BitmapFromBase64(const base64: string): TBitmap;
    class function Base64FromBitmap(Bitmap: TBitmap): string;
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
  //objJPEG := TJPEGImage.Create;
  try
    if Assigned(pValor) and Assigned(pValor.Graphic) then
    begin
      //objJPEG.Assign(pValor.Graphic.save);

      pValor.Graphic.SaveToStream(StreamImagem);
      StreamImagem.Position := 0;

      Result := StreamImagem.ReadString(StreamImagem.Size);
    end;
  finally
    //objJPEG.Free;
    StreamImagem.Free;
  end;
end;

class function TMisc.StringToPicture(const pValor : String) : TPicture;
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

      Result.Assign(objJPEG);
    end;
  finally
    objJPEG.Create;
    StreamImagem.Free;
  end;
end;

class function TMisc.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  if Assigned(Bitmap) then
  begin
    Input := TBytesStream.Create;
    try
      Bitmap.SaveToStream(Input);
      Input.Position := 0;
      Output := TStringStream.Create('', TEncoding.ASCII);
      try
        Soap.EncdDecd.EncodeStream(Input, Output);
        Result := Output.DataString;
      finally
        Output.Free;
      end;
    finally
      Input.Free;
    end;
  end;
end;

class function TMisc.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  if base64 <> '' then
  begin
    Input := TStringStream.Create(base64, TEncoding.ASCII);
    try
      Output := TBytesStream.Create;
      try
        Soap.EncdDecd.DecodeStream(Input, Output);
        Output.Position := 0;
        Result := TBitmap.Create;
        try
          Result.LoadFromStream(Output);
        except
          Result.Free;
          raise;
        end;
      finally
        Output.Free;
      end;
    finally
      Input.Free;
    end;
  end;
end;

end.
