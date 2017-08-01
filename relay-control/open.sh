#!/bin/bash

echo 23 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio23/direction
echo 0 > /sys/class/gpio/gpio23/value

ping -c 2 localhost

echo 23 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio23/direction
echo 1 > /sys/class/gpio/gpio23/value

