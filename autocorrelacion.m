function [acf,lags,bounds] = autocorrelacion(data)
%AUTOCORRELACION correlacion existente entre una variable y la misma
%   Es la correlacion existente entre una variable y la misma desfasada k
%   periodos
  %Todavia no implementadas,pero es una buena interface para todas las
  %funciones
  lags=0; %la posiciones
  bounds=0; %el intervalo de confianza

  mediaMuestral =  mean(data);
  
  n = length(data);
  acf = zeros(n,1);
  
  for k = 1:n
      
      numerador = 0;
      for t = 1+k:n
          numerador = numerador + (data(t)-mediaMuestral) * ( data(t-k) - mediaMuestral);
      end
      
      denominador=0;
      for t = 1+k:n
          denominador = denominador + (data(t)-mediaMuestral)^2;
      end
      
      
      acf(k) = numerador/denominador;
      
      
  end


end

