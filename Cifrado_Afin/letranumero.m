function [salida] = letranumero(entrada)
%Limpia el texto pasado como entrada y devuelve un vector numérico
%   asociado al texto.
%   Parametros:
%   - texto (Entrada): Escrito en castellano y entre ''
%   - salida (Salida): vector numérico asociado al texto.
alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);
entrada = lower(entrada);
salida=[];

for i = entrada
   if contains(alfabeto,i)
    salida(end+1) = find(alfabeto == i) - 1;
   elseif double(i)== 225
    salida(end+1) = find(alfabeto == char(double(i)-128)) - 1;
   elseif double(i)== 233
    salida(end+1) = find(alfabeto == char(double(i)-132)) - 1;
   elseif double(i)== 237
    salida(end+1) = find(alfabeto == char(double(i)-132)) - 1;
   elseif double(i)== 243
    salida(end+1)= find(alfabeto == char(double(i)-132)) - 1;
   elseif double(i)== 250
    salida(end+1) = find(alfabeto == char(double(i)-133)) - 1;
   end
end
end




