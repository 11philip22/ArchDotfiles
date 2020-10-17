#!/bin/bash

echo -e "info" | bluetoothctl | sed -nr '/Name: / s/.*Name: ([^"]+).*/\1/p'     

