# Categorías API

## Requisitos Anteriores

- **Crear una red en `Docker`**
  ```bash
    docker network create test-network
  ```
- **Crear el contenedor de la db en `MySQL`**
  ```bash
    docker run --name test-db -e MYSQL_ROOT_PASSWORD=admin123 -e MYSQL_DATABASE=test -p 3607:3306 -d --network test-network mysql
  ```
---
## Creación de la imagen desde el ambiente local
- **Ubicarse en el directorio raíz del proyecto Categories y ejecutar:**
  ```bash   
    docker build -t api-categories:v1 .
  ```
---
## Descarga de la imagen desde `dockerHub`
- **Obtener la imagen desde el repositorio remoto:**
  ```bash   
    docker pull carlosha176/angularwebadvance:api
  ```
---
## Ejecutar el contenedor de la imagen 
- **Ejecutar si se creo desde el ambiente local**
  ```bash   
    docker run --rm --name category-app -p 8081:8003 --network test-network -e PORT=8003 -d api-categories:v1
  ```
- **Ejecutar si se descargo desde docker hub**
  ```bash   
    docker run --rm --name category-app -p 8081:8003 --network test-network -e PORT=8003 -d carlosha176/angularwebadvance:api
  ```


