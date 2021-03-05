#!/bin/bash

source "/etc/sheep/hydrant.sh"

sudo java -jar "/etc/sheep/sheepit.jar" -ui text -compute-method CPU -login "$TAIL_USERNAME" -password "$TAIL_PASSWORD"