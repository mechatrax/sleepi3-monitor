#!/bin/bash

sleepi3ctl set measurement-interval 10
sleepi3ctl set restore-voltage $THRESHOLD
sleepi3ctl set uvlo 1
