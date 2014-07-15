pronostico_1 = [ 19 15 39 102 90 29 90 46 30 66 80 89 82 17 26 29];

figure(1);
hold on;
plot(pronostico_1)
cc=hsv(12);
for i=3:2:9
    plot(promediosMoviles(pronostico_1,i),'color',cc(i,:));
end

figure(2);
hold on;
plot(pronostico_1)
cc=hsv(12);
for i=1:2:9
    plot(suavizacionExponencialSimple(pronostico_1,i/10),'color',cc(i,:));
end



