function [cifrado] = cifro_rsa_num(e,n,blo)
%Funci�n que cifra una serie de bloques de n�meros mediante la clave p�blica (e,n) y devuelve una
%serie de bloques num�ricos
%  Parametros:
%   - e y n (Entrada): Clave p�blica para RSA.
%   - blo (Entrada): Bloques num�ricos a cifrar.
%   - cifrado (Salida): Vector formado por los bloques num�ricos cifrados.

cifrado = [];

if mod(n,1)~=0 || mod(e,1)~=0
    disp('Los n�meros introducidos deben ser enteros y el texto a cifrar debe ser char.\n');
    return;
end

% Ciframos cada bloque mediante una potencia con exponente e y modulo de
% trabajo n.
for i=blo
    cifrado(end+1) = potencia(i,e,n);
end

end

