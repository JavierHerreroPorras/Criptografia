function [texto] = des_mmh(s,cifrado,mu,invw)
% Función que permita al usuario (receptor) descifrar un mensaje cifrado con su clave pública asociada.
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila supercreciente.
%   - cifrado (Entrada): Texto numérico recibido que representa el texto cifrado.
%   - mu,invw (Entrada): Elementos de la clave privada.
%   - texto (Salida): Texto claro, o 0 si las entradas no son correctas.

% Si el modulo o la inversa de w o la mochila no es supercreciente, el
% algoritmo no se puede aplicar
if mod(mu,1)~=0 || mod(invw,1)~=0 || mochila(s) ~=1
    texto = 0;
    return;
end

% Obtenemos el texto llano
cifrado = mod(cifrado * invw,mu);

texto = des_mochila(s,cifrado); 
    
end

