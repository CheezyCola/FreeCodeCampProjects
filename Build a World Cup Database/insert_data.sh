#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate table
TRUNCATE_RES=$($PSQL "TRUNCATE teams, games RESTART IDENTITY")
if [[ $TRUNCATE_RES == "TRUNCATE TABLE" ]]
then
  echo -e "Tables Truncated!\n"
fi

# Loop to add teams to db teams and details to db games
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPOGOALS
do
  # Check if not header
  if [[ $YEAR != "year" ]]
  then
    # Check if the winner exists in the teams table
    WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    # if not found
    if [[ -z $WIN_TEAM_ID ]]
    then
      # insert winner into teams
      INSERT_WIN_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WIN_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "$WINNER added to teams!"
      fi
      # get new team_id
      WIN_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    # Check if the opponent exists in the teams table
    OPPO_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    # if not found
    if [[ -z $OPPO_TEAM_ID ]]
    then
      # insert opponent into teams
      INSERT_OPPO_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPO_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "$OPPONENT added to teams!"
      fi
      # get new team_id
      OPPO_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

    # insert details to games
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_TEAM_ID, $OPPO_TEAM_ID, $WINNERGOALS ,$OPPOGOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
      echo "Details added to game!"
    fi
    
  fi
done
