function [pote] = potencia(c,d,n)
%Funci�n que usa el algoritmo de potenciaci�n r�pida para calcular las potencias modulares.
%   Par�metros:
%   - c (Entrada): base de la potencia. Un n�mero natural.
%   - d (Entrada): exponente de la potencia. Un n�mero natural.
%   - n (Entrada): m�dulo de trabajo. Un n�mero natural.
%   - pote (Salida): Potencia c^d modulo n.

if mod(c,1)~=0 || mod(d,1)~=0 || mod(n,1)~=0 || c < 0 || d <= 0 || n <= 0
    disp('Todos los parametros deben ser numeros naturales');
    pote = 0;
    return;
end

% Pasar los par�metros a uint64
c = uint64(c);
d = uint64(d);
n = uint64(n);

pote = 1;

% Paso el exponente a binario y lo invierto
aux = dec2bin(d);
aux = fliplr(aux);

potencias = zeros(1,length(aux));

% Calculo las potencias sucesivas
potencias(1) = mod(c,n);
for i = 2:length(aux)
    anterior = mod(potencias(i-1),n);
    potencias(i) = mod(anterior*anterior,n);
end

% Calculo la potencia final multiplicando por las potencias sucesivas si el valor del exponente binario es 1 
for i = 1:length(aux)
    if aux(i) == '1'
        pote = mod(pote * potencias(i),n);
    end
end

