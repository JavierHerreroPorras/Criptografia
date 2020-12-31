function [] = arnold(foto,A)
%Función que va a ordenar o a desordenar una foto.
%   Parámetros:
%   - foto (Entrada):  la foto de la que queremos aplicar una transformación de Arnold. Debe ser cuadrada.
%   - A (Entrada): matriz utilizada para desordenar u ordenar la foto. Debe ser 2x2 y tener inversa módulo el número de filas de foto.

im = imread(foto);

% Comprobamos el tamaño de la imagen. Debe ser cuadrada
[filas,columnas,canales] = size(im);

if filas ~= columnas
    fprintf('La imagen debe ser cuadrada.\n');
    return;
end

% Comprobamos si la matriz es 2x2 y tiene inversa en el modulo determinado
[filasM,columnasM] = size(A);

if filasM ~= 2 || columnasM ~= 2
    fprintf('La matriz de transformación debe ser 2x2.\n');
    return;
end

inversoA = inv_modulo(A,filas);

if inversoA == 0
    fprintf('La matriz debe tener inversa en mod filas de foto.\n');
    return;
end

entrada = input('Introduce un 1 si quieres desordenar, o un 2 si quieres ordenar: ');

%imshow(foto);

%Realizamos el orden o el desorden
figure('Name','Resultado Arnold','NumberTitle','off');
set(gcf, 'WindowState', 'maximized');
switch (entrada)
    case 1
        %Aplicamos el desorden de la imagen y presentamos los datos en una
        %ventana.
        im_ordenada = foto;
        desorden_pixel(im_ordenada,A);
        im_desordenada = getappdata(gcf, 'matriz');
       
        %figure('Name','Resultado Arnold','NumberTitle','off');
        subplot(1,2,1), imshow(im_ordenada), title('orden.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
        subplot(1,2,2), imshow(im_desordenada), title('desorden.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
        
    case 2
        %Realizamos el orden de una foto. En este caso utilizamos la matriz
        %inversa de A (ya que A se utilizó previamente para desordenar la
        %imagen). Presentamos los datos.
        im_desordenada = foto;
        desorden_pixel(im_desordenada,inversoA);
        im_ordenada = getappdata(gcf, 'matriz');
        
        %figure('Name','Resultado Arnold','NumberTitle','off');
        subplot(1,2,1), imshow(im), title('desorden.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
        subplot(1,2,2), imshow(im_ordenada), title('orden.bmp','Units', 'normalized', 'Position', [0.5, -0.1, 0]);
        
    otherwise
        fprintf('Opción incorrecta.\n');
end


end

