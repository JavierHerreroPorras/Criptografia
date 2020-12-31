% El programa debe pedir al usuario los valores de los primos p y q
% y generar las claves públicas y privadas necesarias para cifrar con RSA.

primos = [2	3 5 7 11 13	17 19 23 29	31 37 41 43	47 53 59	61	67	71	73	79	83	89 97 101 103 107 109 113 127	131 137	139	149	151	157	163	167	173 179	181	191	193	197	199	211	223 227	229	233	239	241	251	257	263 269	271	277	281	283	297	307	311 313	317	331	337	347	349	353	359 367	373	379	383	389	397	401	409 419	421	431	433	439	443	439	457 461	463	467	479	487	491	499	503 509	521	523	541	547	557	563	569 571	577	587	593	599	601	607	613 617	619	531	641	643	647	656	659 661	679	677	683	691	701	709	719 727	733	739	743	751	757	761	769 773	787	797	809	811	821	823	827 829	839	853	857	859	863	877	881 883	887	907	911	919	929	937	941 947	953	967	971	977	983	991	997];

flag = 0;

while flag == 0
    resp = input('¿Desea mostrar un listado de numeros primos (1 a 2000)? (Si/No): ','s');
    disp(resp);

    if strcmp('Si',resp) == 1
        disp(primos);
        flag = 1;
    elseif strcmp('No',resp) == 1
        flag = 1;
    else
        disp('Opción incorrecta');
    end
end
    

p = input('Introduzca el valor del primo p: ');
q = input('Introduzca el valor del primo q: ');

if mod(p,1)~=0 || mod(q,1)~=0 || isprime(p) == 0 || isprime(q) == 0
    disp('Los números introducidos deben ser enteros y primos');
    return
end

n = uint64(p*q);

fprintf('\nEl valor de n, que formará parte de las claves es n = %d',n);

fiden = int64((p-1)*(q-1));

fprintf('\nEstamos buscando un número e, que forma parte de la clave privada y que debe cumplir que gcd(e,fiden) = gcd(e,p·q) = gcd(e,%d) = 1',fiden);

flag = 0;

while flag == 0
    if(fiden > 65537)
        e = 65537;
        flag = 1;
   
    else
        fprintf('\nPor favor introduzca un número menor que %d tal que MCD(e,p-1)) = MCD(e,q-1) = 1\n',fiden);
        e = input('');
        if(e < fiden && gcd(e,1) == 1 && gcd(e,p-1) == 1 && gcd(e,q-1) == 1)
            flag = 1;
        end
    end
end

fprintf('\nPara ello hemos seleccionado %d',e);

fprintf('\nAhora buscamos un número d que sea el inverso de e = %d mod fiden = %d',e,fiden);

[~,d,~] = gcd(e,fiden);
d = mod(d,fiden);

fprintf('\nSeleccionamos el numero d = %d\n',d);

fprintf('\nLa clave privada sería (n,d) = (%d, %d)',n,d);
fprintf('\nLa clave pública sería (n,e) = (%d, %d)\n',n,e);
