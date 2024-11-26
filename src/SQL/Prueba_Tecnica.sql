/* Prueba Técnica - Talento 
Sobre TRM USD-COP
Santiago Galvis Duque
*/  

/* 1. Carga de datos */

SELECT *
FROM Tabla1
ORDER BY VIGENCIADESDE DESC
LIMIT 1000; -- Seleccionando solo las primeras 1000 filas

-- Cambiando el formato de la fecha
ALTER TABLE Tabla1
ADD COLUMN fecha DATETIME;

UPDATE Tabla1
SET fecha = STR_TO_DATE(VIGENCIADESDE, '%d/%m/%Y');

-- Agregando columna fechaF con formato MM-YYYY
ALTER TABLE Tabla1
ADD COLUMN fechaF VARCHAR(7);

UPDATE Tabla1
SET fechaF = DATE_FORMAT(fecha, '%m-%Y');

-- Redondeando VALOR a 4 decimales
ALTER TABLE Tabla1
ADD COLUMN valor DECIMAL(10, 4);

UPDATE Tabla1
SET valor = ROUND(VALOR, 4);


/* 2.  Encontrando el Miércoles con valor de cierre más alto */

SELECT MAX(VALOR)
FROM Tabla1
WHERE DATE_FORMAT(fecha, '%w') = 2; -- Condicional para que sea miércoles, usando %w para buscar el día


/* 3.  Promedio de la TRM mensual */

SELECT 
    year(fecha) AS a_o,
    month(fecha) AS mes,
    ROUND(AVG(valor), 4) AS promedio_valor_redondeado
FROM Tabla1
GROUP BY year(fecha), month(fecha) -- Agrupación por año y mes
ORDER BY a_o, mes;


/* 4.  Calculando el valor más alto de TRM para cada mes par. */

SELECT 
    year(fecha) AS a_o,
    month(fecha) AS mes,
    ROUND(MAX(valor), 4) AS maximo_valor_mes_par
FROM Tabla1
WHERE 
    EXTRACT(MONTH FROM fecha) % 2 = 0 -- Condicional para que sea mes par
GROUP BY year(fecha), month(fecha) -- Agrupación por año y mes
ORDER BY a_o, mes;


/* 5.  Buscando el cambio diario más pequeño. */

-- Calculando el cambio diario de la TRM
WITH cambio_diario AS (
    SELECT 
        fecha,
        valor,
        -- Usamos la funcion LAG() para obtener el valor anterior
        LAG(valor) OVER (ORDER BY fecha) AS valor_anterior,
        ROUND(valor - LAG(valor) OVER (ORDER BY fecha), 4) AS cambio
    FROM Tabla1
)
SELECT 
    fecha,
    valor,
    cambio
FROM cambio_diario
WHERE cambio IS NOT NULL -- Excluyendo cambios nulos
ORDER BY fecha;

-- Buscando el día con el menor cambio diario
SELECT MIN(cambio) AS menor_cambio_diario
FROM (
    SELECT 
        fecha,
        valor,
        ROUND(valor - LAG(valor) OVER (ORDER BY fecha), 4) AS cambio
    FROM Tabla1
) subquery;


/* 6. Número de Cambios positivos y negativos */

WITH cambio_diario AS (
    SELECT 
        fecha,
        valor,
        LAG(valor) OVER (ORDER BY fecha) AS valor_anterior,
        CASE -- Condicionales para determinar si el cambio es positivo 0 negativo
            WHEN valor > LAG(valor) OVER (ORDER BY fecha) THEN 1
            WHEN valor < LAG(valor) OVER (ORDER BY fecha) THEN -1
            ELSE 0
        END AS cambio
    FROM Tabla1
)
SELECT 
    fecha,
    -- Contando los cambios positivos y negativos
    COUNT(CASE WHEN cambio = 1 THEN 1 END) AS cambios_positivos,
    COUNT(CASE WHEN cambio = -1 THEN 1 END) AS cambios_negativos
FROM cambio_diario
WHERE cambio != 0 -- Excluyendo cambios nulos
GROUP BY fecha
ORDER BY fecha; -- Buscando que sea más fácil de leer

