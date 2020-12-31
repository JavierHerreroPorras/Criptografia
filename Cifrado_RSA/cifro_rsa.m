function [cifrado] = cifro_rsa(e,n,texto)
%Funci�n que cifra un texto mediante la clave p�blica (e,n) y devuelve una
%serie de bloques num�ricos
%  Parametros:
%   - e y n (Entrada): Clave p�blica para RSA.
%   - texto (Entrada): Texto a cifrar.
%   - cifrado (Salida): Vector formado por los bloques num�ricos cifrados.

cifrado = [];

if mod(e,1)~=0 || mod(n,1)~=0 || ischar(texto) ~= 1
    disp('Los n�meros introducidos deben ser enteros y el texto a cifrar debe ser char.\n');
    return;
end

% Pasamos el texto recibido a un vector de n�meros.
doble = letra2numeros(texto);
tama = length(num2str(n))-1;

% Llamamos a prepa_num_cifrar, que nos devolver� dicho vector dividido en
% bloques de tama�o tama (digitos(n) - 1).
blo = prepa_num_cifrar(tama,doble);

% Ciframos cada bloque mediante la potencia con exponente e y m�dulo de
% trabajo n.
for i=blo
    cifrado(end+1) = potencia(i,e,n);
end
    
end

