function [potencia] = arnold_02(foto,A)
%Funci�n que debe desordenar los p�xeles de la imagen foto seg�n la matriz
%A, de manera sucesiva.
%   Par�metros:
%   - foto (Entrada):  la foto de la que queremos desordenar sus p�xeles.
%   Debe ser cuadrada.
%   - A (Entrada): matriz que nos determina la transformaci�n. Debe ser 2x2 y tener inversa m�dulo el n�mero de filas de foto.
%   - potencia (Salida):  n�mero de veces que hemos realizado la
%   transformaci�n de forma sucesiva.

im = imread(foto);

% Tama�o de la imagen
[filas,columnas,canales] = size(im);

% Comprobamos el tama�o de la imagen. Debe ser cuadrada
if filas ~= columnas
    fprintf('La imagen debe ser cuadrada.\n');
    potencia = -1;
    return;
end



% Comprobamos si la matriz es 2x2 y tiene inversa en el modulo determinado
[filasM,columnasM] = size(A);

if filasM ~= 2 || columnasM ~= 2
    fprintf('La matriz de transformaci�n debe ser 2x2.\n');
    potencia = -1;
    return;
end

inversoA = inv_modulo(A,filas);

if inversoA == 0
    fprintf('La matriz debe tener inversa en mod filas de foto.\n');
    potencia = -1;
    return;
end

entrada = input('Introduce un 1 si quieres desordenar la imagen hasta volver a la original, o 2 si quieres desordenarla hasta una determinada potencia: ');

% Realizamos a desordenar la imagen dependiendo de la entrada del usuario.
% Mostramos la imagen original y la desordenada en cada iteraci�n.
switch (entrada)
    
    case 1
        potencia = pote(A,filas);
        aux = A;
        figure('Name','Resultado Arnold02','NumberTitle','off');
        
        for i = 1:potencia
            im_ordenada = foto;
            desorden_pixel(im_ordenada,aux);
            aux = mod(aux*A,filas);
            cad = strcat(num2str(i),' iteraciones');
            im_desordenada = getappdata(gcf, 'matriz');

            %figure('Name','Resultado Arnold','NumberTitle','off');
            subplot(1,2,1), imshow(im_ordenada), title('original.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
            subplot(1,2,2), imshow(im_desordenada), title({'transformada.bmp';cad},'Units', 'normalized', 'Position', [0.5, -0.2, 0]);
            pause(0.5);
        end
        
    case 2
        potencia = input('Cuantas transformaciones desea hacer? ');
        aux = A;
        figure('Name','Resultado Arnold02','NumberTitle','off');
        
        for i = 1:potencia
            im_ordenada = foto;
            desorden_pixel(im_ordenada,aux);
            aux = mod(aux*A,filas);
            im_desordenada = getappdata(gcf, 'matriz');
            cad = strcat(num2str(i),' iteraciones');

            %figure('Name','Resultado Arnold','NumberTitle','off');
            subplot(1,2,1), imshow(im_ordenada), title('original.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
            subplot(1,2,2), imshow(im_desordenada), title({'transformada.bmp';cad},'Units', 'normalized', 'Position', [0.5, -0.2, 0]);
            pause(0.5);
        end
        
    otherwise
        fprintf('Opci�n incorrecta.\n');
        potencia = -1;
end


end

