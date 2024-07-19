########################
# Root CA
########################

## generate rootca private key
openssl genrsa  -out ./certs/cakey.pem 4096

## generate rootCA certificate
openssl req -new -x509 -days 3650 -key ./certs/cakey.pem -out ./certs/cacert.pem -subj "/C=AU/ST=NSW/O=KainiIndustries, Inc./CN=rootca.kainiindustries.net"

## Verify the rootCA certificate content and X.509 extensions
openssl x509 -noout -text -in ./certs/cacert.pem

########################
# Frontend
########################

# generate server private key
openssl genrsa -out ./certs/frontend.kainiindustries.net.key 4096

# generate CSR
openssl req -new -key ./certs/frontend.kainiindustries.net.key -out ./certs/frontend.kainiindustries.net.csr -config ./certs/frontend_cert.cnf

# check CSR
openssl req -noout -text -in ./certs/frontend.kainiindustries.net.csr | grep -A 1 "Subject Alternative Name"

# generate SAN certificate
openssl x509 -req -days 365 -in ./certs/frontend.kainiindustries.net.csr -CA ./certs/cacert.pem -CAkey ./certs/cakey.pem -CAcreateserial -out ./certs/frontend.kainiindustries.net.crt

cp ./certs/frontend.kainiindustries.net.crt ./certs/frontend.kainiindustries.net.cer

########################
# Backend
########################

# generate server private key
openssl genrsa -out ./certs/backend.kainiindustries.net.key 4096

# generate CSR
openssl req -new -key ./certs/backend.kainiindustries.net.key -out ./certs/backend.kainiindustries.net.csr -config ./certs/backend_cert.cnf

# check CSR
openssl req -noout -text -in ./certs/backend.kainiindustries.net.csr | grep -A 1 "Subject Alternative Name"

# generate SAN certificate
openssl x509 -req -days 365 -in ./certs/backend.kainiindustries.net.csr -CA ./certs/cacert.pem -CAkey ./certs/cakey.pem -CAcreateserial -out ./certs/backend.kainiindustries.net.crt

cp ./certs/backend.kainiindustries.net.crt ./certs/backend.kainiindustries.net.cer
