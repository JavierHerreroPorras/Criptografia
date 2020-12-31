function [doble] = letra2numeros(texto)
%Asocia a cada letra un valor num�rico de dos d�gitos en Z27.
%   Parametros:
%   - texto (Entrada): Escrito en castellano y entre ''.
%   - doble (Salida): Cadena num�rica formada por los n�meros asociados a cada letra del texto.

doble = '';

if (ischar(texto) ~= 1)
    fprintf('El parametro debe ser un char\n');
    return;
end

doble = '';

for i = texto
    resultado = letranumero(i);
    doble = strcat(doble,num2str(resultado,'%02.f'));
end

