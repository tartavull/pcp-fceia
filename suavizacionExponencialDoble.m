function [ pronostico ] = suavizacionExponencialDoble( data, alfa )
%suavizacionExponencialDoble Calcula suavizacion exponencial doble



  n = length(data);
  suavizadoPrimerOrden = zeros (n,1);
  suavizadoSegundoOrden = zeros (n,1);
  
  suavizadoPrimerOrden(1) = data(1);
  suavizadoSegundoOrden(1) = data(1);
  
  
  for  t = 2:n
    suavizadoPrimerOrden(t) = alfa * data(t) + (1 - alfa ) * suavizadoPrimerOrden(t-1);
    suavizadoSegundoOrden(t) = alfa * suavizadoPrimerOrden(t) + (1 - alfa) * suavizadoSegundoOrden(t-1);
  end
  
  a = 2 * suavizadoPrimerOrden - suavizadoSegundoOrden;
  b = alfa / (1- alfa) * ( suavizadoPrimerOrden - suavizadoSegundoOrden );
  a(1) = data(1);
  b(1) =  ((data(2) - data(1)) + (data(4)-data(3)))/2;
  pronostico = a + b;
end

