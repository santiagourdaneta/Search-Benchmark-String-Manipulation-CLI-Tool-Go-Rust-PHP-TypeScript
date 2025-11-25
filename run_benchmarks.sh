#!/bin/bash

# Función para limpiar el texto de puntuación y generar un array de palabras.
clean_and_select_word() {
    # 1. Leer el texto
    TEXTO=$(cat text.txt)

    # 2. Limpiar el texto (minúsculas, eliminar puntuación, múltiples espacios a uno, trim)
    CLEAN_TEXT=$(echo "$TEXTO" | tr '[:upper:]' '[:lower:]' | tr -c '[:alpha:][:space:]' ' ' | sed 's/  */ /g' | xargs)

    # 3. Convertir el texto en un array de palabras
    read -r -a WORDS <<< "$CLEAN_TEXT"

    # 4. Seleccionar una palabra al azar que no sea vacía o muy corta
    while true; do
        RANDOM_INDEX=$((RANDOM % ${#WORDS[@]}))
        SEARCH_WORD="${WORDS[$RANDOM_INDEX]}"
        # Asegurarse de que la palabra tenga al menos 3 caracteres para que sea significativa
        if [ ! -z "$SEARCH_WORD" ] && [ ${#SEARCH_WORD} -ge 3 ]; then
            break
        fi
    done

    echo "$SEARCH_WORD"
}

# --- Inicio del proceso ---
echo "--- ⏱️ Benchmark de Búsqueda de Texto ---"

# Obtener la palabra de búsqueda
SEARCH_WORD=$(clean_and_select_word)

if [ -z "$SEARCH_WORD" ]; then
    echo "Error: No se pudo seleccionar una palabra válida. Revise 'text.txt'."
    exit 1
fi

echo "✅ Palabra seleccionada al azar: **$SEARCH_WORD**"
echo "------------------------------------------------"

# --- 2. Preparar el encabezado de la tabla ---
printf "%-12s | %-15s | %s\n" "Lenguaje" "Ocurrencias" "Tiempo"
printf "%-12s-+-%-15s-+-%s\n" "------------" "---------------" "------------------------------------------------"

# Función para ejecutar y medir el tiempo (asumiendo que los scripts imprimen 'COUNT TIME_STRING')
execute_benchmark() {
    LANGUAGE=$1
    COMMAND=$2
    WORD=$3
    
    # Ejecuta el comando y captura la salida
    OUTPUT=$(eval "$COMMAND $WORD")
    
    # Parsear la salida
    COUNT=$(echo "$OUTPUT" | awk '{print $1}')
    # Capturar el resto de la línea como el tiempo
    TIME=$(echo "$OUTPUT" | cut -d' ' -f2-) 

    printf "%-12s | %-15s | %s\n" "$LANGUAGE" "$COUNT" "$TIME"
}

# Ejecutar Go
execute_benchmark "Go" "go run go_search.go" "$SEARCH_WORD"

# Ejecutar Rust (usamos --release para un rendimiento óptimo y --quiet para evitar salida de cargo)
execute_benchmark "Rust" "cd rust_search && cargo run --release --quiet --" "$SEARCH_WORD"

# Ejecutar PHP
execute_benchmark "PHP" "php php_search.php" "$SEARCH_WORD"

# Ejecutar TypeScript/Node
execute_benchmark "TypeScript" "npx ts-node --transpile-only ts_search.ts" "$SEARCH_WORD"

echo "------------------------------------------------"