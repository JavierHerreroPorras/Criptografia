function [comparo] = barras(v)
%Compara las frecuencias de las letras con las del castellano.
%   Muestra los resultados en tabla y en diagrama de barras.
%   Parámetros:
%   - v (Entrada): Criptograma, debe de estar entre ''.
%   - comparo (Salida): Matriz con las frecuencias de aparición de cada
%   letra en castellano y en el criptograma, ordenadas de mayor a menor.
%   - diagramas (Figura): Diagramas de barras representando la información relativa a la matriz de frecuencias.
modulo = 27;
comparo = zeros(modulo,4);

[~,comparo(:,[3 4])] = cripto_ana_orden(v);
comparo(:,1) = [0.1368, 0.1253, 0.0868, 0.0798, 0.0687, 0.0671, 0.0625, 0.0586, 0.0497, 0.0468, 0.0463, 0.0393, 0.0315, 0.0251, 0.0142, 0.0101, 0.009, 0.009, 0.0088, 0.007, 0.0069, 0.0052, 0.0044, 0.0031, 0.0022, 0.0002, 0.0001];
comparo(:,2) = [4,0,15,19,18,13,8,3,11,2,20,21,12,16,1,6,22,25,17,7,5,26,9,14,24,10,23];

figure('Name','Comparación de Frecuencias','NumberTitle','off');
subplot(2,1,1);
bar(comparo(:,2), comparo(:,1),'r');
axis([-5 30 0 0.15]);
title('Frecuencias en castellano');

hold off;
subplot(2,1,2);
bar(comparo(:,4), comparo(:,3));
axis([-5 30 0 0.15]);
title('Frecuencias del criptograma');

end

