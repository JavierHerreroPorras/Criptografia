function [] = criptoanalisis_afin(v,m)
%Realiza el criptoanálisis de un mensaje cifrado v, con modulo m,
%comparando las frecuencias de aparición de las letras.
%   Parámetros:
%   - v (Entrada): Criptograma
%   - m (Entrada): Módulo de trabajo.

entrada = 1;
indice1=1;
indice2=indice1+1;
flag = 0;
comparo = barras(v);
while entrada == 1
    A = [comparo(indice1,2),1;comparo(indice2,2),1]
    invA = inv_modulo(A,m)
    C = [comparo(1,4);comparo(2,4)];
    cell = num2cell(mod(invA*C,m));
    [clave,d] = cell{:};
    fprintf("Clave = %d",clave);
    fprintf("\nD = %d",d);

    descifraafin = desafin(clave,d,v)
    entrada = input('Si quieres probar otra clave introduce 1, en caso contrario introduce 0: ');
    
    if flag == 0
       indice1=indice1+1;
       indice2 = indice1+1;
       
        if indice1 > 7
            indice1 = 1;
            indice2=indice1-1;
            flag=1;
        end
    end
    
    if flag == 1
       indice1 = indice1+1;
       indice2=indice2+1;
       
        if indice2 >7
            indice1 = 1;
            indice2=indice1+1;
            flag=0;
        end
    end
end
end

