@ECHO off

SET PGUSER=postgres
SET PGPASSWORD=postgres
SET PGHOST=localhost
SET PGPORT=5432
SET Database=brinquedao

SET Path=C:\Weblick\Brinquedao

CD %Path%\PostgreSQL\Bin

@ECHO.
@ECHO Aguarde enquanto o banco de dados esta sendo atualizado...
@ECHO.

createdb -U postgres %Database%
pg_restore -U postgres -h localhost -d %Database% "%Path%\init.backup"