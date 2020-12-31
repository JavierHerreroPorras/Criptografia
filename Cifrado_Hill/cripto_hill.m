function [matrizclave] = cripto_hill(claro,cripto,d)
%Función para hallar la matriz clave en el cifrado Hill
%   Parámetros:
%   - claro (Entrada): Fragmento de texto llano, de longitud al menos d^2.
%   - m (Entrada): Criptograma, de longitud al menos d^2.
%   - d (Entrada): Orden para la matriz de cifrado.
%   - matrizclave (Salida): Matriz clave del cifrado Hill.

% Compruebo que la longitud de las cadenas sea multiplo de d.
% En caso contrario las recorto para poder realizar las matrices.
claro_numero = letranumero(claro);
cripto_numero = letranumero(cripto);

if mod(length(cripto_numero),d)~=0
    while mod(length(cripto_numero),d)~=0
        cripto_numero = cripto_numero(1:length(cripto_numero)-1);
    end
elseif mod(length(claro_numero),d)~=0
   while mod(length(claro_numero),d)~=0
        claro_numero = claro_numero(1:length(claro_numero)-1);
    end 
end

% Compruebo que las cadenas tengan al menos longitud d^2
if length(claro_numero) < d^2 || length(cripto_numero) < d^2
    fprintf('¡Error! El texto claro y el criptograma deben tener longitud al menos %d',d^2);
    matrizclave = 0;
    return;
end

% Si una cadena es más corta que otra, se recortan para igualar el tamaño
if length(claro_numero) < length(cripto_numero)
    cripto_numero = cripto_numero(1:length(claro_numero));
elseif length(cripto_numero) < length(claro_numero)
    claro_numero = claro_numero(1:length(cripto_numero));
end

claro_matriz = reshape(claro_numero,d,[]).';
cripto_matriz = reshape(cripto_numero,d,[]).';

C=[claro_matriz cripto_matriz]; %%unión de los datos en una sola matriz

[filas,~] = size(C);

for i=1:d
    M = inv_modulo(C(1:d,1:d),27);
    % Si la matriz es 0 significa que su determinante es 0
    if M ~= 0
        matrizclave = mod(M*C(1:d,d+1:2*d),27).';
        return;
    else
        k = d+1;
        % Si no existe inversa cambio las filas hasta que tenga una matriz
        % que tenga inversa
        while k <= filas
             D = C;
             D([i k],:) = D([k i],:);
             M = inv_modulo(D(1:d,1:d),27);
             D(1:d,1:d)
             if M ~= 0
                 matrizclave = mod(round(mod(M*D(1:d,d+1:2*d),27).'),27);
                 return;
             else
                 k = k+1;
             end
        end
    end

end

% Si no se encuentra la inversa devolvemos matrizclave = 0
disp('No se ha encontrado la matriz M. Se necesita mas texto para criptoanalizar');
matrizclave = [];

end

