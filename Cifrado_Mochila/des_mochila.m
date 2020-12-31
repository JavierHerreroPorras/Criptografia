function [texto] = des_mochila(s,cifrado)
% Función para descifrar un texto cifrado conociendo la mochila supercreciente que se ha utilizado como clave.
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - cifrado (Entrada): Vector numérico que se corresponde con el mensaje.
%   - texto (Salida): Texto claro. En caso contrario es 0.

%Comprobamos si la mochila es supercreciente
[~,valida] = sol_mochila(s,0);

if valida ~= 1
    texto = 0;
    return;
end

%Obtenemos la solucion de la mochila para cada elemento de cifrado.
%Agrupamos los elementos en un solo vector.
long_mochila = length(s);
A = zeros(1,long_mochila*length(cifrado));
j = 1;
for i = cifrado
    sol = sol_mochila(s,i);
    A(1,j:j+long_mochila-1) = sol;
    j = j+long_mochila;
end

%Tomamos ese vector y lo dividimos en subconjuntos de 8 elementos. Pasamos
%el binario a natural (bin2dec, el cual toma una cadena (necesitamos int2str))
%y obtenemos su correspondiente letra (char).
j = 1;
texto = '';
while j+7 <= length(A)
    texto = sprintf('%s%s',texto,char(bin2dec(int2str(A(j:j+7)))));
    j = j+8;
end

end

