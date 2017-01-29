unit WLick.Miscelania;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, vcl.Forms;

Type
  TMisc = class
    class function GetVersaoSistema(): String;
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

end.
