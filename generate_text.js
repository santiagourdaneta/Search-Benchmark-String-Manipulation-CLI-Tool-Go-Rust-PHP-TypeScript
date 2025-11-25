const fs = require('fs');

// Texto base: una mezcla de palabras comunes y palabras clave de tu proyecto.
const baseText = "El ágil zorro marrón salta sobre el perro perezoso. La programación es divertida y eficiente. Go, Rust, PHP y TypeScript son lenguajes geniales para medir el rendimiento. Algoritmos rápidos y búsqueda binaria son esenciales. ";

let longText = "";

// Repetir el texto 200 veces. Si el texto base tiene unos 200 caracteres,
// esto generará aproximadamente 40,000 caracteres, ¡perfecto para un benchmark!
const REPETITION_COUNT = 200; 
for (let i = 0; i < REPETITION_COUNT; i++) {
    longText += baseText;
}

// Asegurarse de que el texto termine con un salto de línea si es necesario (aunque no es estrictamente necesario para la búsqueda).
fs.writeFileSync('text.txt', longText);

console.log(`✅ ¡Éxito! Se ha generado 'text.txt'.`);
console.log(`Tamaño total del texto: ${longText.length} caracteres.`);
console.log(`Este texto será usado por todos los scripts de búsqueda.`);