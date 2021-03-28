#!/bin/bash
hexdump -v -e '1/1 "%02x\n"' zx81.rom >zx81.hex