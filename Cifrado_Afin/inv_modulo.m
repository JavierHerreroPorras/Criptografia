function [inver] = inv_modulo(A,m)
%Calcula la inversa de una matriz modular con modulo m. En caso de no
%existir, se devuelve 0 y un mensaje informativo.
%   Parámetros:
%   - A (Entrada): Matriz debe tener coeficientes enteros, ser cuadrada e
%   invertible en modulo m.
%   - m (Entrada): Módulo de trabajo.
%   - inver (Salida): Inversa de la matriz A en módulo m. En caso de no
%   existir su valor es 0.

if ~isequal(mod(A,1),zeros(size(A)))
    disp('Esta matriz no tiene todos los elementos enteros');
    inver = 0;
    return;
else
    disp('Esta matriz tiene todos sus elementos enteros');
end

[filas, columnas] = size(A);
if filas ~= columnas
    disp('Esta matriz no es cuadrada');
    inver = 0;
    return;
end

det_inv = moduloInverso(int64(det(A)),m);

if det_inv == 0
   fprintf("La matriz no es inversible en modulo %d",m); 
   inver = 0;
   return;
end
inver = A;
for i = 1:filas
    for j = 1:columnas
        Adj = A;
        Adj(i,:) = [];
        Adj(:,j) = [];
        inver(i,j) = (-1)^(i+j)* det(Adj);
    end
end
inver = mod(double(det_inv)*inver',27);
end

