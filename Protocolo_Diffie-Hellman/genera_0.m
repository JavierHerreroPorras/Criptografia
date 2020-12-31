function [generador] = genera_0(g,p)
%Funci�n que indica si el n�mero natural g es generador del grupo
%multiplicativo determinado por el primo p.
%   Par�metros:
%   - g (Entrada): n�mero natural de Zp. Comprobaremos si es generador.
%   - p (Entrada): n�mero primo que determina el grupo multiplicativo.
%   - generador (Salida): toma el valor 0 si g no es generador en Zp o las
%   entradas no son correctas.

generador = g;

if mod(g,1)~=0 || mod(p,1)~=0 || isprime(p) == 0 || g>=p || g<=0
    disp('El n�mero p debe ser primo, g debe ser menor que p y mayor que 0');
    generador = 0;
    return
end


z = zeros(1,p-1);
% Calculo la potencia g^i mod p y lo almaceno en z.
tic
for i = 1:p-1
    z(i)= potencia(g,i,p);
end
toc

% Hago unique(z) para eliminar los elementos repetidos. Si hubiera
% elementos repetidos, g no ser�a generador de en Zp.
[~,f1] = size(z);
[~,f2] = size(unique(z));

if f1 ~= f2
    generador = 0;
end

