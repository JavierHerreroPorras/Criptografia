function [cifrado] = cifroMochilaSuper(s,texto)
% Función que se asegura de que la mochila introducida es supercreciente, y sólo en ese caso cifra el texto.
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - texto (Entrada): Texto a cifrar.
%   - cifrado (Salida): Vector numérico que se corresponde con el mensaje
%   cifrado. En caso contrario es 0.

%Comprobamos si la mochila es supercreciente y en ese caso ciframos el
%texto.
[valida] = mochila(s);

if valida ~= 1
    cifrado = 0;
    return;
end

cifrado = cifr_mochila(s,texto);

end

