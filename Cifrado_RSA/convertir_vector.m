function [blo] = convertir_vector(vector_numerico,n1,n2)
%Funcion auxiliar para la autentificación de firma en RSA. Concatena y completa con 0 para la longitud de n1 y divide en bloques de longitud n2. 

aux = '';

% Rellenamos cada elemento del vector con 0s hasta la longitud de n1
for i=1:length(vector_numerico)
    bloque_letra = num2str(vector_numerico(i));
    while length(bloque_letra) < n1
        bloque_letra = strcat('0',bloque_letra);
    end
    
    aux = strcat(aux,bloque_letra);
end

% Dividimos con longitud de n2
blo = prepa_num_cifrar(n2,aux);

end

