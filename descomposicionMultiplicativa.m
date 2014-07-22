function pronostico = descomposicionMultiplicativa(datos)
%UNTITLED2 Descomposicion multiplicativa de los datos, con 4 periodos por año, y cantidad ENTERA de años.

prom2per = zeros(length(datos),1);
factoresEstacionales = zeros(length(datos),1);
factores = zeros(4,1);
indicesEstacionales = zeros(length(datos),1);

for i=3:length(datos)-2
    prom2per(i) = (datos(i-2) + 2*datos(i-1) + 2*datos(i) + 2*datos(i+1) + datos(i+2)) / 8;
    factoresEstacionales(i) = datos(i) / prom2per(i);
    factores(rem(i,4)+1) = factores(rem(i,4)+1) + factoresEstacionales(i);
end

factores = factores / sum(factores) * 4;
aux = factores(1);
factores(1) = factores(2);
factores(2) = factores(3);
factores(3) = factores(4);
factores(4) = aux;
lugares = (1:length(indicesEstacionales)+4)';
lugares = rem(lugares,4);
lugares(lugares==0)=4;

indicesEstacionales = factores(lugares);

demandaDesestacionalizada = datos ./ indicesEstacionales(1:length(datos));
[r,m,b] = regression(1:length(demandaDesestacionalizada),demandaDesestacionalizada');

tendencia = (m * (1:length(demandaDesestacionalizada)+4))' + b * (ones(1,length(demandaDesestacionalizada)+4))';
pronostico = tendencia .* indicesEstacionales;

fprintf('Coeficiente de correlación: %d \n',r);
fprintf('r²: %d',r^2);
end