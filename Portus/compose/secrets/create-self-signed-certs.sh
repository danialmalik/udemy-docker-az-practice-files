# Create key
openssl genrsa -des3 -out server.key 4096

# Create csr
openssl req -new -key server.key -out server.csr

# Save orig key
cp server.key server.key.org

# get pw-less key
openssl rsa -in server.key.org -out server.key

# Get cert
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

# Rename
mv server.crt portus.crt
mv server.key portus.key
