# 🚀 Cross-Language Benchmark: Búsqueda de Cadenas

## 📊 Descripción del Proyecto

Este proyecto es un ejercicio de **benchmarking** creado en la terminal para comparar la eficiencia de cuatro lenguajes de programación modernos (Go, Rust, PHP y TypeScript/Node.js) al realizar una tarea común y crítica: la **búsqueda y conteo de ocurrencias de una palabra** dentro de una cadena de texto larga (aproximadamente 40,000 caracteres).

El objetivo es cuantificar la diferencia de rendimiento entre lenguajes compilados (Go, Rust) y lenguajes interpretados/JIT (PHP, Node.js) para operaciones básicas de manipulación de texto.

---

## ✨ Resultados Clave (Ejemplo de Ejecución)

Una ejecución típica muestra la drástica diferencia de rendimiento, especialmente en el rango de los microsegundos (µs) y milisegundos (ms).

| Lenguaje | Palabra Buscada | Ocurrencias | Tiempo de Búsqueda |
| :---: | :---: | :---: | :---: |
| **Go** | geniales | 200 | **0 µs** |
| **Rust** | geniales | 200 | 69 µs |
| **PHP** | geniales | 200 | 0.172 ms |
| **TypeScript** | geniales | 200 | 0.177 ms |

*(Nota: Los tiempos pueden variar ligeramente según el hardware y el sistema operativo.)*

---

## 🛠️ Estructura y Tecnología

El proyecto se compone de un script coordinador de Bash y cuatro scripts de lenguaje específicos.

### Tecnologías

* **Coordinador:** Bash (`run_benchmarks.sh`)
* **Lenguajes a Evaluar:**
    * **Go** (Golang)
    * **Rust**
    * **PHP**
    * **TypeScript** (Ejecutado a través de `ts-node` y Node.js)
* **Generador de Texto:** Node.js (`generate_text.js`)

---

## ⚙️ Guía de Uso Rápido

### 1. Preparación

Instala los lenguajes necesarios (Go, Rust, PHP, Node.js/ts-node) y sus dependencias:

```bash
# 1. Instalar dependencias de Node/TS
npm install typescript ts-node @types/node

# 2. Generar el archivo de texto grande (text.txt)
node generate_text.js

# 3. Dar permiso de ejecución al script principal
chmod +x run_benchmarks.sh

2. Ejecución del Benchmark

Lanza el script maestro. Él seleccionará una palabra al azar y ejecutará las pruebas en los cuatro lenguajes.

./run_benchmarks.sh

 