#!/bin/bash
#
# this script rolls a pair of six-sided dice and displays both the rolls
#

# Task 1:
#  put the number of sides in a variable which is used as the range for the random number
numbersides=6
#  put the bias, or minimum value for the generated number in another variable
minbias=1
#  roll the dice using the variables for the range and bias i.e. RANDOM % range + bias

# Task 2:
#  generate the sum of the dice
#  generate the average of the dice

#  display a summary of what was rolled, and what the results of your arithmetic were

# Tell the user we have started processing
echo "Rolling..."
# roll the dice and save the results
die1=$(( RANDOM % numbersides + minbias))
die2=$(( RANDOM % numbersides + minbias))

# display the results
echo "Rolled $die1, $die2"
echo "Sum of dice is: $((die1+die2))"
echo "Average of dice is: $(((die1+die2)/2))"
