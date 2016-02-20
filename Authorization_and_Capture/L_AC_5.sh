#!/bin/bash
export license_id=`cat .license_id`
TESTID=$(basename $0 .sh)
curl  --tlsv1.2 https://apis.cert.vantiv.com/payment/sp2/credit/v1/authorization \
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
          "ReferenceNumber": "5",
          "TransactionAmount": "101.00",
          "OrderSource": "3dsAuthenticated",
          "CustomerID": "345",
          "PartialApprovedFlag": "false"
     },
     "Application": {
          "ApplicationID": "4306abfcc9a56e42df996a965" 
     },
     "Card": { 
          "Type": "VI",
          "CardNumber": "4100200300011001",
          "ExpirationMonth": "05",
          "ExpirationYear": "16",
          "CVV": "463"
     },
     "CardholderAuthentication": {
          "AuthenticationValue": "BwABBJQ1AgAAAAAgJDUCAAAAAAA="
     },
     "Address": {
          "BillingName": "John & Mary Smith",
          "BillingAddress1": "1 Main St.",
          "BillingCity": "Burlington",
          "BillingState": "MA",
          "BillingZipcode": "01803-3747",
          "BillingCountry": "US"
     }
 }' > ${TESTID}.out
/bin/cat ${TESTID}.out
RESPONSE=$(/bin/cat ${TESTID}.out | sed 's/,/\n/g' | grep RequestID | sed 's/\}//' | sed 's/\"//g' | awk -F ':' '{ print $2 }')
echo $RESPONSE>${TESTID}.response
TRANSACTION=$(/bin/cat ${TESTID}.out | sed 's/,/\n/g' | grep Transaction | sed 's/\}//' |  sed 's/\}//' | sed 's/\"//g' | awk -F ':' '{ print $2 }')
echo $TRANSACTION>${TESTID}.transaction
echo -n "${TESTID}," >> results.txt
echo $RESPONSE >> results.txt
#/bin/cat ${TESTID}.out | sed 's/,/\n/g' | grep RequestID | sed 's/\}//' | sed 's/\"//g' | awk -F ':' '{ print $2 }' >> results.txt
