function [ SSE, MSE, MAD, MAPE ] = calcularErrores( demanda, pronostico)
%CALCULARERRORES SSE, MSE, MAD, MAPE
%   Detailed explanation goes here

 e = zeros(size(pronostico));

 %Supongo que los vectores pronostico e demanda, terminan en el mismo punto
 start =  length(demanda) - length(pronostico);
 
 for index = 1:length(pronostico)
     
     e(index) = demanda(start+index) - pronostico(index);
     
 end
 
 SSE = sum(e.^2);
 MSE = SSE / length(e);
 MAD = sum( abs(e) ) / length(e);
 MAPE= sum( abs( e ./ pronostico)) / length(e) *100;
 
end

