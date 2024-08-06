#!/bin/bash

# connect to db
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check if script runs with arg
if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Check if it is atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE properties.atomic_number = '$1'")
  else
    # Check if it is symbol or name
    ATOMIC_NUMBER=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE elements.symbol = '$1'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT properties.atomic_number FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE elements.name = '$1'")
    fi
  fi
  
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    SYMBOL=$($PSQL "SELECT elements.symbol FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE elements.atomic_number = '$ATOMIC_NUMBER'")
    NAME=$($PSQL "SELECT elements.name FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number WHERE elements.atomic_number = '$ATOMIC_NUMBER'")
    PROPERTIES=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
    echo $PROPERTIES | sed 's/|/ /g' | while read TYPE ATOMIC_MASS MELTING_POINT_C BOILING_POINT_C
    do
    : '
    TYPE=$($PSQL "SELECT type FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
    MELTING_POINT_C=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
    BOILING_POINT_C=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number = '$ATOMIC_NUMBER'")
    '
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_C celsius and a boiling point of $BOILING_POINT_C celsius."
    done
  fi
fi
