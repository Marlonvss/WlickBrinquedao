unit WLick.ConstrutorSQL;

interface

uses
  SysUtils, StrUtils, Classes, Generics.Collections, Generics.Defaults;

type
  ISQLConstructor = interface;
  TJoin = class;
  TSQLExpression<TOwner: ISQLConstructor> = class;

  TReferenceType = (rtAnd, rtOr);

  ISQLConstructor = interface
    function GetFromTable: string;
    procedure SetFromTable(const Value: string);
    function GetAsString: string;
    function GetAsStrings: TStrings;

    function Select(const ColumnName: string; const Alias: string = ''): ISQLConstructor;
    function Join(const ReferenceTable: string; const Left: Boolean = False; const Alias: string = ''): TJoin; overload;
    function Join(const ReferenceTable: string; const Alias: string): TJoin; overload;
    function LeftJoin(const ReferenceTable: string; const Alias: string = ''): TJoin;
    function UnJoin(const ReferenceTable: string): ISQLConstructor;
    function Where(const Expression: string; const _Type: TReferenceType = rtAnd): TSQLExpression<ISQLConstructor>; overload;
    function Where(const ExpressionOne: string; const ExpressionTwo: string): ISQLConstructor; overload;
    function &And(const Expression: string): TSQLExpression<ISQLConstructor>;
    function &Or(const Expression: string): TSQLExpression<ISQLConstructor>;
    function From(const TableName: string; const TableAlias: string = ''): ISQLConstructor; overload;
    function OrderBy(const Campos: string): ISQLConstructor; overload;
    function OrderBy(const Campos: array of string): ISQLConstructor; overload;
    function GroupBy(const Campos: string): ISQLConstructor; overload;
    function GroupBy(const Campos: array of string): ISQLConstructor; overload;
    function Top(const a_Top: Integer): ISQLConstructor;

    function ClearSelect(): ISQLConstructor;
    procedure SaveToFile(const FileName: string);

    property FromTable: string read GetFromTable write SetFromTable;
    property AsString: string read GetAsString;
    property AsStrings: TStrings read GetAsStrings;
  end;

  TSQLOperator = (opNone, opEquals, opNotEqualTo, opGreaterThan, opGreaterThanOrEqualTo, opLessThan, opLessThenOrEqualTo, opIsNull, opNotIsNull, opIn, opNotIn,
    opIsTrue, opIsFalse, opBetween);

  TSQLExpression<TOwner: ISQLConstructor> = class(TInterfacedObject, ISQLConstructor)
    private
      FOwner          : TOwner;
      FExpressionOne  : string;
      FExpressionTwo  : string;
      FExpressionThree: string;
      FOperator       : TSQLOperator;
      function GetSQLConstructor: ISQLConstructor;
    public
      property ExpressionOne  : string read FExpressionOne write FExpressionOne;
      property ExpressionTwo  : string read FExpressionTwo write FExpressionTwo;
      property ExpressionThree: string read FExpressionThree write FExpressionThree;
      property SQLConstructor : ISQLConstructor read GetSQLConstructor implements ISQLConstructor;

      function Equals(const ExpressionTwo: string): TOwner; reintroduce;
      function NotEqualTo(const ExpressionTwo: string): TOwner;
      function GreaterThan(const ExpressionTwo: string): TOwner;
      function GreaterThanOrEqualTo(const ExpressionTwo: string): TOwner;
      function LessThan(const ExpressionTwo: string): TOwner;
      function LessThanOrEqualTo(const ExpressionTwo: string): TOwner;
      function IsNull: TOwner;
      function NotIsNull: TOwner;
      function IsIn(const ExpressionTwo: string): TOwner; overload;
      function IsIn(const SQL: ISQLConstructor): TOwner; overload;
      function NotIsIn(const ExpressionTwo: string): TOwner;
      function IsTrue(): TOwner;
      function IsFalse(): TOwner;
      function Between(const ExpressionTwo: string; const ExpressionThree: string): TOwner;
      function AsString: string;
      function &And(const Expression: string): TSQLExpression<ISQLConstructor>;
      function &Or(const Expression: string): TSQLExpression<ISQLConstructor>;
      constructor Create(const Owner: TOwner; const ExpressionOne: string; const ExpressionTwo: string = ''; const _Operator: TSQLOperator = opNone);
  end;

  TJoin = class(TInterfacedObject, ISQLConstructor)
    private
      FOwner         : ISQLConstructor;
      FLeft          : Boolean;
      FReferenceTable: string;
      FAlias         : string;
      FReferences    : TObjectList<TSQLExpression<TJoin>>;
      FReferenceTypes: TDictionary<TSQLExpression<TJoin>, TReferenceType>;
    public
      function &On(const Expression: string; const _Type: TReferenceType = rtAnd): TSQLExpression<TJoin>; overload;
      function &On(const ExpressionOne: string; const ExpressionTwo: string): TJoin; overload;
      function &And(const Expression: string): TSQLExpression<TJoin>;
      function &Or(const Expression: string): TSQLExpression<TJoin>;
      function Join(const ReferenceTable: string; const Alias: string): TJoin; overload;
      function Join(const ReferenceTable: string; const Left: Boolean = False; const Alias: string = ''): TJoin; overload;
      function LeftJoin(const ReferenceTable: string; const Alias: string = ''): TJoin;
      function Where(const Expression: string): TSQLExpression<ISQLConstructor>; overload;
      function Where(const ExpressionOne: string; const ExpressionTwo: string): ISQLConstructor; overload;
      function EndJoin: ISQLConstructor;
      property ReferenceTable: string read FReferenceTable;
      property Alias: string read FAlias;
      property References: TObjectList < TSQLExpression < TJoin >> read FReferences;
      property ReferenceTypes: TDictionary<TSQLExpression<TJoin>, TReferenceType> read FReferenceTypes;
      property Left: Boolean read FLeft;
      property SQLConstructor: ISQLConstructor read FOwner implements ISQLConstructor;
      constructor Create(const Owner: ISQLConstructor; const ReferenceTable: string; const Left: Boolean = False; const Alias: string = '');
      destructor Destroy; override;
  end;

  TSQLConstructor = class(TInterfacedObject, ISQLConstructor)
    private
      FLastIndex     : Integer;
      FColumns       : TStringList;
      FFromTable     : string;
      FFromTableAlias: string;
      FOrder         : TDictionary<string, Integer>;
      FOrderBy       : TStringList;
      FGroupBy       : TStringList;
      FJoins         : TDictionary<string, TJoin>;
      FWhere         : TObjectList<TSQLExpression<ISQLConstructor>>;
      FWhereKind     : TDictionary<TSQLExpression<ISQLConstructor>, TReferenceType>;
      FUseTop      : Boolean;
      FTop         : Integer;

      function GetFromTable: string;
      procedure SetFromTable(const Value: string);
      function GetAsStrings: TStrings;
      function GetAsString: string;
    public
      function Select(const ColumnName: string; const Alias: string = ''): ISQLConstructor; overload;
      function Join(const ReferenceTable: string; const Left: Boolean = False; const Alias: string = ''): TJoin; overload;
      function Join(const ReferenceTable: string; const Alias: string): TJoin; overload;
      function LeftJoin(const ReferenceTable: string; const Alias: string = ''): TJoin;
      function UnJoin(const ReferenceTable: string): ISQLConstructor;
      function Where(const Expression: string; const _Type: TReferenceType = rtAnd): TSQLExpression<ISQLConstructor>; overload;
      function Where(const ExpressionOne: string; const ExpressionTwo: string): ISQLConstructor; overload;
      function &And(const Expression: string): TSQLExpression<ISQLConstructor>;
      function &Or(const Expression: string): TSQLExpression<ISQLConstructor>;
      function From(const TableName: string; const TableAlias: string = ''): ISQLConstructor; overload;
      function OrderBy(const Campos: string): ISQLConstructor; overload;
      function OrderBy(const Campos: array of string): ISQLConstructor; overload;
      function GroupBy(const Campos: string): ISQLConstructor; overload;
      function GroupBy(const Campos: array of string): ISQLConstructor; overload;
      function Top(const a_Top: Integer): ISQLConstructor;
      function ClearSelect(): ISQLConstructor;

      procedure SaveToFile(const FileName: string);

      property FromTable: string read FFromTable write FFromTable;
      property FromTableAlias: string read FFromTableAlias write FFromTableAlias;
      property AsString: string read GetAsString;
      property AsStrings: TStrings read GetAsStrings;

      constructor Create;
      destructor Destroy; override;
  end;

function Select(const ColumnName: string; const Alias: string = ''): ISQLConstructor;
function Where(const Expression: string): TSQLExpression<ISQLConstructor>;

implementation

const
  cReferenceTypeString: array [TReferenceType] of string = ('AND', 'OR');

function Select(const ColumnName: string; const Alias: string = ''): ISQLConstructor;
begin
  Result := TSQLConstructor.Create;
  Result.Select(ColumnName, Alias);
end;

function Where(const Expression: string): TSQLExpression<ISQLConstructor>;
var
  t_SQL: ISQLConstructor;
begin
  t_SQL := TSQLConstructor.Create;

  Result := t_SQL.Where(Expression);
end;

function TJoin.On(const Expression: string; const _Type: TReferenceType = rtAnd): TSQLExpression<TJoin>;
begin
  Result := TSQLExpression<TJoin>.Create(Self, Expression);
  FReferences.Add(Result);
  FReferenceTypes.Add(Result, _Type);
end;

function TJoin.Where(const Expression: string): TSQLExpression<ISQLConstructor>;
begin
  Result := FOwner.Where(Expression);
end;

function TJoin.&Or(const Expression: string): TSQLExpression<TJoin>;
begin
  Result := On(Expression, rtOr);
end;

function TJoin.Where(const ExpressionOne, ExpressionTwo: string): ISQLConstructor;
begin
  Result := FOwner.Where(ExpressionOne, ExpressionTwo);
end;

function TJoin.&On(const ExpressionOne, ExpressionTwo: string): TJoin;
begin
  Result := On(ExpressionOne).Equals(ExpressionTwo);
end;

function TJoin.&And(const Expression: string): TSQLExpression<TJoin>;
begin
  Result := On(Expression);
end;

constructor TJoin.Create(const Owner: ISQLConstructor; const ReferenceTable: string; const Left: Boolean = False; const Alias: string = '');
begin
  FOwner := Owner;
  FReferenceTable := ReferenceTable;
  FAlias := Alias;
  FLeft := Left;
  FReferences := TObjectList < TSQLExpression < TJoin >>.Create;
  FReferenceTypes := TDictionary<TSQLExpression<TJoin>, TReferenceType>.Create;
end;

destructor TJoin.Destroy;
begin
  FreeAndNil(FReferences);
  FreeAndNil(FReferenceTypes);

  inherited;
end;

function TJoin.EndJoin: ISQLConstructor;
begin
  Result := FOwner;
end;

function TJoin.Join(const ReferenceTable: string; const Left: Boolean; const Alias: string): TJoin;
begin
  Result := FOwner.Join(ReferenceTable, Left, Alias);
end;

function TJoin.Join(const ReferenceTable: string; const Alias: string): TJoin;
begin
  Result := FOwner.Join(ReferenceTable, Alias);
end;

function TJoin.LeftJoin(const ReferenceTable: string; const Alias: string): TJoin;
begin
  Result := FOwner.LeftJoin(ReferenceTable, Alias);
end;

procedure TSQLConstructor.SaveToFile(const FileName: string);
var
  Tmp: TStrings;
begin
  Tmp := GetAsStrings;

  try
    Tmp.SaveToFile(FileName);
  finally
    Tmp.Free;
  end;
end;

function TSQLConstructor.Select(const ColumnName: string; const Alias: string = ''): ISQLConstructor;
begin
  if Trim(ColumnName) <> EmptyStr then
  begin
    if Trim(Alias) = EmptyStr
    then
      FColumns.Add(ColumnName)
    else
      FColumns.Add(ColumnName + ' as "' + Alias + '"');
  end;

  Result := Self;
end;

function TSQLConstructor.Join(const ReferenceTable: string; const Alias: string): TJoin;
begin
  Result := Join(ReferenceTable, False, Alias);
end;

function TSQLConstructor.Join(const ReferenceTable: string; const Left: Boolean = False; const Alias: string = ''): TJoin;
var
  Key: string;
begin
  if Alias <> '' then
    Key := Alias
  else
    Key := ReferenceTable;

  if FJoins.ContainsKey(Key) then
    Result := FJoins[Key]
  else
  begin
    Result := TJoin.Create(Self, ReferenceTable, Left, Alias);
    FJoins.Add(Key, Result);
    Inc(FLastIndex);
    FOrder.Add(Key, FLastIndex);
  end;
end;

function TSQLConstructor.LeftJoin(const ReferenceTable: string; const Alias: string = ''): TJoin;
begin
  Result := Join(ReferenceTable, True, Alias);
end;

function TSQLConstructor.Top(const a_Top: Integer): ISQLConstructor;
begin
  FUseTop := True;
  FTop := a_Top;
  Result := Self;
end;

function TSQLConstructor.ClearSelect: ISQLConstructor;
begin
  FColumns.Clear;

  Result := Self;
end;

constructor TSQLConstructor.Create;
begin
  FLastIndex := 0;
  FColumns := TStringList.Create;
  FOrder := TDictionary<string, Integer>.Create;
  FJoins := TDictionary<string, TJoin>.Create;
  FWhere := TObjectList < TSQLExpression < ISQLConstructor >>.Create;
  FWhereKind := TDictionary<TSQLExpression<ISQLConstructor>, TReferenceType>.Create;
  FOrderBy := TStringList.Create;
  FGroupBy := TStringList.Create;
end;

destructor TSQLConstructor.Destroy;
begin
  FOrder.Free;
  FJoins.Free;
  FColumns.Free;
  FWhere.Free;
  FWhereKind.Free;
  FOrderBy.Free;
  FGroupBy.Free;

  inherited;
end;

function TSQLConstructor.GetAsString: string;
var
  Tmp: TStrings;
begin
  Tmp := GetAsStrings;

  try
    Result := Tmp.Text;
  finally
    FreeAndNil(Tmp);
  end;
end;

function TSQLConstructor.GetAsStrings: TStrings;
var
  Col   : string;
  Join  : TJoin;
  ColRef: TSQLExpression<TJoin>;
  Where : TSQLExpression<ISQLConstructor>;
  A     : TArray<TPair<string, Integer>>;
  P     : TPair<string, Integer>;
  i     : Integer;
begin
  Result := TStringList.Create;

  try
    if FColumns.Count > 0 then
    begin
      Result.Add('SELECT' + #13#10);

      if FUseTop then
        Result.Add(#13#10 + 'TOP ' + IntToStr(FTop));
      
      for Col in FColumns do
        Result.Add('  ' + Col + ',');

      Result.Text := Copy(Trim(Result.Text), 1, Length(Trim(Result.Text)) - 1);
    end;

    if Trim(FFromTable) <> '' then
      Result.Add(#13#10 + 'FROM ' + FFromTable + IfThen(FromTableAlias <> '', ' AS ' + FFromTableAlias, ''));

    A := FOrder.ToArray;

    TArray.Sort < TPair < string, Integer >> (A, TComparer < TPair < string, Integer >>.Construct(

      function(const L, R: TPair<string, Integer>): Integer
      begin
        Result := L.Value - R.Value;
      end)
      );

    for P in A do
    begin
      Join := FJoins[P.Key];

      if Trim(Join.Alias) = '' then
        Result.Add(#13#10 + '  ' + IfThen(Join.Left, 'LEFT', '') + ' JOIN ' + Join.ReferenceTable)
      else
        Result.Add(#13#10 + '  ' + IfThen(Join.Left, 'LEFT', '') + ' JOIN ' + Join.ReferenceTable + ' ' + Join.Alias);

      for ColRef in Join.References do
      begin
        if ColRef = Join.References.First then
          Result.Add('    ON ' + ColRef.AsString)
        else
          Result.Add(Format('   %s ' + ColRef.AsString, [cReferenceTypeString[Join.ReferenceTypes[ColRef]]]));
      end;
    end;

    for Where in FWhere do
    begin
      if Where = FWhere.First then
        Result.Add(#13#10 + 'WHERE ' + Where.AsString)
      else
        Result.Add(Format('  %s ' + Where.AsString, [cReferenceTypeString[FWhereKind[Where]]]))
    end;

    for i := 0 to Pred(FGroupBy.Count) do
      if i = 0 then
        Result.Add(#13#10 + 'GROUP BY ' + FGroupBy[i])
      else
        Result.Add(FGroupBy[i]);

    for i := 0 to Pred(FOrderBy.Count) do
      if i = 0 then
        Result.Add(#13#10 + 'ORDER BY ' + FOrderBy[i])
      else
        Result.Add(FOrderBy[i]);
  except
    FreeAndNil(Result);
    raise;
  end;
end;

function TSQLConstructor.Where(const Expression: string; const _Type: TReferenceType): TSQLExpression<ISQLConstructor>;
begin
  Result := TSQLExpression<ISQLConstructor>.Create(Self, Expression);
  FWhere.Add(Result);
  FWhereKind.Add(Result, _Type);
end;

function TSQLConstructor.&Or(const Expression: string): TSQLExpression<ISQLConstructor>;
begin
  Result := Where(Expression, rtOr);
end;

function TSQLConstructor.&And(const Expression: string): TSQLExpression<ISQLConstructor>;
begin
  Result := Where(Expression);
end;

function TSQLConstructor.From(const TableName: string; const TableAlias: string = ''): ISQLConstructor;
begin
  Self.FromTable := TableName;
  Self.FromTableAlias := TableAlias;

  Result := Self;
end;

function TSQLConstructor.GetFromTable: string;
begin
  Result := FFromTable;
end;

procedure TSQLConstructor.SetFromTable(const Value: string);
begin
  FFromTable := Value;
end;

function TSQLConstructor.UnJoin(const ReferenceTable: string): ISQLConstructor;
var
  Aux: string;
begin
  for Aux in FJoins.Keys do
  begin
    if UpperCase(Aux) = UpperCase(ReferenceTable) then
    begin
      FJoins.Remove(Aux);
      FOrder.Remove(Aux);
      Break;
    end;
  end;

  Result := Self;
end;

function TSQLConstructor.Where(const ExpressionOne, ExpressionTwo: string): ISQLConstructor;
begin
  Result := Where(ExpressionOne).Equals(ExpressionTwo);
end;

function TSQLConstructor.OrderBy(const Campos: string): ISQLConstructor;
begin
  FOrderBy.Add(Campos);
  Result := Self;
end;

function TSQLConstructor.OrderBy(const Campos: array of string): ISQLConstructor;
var
  Aux: string;
  i  : Integer;
begin
  Aux := '';

  for i := Low(Campos) to High(Campos) do
    if i = Low(Campos) then
      Aux := Aux + Campos[i]
    else
      Aux := Aux + ', ' + Campos[i];

  Result := OrderBy(Aux);
end;

function TSQLConstructor.GroupBy(const Campos: string): ISQLConstructor;
begin
  FGroupBy.Add(Campos);
  Result := Self;
end;

function TSQLConstructor.GroupBy(const Campos: array of string): ISQLConstructor;
var
  Aux: string;
  i  : Integer;
begin
  Aux := '';

  for i := Low(Campos) to High(Campos) do
    if i = Low(Campos) then
      Aux := Aux + Campos[i]
    else
      Aux := Aux + ', ' + Campos[i];

  Result := GroupBy(Aux);
end;

{ TSQLExpression }

function TSQLExpression<TOwner>.&Or(const Expression: string): TSQLExpression<ISQLConstructor>;
begin
  Result := FOwner.&Or(Expression);
end;

function TSQLExpression<TOwner>.&And(const Expression: string): TSQLExpression<ISQLConstructor>;
begin
  Result := FOwner.&And(Expression);
end;

function TSQLExpression<TOwner>.AsString: string;
begin
  Result := FExpressionOne;

  case FOperator of
    opNone:
      Result := FExpressionOne;
    opEquals:
      Result := Result + ' = ' + FExpressionTwo;
    opNotEqualTo:
      Result := Result + ' <> ' + FExpressionTwo;
    opGreaterThan:
      Result := Result + ' > ' + FExpressionTwo;
    opGreaterThanOrEqualTo:
      Result := Result + ' >= ' + FExpressionTwo;
    opLessThan:
      Result := Result + ' < ' + FExpressionTwo;
    opLessThenOrEqualTo:
      Result := Result + ' <= ' + FExpressionTwo;
    opIsNull:
      Result := Result + ' IS NULL';
    opNotIsNull:
      Result := 'NOT (' + Result + ' IS NULL)';
    opIn:
      Result := Result + ' IN (' + FExpressionTwo + ')';
    opNotIn:
      Result := Result + 'NOT (' + Result + ' IN (' + FExpressionTwo + ')';
    opIsTrue:
      Result := Result + ' = true';
    opIsFalse:
      Result := Result + ' = false';
    opBetween:
      Result := Result + ' BETWEEN ' + FExpressionTwo + ' AND ' + FExpressionThree;
  end;
end;

function TSQLExpression<TOwner>.Between(const ExpressionTwo, ExpressionThree: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FExpressionThree := ExpressionThree;

  FOperator := opBetween;
  Result := FOwner;
end;

constructor TSQLExpression<TOwner>.Create(const Owner: TOwner; const ExpressionOne: string; const ExpressionTwo: string; const _Operator: TSQLOperator);
begin
  FOwner := Owner;
  FExpressionOne := ExpressionOne;
  FExpressionTwo := ExpressionTwo;

  FOperator := _Operator;
end;

function TSQLExpression<TOwner>.Equals(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opEquals;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.GetSQLConstructor: ISQLConstructor;
begin
  Result := ISQLConstructor(FOwner);
end;

function TSQLExpression<TOwner>.GreaterThan(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opGreaterThan;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.GreaterThanOrEqualTo(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opGreaterThanOrEqualTo;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.IsIn(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opIn;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.IsTrue(): TOwner;
begin
  FExpressionTwo := '';
  FOperator := opIsTrue;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.IsFalse(): TOwner;
begin
  FExpressionTwo := '';
  FOperator := opIsFalse;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.IsIn(const SQL: ISQLConstructor): TOwner;
begin
  Result := IsIn(SQL.AsString);
end;

function TSQLExpression<TOwner>.IsNull: TOwner;
begin
  FOperator := opIsNull;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.LessThan(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opLessThan;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.LessThanOrEqualTo(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opLessThenOrEqualTo;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.NotEqualTo(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opNotEqualTo;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.NotIsIn(const ExpressionTwo: string): TOwner;
begin
  FExpressionTwo := ExpressionTwo;
  FOperator := opNotIn;
  Result := FOwner;
end;

function TSQLExpression<TOwner>.NotIsNull: TOwner;
begin
  FOperator := opNotIsNull;
  Result := FOwner;
end;

end.
