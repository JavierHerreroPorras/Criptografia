function [v,valida] = sol_mochila(s,obj)
%Analiza si una mochila dada cumple un determinado objetivo con el algoritmo estudiado para mochilas supercrecientes
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - obj (Entrada): Objetivo a alcanzar.
%   - v (Entrada): Si el objetivo se cumple es un vector indicando los valores de la mochila que permiten obtenerlo. En caso contrario es 0.
%   - valida (Salida): Toma el valor 1 si la mochila es supercreciente, 0 si es una mochila pero no es supercreciente y -1 si no es una mochila.

valida = mochila(s);
[~,elementos] = size(s);
v = zeros(1,elementos);

    if valida == -1
        return;
    end

    for i = elementos:-1:1
        if obj >= s(i)
            obj = obj - s(i);
            v(i) = 1;
        end
    end
    
    % Si al final del algoritmo el objetivo no es 0, v será 0 ya que no se
    % ha cumplido
    if obj ~= 0
        v = 0;
    end
end

