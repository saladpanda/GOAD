#!/bin/bash

source ./fix-winrm-source-me.sh
vagrant snapshot restore --no-start --no-provision initial
