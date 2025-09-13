#!/bin/sh
# Start both scripts in the background and keep container alive
python3 app.py &
python3 forum.py &
wait
