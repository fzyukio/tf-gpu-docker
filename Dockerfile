# Use an official Python runtime as a base image
FROM tensorflow/tensorflow:latest-gpu-py3

MAINTAINER Yukio Fukuzawa

ENV PYTHONUNBUFFERED 1

ARG uid=1000

ARG http_proxy=''
ARG https_proxy=''
ENV http_proxy=''
ENV https_proxy=''
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# backports needed to install ffmpeg
# RUN echo 'deb http://httpredir.debian.org/debian jessie-backports main non-free \n\
# deb-src http://httpredir.debian.org/debian jessie-backports main non-free' >> /etc/apt/sources.list

# Install extra packages.
# RUN add-apt-repository -y ppa:jonathonf/ffmpeg-4 && apt-get update && apt-get install -y --no-install-recommends git vim mysql-client libmysqlclient-dev ffmpeg python-psycopg2 libxml2-dev libxmlsec1-dev && rm -rf /var/lib/apt/lists/*
RUN rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python

COPY requirements.txt /

## Install any needed packages specified in requirements.txt
RUN pwd && ls -l / && pip install Cython numpy && pip install -r /requirements.txt --no-cache-dir

RUN python -m ipykernel.kernelspec

WORKDIR /code

COPY . .

ENTRYPOINT ["/bin/bash"]
CMD ["run_app.sh", "tensorflow"]
