# Sobre: TRM USD-COP
# Prueba Técnica - Talento B, Bancolombia

### Santiago Galvis Duque

## Tabla de Contenidos
- [Sobre: TRM USD-COP](#sobre-trm-usd-cop)
- [Prueba Técnica - Talento B, Bancolombia](#prueba-técnica---talento-b-bancolombia)
    - [Santiago Galvis Duque](#santiago-galvis-duque)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Descripción](#descripción)
  - [Estructura del Proyecto](#estructura-del-proyecto)
  - [Instalación y Ejecución](#instalación-y-ejecución)
  - [Resultados encontrados](#resultados-encontrados)
  - [Futuras Mejoras](#futuras-mejoras)
    - [Contacto](#contacto)

## Descripción
Este repositorio contiene la solución a la prueba técnica realizada como parte del proceso de selección para el prgrama de Talento B. El objetivo de la prueba es analizar algunos comportamientos del índice **TRM USD-COP**, usando Python y SQL.

## Estructura del Proyecto


```text
├── Data/
│ └── TRM_USD-COP.csv
│── src/
│ └──  Notebooks/
│   └── Prueba_Tecnica.ipynb
│   └── EDA.ipynb 
│ └── SQL/
│   └── Prueba_Tecnica.sql
│ └──  requirements.txt
├── README.md 
```               


## Instalación y Ejecución

1. **Clonar el repositorio:**
```bash
git clone git@github.com:SGalvisD/TRM_USD-COP.git  
cd TRM_USD-COP
```

2. **Instalar dependencias:**
```bash
pip install -r requirements.txt
```

## Resultados encontrados
Se realiza un corto EDA del Dataset en Python de TRM USD-COP de los últimos 1000 días, se verifica la completitud de los datos y se realiza un pequeño estudio sobre el comportamiento de las variables que contiene. De igual forma, se logra realizar cada uno de los puntos consignados en la prueba técnica en Python y en SQL, cada uno está consignado en su propia carpeta dentro del folder `src/` y por último se realiza una gráfica con la intención de que sea parte de un reporte para un stakeholder con algún tipo de interés en el comportamiento de la TRM USD-COP.

## Futuras Mejoras
Por otros compromisos relacionados con mi Trabajo de Grado, mi tiempo disponible fue recortado. Es por esto que en un momento futuro es de mi interes modificar la solución para que esta esté en script ejecutable en vez de notebook, agregar logfiles, la escritura de documentación y demás pruebas.

### Contacto

Si tienes preguntas o comentarios, puedes contactarme a través de:

  santiagogalvisd@gmail.com