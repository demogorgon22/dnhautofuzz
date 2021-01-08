#!/bin/bash
cd $DNH_DIR/
gdb -x /app/gdbconfig  --args $DNH_GAME
