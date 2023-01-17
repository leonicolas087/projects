#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #get teams_id
  if [[ $WINNER != "winner" ]]
  then
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $TEAM_ID ]]
    then
      INSERT_TEAM_1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_1 == "INSERT 0 1" ]]
      then
        echo Inserted into team, $WINNER
      fi
    fi
  fi  
  if [[ $OPPONENT != "opponent" ]]
  then
    TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $TEAM_ID2 ]]
    then
      INSERT_TEAM_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_2 == "INSERT 0 1" ]]
      then
        echo Inserted into team, $OPPONENT
      fi
    fi   
  fi
done
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  TEAM_ID2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $TEAM_ID, $TEAM_ID2 )")
  if [[ $INSERT_GAMES == "INSERT 0 1" ]]
  then
    echo Inserted into games, $ROUND
  fi
done
