function [permuta] = permutacion_v(p)
% Comprueba si el vector es una permutacion.
%   Par�metros:
%   - p (Entrada): Vector. 
%   - permuta (Salida): Es 1 si el vector es una permutaci�n y 
%                          0 en caso contrario.

longitud = length(p);
    if isequal(1:longitud,unique(p,'sorted'))
        permuta = 1;
    else
        permuta = 0;
    end
end

