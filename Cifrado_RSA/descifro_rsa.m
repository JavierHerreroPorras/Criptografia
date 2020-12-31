function [descifrado] = descifro_rsa(d,n, cifrado_numero)
%Función que aplica la función de descifrado del método RSA a un vector numérico (que supuestamente se habrá cifrado previamente con la clave pública), utilizando la clave privada proporcionada y devuelve el texto llano asociado.
%  Parametros:
%   - d y n (Entrada): Clave privada.
%   - cifrado_numero (Entrada): Vector numérico.
%   - descifrado (Salida): Texto llano obtenido tras aplicar la función de descifrado con RSA.

descifrado = '';

if mod(d,1)~=0 || mod(n,1)~=0
    disp('Los números introducidos deben ser enteros.\n');
    return;
end

% Aplico el descifrado RSA al vector numérico recibido
descifro_num = descifro_rsa_num(d,n,cifrado_numero);

% Paso dicho vector a letras.
descifrado = num_descifra(n,descifro_num);

end

