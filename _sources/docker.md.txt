# Use Mirte with Docker

## Download docker image
You can download the docker image directly from github

```Bash
docker pull ghcr.io/kas-lab/mirte_playground:main
```

## Build docker image

If you prefer, you can build the image yourself instead.

Build:
```Bash
mkdir -p ~/mirte_ws/src
cd ~/mirte_ws/src
git clone https://github.com/kas-lab/mirte_playground.git
docker build -t mirte .
```

## Run docker image

Allow container to use the host machine display
```Bash
xhost +
```

**Note:** If you built the image yourself, replace `ghcr.io/kas-lab/mirte_playground:main` with `mirte`

Run container without GPU support:
```Bash
docker run -it --rm --name mirte -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro -v $HOME/mirte_ws/src/mirte_playground:/home/ubuntu-user/mirte_ws/src/mirte_playground --network host ghcr.io/kas-lab/mirte_playground:main
```

Run container with nvidia support (for this to work, first you need to install [nvidia-docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)):
```Bash
docker run -it --rm --gpus all --runtime=nvidia --name mirte -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -v /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/localtime:/etc/localtime:ro -v $HOME/mirte_ws/src/mirte_playground:/home/ubuntu-user/mirte_ws/src/mirte_playground --network host ghcr.io/kas-lab/mirte_playground:main
```