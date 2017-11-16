
**[Info.](#info)** |
**[Usage](#usage)** |


# **jupyterhub:KerasGPU**

# Info
This repo is aimed to create docker images for using jupyterhub on the base of Keras-gpu.

## Includes

* Ubuntu 16.04
* Python packages:
  * Keras 2.0.8
  * tensorflow-gpu 1.3.0
  * pandas
  * others
* JupyterHub

# Usage

* Docker(tested)

```docker
docker run -p 8000:8000 --rm jupyterhub:KerasGPU jupyterhub
```

* nvidia-docker(tested on version 2)

```docker
nvidia-docker -p 8000:8000 --rm jupyterhub:KerasGPU jupyterhub
```

#TODO

* Create conda env. based jupyter kernels
* others