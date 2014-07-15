function promedios = suavizacionExponencialSimple( datos, alfa)

promedios = zeros(size(datos));

promedios(1) = datos(1);

for index = 2:length(datos)

   promedios(index)=alfa*datos(index)+(1-alfa)*promedios(index-1);

end