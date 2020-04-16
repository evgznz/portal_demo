#!/bin/bash
sudo curl -X PUT --data-binary @unit.conf --unix-socket /var/run/control.unit.sock http://localhost/config

