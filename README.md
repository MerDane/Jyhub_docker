
**[Info.](#info)** |
**[Usage](#usage)** |
**[TODO](#todo)** |
**[Other](#other)** |

# **jupyterhub:KerasGPU**

# Info

This repo is aimed to create docker images for using jupyterhub on the base of Keras-gpu.

## Includes

* Ubuntu 16.04
* Python packages:
  * Keras 2.0.8
  * tensorflow-gpu 1.3.0
  * pandas
* JupyterHub
* nvidia/cuda:9.0-cudnn7

# Usage

* Docker (not Supported)

```docker
#docker run -p 8000:8000 --rm jupyterhub:TebsorflowGPU jupyterhub
```

* nvidia-docker (tested)

```docker
nvidia-docker -p 8000:8000 --rm jupyterhub:TebsorflowGPU jupyterhub
```

* GPU confirmation

  ```py
  import tensorflow as tf

  config = tf.ConfigProto()
  config.gpu_options.allow_growth = True
  sess = tf.Session(config=config)

  ```

# TODO

* Create conda env. based jupyter kernels
* others

# Other

```docker

LABEL org.jupyter.service="jupyterhub" \
      multi.label1="XXXX Ltd." \
      multi.label2="TRU" \
      other="GPU"

```


Just some informations for built images