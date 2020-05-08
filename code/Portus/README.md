# Portus

Self-hosted docker registry.

### Installing Portus
1- Prepare HTTPs certs for hostname. I will using dockertools as hostname (add it to hosts file).
```
cd compose/secrets
./create-self-signed-certs.sh
```

2- Source env file
```
cd ..
source .env
```

3- Start the container

```
docker-compose up
```

Now access the Portus on dockertools.com

**Note** If after doing all the steps above, accessing dockertools.com results in empty response err, try typing the whole URL (including https://) in browser. i.e.
```
https://dockertools.com
```
If you see the error that the connection is not private and do not see an option to proceed, type text "thisisunsafe" anywhere (like a cheatcode) and now you can access the site.

**Note** To enable unsafe access to the site on **MacOS**,
1. open keychain access tool
2. File > Import Items
3. Import protus.crt file we created earlier.
4. Now go to certificates section and search for dockertools.com
5. Open the certificate options and go to Trust section.
6. Set trust setting to always trust.

Now try to access the https://dockertools.com, there should be option to proceed.


### Things we can do with protus
1. login
```
docker login dockertools.com
```

2. Push a hello world app
```
docker pull hello-world
docker tag hello-world:latest dockertools.com/admin/hello
docker push dockertools.com/admin/hello
```
