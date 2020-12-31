g = input('Introduce el valor del primo: ');
p = input('Introduce el valor del generador: ');

fprintf('Nos ponemos de acuerdo en g = %d y p = %d\n',g,p);

if genera(g,p) ~= g
    disp('Parámetros incorrectos');
    return;
end

aleatorio_a = randi([2,p-2]);
fprintf('\nA genera un número aleatorio aa = %d entre 2 y %d\n',aleatorio_a,p-2);

pote_a = potencia(g,aleatorio_a,p);
fprintf('A envía a B: pote_a= mod (g^aa, p) = mod (%d ^%d, %d)=%d\n',g,aleatorio_a,p,pote_a);

fprintf('EL INTRUSO CAPTURA pote_a =%d, y lo guarda\n',pote_a);

aleatorio_c = randi([2,p-2]);
fprintf('EL INTRUSO GENERA cc = %d entre 2 y %d\n',aleatorio_c,p-2);

pote_c = potencia(g,aleatorio_c,p);
fprintf('EL INTRUSO ENVIA a B: pote_c= mod (g^c, p) = mod (%d ^%d, %d)=%d\n',g,aleatorio_c,p,pote_c);

fprintf('(B piensa que le llega de A)\n\n');

aleatorio_b = randi([2,p-2]);
fprintf('B genera un número aleatorio bb = %d entre 2 y %d\n',aleatorio_b,p-2);

pote_b = potencia(g,aleatorio_b,p);
fprintf('B envía a A: pote_b= mod (g^bb, p) = mod (%d ^%d, %d)=%d\n',g,aleatorio_b,p,pote_b);

fprintf('EL INTRUSO CAPTURA pote_b =%d, y lo guarda\n',pote_b);

fprintf('EL INTRUSO ENVIA a A el mismo dato que ha enviado a B: pote_c =%d\n',pote_c);

fprintf('(A piensa que le llega de B)\n\n');

fprintf('A y B calculan la clave con la que van a cifrar sus mensajes\n');

clave_a = potencia(pote_c,aleatorio_a,p);
fprintf('A obtiene clave= potencia (pote_c, aa, p) = potencia (%d, %d, %d) = %d\n',pote_c,aleatorio_a,p,clave_a);

clave_b = potencia(pote_c,aleatorio_b,p);
fprintf('B obtiene clave= potencia (pote_c, bb, p) = potencia (%d, %d, %d) = %d\n',pote_c,aleatorio_b,p,clave_b);

fprintf('\nEL INTRUSO CALCULA TAMBIÉN LAS CLAVES\n');
fprintf('Sabe que A cifrará con potencia (pote_a, cc, p)=%d\n',clave_a);
fprintf('Sabe que B cifrará con potencia (pote_b, cc,p)=%d\n',clave_b);

