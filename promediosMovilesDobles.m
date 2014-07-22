function [a,b,primerPromedios,segundoPromedios] = promediosMovilesDobles( demanda, nPrimerPeriodo, nSegundosPeriodo )
%PROMEDIOSMOVILESDOBLES Summary of this function goes here
% Es util cuando solo hay patron de tendencia y aleatoriedad
% No modela estacionalidades

primerPromedios = promediosMoviles(demanda, nPrimerPeriodo);
segundoPromedios = promediosMoviles( primerPromedios, nSegundosPeriodo);

%Ambos vectores deben tener el mismo tamano
primerPromedios = primerPromedios(end - length(segundoPromedios)+1:end);

a = 2 * primerPromedios - segundoPromedios;
b = 2 / (nPrimerPeriodo - 1) * (primerPromedios - segundoPromedios);


end
