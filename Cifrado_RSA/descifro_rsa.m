function [descifrado] = descifro_rsa(d,n, cifrado_numero)
%Funci�n que aplica la funci�n de descifrado del m�todo RSA a un vector num�rico (que supuestamente se habr� cifrado previamente con la clave p�blica), utilizando la clave privada proporcionada y devuelve el texto llano asociado.
%  Parametros:
%   - d y n (Entrada): Clave privada.
%   - cifrado_numero (Entrada): Vector num�rico.
%   - descifrado (Salida): Texto llano obtenido tras aplicar la funci�n de descifrado con RSA.

descifrado = '';

if mod(d,1)~=0 || mod(n,1)~=0
    disp('Los n�meros introducidos deben ser enteros.\n');
    return;
end

% Aplico el descifrado RSA al vector num�rico recibido
descifro_num = descifro_rsa_num(d,n,cifrado_numero);

% Paso dicho vector a letras.
descifrado = num_descifra(n,descifro_num);

end

