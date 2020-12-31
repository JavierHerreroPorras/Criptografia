function [blo] = prepa_num_cifrar(tama,bloque)
%Funci�n que convierte una cadena num�rica en bloques de un tama�o dado,
%despu�s convierte dichos bloques en n�meros y los almacena en un vector.
%  Parametros:
%   - tama (Entrada): Tama�o de los bloques.
%   - bloque (Entrada): Cadena num�rica.
%   - blo (Salida): Vector formado por los n�meros que se corresponden con cada uno de los bloques.

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

% A�adimos al final 30s si faltan 2 d�gitos para llegar al tama�o deseado o
% 0s si falta 1 d�gito para llegar al tama�o deseado.
while length(bloque(i:length(bloque))) ~= tama
    if ((tama - length(bloque(i:length(bloque)))) > 1)
        bloque = strcat(bloque,'30');
    else
        bloque = strcat(bloque,'0');
    end
end

% Pasamos el resultado obtenido a un n�mero.
blo(end+1) = str2double(bloque(i:length(bloque)));

end

