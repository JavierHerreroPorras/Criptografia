function [cifrado] = cifro_permutacion(p,texto)
% Cifra el texto de acuerdo a partir de una permutacion.
%   Parámetros:
%   - p (Entrada): Vector
%   - texto (Entrada): Texto a cifrar.
%   - cifrado (Salida): Texto cifrado usando Hill.

A = matper(p);

cifrado = cifro_hill(A,27,texto);

end

