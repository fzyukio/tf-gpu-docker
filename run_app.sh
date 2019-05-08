#!/bin/bash

unset http_proxy
unset https_proxy

cd /code

jupyter notebook --allow-root --no-browser #--config jupyter_notebook_config.py
