#!/bin/bash
export license_id=`cat ../.license_id`
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
          "ReferenceNumber": "4",
          "TransactionAmount": "0.00",
          "OrderSource": "ecommerce",
          "CustomerID": "345",
          "PartialApprovedFlag": "false"
        },
     "Application": {
          "ApplicationID": "4306abfcc9a56e42df996a965" 
     },
     "Card": {
          "Type": "AX",
          "CardNumber": "375001000000005",
          "ExpirationMonth": "04",
          "ExpirationYear": "16"
        },
        "Address": {
          "BillingName": "Bob Black",
          "BillingAddress1": "4 Main St.",
          "BillingCity": "Laurel",
          "BillingState": "MD",
          "BillingZipcode": "20708",
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
