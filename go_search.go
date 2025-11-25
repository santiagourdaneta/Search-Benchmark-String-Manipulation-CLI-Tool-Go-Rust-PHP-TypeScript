package main

import (
	"fmt"
	"os"
	"strings"
	"time"
)

func main() {
	// 1. Obtener la palabra de búsqueda del argumento de línea de comandos
	if len(os.Args) < 2 {
		// Imprimir un valor de error o vacío para que el script Bash no falle
		fmt.Println("0 Error") 
		return
	}
	searchWord := os.Args[1]
	
	// 2. Cargar la cadena de texto
	content, err := os.ReadFile("text.txt")
	if err != nil {
		fmt.Println("0 Error_lectura")
		return
	}
	text := string(content)

	// 3. Medir el tiempo de búsqueda
	startTime := time.Now()
	
	count := strings.Count(text, searchWord)
	
	elapsedTime := time.Since(startTime)

	// 4. Imprimir el resultado: CONTEO TIEMPO_STRING
	// Usamos Microsegundos (µs) para Go, ya que suele ser muy rápido.
	fmt.Printf("%d %d µs", count, elapsedTime.Microseconds())
}