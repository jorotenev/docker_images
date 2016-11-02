This repo holds the code for the image [jorotenev/python_base](https://hub.docker.com/r/jorotenev/python_base/)
# Build the image

* Launch vagrant  
`vagrant up`  
`vagrant ssh` to get in the VM
* [optional] Change `base/Dockerfile` or `base/base_requirements.txt`
* Build the image from the Dockerfile  
`docker build jorotenev/python_base:v1`  


# Example usage with docker-compose:
Once you have the image built, you can use it in your projects. Assuming you have docker-compose, here's a minimal example which will use the `python_base` image, attach the current dir to the container at a given path and run Flask.   
* ./Dockerfile  
```
FROM jorotenev/python_base:v1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app
```
* ./docker-compose.yaml  
```
web:
  build: .
  ports: 
    - "5000:5000"
  volumes:
    - .:/usr/src/app/
  command: python manage.py runserver

```


