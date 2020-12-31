function [cpubl,cpriv] = mochila_mh(s)
% Función que permite generar una clave privada y una pública a partir de
% una mochila supercreciente.
%   Parámetros:
%   - s (Entrada): Vector fila que representa la mochila supercreciente.
%   - cpubl (Salida): Mochila trampa.
%   - cpriv (Salida): Vector fila compuesto del módulo de trabajo y el
%   inverso de w módulo mu.

n = length(s);

% Si la mochila no es supercreciente, no se puede ejecutar el algoritmo.
if mochila(s) ~= 1
    cpubl = 0;
    cpriv = 0;
    return;
end

mu = 0;
suma = sum(s);
flag = 0;
w = 0;

% Buscamos un modulo de trabajo adecuado (Introducido por el usuario).
while (flag == 0)
    fprintf('Introduzca un número natural mayor que %d: ',suma);
    mu = input('');
    
    if mod(mu,1)~=0
        flag = 0;
        continue;
    end
    
    % Ahora buscamos w que sea adecuada, de manera aleatoria.
    correct = 0;
    while (correct == 0)
        w = randi([2 mu-2]);
        
        if gcd(w,mu) ~= 1 || factorescomunes(w,s) ~=0
            correct = 0;
        else
            correct = 1;
        end
    end
    
    break;
end

    % Por último generamos las claves públicas y privadas correspondientes.
    cpubl = mod(s*w,mu);
    cpriv = [mu, moduloInverso(w,mu)];
end

