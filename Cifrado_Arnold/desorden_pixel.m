function [] = desorden_pixel(foto,A)
%Funci�n que desordena los p�xeles de las matrices asociadas a una imagen, foto, de acuerdo a la transformaci�n asociada a la matriz A.
%   Par�metros:
%   - foto (Entrada):  la foto de la que queremos desordenar sus p�xeles.
%   Debe ser cuadrada.
%   - A (Entrada): matriz que nos determina la transformaci�n. Debe ser 2x2 y tener inversa m�dulo el n�mero de filas de foto.

im = imread(foto);

% Comprobamos el tama�o de la imagen. Debe ser cuadrada
[filas,columnas, numberOfChannels] = size(im);

if filas ~= columnas
    fprintf('La imagen debe ser cuadrada.\n');
    return;
end

% Comprobamos si la matriz es 2x2 y tiene inversa en el modulo determinado
[filasM,columnasM] = size(A);

if filasM ~= 2 || columnasM ~= 2
    fprintf('La matriz de transformaci�n debe ser 2x2.\n');
    return;
end

if inv_modulo(A,filas) == 0
    fprintf('La matriz debe tener inversa en mod filas de foto.\n');
    return;
end

%Creamos una nueva imagen de uint8, con las mismas dimensiones y canales
%que la original
newIm = zeros(filas,columnas,numberOfChannels,'uint8');

% Realizamos las correspondientes operaciones para cada pixel. Si el
% resultado es 0, ponemos dicho valor igual al numero de filas.
for f = 1:filas
    for c = 1:columnas
        res = mod(A*[f;c],filas);
        
        if res(1) == 0
            res(1) = filas;
        end
        
        if res(2) == 0
            res(2) = filas;
        end
        
        newIm(res(1),res(2),:) = im(f,c,:);
    end
end

% Guardamos los datos
setappdata (gcf, 'matriz', newIm);

end

