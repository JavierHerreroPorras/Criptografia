function [descifro_num] = descifro_rsa_num(d,n,cifrado_numero)
%Funci�n que aplica la funci�n de descifrado del m�todo RSA a un vector num�rico (que supuestamente se habr� cifrado previamente con la clave p�blica), utilizando la clave privada proporcionada.
%  Parametros:
%   - d y n (Entrada): Clave privada.
%   - cifrado_numero (Entrada): Vector num�rico.
%   - descifro_num (Salida): Vector num�rico obtenido tras aplicar la funci�n de descifrado con RSA.

descifro_num = [];

if mod(d,1)~=0 || mod(n,1)~=0
    disp('Los n�meros introducidos deben ser enteros.\n');
    return;
end

% Desciframos cada elemento del vector recibido (realizando una potencia
% con exponente d y modulo de trabajo n).
descifro_num = zeros(1,length(cifrado_numero));

for i=1:length(cifrado_numero)
   descifro_num(i) = potencia(cifrado_numero(i),d,n);
end
end

