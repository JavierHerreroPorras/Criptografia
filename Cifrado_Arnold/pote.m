function [n] = pote(A,m)
%Función que debe calcular el mínimo valor del exponente de la potencia de A que módulo m es igual a la matriz identidad.
%   Parámetros:
%   - A (Entrada): matriz. Debe ser 2x2 y tener inversa módulo el número de filas de foto.
%   - m (Entrada): modulo de trabajo
%   - n (Salida): el valor del exponente que hace que la correspondiente
%   potencia de A sea la identidad.

[filasM,columnasM] = size(A);

% Comprobamos si la matriz es 2x2 y tiene inversa en el modulo determinado

if filasM ~= 2 || columnasM ~= 2
    fprintf('La matriz debe ser 2x2.\n');
    n = -1;
    return;
end

inversoA = inv_modulo(A,m);

if inversoA == 0
    fprintf('La matriz debe tener inversa en mod m.\n');
    n = -1;
    return;
end

identidad = eye(2);
aux = A;
n = 1;

% Realizamos multiplicaciones hasta que encontremos la identidad. Guardamos
% el indice encontrado en n.
while (isequal(aux,identidad) == 0)
    aux = mod(aux*A,m);
    n = n+1;
end

end

