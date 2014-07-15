tablaPrecedencias = {
    'A','B';
    'B','D';
    'C','D';
    'D','E';
    'E','H';
    'F','H';
    'G','H';
    'H','I,J';
    'I','K';
    'J','K'
    'K',''};

tiempoTarea = {
    'A' 8;
    'B' 6;
    'C' 6;
    'D' 10;
    'E' 2;
    'F' 4;
    'G' 5;
    'H' 7;
    'I' 2;
    'J' 9;
    'K' 3};

matrizPrecedencias = tablaToMatriz(tablaPrecedencias);

totalTime = sum([tiempoTarea{:,2}]);