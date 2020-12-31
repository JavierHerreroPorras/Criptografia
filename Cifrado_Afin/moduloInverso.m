function [ModMultInv] = moduloInverso(A,M)
%Calcula el inverso de A en módulo M
%   Parámetros:
%   - A (Entrada).
%   - M (Entrada): Módulo de trabajo.
%   - ModMultInv (Salida): Inverso modular de A.

[G,C,~] = gcd(A,M);

if G==1
    ModMultInv = mod(C,M);
else
    ModMultInv = 0;
end

