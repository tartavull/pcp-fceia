function [promedios, laps] = promediosMoviles( datos, nPeriodo )

promedios = zeros(length(datos)-nPeriodo+1,1);

inicio = floor((nPeriodo-1)/2);
final = length(datos) - (nPeriodo-1 - inicio);

laps = inicio+1:final;

for index = 1:length(datos)-nPeriodo+1

   intervalo = index:index+nPeriodo-1;
   promedios(index)=mean(datos(intervalo));

end