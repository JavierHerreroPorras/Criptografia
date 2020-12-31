function [cifradoafin] = afin(clave,d, texto)
%Función que cifra un mensaje por el método afín, con una clave y un
%desplazamiento. 
%   Parámetros:
%   - clave (Entrada): Debe ser entero y con mcd(clave,27) = 1.
%   - d (Entrada): Debe ser entero.
%   - texto (Entrada): Escrito en castellano y entre ''
%   - cifradoafin (Salida): Texto cifrado por el método afín.

textonumero = letranumero(texto);
alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);
modulo = 27;
cifradoafin = char(textonumero);

if fix(clave)~=clave || (gcd(clave,modulo)~= 1)
    error("Clave no valida");

elseif fix(d)~=d
    error("Desplazamiento no valido");
end

for i = 1:length(textonumero)
    letra_cifrada = mod((clave*textonumero(i))+d,modulo)+1;
    cifradoafin(i) = char(alfabeto(letra_cifrada));
end

end

