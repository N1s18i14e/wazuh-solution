#!/bin/bash
LOCAL=$(dirname $0)
cd $LOCAL
cd ../

read INPUT_JSON
SRCIP=$(echo $INPUT_JSON | grep -oP '"srcip":"\K[^"]+')

if [ -z "$SRCIP" ]; then
  echo "$(date) Erreur: pas d'IP source trouvée" >> /var/ossec/logs/active-responses.log
  exit 1
fi

PIDS=$(ss -tnp | grep "$SRCIP" | grep -oP 'pid=\K[0-9]+')

if [ -z "$PIDS" ]; then
  echo "$(date) Aucune session active trouvée pour $SRCIP" >> /var/ossec/logs/active-responses.log
  exit 0
fi

for PID in $PIDS; do
  kill -9 $PID
  echo "$(date) Session SSH tuée (PID $PID) pour IP $SRCIP" >> /var/ossec/logs/active-responses.log
done

exit 0
