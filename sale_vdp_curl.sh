curl  --tlsv1.2 https://apis.cert.vantiv.com/payment/sp2/credit/v1/authorization \
-H "Content-Type: application/json" \
-H 'Authorization: VANTIV license="44a5315e7221440f918cb81619f21787$$#$$9l0GxE9NIu5h8FJUwka3Hw9MGElABGjG$$#$$2016-12-11$$#$$cert_key$$#$$SHA512withRSA$$#$$RSA$$#$$1$$#$$598D0B1DD4371C205F8935B172F438612861E3B9390222EA61FEC510FAA43E83C63BFCF2F7646DF89A24B830782365F183339783758DAD7847ED6C0E5DBF9FE5D414CF70E8A12226369EBFE7FF54666CEE4E1FCB9F94621852C57B91C8A2159790BB1552C1674168ABE3D19192E39DD4DD8E2D52F0AE823D3BC98FFF36CDD381A5A49A5B52B248FE1C4054C8CDE185176F0E915AB4B1870A1A8138F22F7BDDBECE02B6827BCE3637AE0ACBBF96E306DF8386519AA2042D7ACF320B0F3AA168C91B34AC3C1BB9EF004AA402428F5C858AE41C4F197C9FF5F4082064F80A4EA5E387807779B07C6A494F0A5D534DE40788CEC52CD0A33868A0E2E920BCE0652E0D"' \
-d \
'{
  "Credentials": {
    "AcceptorID": "1147003"
  },
  "Reports": {
    "ReportGroup": "1243"
  },
  "Transaction": {
    "ReferenceNumber": "1",
    "TransactionAmount": "101.00",
    "OrderSource": "ecommerce",
    "CustomerID": "345",
    "PartialApprovedFlag": "false"
  },
  "Application": {
    "ApplicationID": "80b119eed999e774b13cb3c5c"
  },
  "Card": {
    "Type": "VI",
    "CardNumber": "4457010000000009",
    "ExpirationMonth": "01",
    "ExpirationYear": "16",
    "CVV": "349"
  },
  "Address": {
    "BillingName": "John & Mary Smith",
    "BillingAddress1": "1 Main St.",
    "BillingCity": "Burlington",
    "BillingState": "MA",
    "BillingZipcode": "01803-3747",
    "BillingCountry": "US"
  }
}'

