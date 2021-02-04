#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also display the 12 largest regular files in the system, sorted by their sizes
# The listing should
#    only have the file name, owner, and size of the 12 largest files
#    show the size in human friendly format
#    be displayed after the listing of setuid files
#   should have its own title, similar to how the setuid files listing has a title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired
echo ""
echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 5
echo ""
echo "============================================================================================================================"
echo "Jaime Laguna filter:"
echo "Display only file name, owner, and size of 12 largest files which complies with the executable attribute in the entire disk"
echo "============================================================================================================================"
echo "File name                                        Owner   Size"
find / -type f -executable -perm -4000 -exec ls -lh {} + 2>/dev/null | sort -k 5 -h | tail -n 12 | awk '{print $9,":",$3,":",$5}'| column -t -s:
echo ""
# find / -type f -executable -perm -4000 -ls 2>/dev/null | sort -k 7 -n | tail -n 12 | awk '{print "File name:", $11,"     Owner:",$5,"     Size: ",$7}'
# for the task, add
# commands to display a title
# commands to make a list of the 12 biggest files
# sort/format whatever to display the list properly
