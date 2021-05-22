#!/bin/sh
bert-serving-start -http_port 8125 -cpu -num_worker=1 -model_dir /app/ -cpu


