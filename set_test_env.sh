#!/bin/bash

# Don't let the device overheat and throttle
export WATCHDOG_SENSOR=cpu.temp,gpu.temp,sys.temp,hdd.temp
export WATCHDOG_SENSOR_THRESHOLD=85
# If it's not returning to lower temps, continue after this many min
export WATCHDOG_MAXIMUM_WAIT=3
