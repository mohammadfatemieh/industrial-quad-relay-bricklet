#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Industrial Quad Relay Bricklet

# Turn relays alternating on/off 10 times with 100 ms delay
for i in 0 1 2 3 4 5 6 7 8 9; do
	sleep 0.1
	tinkerforge call industrial-quad-relay-bricklet $uid set-value 1 # 1 << 0 = 1
	sleep 0.1
	tinkerforge call industrial-quad-relay-bricklet $uid set-value 2 # 1 << 1 = 2
	sleep 0.1
	tinkerforge call industrial-quad-relay-bricklet $uid set-value 4 # 1 << 2 = 4
	sleep 0.1
	tinkerforge call industrial-quad-relay-bricklet $uid set-value 8 # 1 << 3 = 8
done
