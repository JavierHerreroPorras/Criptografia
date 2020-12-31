function [cifrado] = cifro_hill(A,m, texto)
%Cifra un texto dado a partir de una matriz A con modulo m
%   Parámetros:
%   - A (Entrada): Matriz debe tener coeficientes enteros, ser cuadrada e
%   invertible en modulo m.
%   - m (Entrada): Módulo de trabajo.
%   - texto (Entrada): Texto a cifrar
%   - cifrado (Salida): Texto cifrado por el metodo Hill.
alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);

if inv_modulo(A,m) == 0
    fprintf('Esta matriz no tiene inversa en modulo %d\n',m);
    cifrado = ' ';
    return;
end

[~,longitud_bloque] = size(A);

%Si la cadena no tiene una longitud multiplo de la longitud de bloque
% añadimos x para completarlo.
caracteres_faltan = mod(length(texto),longitud_bloque);
if caracteres_faltan ~= 0
    for k = 1:longitud_bloque-caracteres_faltan
        texto = strcat(texto,'x');
    end
end

cifrado_numero = letranumero(texto);
cifrado = '';

%Recorremos los correspondientes bloques y ciframos
i = 1;
while i <= length(cifrado_numero)-longitud_bloque+1
    bloque_cifrado = (mod(A*cifrado_numero(i:i+longitud_bloque-1).',27)).';
    for j = 1:longitud_bloque
        cifrado = strcat(cifrado,char(alfabeto(bloque_cifrado(j)+1)));
    end
    i = i + longitud_bloque;
end

end


