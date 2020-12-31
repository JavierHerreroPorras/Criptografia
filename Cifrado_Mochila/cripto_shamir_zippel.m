function [s] = cripto_shamir_zippel(cpubl,mu)
% Función que permita al usuario (receptor) descifrar un mensaje cifrado con su clave pública asociada.
%   Parámetros:
%   - cpubl (Entrada): Vector fila que representa la mochila trampa.
%   - mu (Entrada): Entero que representa el módulo de trabajo.
%   - s (Salida): Mochila supercreciente asociada, o 0 si las entradas no son correctas.


respuesta = 1;
%Calculamos el inverso de b2 y posteriormente q, para obtener los
%candidatos
[~,b2inv,~] = gcd(cpubl(2),mu);
q = mod(cpubl(1)*b2inv,mu);

n = length(cpubl);

% Obtenemos los rangos de los candidatos
rango_inferior = 1;
rango_superior = 2^(n+1);

while(respuesta ==1)
    candidatos = sort(mod(q*rango_inferior:q:rango_superior*q,mu));

    fprintf('\nVamos a buscar en el rango de valores: [%d, %d]\n',rango_inferior,rango_superior);
    fprintf('Espera respuesta del ordenador...\n');
    tic

    % Una vez tenemos los candidatos ordenados, averiguamos w mediante el
    % inverso del menor candidato
    for i=1:length(candidatos)
       [~,a1inv,~] = gcd(candidatos(i),mu);
       w = mod(cpubl(1)*a1inv,mu);  

       % Si obtenemos w = 0, no habrá una mochila supercreciente.
       if w ~= 0
          [~,Cinv,~] = gcd(w,mu);
           winv = mod(Cinv,mu);

           s = mod(winv*cpubl,mu);

           % Si obtenemos una mochila supercreciente, el algoritmo termina.
           if(mochila(s) == 1)
               toc
               fprintf('¡Hemos encontrado la mochila supercreciente!\n');
               return;
           end
       end
    end
    
    toc
    
    % Si no se encuentra una mochila supercreciente se pregunta al usuario,
    % y se cambia de rango de candidatos.
    fprintf('No he encontrado la mochila, si quieres ampliar el rango, responde 1: ');
    respuesta = input('');

    rango_inferior = rango_superior+1;
    rango_superior = 2*rango_superior;
end

s = 0;

end

