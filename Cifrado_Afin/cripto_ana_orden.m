function [frecuencia,freordenada] = cripto_ana_orden(v)
%Obtener las frecuencias de cada letra de un criptograma
%   Devuelve las frecuencias en forma de matriz.
%   Parámetros:
%   - v (Entrada): Criptograma, debe de estar entre ''.
%   - frecuencia (Salida): Matriz con las frecuencias de aparición de cada
%   letra.
%   - freordenada (Salida): Matriz con las frecuencias de aparición de cada
%   letra, ordenadas de mayor a menor.

modulo = 27;
alfabeto = 'abcdefghijklmnnopqrstuvwxyz';
alfabeto(15) = char(241);
frecuencia = zeros(modulo,2);

for i = 1:length(alfabeto)
    frecuencia(i,1) = (length(find(v == alfabeto(i)))/length(v));
    frecuencia(i,2) = i-1;
end
[~,s] = sort(frecuencia(:,1),'descend');
freordenada = frecuencia(s,:);
end

