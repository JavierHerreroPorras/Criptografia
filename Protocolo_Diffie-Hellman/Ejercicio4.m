g = input('Introduce el valor del primo: ');
p = input('Introduce el valor del generador: ');

fprintf('Nos ponemos de acuerdo en g = %d y p = %d\n',g,p);

if genera(g,p) ~= g
    disp('Parámetros incorrectos');
    return;
end

aleatorio_a = randi([2,p-2]);
fprintf('A genera un número aleatorio aa = %d entre 2 y %d\n',aleatorio_a,p-2);

pote_a = potencia(g,aleatorio_a,p);
fprintf('A envía a B: pote_a= mod (g^aa, p) = mod (%d ^%d, %d)=%d\n',g,aleatorio_a,p,pote_a);

aleatorio_b = randi([2,p-2]);
fprintf('B genera un número aleatorio bb = %d entre 2 y %d\n',aleatorio_b,p-2);

pote_b = potencia(g,aleatorio_b,p);
fprintf('B envía a A: pote_b= mod (g^bb, p) = mod (%d ^%d, %d)=%d\n',g,aleatorio_b,p,pote_b);

fprintf('A y B calculan la clave con la que van a cifrar sus mensajes\n');

clave_a = potencia(pote_b,aleatorio_a,p);
fprintf('A obtiene clave= potencia (pote_b, aa, p) = potencia (%d, %d, %d) = %d\n',pote_b,aleatorio_a,p,clave_a);

clave_b = potencia(pote_a,aleatorio_b,p);
fprintf('B obtiene clave= potencia (pote_a, bb, p) = potencia (%d, %d, %d) = %d\n',pote_a,aleatorio_b,p,clave_b);

