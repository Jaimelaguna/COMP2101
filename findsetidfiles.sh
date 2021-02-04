#!/bin/bash

echo "============================================================================================================================"
echo "Jaime Laguna filter:"
echo "Display only file name, owner, and size of 12 largest files which complies with the executable attribute in the entire disk"
echo "============================================================================================================================"
echo "File name                                                  Owner       Size"
find / -type f -exec ls -lh {} + 2>/dev/null | sort -k 5 -h | tail -n 12 | awk '{print $9,":",$4,":",$5}'| column -t
echo ""
