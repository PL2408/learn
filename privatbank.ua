privatbank.ua

GET reqeust: url privatbank.ua, headers={},


GET

curl 

[
 {"ccy":"EUR","base_ccy":"UAH","buy":"40.60000","sale":"41.60000"},
 {"ccy":"USD","base_ccy":"UAH","buy":"37.15000","sale":"37.65000"}
]

curl -X GET -H "Accept: application/json" --url 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5'

USD_BUY=$( curl -s 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5'|jq '.[1].buy' -r)
USD_SALE=$( curl -s 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5'|jq '.[1].sale' -r)

curl 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5'

curl --url 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5' -auth "pt.lazarenko:<api_key>"

curl 'https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid={api_key}'


#!/bin/bash

curl 'https://api.privatbank.ua/p24api/pubinfo?exchange&coursid=5' -o exchange.json

USD_BUY=$( cat exchange.json|jq '.[1].buy' -r)
USD_SALE=$( cat exchange.json|jq '.[1].sale' -r)

result=$(bc << $(($USD_BUY+$USD_SALE)/2))

echo "Middle exchange rate is: $result" >> weather.html