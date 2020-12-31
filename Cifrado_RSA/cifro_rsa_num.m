function [cifrado] = cifro_rsa_num(e,n,blo)
%Función que cifra una serie de bloques de números mediante la clave pública (e,n) y devuelve una
%serie de bloques numéricos
%  Parametros:
%   - e y n (Entrada): Clave pública para RSA.
%   - blo (Entrada): Bloques numéricos a cifrar.
%   - cifrado (Salida): Vector formado por los bloques numéricos cifrados.

cifrado = [];

if mod(n,1)~=0 || mod(e,1)~=0
    disp('Los números introducidos deben ser enteros y el texto a cifrar debe ser char.\n');
    return;
end

% Ciframos cada bloque mediante una potencia con exponente e y modulo de
% trabajo n.
for i=blo
    cifrado(end+1) = potencia(i,e,n);
end

end

