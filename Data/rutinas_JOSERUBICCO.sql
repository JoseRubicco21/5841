-- *----------------*
-- | PROCEDIMIENTOS |
-- *----------------*

-- Añadir un objeto

USE LEAGUE_OF_LEGENDS_WORLD_CHAMPIONSHIP;
GO

CREATE PROCEDURE spu_agregar_objeto 
	@nombre VARCHAR(30),
	@precio INT
AS
BEGIN TRAN
DECLARE @cod INT;
SELECT @cod = MAX(Codigo)+1 FROM OBJETO O;

	IF @nombre IS NULL OR @precio IS NULL
		BEGIN
			PRINT 'Nombre y precio son obligatorios.'
			ROLLBACK
		END
	IF @nombre NOT IN (SELECT O.Nombre FROM OBJETO O) AND @precio >= 0
		BEGIN
			INSERT INTO OBJETO (Codigo, Nombre, Precio) VALUES
			(@cod, @nombre, @precio)
			COMMIT
		END
GO

EXEC spu_agregar_objeto @nombre='Test Objeto', @precio=3000
SELECT * FROM OBJETO WHERE Precio=3000
GO
-- Comprueba que hay mas objetos y el objeto que se añadio. Añadir un objeto es interesante 
-- Como procedimiento almacenado ya que cambian todas las temporadas (Cada año) asi que tendria
-- sentido tener un procedimiento almacenado para esto.

-- Añadir un equipo
ALTER PROCEDURE spu_agregar_equipo 
	@nombre VARCHAR(30),
	@cod_region VARCHAR(5)
AS
BEGIN TRAN
DECLARE @cod INT;
SELECT @cod = MAX(Codigo)+1 FROM EQUIPO
	IF @nombre IS NULL or @cod_region IS NULL
		BEGIN
			PRINT 'El dato y el código de la region no puede ser nulo'
			ROLLBACK
		END
	IF @nombre NOT IN (SELECT Nombre FROM EQUIPO) AND @cod_region IN (SELECT Codigo FROM REGION)
		BEGIN
			INSERT INTO EQUIPO (Codigo, Cod_region, Nombre) VALUES
			(@cod, @cod_region, @nombre)
			COMMIT
		END
GO
-- De la misma forma los equipos se van cambiando cada año tendria sentido tener un procedimiento si la 
-- base de datos pretende guardar los datos de solo el año actual.
EXEC spu_agregar_equipo @nombre='Mi Equipo', @cod_region='LPL'
SELECT * FROM EQUIPO WHERE Cod_region='LPL'

-- *-----------*
-- | FUNCIONES |
-- *-----------*

-- Funcion escalar: Obtener número de clasificados al mundial de una región en concreto

USE LEAGUE_OF_LEGENDS_WORLD_CHAMPIONSHIP
GO

CREATE FUNCTION fn_numero_de_clasificados_de_region
( @cod_region VARCHAR(5)) returns INT
AS
	BEGIN
		DECLARE @num_regiones INT
		SELECT @num_regiones = COUNT(Codigo) FROM EQUIPO E WHERE Cod_region=@cod_region;
		RETURN @num_regiones
	END
GO

DECLARE @num_lck INT;
SELECT @num_lck = dbo.fn_numero_de_clasificados_de_region('LCK')
SELECT @num_lck as 'Numero de clasificados de la LCK'

GO
-- Podria ser utilizado para alguna tabla como la de PERSONAJE_USA_RUNA_EN_PARTIDA
-- y obtener información un poco mas interesante. La verdad es que juzgue mal
-- la cantidad de información que terminaria por exisitir. Demasiada informacion.
CREATE FUNCTION fn_get_informacion_de_runa (@num_runa int)
RETURNS TABLE
AS 
	RETURN
	(SELECT R.Nombre, R.Descripcion, R.Categoria FROM RUNA R WHERE R.Codigo=@num_runa)
GO
SELECT * FROM dbo.fn_get_informacion_de_runa(10);