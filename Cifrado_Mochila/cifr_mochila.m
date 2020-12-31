function [cifrado] = cifr_mochila(s,texto)
%Función para cifrar un mensaje con una mochila (no tiene porqué ser supercreciente).
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila.
%   - texto (Entrada): Texto a cifrar.
%   - cifrado (Salida): Vector numérico que se corresponde con el mensaje
%   cifrado. En caso contrario es 0.

%Comprobamos en primer lugar si la mochila es válida
if mochila(s) == -1
    cifrado = 0;
    return;
end

%Pasamos el texto a números binarios y obtenemos una cadena de digitos
%binarios
A = abs(texto);
B = dec2bin(A,8);
B= B.';
C= strcat(B(:)');

%Obtenemos la longitud de los bloques
[~,n] = size(s);
cifrado = zeros(1,n);

%Añadimos 1 si faltan digitos para completar bloques
while mod(length(C),n)~=0
    C = strcat(C,'1');
end

%Dividimos la cadena en bloques
[~,max] = size(C);
j= 1; index = 1;

while j+n-1 <= max
    Z = C(j:j+n-1).';
    Z = str2num(Z); %#ok<ST2NM>
    %Sustituimos el bloque obtenido en la mochila
    cifrado(index) = (s*Z);
   
    j = j+n; index = index+1;
end

end

