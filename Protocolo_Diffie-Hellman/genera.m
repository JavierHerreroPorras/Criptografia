function [generador] = genera(g,p)
%Funci�n que indica si el n�mero natural g es generador del grupo
%multiplicativo determinado por el primo p.
%   Par�metros:
%   - g (Entrada): n�mero natural de Zp. Comprobaremos si es generador.
%   - p (Entrada): n�mero primo que determina el grupo multiplicativo.
%   - generador (Salida): toma el valor 0 si g no es generador en Zp o las
%   entradas no son correctas.

generador = g;

tic

if mod(g,1)~=0 || mod(p,1)~=0 || isprime(p) == 0 || g>=p || g<=0
    disp('El n�mero p debe ser primo, g debe ser menor que p y mayor que 0');
    generador = 0;
    return
end

% Obtengo los factores de p-1
factores = unique(factor(p-1));

%Aplicamos la definici�n para comprobar si es generador.
for i = factores
   if potencia(g,(p-1)/i,p) == 1
       generador=0;
   end
end
toc
end

