#!/bin/bash

# PSQL-Kommando für Datenbankabfragen
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Funktion: Benutzerinformationen abrufen oder neuen Benutzer erstellen
GET_USER_INFO() {
  # Benutzername eingeben
  echo "Enter your username:"
  read USERNAME

  # Validierung des Benutzernamens (max. 22 Zeichen, keine Sonderzeichen)
  if [[ ! $USERNAME =~ ^[a-zA-Z0-9_]{1,22}$ ]]; 
  then
    echo "Invalid username. Please use only letters, numbers, or underscores, and keep it under 22 characters."
    exit 1
  fi

  # Benutzerinformationen aus der Datenbank abrufen
  USER_INFO=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

  if [[ -z $USER_INFO ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, best_game) VALUES('$USERNAME', 9999)")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    GAMES_PLAYED=0
    BEST_GAME=9999
  else
    # Korrektes Parsen der Rückgabe (Verwenden von IFS für die Trennung der Werte)
    IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
    USER_ID=$(echo $USER_ID | xargs)
    GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
    BEST_GAME=$(echo $BEST_GAME | xargs)

    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

# Funktion: Spiel initialisieren
INITIALIZE_GAME() {
  SECRET_NUMBER=$((RANDOM % 1000 + 1))
  NUMBER_OF_GUESSES=0
  NUMBER_OF_GUESSES=$(echo $NUMBER_OF_GUESSES | xargs)  # Trimmen von NUMBER_OF_GUESSES
  echo "Guess the secret number between 1 and 1000:"
}

# Funktion: Spiel starten
PLAY_GAME() {
  while true; do
    read GUESS
    ((NUMBER_OF_GUESSES++))

    # Überprüfen, ob die Eingabe ein Integer ist
    if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi

    # Hinweis geben, ob die Zahl höher oder niedriger ist
    if (( GUESS < SECRET_NUMBER )); then
      echo "It's higher than that, guess again:"
    elif (( GUESS > SECRET_NUMBER )); then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      break
    fi
  done
}



# Funktion: Spielstatistiken aktualisieren
UPDATE_STATISTICS() {
  if [[ -n $USER_ID ]];
  then
    NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
    $PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED WHERE user_id=$USER_ID"

    if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; 
    then
      $PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID"
    fi
  else
    echo "ERROR: USER_ID is not set. Cannot update statistics."
  fi
}

# Hauptprogramm
MAIN() {
  GET_USER_INFO
  INITIALIZE_GAME
  PLAY_GAME
  UPDATE_STATISTICS
}

# Programm starten
MAIN
