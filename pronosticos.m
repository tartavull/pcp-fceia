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

data_autocorrelacion = [130 ; 120 ; 171 ;213 ;167; 201;
225; 212; 150; 138; 152; 134; 115; 173; 161; 226; 225;
288; 280; 256; 247; 207; 190; 185; 219; 270; 301; 375; 401;
468; 399; 352; 361; 338; 300; 295; 316; 407; 425; 482; 588; 
648 ;659 ;615 ;549; 543; 511; 444];

pronostico_5=[9.5 12.2 8.8 13.6 10.4 13.5 9.7 13.1 9.5 11.7 8.4 12.9 10.9 13.7 10.1 15.0]


example_page63 = [63 64 58 60 75 70 64 67 80 74 66 68 80 81 74 75 87 84 76 74 93 91 85 84
97 95 89 86 103 101];

example_pag30 = [72 110 117 172 76 112 130 194 78 119 128 201 81 134 141 216] ;