function [descifraafin] = desafin(clave, d, texto)
%Función que descifra un mensaje cifrado con el método afín
%   Debemos conocer las claves de cifrado (clave y d).
%   Parámetros:
%   - clave (Entrada): Debe ser entero y con mcd(clave,27) = 1.
%   - d (Entrada): Debe ser entero.
%   - texto (Entrada): Texto encriptado con los parámetros clave y d.
%   - descifraafin (Salida): Texto descifrado.

textonumero = letranumero(texto);
alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);
descifraafin = char(textonumero);
modulo = 27;

if fix(clave)~=clave || (gcd(clave,modulo)~= 1)
    descifraafin = ' ';
    return;

elseif fix(d)~=d
    descifraafin = ' ';
    return;
end

d_inv = modulo - d;
clave_inv = moduloInverso(clave,modulo);

for i = 1:length(descifraafin)
    letra_descifrada = mod(clave_inv*(textonumero(i)+d_inv),modulo)+1;
    descifraafin(i) = char(alfabeto(letra_descifrada));
end
end

