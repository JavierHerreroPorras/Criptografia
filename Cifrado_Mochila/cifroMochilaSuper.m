function [cifrado] = cifroMochilaSuper(s,texto)
% Funci�n que se asegura de que la mochila introducida es supercreciente, y s�lo en ese caso cifra el texto.
%   Par�metros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - texto (Entrada): Texto a cifrar.
%   - cifrado (Salida): Vector num�rico que se corresponde con el mensaje
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

