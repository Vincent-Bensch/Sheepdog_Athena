#!/bin/bash

source "/etc/sheep/hydrant.sh"

sudo java -jar "/etc/sheep/sheepit.jar" -ui text -compute-method CPU_GPU -gpu CUDA_0 -rendertime 60 -login "$TAIL_USERNAME" -password "$TAIL_PASSWORD"