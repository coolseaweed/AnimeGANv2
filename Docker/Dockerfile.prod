FROM tensorflow/tensorflow:1.15.0-gpu-py3

MAINTAINER tom jeellato@gmail.com

# ENV params.
ENV LANG=C.UTF-8
ENV TZ=Asia/Seoul
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Set default shell to /bin/bash
SHELL ["/bin/bash", "-cu"]


RUN apt-get update && \ 
	apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
		cmake \ 
		make \
		g++-7 \
		git \
		curl \
		vim \ 
		wget \
		ca-certificates \
		tzdata \
		bzip2 \
        htop \
		iftop \
		net-tools \
		iputils-ping \
		libgl1-mesa-glx


# Install dependency
RUN pip install tqdm opencv-python


WORKDIR /workspace