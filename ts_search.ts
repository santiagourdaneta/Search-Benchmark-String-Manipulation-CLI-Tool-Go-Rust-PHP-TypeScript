import * as fs from 'fs';
import * as _ from 'lodash';

function runSearch() {
    // 1. Obtener la palabra de búsqueda del argumento de línea de comandos (índice 2 en Node.js)
    const searchWord: string = process.argv[2];

    if (!searchWord) {
        console.log("0 Error");
        return;
    }

    // 2. Cargar la cadena de texto
    let text: string;
    try {
        text = fs.readFileSync('text.txt', 'utf8');
    } catch (error) {
        console.log("0 Error_lectura");
        return;
    }

    // 3. Medir el tiempo de búsqueda
    // process.hrtime() es el método de alta precisión de Node.js
    const startTime: [number, number] = process.hrtime();
    
    // Usar RegExp para un conteo preciso
    const safeSearchWord = _.escapeRegExp(searchWord);
    const matches = text.match(new RegExp(safeSearchWord, 'g'));
    const count: number = matches ? matches.length : 0;
    
    const elapsedTime: [number, number] = process.hrtime(startTime);
    // Convertir a milisegundos para la impresión
    const elapsedMs: number = (elapsedTime[0] * 1000) + (elapsedTime[1] / 1000000); 

    // 4. Imprimir el resultado: CONTEO TIEMPO_STRING
    // Usamos Milisegundos (ms) para TypeScript/Node.js.
    console.log(`${count} ${elapsedMs.toFixed(3)} ms`);
}

runSearch();