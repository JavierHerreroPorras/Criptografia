function [factores_c,fact] = factorescomunes(w,s)
% Funci�n para comprobar si un n�mero w tiene factores primos comunes con los elementos de la mochila s.
%   Par�metros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - w (Entrada): N�mero natural.
%   - factores_c (Salida): Es 0 si no hay factores comunes, 1 si los hay y
%   -1 si las entradas son incorrectas.

factores_c=1;
fact=[];

% Si s no es una mochila, salimos de la funci�n con factores_c = -1
if mochila(s) == -1
    factores_c = -1;
    fact = [];
    return;
end

% Comprobamos los factores comunes de w con cada elemento de s. Si los hay
% los a�adimos a fact.
for i = s
    if gcd(w,i) ~= 1
        fact = [fact i];
    end
end

% Si fact est� vac�o, significa que no hay factores comunes y por tanto w es
% un buen candidato.
if isempty(fact)
    fact = 0;
    factores_c = 0;
end

end

