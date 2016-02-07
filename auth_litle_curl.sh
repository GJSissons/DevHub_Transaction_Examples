curl  --tlsv1.2 https://www.testlitle.com/sandbox/communicator/online \
-H "Content-Type: text/xml" \
-d \
'<litleOnlineRequest version="9.4" xmlns="http://www.litle.com/schema" merchantId="default">
    <authentication>
        <user>MyTestStore</user>
        <password>MyPa$$word</password>
    </authentication>
    <authorization id="auth-id" reportGroup="IQRptGrp" customerId="12345">
        <orderId>1</orderId>
        <amount>10.00</amount>
        <orderSource>ecommerce</orderSource>
        <billToAddress>
            <name>John Smith</name>
            <addressLine1>20 Main Street</addressLine1>
            <city>San Jose</city>
            <state>CA</state>
            <zip>95032</zip>
            <country>USA</country>
            <email>jdoe@vantiv.com</email>
            <phone>978-551-0040</phone>
        </billToAddress>
        <card>
            <type>VI</type>
            <number>4457010000000110</number>
            <expDate>0112</expDate>
            <cardValidationNum>349</cardValidationNum>
        </card>
        <customBilling>
            <phone>8885551212</phone>
            <descriptor>mystore*001</descriptor>
        </customBilling>
    </authorization>
</litleOnlineRequest>'
