function [desci] = num_descifra(n,bloque_numero)
%Función que transforma un vector numérico en letras (considerando dos
%dígitos por letra).
%  Parametros:
%   - n (Entrada): Determina el tamaño de los bloques (digitos(n)-1).
%   - bloque_numero (Entrada): Vector numérico.
%   - desci (Salida): Cadena alfabética con el texto asociado a los bloques de números.

desci = '';

if mod(n,1)~=0
    disp('Los números introducidos deben ser enteros y el texto a cifrar debe ser char.\n');
    return;
end

alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);
tama = length(num2str(n))-1;
aux = '';

% Cada bloque numérico se pasa a formato cadena y se completa con 0s para
% que tengan la longitud necesaria (tama). Se concatenan.
for i=1:length(bloque_numero)
    
    bloque_letra = num2str(bloque_numero(i));
    while length(bloque_letra) < tama
        bloque_letra = strcat('0',bloque_letra);
    end
    
    aux = strcat(aux,bloque_letra);
end

% Tomamos la cadena realizada anteriormente y tomamos sus elementos de 2 en
% 2, para pasarlos a letra. Si detectamos un 30, salimos del bucle, puesto
% que hemos llegado al final del mismo (es ruido).
for i=1:2:length(aux)-1
    if str2double(aux(i:i+1)) ~= 30
        desci = strcat(desci,alfabeto(str2double(aux(i:i+1))+1)); 
    else
        break;
    end
    
end

end

