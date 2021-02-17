#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
day=$(date +%A)
USER=Jaime
hostname=$(hostname)

###############
# Main        #
###############
case $day in
Monday)
message="everybody is working for the weekend"
;;
Tuesday)
message="good day to start to work"
;;
Wednesday)
message="is the halfway to the weekend"
;;
Thursday)
message="dont worry tomorrow is Friday"
;;
Friday)
message="Thanks God is Friday"
;;
Saturday)
message="Good day to watch a movie"
;;
Sunday)
message="Relax and just relax"
;;
esac
MYVARIABLE="Today is $day at $(date +%r) Welcome to planet $hostname $message $USER!"
cowsay $MYVARIABLE
