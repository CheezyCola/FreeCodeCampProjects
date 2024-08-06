#!/bin/bash
# connect to db
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

: '
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo "Welcome to My Salon, how can I help you?"
  echo -e "\n1. Make an appointment \n2. Exit"
  read MENU_SELECTION

  case $MENU_SELECTION in
    1)
      DISPLAY_SERVICES
      MAKE_APPOINTMENT
      ;;
    2)
      EXIT
      ;;
    *)
      MAIN_MENU "Please enter a valid option."
    ;;
  esac
}
'

DISPLAY_SERVICES(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # display services
  echo -e "\nHere are the services we have available:"
  echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
}

MAKE_APPOINTMENT(){
  DISPLAY_SERVICES
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  # check if service exists
  if [[ -z  $SERVICE_NAME ]]
  then
    # Display service again
    DISPLAY_SERVICES "Invalid input for a service. Try Again."
  else
    # get phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    # Check if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then 
      # get new customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    # insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    # return to main menu
    echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi
}

EXIT(){
  echo -e "\nThank you for your time.\n"
}

MAKE_APPOINTMENT
