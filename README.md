This repo holds the code for the image [jorotenev/python_base](https://hub.docker.com/r/jorotenev/python_base/)  

To use in your project, change `jorotenev/python_base` to your Docker hub repository.


* Launch vagrant via  
`vagrant up`  
`vagrant ssh` to get in the VM
* To build a new image, either change `base/Dockerfile` or `base/base_requirements.txt`  
* Then do  
`docker build jorotenev/python_base:v1`  (tag the image with something else than `v1` if appropriate)
* Push to Docker hub  
`docker push jorotenev/pyhton_base`  
You might need to authenticate via `docker login` first.