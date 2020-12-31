function [mat_per] = matper(p)
%Comprueba si el vector es una permutación y construye una matriz asociada
%   Parámetros:
%   - p (Entrada): Vector
%   - mat_per (Salida): Matriz asociada a p.

if isequal(permutacion_v(p),0)
    disp('No has introducido una permutacion');
    return;
end
filas = length(p);
mat_per = zeros(filas, filas);

for i = 1:filas
    mat_per(i,p(i)) = 1;
end

