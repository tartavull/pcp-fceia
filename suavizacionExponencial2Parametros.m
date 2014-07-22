function [ pronostico ] = suavizacionExponencial2Parametros(demanda, alfa, gamma )
%SUAVIZACIONEXPONENCIAL2PARAMETROS Summary of this function goes here
%   Detailed explanation goes here

   nivel(1) = demanda(1);
   tendencia(1) = 1/2 * ( demanda(2) - demanda(1) + demanda(4) - demanda(3) );

   for t = 2:length(demanda)
       nivel(t) = alfa * demanda(t) + (1 - alfa) * (nivel(t-1) + tendencia (t-1));
       tendencia(t) =  gamma * ( nivel(t) - nivel(t-1) ) + (1 - gamma) * tendencia(t -1);
   end
   
   pronostico = nivel + tendencia;

end

