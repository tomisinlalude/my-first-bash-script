#!/bin/bash

# STANDUP REMINDER
# Set email destination
TO_array=("tosinamuda@gmail.com" "amarachi.anyim00@gmail.com" "dammierezseriki@gmail.com" "oluwatomisinlalude@gmail.com")

# Declare array
declare -a email_array

email_array=("It's first sprint so no standup" "Stand up time! Don't stand your team mates up" "Relax, it's the weekend" )

# Assign full date to a variable

current_day=$(date|awk '{print $1}')

# Check for the day of the week
# Print and send email

for email in ${TO_array[@]}
do

if [ $current_day = "Mon" ]

then
    echo ${email_array[0]}
    echo "Subject: Cloud School (The Explorers) Standup"|sendmail $TO_array
elif [ $current_day = "Sat" ] || [ $current_day = "Sun" ]
then
    echo ${email_array[2]}
    echo "Subject: Cloud School (The Explorers) Standup"|sendmail $TO_array
else
    echo ${email_array[1]}
    echo "Subject: Cloud School (The Explorers) Standup"|sendmail $TO_array
fi

done