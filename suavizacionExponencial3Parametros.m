function [ output_args ] = suavizacionExponencial3Parametros( demanda, alfa, gamma, beta, nCicloEstacional )
%SUAVIZACIONEXPONENCIAL3PARAMETROS Summary of this function goes here
%   Detailed explanation goes here

   nivel(t) =  alfa * demanda(t) / indiceEstacional(t - nCicloEstacional) + (1 - alfa) * ( demanda(t-1) + tendencia(t -1));
   tendencia(t) =  gamma * (nivel(t) - nivel(t-1) + (1 - gamma) * tendencia(t -1);
   indiceEstacional(t) = beta * demanda(t) / nivel(t) + (1 - beta) * indiceEstacional(t - nCicloEstacional);
   pronostico(t) = (nivel(t)+tendencia(t)) * indiceEstacional(t- nCicloEstacional+1);
   
end

