:
openssl genrsa -aes128 -out arena.key 2048
openssl req -new -days 365 -key arena.key -out arena.csr
openssl x509 -in arena.csr -out arena.crt -req -signkey arena.key -days 365
openssl pkcs12 -export -out arena.pfx -inkey arena.key -in arena.crt

