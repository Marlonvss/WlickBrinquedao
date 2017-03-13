unit WLick.ClassHelper;

interface

uses
  Variants, Classes, System.SysUtils, DateUtils, cxButtons, cxImageComboBox,
  cxDropDownEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLookupEdit,
  Data.DB, System.Types, DBAccess;

type

  Helper_Variant = record helper for Variant
    function ToString(): String;
    function ToDate(): TDate;
    function ToDateTime(): TDateTime;
    function ToInteger(): Integer;
    function ToLargeInt(): Int64;
    function ToBoolean(const a_Default : Boolean = False):Boolean;
    function IsNull():Boolean;
    function ToGUID(): TGUID;
    function ToDouble(): Double;
    function ToCurrency(): Currency;
    function ToExtended(): Extended;
  end;

  Helper_ComboBox = class helper for TcxComboBox
    procedure Disable();
    procedure Enable();
    procedure SetItemIndex(const a_Value: Integer);
    procedure AddItemStr(const a_Value: String);
    procedure ClearItens();
    function IndexOf(const a_Value: String): Integer;
  end;

  Helper_LookupComboBox = class helper for TcxLookupComboBox
    procedure Disable();
    procedure Enable();
  end;

  Helper_Button = class helper for TcxButton
    procedure Disable();
    procedure Enable();
  end;

  Helper_ImageComboBox = class helper for TcxImageComboBox
    procedure Disable();
    procedure Enable();
    procedure SetItemIndex(const a_Value: Integer);
  end;

  Helper_Boolean = record helper for Boolean
    function ToString(): String;
    function ToQuery(): String;
    function ToInteger(): integer;
  end;

  Helper_Integer = record helper for Integer
    function ToString(const a_zeroIsNull: Boolean = False): String;
    function ToBoolean(): Boolean;
    function IsInvalid(): Boolean;
  end;

  Helper_SmallInt = record helper for SmallInt
    function ToString(): String;
    function ToBoolean(): Boolean;
    function IsInvalid(): Boolean;
  end;

  Helper_Int64 = record helper for Int64
    function ToString(): String;
  end;

  Helper_String = record helper for String
    function OnlyNumbers(): String;
    function ToDate(): TDate;
    function ToDateFormat(const a_Format: String): TDate;
    function ToDateTime(): TDateTime;
    function ToTime() : TTime;
    function ToInteger(): Integer;
    function ToDouble() : Double;
    function ToGUID(): TGUID;
    function ToCurrency(): Currency;
    function ToBoolean(): Boolean;
    function ToExtended(): Extended;
    function ToUpper(): String;
    function ToLower(): String;
    function IsNull(): Boolean;
    function Quoted(): String;
    function CommaQuoted(): String;
    function WithoutChar(const a_char: string): String;
    function OnlyChar(): String;
    function Equals(const a_String: string): Boolean;
    function CompletarEsquerda(const a_TamanhoFinal: Integer; const a_Char: Char = ' '): String;
    function CompletarDireita(const a_TamanhoFinal: Integer; const a_Char: Char = ' '): String;
    function WhenNull(const a_default: string): string;
    function ConcatWithLineBreak(const a_Text: String): String;
    function Split(a_delimiter : Char) : TArray<String>;
  end;

  Helper_WideString = record helper for WideString
    function toUpper(): WideString;
    function IsNull(): Boolean;
    function CommaQuoted(): WideString;
  end;

  Helper_Date = record helper for TDate
    function IsNull(): Boolean;
    function ToString(): String;
    function YearOf(): Integer;
    function MonthOf(): Integer;
    function DayOf(): Integer;
  end;

  Helper_Time = record helper for TTime
    function IsNull() : Boolean;
    function ToString() : String;
  end;

  Helper_Double = record helper for Double
    function ToInt(): Integer;
    function ToQuery: String;
    function ToString(): String;
  end;

  Helper_Currency = record helper for Currency
    function ToString(): String;
    function FormatToSQL(): String;
  end;

  Helper_AnsiString = record helper for AnsiString
    function EmBranco(): Boolean;
  end;

  Helper_DateTime = record helper for TDateTime
    function ToDate(): TDate;
    function ToString(a_ConsiderarHora: boolean = True): String;
    function IsNull(): Boolean;
  end;

  Helper_Extended = record helper for Extended
    function ToString(): String;
  end;

  TFuncoesGUID = class
  public
    class function FromString(const a_Value : String): TGuid;
    class function ToString(const a_Value : TGUID): String;
    class function NullGUID: TGUID;
    class function NewGUID: TGUID;
  end;

  THelperGuid = record helper for TGUID
    function IsNull(): Boolean;
    function ToString(): String;
    function ToQuotedString(): String;
    function Equals(a_GUID: TGUID): Boolean;
    procedure generate();
    procedure null();
  end;

  THelperField = Class helper for TField
  protected
    function GetAsGuid: TGUID;
    procedure SetAsGuid(const Value: TGUID);
    function GetAsQuoted: String;
  public
    property AsGuid: TGUID read GetAsGuid write SetAsGuid;
    property AsQuoted: String read GetAsQuoted;
  end;

  THelperGuidField = Class helper for TGuidField
  protected
    function GetAsGuid: TGUID;
    function GetAsQuoted: String;
    procedure SetAsGuid(const Value: TGUID);
  public
    property AsGuid: TGUID read GetAsGuid write SetAsGuid;
    property AsQuoted: String read GetAsQuoted;
  end;

  THelperParam = Class helper for TParam
  protected
    function GetAsGuid: TGUID;
    procedure SetAsGuid(const Value: TGUID);
  public
    property AsGuid: TGUID read GetAsGuid write SetAsGuid;
  end;

  THelperCustomDaDataSet = Class helper for TCustomDaDataSet
  protected
  public
     function FindKey(const KeyValues:  Array Of TGUID): Boolean; overload;
     function FindKey(const KeyValues:  Array Of Variant): Boolean; overload;
  end;

implementation

{ Helper_Variant }

function Helper_Variant.IsNull: Boolean;
begin
  Result := VarIsNull(Self)
end;

function Helper_Variant.ToBoolean(const a_Default : Boolean = False): Boolean;
begin
  Try
   Result := a_Default;
   if not VarIsNull(Self) and not (VarToStr(Self) = '')
    then Result := VarAsType(Self, varBoolean);
  Except
    begin
      Result := False;
      raise Exception.Create('Erro ao converter o campo Variant para Boolean.');
    end;
  End
end;

function Helper_Variant.ToCurrency: Currency;
begin
  Result := 0;
  try
     if not VarIsNull(Self) and not (VarToStr(Self) = '')
      then Result := Self;
  except on E: Exception
    do begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Currency.');
    end;
  end;
end;

function Helper_Variant.ToDate: TDate;
begin
   Try
     Result := 0;
     if not VarIsNull(Self) and not (VarToStr(Self) = '') then
       Result := VarAsType(Self, varDate);
   Except
    begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Date.');
    end;
   End
end;

function Helper_Variant.ToDateTime: TDateTime;
begin
   Try
     Result := 0;
     if not VarIsNull(Self) and not (VarToStr(Self) = '')
      then Result := Self.ToString().ToDateTime();
   Except
    begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Date.');
    end;
   End
end;

function Helper_Variant.ToDouble: Double;
begin
  Result := 0;
  try
    if not VarIsNull(Self) and not (VarToStr(Self) = '')
      then Result := Self;
  except
    begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Double.');
    end;
  end;
end;

function Helper_Variant.ToExtended: Extended;
begin
  Result := 0;
  try
     if not VarIsNull(Self) and not (VarToStr(Self) = '')
      then Result := Self;
  except on E: Exception
    do begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Extended.');
    end;
  end;
end;

function Helper_Variant.ToGUID: TGUID;
begin
  try
    Result := TFuncoesGUID.FromString(StringReplace(VarToStr(Self), '''', '', [rfReplaceAll]));
  except
    begin
      Result := TFuncoesGUID.NullGUID;
      raise Exception.Create('Erro ao converter o campo Variant para Guid.');
    end;
  end;
end;

function Helper_Variant.ToInteger: Integer;
begin
   try
     Result := 0;
     if not VarIsNull(Self) and not (VarToStr(Self) = '') and VarIsNumeric(Self)
      then Result := VarAsType(Self, varInteger);
   except on E: Exception do
    begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Integer.');
    end;
   end;
end;

function Helper_Variant.ToLargeInt: Int64;
begin
   try
     Result := 0;
     if not VarIsNull(Self) and not (VarToStr(Self) = '') and VarIsNumeric(Self)
      then Result := VarAsType(Self, varInt64);
   except on E: Exception do
    begin
      Result := 0;
      raise Exception.Create('Erro ao converter o campo Variant para Int64.');
    end;
   end;
end;

function Helper_Variant.ToString: String;
begin
  try
    Result := EmptyStr;
    if not VarIsNull(Self) and not (VarToStr(Self) = '') then
      Result := VarToStr(Self);
  except
    begin
      Result := EmptyStr;
      raise Exception.Create('Erro ao converter o campo Variant para String.');
    end;
  end
end;

{ Helper_Boolean }

function Helper_Boolean.ToInteger: integer;
begin
  Result := Integer(Self);
end;

function Helper_Boolean.ToQuery: String;
begin
  if Self
    then Result := 'True'
    else Result := 'False';
end;

function Helper_Boolean.ToString: String;
begin
  if Self
    then Result := '1'
    else Result := '0';
end;

{ Helper_Integer }

function Helper_Integer.IsInvalid: Boolean;
begin
  Result := Self < 0;
end;

function Helper_Integer.ToBoolean: Boolean;
begin
  Result := Boolean(Self);
end;

function Helper_Integer.ToString(const a_zeroIsNull: Boolean = False): String;
begin
  Result := IntToStr(Self);
  if (Result = '0') and a_zeroIsNull
    then Result := EmptyStr;
end;

{ Helper_Int64 }

function Helper_Int64.ToString: String;
begin
  Result := IntToStr(Self);
end;

{ Helper_String }

function Helper_String.CommaQuoted: String;
begin
  Result := WideString(Self).CommaQuoted();
end;

function Helper_String.CompletarDireita(const a_TamanhoFinal: Integer; const a_Char: Char): String;
var
  t_TamanhoFinal: Integer;
begin
  t_TamanhoFinal := a_TamanhoFinal - Length(Self);
  if t_TamanhoFinal > 0
    then Result := Self + System.StringOfChar(a_Char, t_TamanhoFinal)
    else Result := Self;
end;

function Helper_String.CompletarEsquerda(const a_TamanhoFinal: Integer; const a_Char: Char): String;
var
  t_TamanhoFinal: Integer;
begin
  t_TamanhoFinal := a_TamanhoFinal - Length(Self);
  if t_TamanhoFinal > 0
    then Result := System.StringOfChar(a_Char, t_TamanhoFinal) + Self
    else Result := Self;
end;

function Helper_String.ConcatWithLineBreak(const a_Text: String): String;
begin
  if Self.IsNull()
    then Self := a_Text
    else Self := Self + #13 + a_Text;
  Result := Self;
end;

function Helper_String.Equals(const a_String: string): Boolean;
begin
  Result := SameText(
              StringReplace(Trim(Self), '''', '', [rfReplaceAll]),
              StringReplace(Trim(a_String), '''', '', [rfReplaceAll])
            );
end;

function Helper_String.IsNull: Boolean;
begin
  Result := SameText(Trim(Self), EmptyStr);
end;

function Helper_String.OnlyChar: String;

  var t_indice: Integer;

begin
  Result := System.SysUtils.EmptyStr;
  if Self.isNull()
    then Exit();
  for t_indice := 0 to Length(Self)
    do begin
      if (Self[t_indice] in ['A'..'Z', 'a'..'z', '0'..'9'])
        then Result := Result + Self[t_indice];
    end;
end;

function Helper_String.OnlyNumbers: String;

  var t_indice: Integer;

begin
  Result := System.SysUtils.EmptyStr;
  if Self.isNull()
    then Exit();
  for t_indice := 0 to Length(Self)
    do begin
      if (Self[t_indice] in ['0'..'9'])
        then Result := Result + Self[t_indice];
    end;
end;

function Helper_String.Quoted: String;
begin
  Result := QuotedStr(Self);
end;

function Helper_String.ToBoolean: Boolean;
begin
  Result := False;
  try
    if not Self.IsNull()
      then Result := StrToBool(Self);
  except on E: Exception
    do Result := False;
  end;
end;

function Helper_String.ToCurrency: Currency;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToFloat(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToDate: TDate;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToDate(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToDateFormat(const a_Format: String): TDate;
var
  vFormat : TFormatSettings;
Begin
  vFormat := TFormatSettings.Create;
  vFormat.DateSeparator := '-';
  vFormat.ShortDateFormat := a_Format;

  Result := 0;
  try
    if not Self.IsNull() then
    begin
      Result := StrToDate(Self, vFormat);
    end;
  except
    Result := 0;
  end;
end;

function Helper_String.ToDateTime: TDateTime;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToDateTime(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToDouble: Double;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToFloat(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToExtended: Extended;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToFloat(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToGUID: TGUID;
begin
  Result := TGUID.Empty;
  try
    if not Self.IsNull()
      then begin
        if Pos('{', Self) > 0
          then Result := StringToGUID(Self)
          else Result := StringToGuid('{' + Self + '}');
      end;
  except
    Result := TGUID.Empty;
  end;
end;

function Helper_String.ToInteger: Integer;
begin
  try
    if Self <> ''
      then Result := StrToInt(Self)
      else Result := 0;
  except
    Result := 0;
  end;
end;

function Helper_String.ToLower: String;
begin
  Result := LowerCase(Self);
end;

function Helper_String.ToTime: TTime;
begin
  Result := 0;
  try
    if not Self.IsNull()
      then Result := StrToTime(Self);
  except
    Result := 0;
  end;
end;

function Helper_String.ToUpper: String;

  var t_indice: Integer;

begin
  if(Self.IsNull) then
    Exit;

  for t_indice := 0 to Length(Self)
    do begin
      case Self[t_indice] Of
        'á': Self[t_indice] := 'Á';
        'â': Self[t_indice] := 'Â';
        'ã': Self[t_indice] := 'Ã';
        'à': Self[t_indice] := 'À';
        'é': Self[t_indice] := 'É';
        'ê': Self[t_indice] := 'Ê';
        'í': Self[t_indice] := 'Í';
        'ó': Self[t_indice] := 'Ó';
        'ô': Self[t_indice] := 'Ô';
        'õ': Self[t_indice] := 'Õ';
        'ú': Self[t_indice] := 'Ú';
        'ü': Self[t_indice] := 'Ü';
        'ç': Self[t_indice] := 'Ç';
        'ñ': Self[t_indice] := 'Ñ';
        'a' .. 'z': Self[t_indice] := System.UpCase(Self[t_indice]);
      end;
    end;
  Result := Self;
end;

function Helper_String.WhenNull(const a_default: string): string;
begin
  if Self.IsNull
    then Result := a_default
    else Result := Self;
end;

function Helper_String.WithoutChar(const a_char: string): String;
begin
  Result := StringReplace(Self, a_char, '', [rfReplaceAll]);
end;

function Helper_String.Split(a_delimiter : Char) : TArray<String>;

  var t_ListaRetorno : TStringList;
  var t_I : integer;

begin
  t_ListaRetorno := TStringList.Create;

  try
    t_ListaRetorno.Delimiter       := a_delimiter;
    t_ListaRetorno.StrictDelimiter := True;
    t_ListaRetorno.DelimitedText   := Self;

    SetLength(Result, t_ListaRetorno.Count);

    for t_I := 0 to t_ListaRetorno.Count-1 do
    begin
      Result[t_I] := t_ListaRetorno[t_I];
    end;
  finally
    FreeAndNil(t_ListaRetorno);
  end;
end;
{ Helper_WideString }

function Helper_WideString.CommaQuoted: WideString;
var
  t_Lista : TstringList;
  i: Integer;
begin
  try
    t_Lista := TStringList.Create;
    t_Lista.Delimiter := ',';
    t_Lista.DelimitedText := Self;

    for i := 0 to t_Lista.Count -1
      do t_Lista[i] := QuotedStr(t_Lista[i]);
  finally
    Result := t_Lista.DelimitedText;
    FreeAndNil(t_Lista);
  end;
end;

function Helper_WideString.IsNull: Boolean;
begin
  Result := SameText(Trim(Self), EmptyStr);
end;

function Helper_WideString.toUpper: WideString;

  var t_indice: Integer;

begin
  if(Self.IsNull) then
    Exit;

  for t_indice := 0 to Length(Self)
    do begin
      case Self[t_indice] Of
        'á': Self[t_indice] := 'Á';
        'â': Self[t_indice] := 'Â';
        'ã': Self[t_indice] := 'Ã';
        'à': Self[t_indice] := 'À';
        'é': Self[t_indice] := 'É';
        'ê': Self[t_indice] := 'Ê';
        'í': Self[t_indice] := 'Í';
        'ó': Self[t_indice] := 'Ó';
        'ô': Self[t_indice] := 'Ô';
        'õ': Self[t_indice] := 'Õ';
        'ú': Self[t_indice] := 'Ú';
        'ü': Self[t_indice] := 'Ü';
        'ç': Self[t_indice] := 'Ç';
        'ñ': Self[t_indice] := 'Ñ';
        'a' .. 'z': Self[t_indice] := System.UpCase(Self[t_indice]);
      end;
    end;
  Result := Self;
end;

{ Helper_Date }

function Helper_Date.DayOf: Integer;
begin
  Result := DateUtils.DayOf(Self);
end;

function Helper_Date.IsNull: Boolean;
begin
  Result := (Self = 0) or (Self.ToString() = '00/00/0000') or (Self.ToString() = '31/12/1899');
end;

function Helper_Date.MonthOf: Integer;
begin
  Result := DateUtils.MonthOf(Self);
end;

function Helper_Date.ToString: String;
begin
  Result := DateToStr(Self);
end;

function Helper_Date.YearOf: Integer;
begin
  Result := DateUtils.YearOf(Self);
end;

{ Helper_Double }

function Helper_Double.ToInt: Integer;
begin
  Result := Trunc(Self);
end;

function Helper_Double.ToQuery: String;
begin
  Result := FloatToStr(Self);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

function Helper_Double.ToString: String;
begin
  Result := '';
  try
    if not VarIsNull(Self) and not (VarToStr(Self) = '') and VarIsFloat(Self)
      then Result := VarToStr(Self);
  except on E: Exception
    do Result := '';
  end;
end;

{ Helper_Currency }

function Helper_Currency.FormatToSQL: String;
begin
  Result := StringReplace(Self.ToString(), ',', '.', [rfReplaceAll]);
end;

function Helper_Currency.ToString: String;
begin
  try
    Result := FloatToStr(Self);
  except
    Result := '0';
  end;
end;

{ Helper_SmallInt }

function Helper_SmallInt.IsInvalid: Boolean;
begin
  Result := Self < 0;
end;

function Helper_SmallInt.ToBoolean: Boolean;
begin
  Result := Boolean(Self);
end;

function Helper_SmallInt.ToString: String;
begin
  Result := IntToStr(Self);
end;

{ Helper_Time }

function Helper_Time.IsNull: Boolean;
begin
  Result := Self = 0;
end;

function Helper_Time.ToString: String;
begin
  Result := TimeToStr(Self);
end;

{ Helper_AnsiString }

function Helper_AnsiString.EmBranco: Boolean;
begin
  Result := SameText(Trim(Self), EmptyStr);
end;

{ Helper_DateTime }

function Helper_DateTime.IsNull: Boolean;
begin
  Result := Self <= 0;
end;

function Helper_DateTime.ToDate: TDate;
begin
  Result := TDate(Self);
end;

function Helper_DateTime.ToString(a_ConsiderarHora: boolean = True): String;
begin
  if a_ConsiderarHora
    then Result := DateTimeToStr(Self)
    else Result := DateToStr(Self);
end;

{ Helper_ComboBOx }

procedure Helper_ComboBOx.AddItemStr(const a_Value: String);
begin
  Self.Properties.Items.Add(a_Value);
end;

procedure Helper_ComboBOx.ClearItens;
begin
  Self.Properties.Items.Clear();
end;

procedure Helper_ComboBOx.Disable;
begin
  Self.Enabled := False;
end;

procedure Helper_ComboBOx.Enable;
begin
  Self.Enabled := True;
end;

function Helper_ComboBOx.IndexOf(const a_Value: String): Integer;
begin
  Result := Self.Properties.Items.IndexOf(a_Value);
end;

procedure Helper_ComboBOx.SetItemIndex(const a_Value: Integer);
begin
  Self.ItemIndex := a_Value;
end;

{ Helper_LookupComboBOx }

procedure Helper_LookupComboBOx.Disable;
begin
  Self.Enabled := False;
end;

procedure Helper_LookupComboBOx.Enable;
begin
  Self.Enabled := True;
end;

{ Helper_Button }

procedure Helper_Button.Disable;
begin
  Self.Enabled := False;
end;

procedure Helper_Button.Enable;
begin
  Self.Enabled := True;
end;

{ Helper_ImageComboBox }

procedure Helper_ImageComboBox.Disable;
begin
  Self.Enabled := False;
end;

procedure Helper_ImageComboBox.Enable;
begin
  Self.Enabled := True;
end;

procedure Helper_ImageComboBox.SetItemIndex(const a_Value: Integer);
begin
  Self.ItemIndex := a_Value;
end;

{ Helper_Extended }

function Helper_Extended.ToString: String;
begin
  Result := '';
  try
    if not VarIsNull(Self) and not (VarToStr(Self) = '') and VarIsFloat(Self)
      then Result := VarToStr(Self);
  except on E: Exception
    do Result := '';
  end;
end;

class function TFuncoesGUID.FromString(const a_Value : String): TGuid;
var
  a_StringGuid: string;
begin
  if a_Value <> '' then
  begin
    a_StringGuid := a_Value;
    a_StringGuid := StringReplace(a_StringGuid, '{', EmptyStr, []);
    a_StringGuid := StringReplace(a_StringGuid, '}', EmptyStr, []);
    Result := StringToGuid('{' + a_StringGuid + '}');
  end
  else
    Result := GUID_NULL;
end;

{ THelperField }

function THelperField.GetAsGuid: TGUID;
begin
    Result := TFuncoesGUID.FromString(GetAsString)
end;

function THelperField.GetAsQuoted: String;
begin
    Result := '"' + AsString + '"'
end;

procedure THelperField.SetAsGuid(const Value: TGUID);
begin
    SetAsString(TFuncoesGUID.ToString(Value));
end;

{ THelperParam }

function THelperParam.GetAsGuid: TGUID;
begin
    Result := TFuncoesGUID.FromString(GetAsString)
end;

procedure THelperParam.SetAsGuid(const Value: TGUID);
begin
    SetAsString(TFuncoesGUID.ToString(Value));
end;

{ THelperCustomDaDataSet }

function THelperCustomDaDataSet.FindKey(const KeyValues: Array Of TGUID): Boolean;
Var
    I : Integer;
    Chave : Array Of Variant;

begin
    SetLength (Chave, High(KeyValues) + 1);

    For I := Low (KeyValues) To High(KeyValues)
      Do
        Chave [I] := Copy (GuidToString(KeyValues[I]), 2, Length (GuidToString(KeyValues[I])) - 2);

    Result := Inherited FindKey ([VarArrayOf (Chave)]);
end;

function THelperCustomDaDataSet.FindKey(
  const KeyValues: array of Variant): Boolean;
begin
    Result := Inherited FindKey ([VarArrayOf(KeyValues)]);
end;

{ THelperGuidField }

function THelperGuidField.GetAsGuid: TGUID;
begin
    Result := TFuncoesGUID.FromString(GetAsString)
end;

function THelperGuidField.GetAsQuoted: String;
begin
    Result := '"' + AsString + '"'
end;

procedure THelperGuidField.SetAsGuid(const Value: TGUID);
begin
    SetAsString(TFuncoesGUID.ToString(Value));
end;

class function TFuncoesGUID.NewGUID: TGUID;
begin
  CreateGUID(Result);
end;

class function TFuncoesGUID.NullGUID: TGuid;
begin
  Result := GUID_NULL;
end;

class function TFuncoesGUID.ToString(const a_Value: TGUID): String;
begin
  Result := GuidToString(a_Value);
  Result := StringReplace(Result, '{', EmptyStr, [rfReplaceAll]);
  Result := StringReplace(Result, '}', EmptyStr, [rfReplaceAll]);
end;

{ THelperGuid }

procedure THelperGuid.null;
begin
  Self := GUID_NULL;
end;

function THelperGuid.Equals(a_GUID: TGUID): Boolean;
begin
  Result := IsEqualGUID(Self, a_GUID);
end;

procedure THelperGuid.generate;

  var t_guid: TGUID;

begin
  System.SysUtils.CreateGUID(t_guid);
  Self := t_guid;
end;

function THelperGuid.IsNull: Boolean;
begin
  Result := IsEqualGUID(Self, GUID_NULL);
end;

function THelperGuid.ToString: String;
begin
  Result := TFuncoesGUID.ToString(Self);
end;

function THelperGuid.ToQuotedString: String;
begin
  Result := QuotedStr(Self.ToString)
end;


end.


