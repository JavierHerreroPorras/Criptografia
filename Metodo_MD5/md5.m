% PRACTICA 8: Completa el siguiente codigo para implementar un programa
% que proporcione el MD5 de cualquier mensaje.
%
% Por si os ayuda os dejo un esqueleto del codigo junto con alguna 
% indicacion. Hay pasos que se pueden implementar de una forma
% alternativa, podeis variarlo siempre y cuando el programa funcione
% correctametne

%  Salida: resumen MD5 del mensaje, que debera ser pedido al usuario,
%  como una cadena hexadecimal.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 1.- INTRODUCIMOS VARIABLES Y CONSTANTES NECESARIAS
clc
%PASO 1.1.- SOLICITAMOS EL MENSAJE

% Pedimos el mensaje al usuario
mensaje = input('Introduce el mensaje: ','s');


% PASO 1.2.- VAMOS A TRABAJAR MODULO M=2^32
m=2^32;

% PASO 1.3.-  CREAMOS UNA MATRIZ S PARA HACER LA ROTACION DE BITS,
% LOS NUMEROS SON NEGATIVOS POR SER UNA ROTACION A IZQUIERDA
s = [-7, -12, -17, -22;-5,  -9, -14, -20;-4, -11, -16, -23;-6, -10, -15, -21];
% Para hacer las rotaciones de bits (dp 46 en adelante)

% PASO 1.4.- t ES EL VECTOR QUE USAREMOS MAS ADELANTE, para construir la funcion
% Hash  del mensaje
t = fix(abs(sin(1:64)) .* m);

% PASO 1.5.- INICIALIZAMOS LA HASH
% MD5 utiliza las cuatro palabras siguientes:
% A=01 23 45 67 pero en Little endian:67 45 23 01
% B=89 ab cd ef --> ef cd ab 89 
% C=fe dc ba 98 --> 98 ba dc fe
% D=76 54 32 10 --> 10 32 54 76
% Como está en hexadecimal, podemos poner las letras en minúscula
A = '67452301';
B = 'efcdab89';
C = '98badcfe';
D = '10325476';

A_num = hex2dec(A);
B_num = hex2dec(B);
C_num = hex2dec(C);
D_num = hex2dec(D);

%Pasamos dichos numeros a decimal y los concatenamos en un vector, fhash.
fhash = [A_num B_num C_num D_num];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 2.- PREPARAMOS EL MENSAJE PARA APLICARLE LA HASH

mensaje = abs(mensaje)
bytelen = numel(mensaje) %numero de elementos del vector 

% PASO 2.1.- COMPLETAMOS EL MENSAJE CON UN 1 Y  LOS CEROS NECESARIOS PARA QUE EL 
% NUMERO DE BITS SEA CONGRUENTE CON 448 MODULO 512. COMO TENEMOS BYTES, COMPLETAMOS 
% CON 128 (10000000) Y LOS CEROS NECESARIOS PARA QUE EL NUMERO DE BYTES SEA 
% CONGRUENTE CON 56 MODULO 64.

mensaje = [mensaje 128];

aux = mod(numel(mensaje),64);

diff = 0;

if aux < 56
    diff = 56-aux;
elseif aux > 56
    diff = 64-aux+56;
end

mensaje = [mensaje zeros(1,diff)];

% PASO 2.2.- COMO CADA PALABRA VIENE FORMADA POR 4 BYTES, HACEMOS UNA MATRIZ DE 
% 4 FILAS CON LOS BYTES DEL MENSAJE, ASI CADA COLUMNA SERA UNA PALABRA 

% Convertimos la matriz a una de 4 filas y un número de columnas que se
% corresponderá con las palabras totales
matriz = reshape(mensaje,4,[]);

% PASO 2.3.- CONVERTIMOS CADA COLUMNA A ENTEROS DE 32 BITS, little endian.

[~,columnas] = size(matriz);

mensaje = zeros(1,columnas);

% Cada columna de convierte a enteros en little endian.
for i = 1:columnas
    mensaje(i) = mod((matriz(1,i) + matriz(2,i)*2^8 + matriz(3,i)*2^16 + matriz(4,i)*2^24),m);
end

% PASO 2.4.- COMPLETAMOS CON LA LONGITUD DEL MENSAJE ORIGINAL COMO UN ENTERO 
% DE 64 BITS __>8 bytes__>dos palabras : little endian.

bitlen = (bytelen*8);

if(bitlen < m)
    a = mod(bitlen,m);
    b = 0;
else %Caso raro
    a = mod(bitlen,m);
    b = mod(floor(bitlen/m),m);
end

mensaje = [mensaje a b];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% PASO 3.- REALIZAMOS LA FUNCION HASH
% TRABAJAMOS CON CADA BLOQUE DE  512 bits
% TENEMOS ENTEROS DE 32 BITS (UNA PALABRA). CADA BLOQUE TIENE 16 ELEMENTOS
% (PALABRAS)

for k = 1:16:numel(mensaje)
    a = fhash(1); b = fhash(2); c = fhash(3); d = fhash(4);
    for i =1:64
        % Convertimos b, c y d a vectores fila de bits.
        bv = dec2bin(b, 32) - '0';
        cv = dec2bin(c, 32) - '0';
        dv = dec2bin(d, 32) - '0';
        % obtenemos  f  = mix de b, c, d.
        %      ki = indice  0:15, del mensaje (k + ki).
        %      sr = filas 1:4, de  s(sr, :).
        % bv es X       
        % cv es Y         F (X,Y,Z) = (X AND Y) OR (NOT X AND Z)
        % dv es Z
        if i <= 16          % ronda 1
            f = (bv & cv) | (~bv & dv);
            ki = i - 1;
            sr = 1;
        elseif i <= 32      % ronda 2
            f = (bv & dv) | (cv & ~dv);
            ki = mod(5 * i - 4, 16);    %de 5 en 5 empezando en 1
            sr = 2;
        elseif i <= 48      % ronda 3
            f = xor(bv, xor(cv, dv));
            ki = mod(3 * i + 2, 16);    %de 3 en 3 empezando en 5
            sr = 3;
        else                % ronda 4
            f = xor(cv, bv | ~dv);
            ki = mod(7 * i - 7, 16);    %de 7 en 7 empezando en 0
            sr = 4;
        end
        % Convertimos f, DE VECTOR FILA DE BITS A ENTEROS DE 32-bit .
      
        f = mod(bin2dec(num2str(f)),m);
        
        % HACEMOS LA ROTACIONES
        sc = mod(i - 1, 4) + 1;
        sum = mod(a + f + mensaje(k + ki) + t(i), m);
        sum = dec2bin(sum, 32);
        sum = circshift(sum, [0, s(sr, sc)]);
        sum = bin2dec(sum);
        
        % ACTUALIZAMOS  a, b, c, d.
        a = d;
        d = c;
        c = b;
        b = mod(b+sum,m);     
    end
    
    % MODIFICAMOS EL HASH.
    fhash(1) = mod(a+fhash(1),m);
    fhash(2) = mod(b+fhash(2),m);
    fhash(3) = mod(c+fhash(3),m);
    fhash(4) = mod(d+fhash(4),m);
end

% CONVERTIMOS HASH DE ENTEROS DE 32 BITS, LITTLE ENDIAN, A BYTES .
fhash = dec2hex(fhash);

% Transforamos el hash para obtener la salida deseada.
aux = [];
for i = 1:4
    aux =[aux fhash(i,7:8) fhash(i,5:6) fhash(i,3:4) fhash(i,1:2)];
end

fprintf('Salida: ');
disp(aux);




