function [factores_c,fact] = factorescomunes(w,s)
% Función para comprobar si un número w tiene factores primos comunes con los elementos de la mochila s.
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - w (Entrada): Número natural.
%   - factores_c (Salida): Es 0 si no hay factores comunes, 1 si los hay y
%   -1 si las entradas son incorrectas.

factores_c=1;
fact=[];

% Si s no es una mochila, salimos de la función con factores_c = -1
if mochila(s) == -1
    factores_c = -1;
    fact = [];
    return;
end

% Comprobamos los factores comunes de w con cada elemento de s. Si los hay
% los añadimos a fact.
for i = s
    if gcd(w,i) ~= 1
        fact = [fact i];
    end
end

% Si fact está vacío, significa que no hay factores comunes y por tanto w es
% un buen candidato.
if isempty(fact)
    fact = 0;
    factores_c = 0;
end

end

