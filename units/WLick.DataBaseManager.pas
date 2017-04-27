unit WLick.DataBaseManager;

interface

uses ORM.daoBase, Uni, ORM.DataBaseManager;

type
  TDataBaseManager = class(TORMDataBaseManager)
    protected
      function ExecBefore: Boolean; override;
      function ExecTables: Boolean; override;
      function ExecFunctions: Boolean; override;
      function ExecView: Boolean; override;
      function ExecCargaDeDados: Boolean; override;
      function ExecAfter: Boolean; override;

      function GetCurrentVersao: integer; override;
  end;

implementation

{ TDataBaseManager }

function TDataBaseManager.ExecAfter: Boolean;
var
  vStr: WideString;
begin
  Result := inherited ExecAfter;

  if (FVersaoBD < 2) then
  begin
    vStr := 'drop sequence if exists codigocrianca';
    FDAO.ExecutaSQL(vStr);
  end;

end;

function TDataBaseManager.ExecBefore: Boolean;
var
  vStr: WideString;
begin
  Result := inherited ExecBefore;

  if (FVersaoBD < 2) then
  begin

  end;

end;

function TDataBaseManager.ExecCargaDeDados: Boolean;
begin
  Result := inherited ExecCargaDeDados;

  if (FVersaoBD < 1) then
  begin

  end;

end;

function TDataBaseManager.ExecFunctions: Boolean;
var
  vStr: WideString;
begin
  Result := inherited ExecFunctions;

  if (FVersaoBD < 1) then
  begin
    vStr :=
      'CREATE OR REPLACE FUNCTION EncerrarDia() RETURNS VOID AS' + #13 +
      '$BODY$' + #13 +
      'DECLARE DataOperacao date;' + #13 +
      'DECLARE DataCorrente date;' + #13 +
      'BEGIN' + #13 +
      '  ' + #13 +
      '  select current_date into DataCorrente;' + #13 +
      '  ' + #13 +
      '   select valor from configuracoes where configuracao = ''DataOperacao'' into DataOperacao;' + #13 +
      '   if DataOperacao is null then' + #13 +
      '     DataOperacao := current_date;' + #13 +
      '     insert into configuracoes(configuracao, valor) values (''DataOperacao'', DataOperacao);' + #13 +
      '   end if;' + #13 +
      '  ' + #13 +
      '   if (DataCorrente <> DataOperacao) then' + #13 +
      '     -- Crianças -> Ao alterar o dia, a sequencia do cadastro é reiniciada...' + #13 +
      '     perform setval(''codigocrianca'', 0, true);' + #13 +
      '  ' + #13 +
      '     -- Atividades -> Ao alterar o dia, finalizar todos as atividades abertas...' + #13 +
      '     update atividades ' + #13 +
      '        set situacao = 1, ' + #13 +
      '            saida = entrada, ' + #13 +
      '            valorsaida = 0, ' + #13 +
      '            obs = obs || Chr(13) || ''Mensagem automática: Esta atividade não foi encerrada no mesmo dia de abertura e foi finalizada pelo sistema'' ' + #13 +
      '      where situacao = 0; ' + #13 +
      '  ' + #13 +
      '     -- Configurações -> Atualiza a tabela de configurações com a nova data de operacao' + #13 +
      '     update configuracoes ' + #13 +
      '        set valor = DataCorrente ' + #13 +
      '      where configuracao = ''DataOperacao'';' + #13 +
      '   end if;' + #13 +
      '  ' + #13 +
      'END;' + #13 +
      '$BODY$' + #13 +
      '  LANGUAGE plpgsql VOLATILE' + #13 +
      '  COST 100;';
    FDAO.ExecutaSQL(vStr);

  end;

  if (FVersaoBD < 2) then
  begin
    vStr := 'DROP FUNCTION IF EXISTS EncerrarDia()';
    FDAO.ExecutaSQL(vStr);

    vStr :=
      'CREATE OR REPLACE FUNCTION Func_Encerrar_Dia() '+#13+
      '  RETURNS void AS '+#13+
      '$BODY$ '+#13+
      'DECLARE DataOperacao date; '+#13+
      'DECLARE DataCorrente date; '+#13+
      'BEGIN '+#13+
      '   '+#13+
      '  select current_date into DataCorrente; '+#13+
      '   '+#13+
      '   select valor from configuracoes where configuracao = ''DataOperacao'' into DataOperacao; '+#13+
      '   if DataOperacao is null then '+#13+
      '     DataOperacao := current_date; '+#13+
      '     insert into configuracoes(configuracao, valor) values (''DataOperacao'', DataOperacao); '+#13+
      '   end if; '+#13+
      '   '+#13+
      '   if (DataCorrente <> DataOperacao) then '+#13+
      '   '+#13+
      '     -- Atividades -> Ao alterar o dia, finalizar todos as atividades abertas... '+#13+
      '     update atividades  '+#13+
      '        set situacao = 1,  '+#13+
      '            saida = entrada,  '+#13+
      '            valorsaida = 0,  '+#13+
      '            obs = obs || Chr(13) || Chr(13) || ''Mensagem automática: Esta atividade foi encerrada automaticamente pois não foi encerrada no mesmo dia de abertura''  '+#13+
      '      where situacao = 0;  '+#13+
      '   '+#13+
      '     -- Configurações -> Atualiza a tabela de configurações com a nova data de operacao '+#13+
      '     update configuracoes  '+#13+
      '        set valor = DataCorrente  '+#13+
      '      where configuracao = ''DataOperacao''; '+#13+
      '   end if; '+#13+
      '   '+#13+
      'END; '+#13+
      '$BODY$ '+#13+
      '  LANGUAGE plpgsql VOLATILE '+#13+
      '  COST 100; ';
    FDAO.ExecutaSQL(vStr);

  end;

end;

function TDataBaseManager.ExecTables: Boolean;
var
  vStr: WideString;
begin
  Result := inherited ExecTables;

  if (FVersaoBD < 1) then
  begin
    vStr := 'ALTER TABLE criancas '+
            '  add COLUMN datainsert date default current_date';
    FDAO.ExecutaSQL(vStr);

    vStr := 'ALTER TABLE atividades '+
            'ALTER COLUMN entrada TYPE time without time zone, '+
            'ALTER COLUMN saida TYPE time without time zone, '+
            '  ADD COLUMN datainsert date default current_date; ';
    FDAO.ExecutaSQL(vStr);


    vStr := 'ALTER TABLE usuarios '+
            '  ADD COLUMN nivelacesso smallint ';
    FDAO.ExecutaSQL(vStr);
  end;

  if (FVersaoBD < 2) then
  begin

    vStr := 'ALTER TABLE ATIVIDADES '+
            '  ADD COLUMN CRIANCA_NOME VARCHAR(100), '+
            '  ADD COLUMN CRIANCA_NASCIMENTO TIMESTAMP WITHOUT TIME ZONE, '+
            '  ADD COLUMN CRIANCA_FOTO BYTEA, '+
            '  ADD COLUMN RESPONSAVEL_NOME VARCHAR(100), '+
            '  ADD COLUMN RESPONSAVEL_DOCUMENTO VARCHAR(30), '+
            '  ADD COLUMN RESPONSAVEL_EMAIL VARCHAR(100), '+
            '  ADD COLUMN RESPONSAVEL_CONTATO VARCHAR(50), '+
            '  ADD COLUMN RESPONSAVEL_FOTO BYTEA, '+
            '  DROP COLUMN ID_CRIANCA, '+
            '  DROP COLUMN ID_RESPONSAVEL; ';
    FDAO.ExecutaSQL(vStr);

    vStr := 'DROP SEQUENCE codigocrianca;';
    FDAO.ExecutaSQL(vStr);

    vStr := 'DROP TABLE responsaveiscriancas;';
    FDAO.ExecutaSQL(vStr);

    vStr := 'DROP TABLE criancas;';
    FDAO.ExecutaSQL(vStr);

    vStr := 'DROP TABLE responsaveis;';
    FDAO.ExecutaSQL(vStr);

  end;

end;

function TDataBaseManager.ExecView: Boolean;
begin
  Result := inherited ExecView;

  if (FVersaoBD < 1) then
  begin

  end;

end;

function TDataBaseManager.GetCurrentVersao: integer;
begin
  Result := 2;
end;

end.
