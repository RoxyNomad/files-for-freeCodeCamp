#!/bin/bash

# Set PSQL variable for querying the database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Query the database
if [[ $1 =~ ^[0-9]+$ ]]; then
  # If the input is a number, query by atomic_number
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
                  FROM elements e 
                  JOIN properties p ON e.atomic_number = p.atomic_number 
                  JOIN types t ON p.type_id = t.type_id 
                  WHERE e.atomic_number = $1")
else
  # If the input is not a number, query by symbol or name
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
                  FROM elements e 
                  JOIN properties p ON e.atomic_number = p.atomic_number 
                  JOIN types t ON p.type_id = t.type_id 
                  WHERE e.symbol = '$1' OR e.name = '$1'")
fi

# Check if the query returned a result
if [[ -z $RESULT ]]; then
  echo "I could not find that element in the database."
else
  # Parse the result and format the output
  echo "$RESULT" | while IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING; do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
fi
