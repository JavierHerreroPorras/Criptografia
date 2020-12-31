function [blo] = prepa_num_cifrar(tama,bloque)
%Función que convierte una cadena numérica en bloques de un tamaño dado,
%después convierte dichos bloques en números y los almacena en un vector.
%  Parametros:
%   - tama (Entrada): Tamaño de los bloques.
%   - bloque (Entrada): Cadena numérica.
%   - blo (Salida): Vector formado por los números que se corresponden con cada uno de los bloques.

% Dividimos la cadena en bloques
i = 1;
blo = [];

if (ischar(bloque) ~= 1 || mod(tama,1) ~= 0)
    fprintf('Los parametros deben ser un numero entero y un char.\n');
    return;
end

while i < length(bloque)-tama+1
    blo(end+1) = str2double(bloque(i:i+tama-1));
    i = i + tama;
end

% Añadimos al final 30s si faltan 2 dígitos para llegar al tamaño deseado o
% 0s si falta 1 dígito para llegar al tamaño deseado.
while length(bloque(i:length(bloque))) ~= tama
    if ((tama - length(bloque(i:length(bloque)))) > 1)
        bloque = strcat(bloque,'30');
    else
        bloque = strcat(bloque,'0');
    end
end

% Pasamos el resultado obtenido a un número.
blo(end+1) = str2double(bloque(i:length(bloque)));

end

