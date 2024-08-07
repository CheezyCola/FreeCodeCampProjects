#!/bin/bash

# connect to db
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~ Number Guessing Game ~~\n"

echo "Enter your username:"
read USERNAME

# get player_id from db
PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")

# check if user exists in db
if [[ -z $PLAYER_ID ]]
then
  # new user
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # get game play history
  GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM game_play_history WHERE player_id = $PLAYER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guess) FROM game_play_history WHERE player_id = $PLAYER_ID")
  echo -e "\nWelcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate secret number between 1 and 1000
SECRET_NUM=$((RANDOM % 999 +1))
echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_GUESS=0
GUESS=0

while [[ $GUESS -ne $SECRET_NUM ]]
do
  read GUESS
  # check if it is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  else
    # check guess
    if [[ $GUESS -lt $SECRET_NUM ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $GUESS -gt $SECRET_NUM ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    fi
    (( NUMBER_OF_GUESS ++ ))
  fi
done
# Guess Successfully
echo -e "\nYou guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET_NUM. Nice job!"
# Insert player and game play
# get player_id from db
if [[ -z $PLAYER_ID ]]
then
  INSERT_PLAYER_RESULT=$($PSQL "INSERT INTO players(name) VALUES('$USERNAME')")
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE name = '$USERNAME'")
fi
INSERT_GAME_PLAY_RESULT=$($PSQL "INSERT INTO game_play_history(player_id, number_of_guess) VALUES($PLAYER_ID, $NUMBER_OF_GUESS)")
