## Setup the first time 

First make a copy of .env.default:
```
cp .env.default .env
```

Now change the values as necessary:

```
# The raw password here is `abc123456`
# Make sure you change it, use 'jupyter notebook password' to generate one
password="sha1:ddbdd637cc15:169ab8f6cdfd3742421ccdfcf6e5621b4fa66760"

# Bind this to your LAN IP address
# If you want to access it locally, change to 127.0.0.1 or 'localhost'
# To access it from LAN, keep it at 0.0.0.0
# To access it from the internet, change it to your IP address
ip=0.0.0.0

# No need to change this unless you have good reasons to do so
notebook_port=8888

# This is the port you can access your notebook externally
# e.g. http://my-computer:8080/
external_port=8080

# Notebooks created in the 'notebooks' folder will be stored here.
# If you create notebooks outside of this folder, they will only be stored
# in the docker container, and you'll lose them once the container restarts
notebook_dir=/code/notebooks

# If your computer has CUDA installed, change it to 'nvidia'
# Otherwise 'runc' will use CPU only
runtime=runc
```

## Create an external network 
In case you need to run multiple internet-accessible docker containers,
all networks shall be bound to one nginx-server only. That's why the nginx-server containers
is separated from the main docker-compose

Do this once after starting up your computer:
```
cd nginx-server
docker-compose up -d
cd ../
```

You don't need to run this again while making changes to the main docker-compose

## Run the goddamn thing
```
docker-compose down -v && docker-compose build && docker-compose up -d
```

## Licence
MIT