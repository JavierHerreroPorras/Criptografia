function [valida] = mochila(s)
%Analiza si la mochila s es simple o supercreciente
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - valida (Salida): Toma el valor 1 si la mochila es supercreciente, 0 si es una mochila pero no es supercreciente y -1 si no es una mochila.

[filas,columnas] = size(s);

    if filas ~= 1
        valida = -1;
        return;
    end

    if isequal(mod(s,1),zeros(1,columnas)) == 0
       valida = -1;
       return;
    end

    %Se comprueba, si es supercreciente, que el elemento i sea mayor que la
    %suma de todos los anteriores.
    suma = 0;
    for i = s
        if i < 1
            valida = -1;
            return;
        elseif i < suma
            valida = 0;
            return;
        else
            suma = suma + i;
        end
    end
    
    valida = 1;
end

