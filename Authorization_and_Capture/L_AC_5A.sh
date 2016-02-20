#!/bin/bash
export license_id=`cat .license_id`
TESTID=$(basename $0 .sh)
L_AC_5=`cat ./L_AC_5.transaction`
curl  --tlsv1.2 https://apis.cert.vantiv.com/payment/sp2/credit/v1/authorizationCompletion \
-H "Content-Type: application/json" \
-H "Authorization: VANTIV license=\"${license_id}\"" \
-d \
'{
    "Credentials": {
          "AcceptorID": "1147003"
     },
     "Reports": {
          "ReportGroup": "1243"
     },
     "Transaction": {
          "TransactionID": "'${L_AC_5}'",
          "TransactionAmount": "10.00",
          "CustomerID": "345"
     },
     "Application": {
          "ApplicationID": "4306abfcc9a56e42df996a965" 
     }
 }' > ${TESTID}.out
/bin/cat ${TESTID}.out
RESPONSE=$(/bin/cat ${TESTID}.out | sed 's/,/\n/g' | grep RequestID | sed 's/\}//' | sed 's/\"//g' | awk -F ':' '{ print $2 }')
echo $RESPONSE>${TESTID}.response
TRANSACTION=$(/bin/cat ${TESTID}.out | sed 's/,/\n/g' | grep Transaction | sed 's/\}//' |  sed 's/\}//' | sed 's/\"//g' | awk -F ':' '{ print $2 }')
echo $TRANSACTION>${TESTID}.transaction
echo -n "${TESTID}," >> results.txt
echo $RESPONSE >> results.txt
