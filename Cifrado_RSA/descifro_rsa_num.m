function [descifro_num] = descifro_rsa_num(d,n,cifrado_numero)
%Función que aplica la función de descifrado del método RSA a un vector numérico (que supuestamente se habrá cifrado previamente con la clave pública), utilizando la clave privada proporcionada.
%  Parametros:
%   - d y n (Entrada): Clave privada.
%   - cifrado_numero (Entrada): Vector numérico.
%   - descifro_num (Salida): Vector numérico obtenido tras aplicar la función de descifrado con RSA.

descifro_num = [];

if mod(d,1)~=0 || mod(n,1)~=0
    disp('Los números introducidos deben ser enteros.\n');
    return;
end

% Desciframos cada elemento del vector recibido (realizando una potencia
% con exponente d y modulo de trabajo n).
descifro_num = zeros(1,length(cifrado_numero));

for i=1:length(cifrado_numero)
   descifro_num(i) = potencia(cifrado_numero(i),d,n);
end
end

