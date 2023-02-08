#! /bin/bash

PSQL="psql --username=postgres --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MENU() {
  $PSQL "SELECT * FROM services ORDER BY service_id" | sed 's/|/) /'
  read SERVICE_ID_SELECTED
  SERVICE_ID=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MENU
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_NEW_CLIENT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      $INSERT_NEW_CLIENT
      echo -e "\nWhat time would you like your $SERVICE_ID, $CUSTOMER_NAME?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
      INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME','$CUSTOMER_ID',$SERVICE_ID_SELECTED)")
      $INSERT_NEW_APPOINTMENT
      echo -e "\nI have put you down for a $SERVICE_ID at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nWhat time would you like your $SERVICE_ID, $CUSTOMER_NAME?"
      read SERVICE_TIME
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
      INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME','$CUSTOMER_ID',$SERVICE_ID_SELECTED)")
      $INSERT_NEW_APPOINTMENT
      echo -e "\nI have put you down for a $SERVICE_ID at $SERVICE_TIME, $CUSTOMER_NAME."
    fi  
  fi 
}
MENU
