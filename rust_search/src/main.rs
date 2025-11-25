use std::env;
use std::fs;
use std::time::Instant;

fn main() {
    // 1. Obtener la palabra de búsqueda del argumento de línea de comandos
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        println!("0 Error");
        return;
    }
    let search_word = &args[1];

    // 2. Cargar la cadena de texto (asumiendo que se ejecuta desde la carpeta rust_search)
    let text = match fs::read_to_string("../text.txt") {
        Ok(t) => t,
        Err(_) => {
            println!("0 Error_lectura");
            return;
        }
    };

    // 3. Medir el tiempo de búsqueda
    let start_time = Instant::now();
    
    // Contar ocurrencias
    let count = text.match_indices(search_word).count();
    
    let elapsed_time = start_time.elapsed();

    // 4. Imprimir el resultado: CONTEO TIEMPO_STRING
    // Usamos Microsegundos (µs) para Rust.
    println!("{} {} µs", count, elapsed_time.as_micros());
}