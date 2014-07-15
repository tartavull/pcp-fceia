function promedios = promediosMoviles( datos, nPeriodo )

promedios = zeros(size(datos));

for index = nPeriodo:length(datos)

   promedios(index)=mean(datos((index+1)-nPeriodo:index));

end