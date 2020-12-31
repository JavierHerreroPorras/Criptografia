function [texto] = descifro_permutacion(p,cifrado)
% Descifra el texto de acuerdo a partir de una permutacion.
%   Parámetros:
%   - p (Entrada): Vector
%   - cifrado (Entrada): Texto cifrado a partir de p.
%   - texto (Salida): Texto descifrado usando Hill.
longitud = length(p);
if ~isequal(1:longitud,unique(p,'sorted'))
    disp('Hola');
    return;
end

A = matper(p);

A = inv_modulo(A,27);

if A == 0
    printf('Esta matriz no tiene inversa en el modulo %d',m);
    texto= ' ';
    return;
end

texto = cifro_hill(A,27,cifrado);


end

