fprintf('\nIntroduzca los parámetros necesarios para generar las claves pública y privada de A\n');
[na, ea, da] = genero_clave_func();
fprintf('\nIntroduzca los parámetros necesarios para generar las claves pública y privada de B\n');
[nb, eb, db] = genero_clave_func();

fprintf('\n\nLa clave pública de A es (na,ea)=(%d,%d)',na,ea);
fprintf('\nLa clave privada de A es (na,da)=(%d,%d)',na,da);
fprintf('\nLa clave pública de B es (nb,eb)=(%d,%d)',nb,eb);
fprintf('\nLa clave privada de B es (nb,db)=(%d,%d)',nb,db);

mensaje = input('\n\nIntroduzca el mensaje que quiere enviar A (sin firma): ','s');
firma = input('\nIntroduca la firma de A: ','s');

mensajefirma = strcat(mensaje,firma);

fprintf('\n\nEl mensaje que A quiere enviar, junto con su firma es: mensaje = %s',mensajefirma);

fprintf('\n\nLos dos criptogramas que A envía a B son:\n');

cif_mens = cifro_rsa(eb,nb,mensajefirma)
firma_cifrado = cifro_rsa(da,na,firma);

%Función auxiliar, que concatena los elementos de firma_cifrado y los
%divide al tamaño de digitos(nb) - 1 para posteriormente cifrarlos
blo = convertir_vector(firma_cifrado,length(num2str(na)),length(num2str(nb))-1);

cif_firma_da_eb = cifro_rsa_num(eb,nb,blo)

fprintf('\n\nB comienza el descifrado');

mensajefirma_descifrado = descifro_rsa(db,nb,cif_mens);

fprintf('\n\nEl mensaje con la firma que recibe es: mensaje = %s',mensajefirma_descifrado);

firma_descifra = descifro_rsa_num(db,nb,cif_firma_da_eb);

%Función auxiliar, que concatena los elementos de firma_descifra y los
%divide al tamaño de digitos(na) para posteriormente descifrarlos
blo = convertir_vector(firma_descifra,length(num2str(nb))-1,length(num2str(na)));

firma_descifrada = descifro_rsa(ea,na,blo);

fprintf('\n\nB obtiene la firma y comprueba su autentificación: firma = %s\n', firma_descifrada);

